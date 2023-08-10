# OpenTitan Secure Mailbox Interface
# (secure\_mailbox\_spec)

Contributor: [Neeraj Upasani](mailto:neeraj@opentitan.org)

Reviewer: [Andreas Kurth](mailto:adk@opentitan.org) [Michael Schaffner](mailto:msf@opentitan.org)

Last Update: 2022-10-04

Approved by TC: 2023-05-09

Status: Draft v0.2

Table of Contents
=====================================================

Introduction
================================================

Scope
------------------------------

Document a proposal for the secure mailbox communication channel for the
Integrated OpenTitan project

Document Organization
----------------------------------------------

Glossary
---------------------------------

| Term  | Description                                             |
|-------|---------------------------------------------------------|
| PCIe  | PCI Express                                             |
| DOE   | Data Object Exchange                                    |
| CXL   | Compute Express Link                                    |
| MCTP  | Management Component Transport Protocol                 |
| SPDM  | Security Protocol and Data Model                        |
| CMA   | Component Measurement and Attestation                   |
| DMTF  | formerly known as the Distributed Management Task Force |
| OT    | OpenTitan                                               |
| RoT   | Root Of Trust                                           |
| CTN   | ConTrol Network                                         |
| SoC   | System On Chip                                          |
| SCS   | System Control Subsystem                                |
| IOMMU | Input Output Memory Management Unit                     |
| ECR   | Engineering Change Request                              |
| ECN   | Engineering Change Notification                         |

References
-----------------------------------

| OpenTitan Documentation                           | https://docs.opentitan.org/                                               |
|---------------------------------------------------|---------------------------------------------------------------------------|
| Integrated OpenTitan: Challenges To Solve         | Proposal Specification Link                                               |
| Integrated OpenTitan: Access to SoC address space | Proposal Specification Link                                               |
| Integrated OpenTitan: DMA Controller              | Proposal Specification Link                                               |
| Integrated OpenTitan: DOE Mailbox Interface       | Proposal Specification Link                                               |
| Integrated OpenTitan: Design for Test and Debug   | Proposal Specification Link   (Not Ready Yes)                             |
| PCIe Specification                                | PCI Express                                                               |
| CXL Specification                                 | Compute Express Link                                                      |
| SPDM                                              | https://www.dmtf.org/dsp/DSP0274 (CMA requires SPDM Version 1.0 or above) |
| SPDM-MCTP                                         | https://www.dmtf.org/dsp/DSP0275                                          |
| Secured SPDM                                      | https://www.dmtf.org/dsp/DSP0277                                          |

Version History
----------------------------------------

| Version | Description                                                 | Authors                              |
|---------|-------------------------------------------------------------|--------------------------------------|
| 0.1     | Initial version                                             | Ved Shanbhogue Ricky Wen (Rivos Inc) |
| 0.2     | Added Context behind DOE Object definition Interrupt tweaks | Neeraj Upasani (Rivos Inc)           |

Overview
========

The integrated version of OpenTitan Root-Of-Trust may
provide security services to the SoC such as:

-   Encryption or decryption of data blobs
-   Cryptographic hashing of data blobs
-   Key derivation
-   Random seed generation service
-   Public Key ( PK ) signing
-   PK verification
-   Root of Trust for Measurement , Reporting and
    Storage
-   Secure Firmware update
-   Access to secure storage
-   Mutual authentication / attestation services
-   SoC security monitoring / book-keeping
    services
-   Debug authentication / unlock service

The SoC Host (or other SoC Execution Engines) may request these services
from the OpenTitan. This means that pre-defined control information must
be passed to OpenTitan from the security service requester. A secure
in-bound/outbound mailbox is defined to exchange such control
information between. This proposal adopts the  [PCIe specification defined Data-Object-Exchange](https://members.pcisig.com/wg/PCI-SIG/document/18363)
mailbox protocol  as the OpenTitan Integrated
mailbox communication channel.

As an example, the DMA controller shall be used in conjunction with the
newly defined OpenTitan mailbox interface. Mailbox interface is used to
pass pointers to data blobs external  to the OT RoT and  request
operations via pre-defined command  objects .

Secure Mailbox Interface
=======================================================

![](doc/mbx_interface.svg)

### Data Object Exchange Mailbox Instance

Mailbox Terminology
--------------------------------------------

| OT Mailbox registers (Inbox regs / Outbox regs) | PCIe DOE specification defined registers used for reading and writing to the mailbox. See PCI Express Base Specification 6.0 section 7.9.24 Note that these registers may be mapped into the PCIe Config space for the System Host to access the mailbox via the PCIe defined mechanism Accesses from other SoC firmware based agents may not be mapped into the config address space. The access mechanism and relevant address space for such agents is defined by the SoC integrator              |
| OT Inbox Memory                                 | Memory is allocated to the mailbox mechanism to store data objects passed from System/SoC mailbox  writer  to OT. Memory within the OpenTitan RoT secure perimeter. Please refer to the section below for   inbox memory implementation options System/SoC mailbox  writer  can write this memory via mailbox interface registers only. OT Ibex core may have direct read/write access to this memory                                                                                                |
| OT Outbox Memory                                | Memory is allocated to the mailbox mechanism to store data objects passed from OT to System/SoC mailbox  reader. This memory is within the OpenTitan RoT secure perimeter; It may be a dedicated memory structure or carved out section (protected by access control) of a larger memory. System/SoC mailbox  reader  can read this memory via mailbox interface registers only. OT Ibex core may have direct read/write access to this memory                                                       |
| DOE mailbox instance                            | A collection of the mailbox registers, inbound mailbox memory and outbound mailbox memory that can be used to exchange objects between OT and an SoC agent. Note that a separate  mailbox instance  is  required  for each uncoordinated SoC agent that communicates with Integrated OT via mailbox mechanism. OT may handle (read or write) objects from each DOE instance in a simple round robin arbitration fashion.  Note  that this is firmware controlled based on pending mailbox interrupts |
| Inbox / Outbox Handler                          | Hardware widget to move mailbox data back and forth between mailbox registers and corresponding memories                                                                                                                                                                                                                                                                                                                                                                                             |
| Requester                                       | Typically System Host or an SoC firmware agent that would request a security service via predefined DOE objects                                                                                                                                                                                                                                                                                                                                                                                      |
| Responder                                       | Entity that processes the DOE request object and generates a DOE response in case one is expected for the original request. OpenTitan would generally have the responder role; however there may be use cases where OpenTitan is a DOE requester                                                                                                                                                                                                                                                     |

### Mailbox memory Options

Mailbox memory implementation shall have the following options

| Option                                                                                                      | Pros                                                                                                                                                                                                                                                                 | Cons                                                                                                                                                          |
|-------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dedicated Memory within mailbox instance                                                                    | Each mailbox instance has access to its own inbox memory space. No memory arbitration required when mailbox is written. Easy to prevent IBEX instruction fetch port from accessing mailbox memory (prevent address decode)                                           | Difficult to implement memory protection mechanisms such as scrambling                                                                                        |
| Shared Mailbox Memory - local write port, read access by memory (separate instance than RoT private memory) | Easier to implement memory protection schemes such as scrambling, if desired. Mailboxes not an initiator on TL-UL fabric; additional access control not required. Easy to prevent IBEX instruction fetch port from accessing mailbox memory (prevent address decode) | Memory controller may need dedicated arbitration logic                                                                                                        |
| Shared Mailbox Memory On RoT Fabric (separate instance than RoT private memory)                             | Memory access arbitration handled by fabricEasier to implement memory protection schemes such as scrambling, if desiredEasy to prevent IBEX instruction fetch port from accessing mailbox memory (prevent address decode)                                            | Mailbox port is an initiator port on the fabric; requires additional security access control mechanisms such as IOPMP (access range protection registers etc) |
| Shared Mailbox Memory carved out of RoT private memory)Note  that this option is not preferred              | Easier to manage memory size requirements - (flexible range setup)                                                                                                                                                                                                   | Hard address decode based prevention of IBEX instruction fetch from this memory not possible - mixed with IBEX code memory                                    |

Mailbox Basics
----------------------------------------

-   PCIe specification section 6.30 defines the
    (optional) Data Object Exchange mechanism. It is accessed using a
    PCIe extended capability defined in section 7.9.24 that provides a
    Mailbox for data exchange.
-   All inbound and outbound mailbox communication
    takes place via a set of mailbox registers

    -    [DOE Control Register](#doe-control-register)
    -    [DOE Status Register](#doe-status-register)
    -    [DOE Write Data Mailbox Register](#doe-write-data-mailbox-register)
    -    [DOE Read Data Mailbox Register](#doe-read-data-mailbox-register)

-   [DOE Control Register](#doe-control-register)
    and  [DOE Status Register](#doe-status-register)
    are used by the requester and the responder to perform a
    valid handshake protocol while transferring objects back and forth
-   An entity that supports the DOE mechanism is
    permitted to specify its own vendor defined data objects
-   DOE Inbox is used by a ‘requester’ to query the supported data
    object formats

    -   A mailbox instance is not required to support all
        DOE object formats.
    -   PCIe Vendor ID and an object format index number
        together uniquely identify the supported object format
    -   Mailbox requester FW/SW knows how to interpret the
        data object format(s) of interest
    -   DOE specification defined query mechanism enables
        Mailbox requester to check if the DOE instance supports the data
        object format of interest

-   DOE Inbox is used by a ‘requester’ to write
    supported data objects into the DOE mailbox

    -   DOE mailbox drops the object in case it is an
        unsupported format or does not match the expected format
    -   Each mailbox write is a non-posted transaction and
        expects a response back
    -   [DOE Write Data Mailbox Register](#doe-write-data-mailbox-register)
        is used to write the inbox, one DWORD (32 bit) at a time

-   DOE Outbox is used by the responder to populate a
    response, in case one is expected
-   DOE instances have the ability to send an interrupt
    to notify that an object response is ready. Note that a PCIe
    compatible DOE mailbox instance shall have the ability to send an
    MSI interrupt
-   Various error handling scenarios are described
    later in this document

Following is a basic mailbox read / write sequence:

1.  [DOE Status Register](#doe-status-register).
    Busy being Clear indicates
    that the mailbox instance is not being actively used and is ready to
    accept new requests. System Host consults this bit to check if the
    DOE instance is free.
2.  System host writes the entire data object a DWORD at a time via the
    [DOE Write Data Mailbox Register](#doe-write-data-mailbox-register)

    1.  The inbox handler places each DWORD into the appropriate location of
        the OT inbox memory to assemble the object being transferred

1.  System host sets the DOE Go bit in  [DOE Control Register](#doe-control-register)

    1.  The inbox handler generates an interrupt to notify
        the responder (e.g. OpenTitan Ibex core) to start parsing the
        transferred object
    2.  The parser consumes the DOE request from the DOE
        mailbox.

1.  After successful processing, the responder (OT Ibex
    core) generates a response, in case one is expected

    1.  OT host places the response in the outbox
        memory
    2.  OT host sets the Data Object Ready bit
    3.  DOE outbox handler generates a notification
        interrupt, if supported and enabled

1.  System host waits for an interrupt  if applicable. Upon receiving an
    interrupt, it checks the [DOE Status Register](#doe-status-register).*ready*
    bit to see if the object is ready.
    Alternatively, if an interrupt is not supported, it can poll for the
    polls the  [DOE Status Register](#doe-status-register).*ready* bit
    Note that SoC level power
    management schemes and related interrupt delivery mechanism is outside
    the scope of this document. Any logic required to support SoC wake from
    deeper power management states for interrupt delivery shall be
    implemented at the SoC level at the time of integration

1.  If the ready bit is Set,

    1.  System host reads data from the  [DOE Read Data Mailbox Register](#doe-read-data-mailbox-register)
        one DWORD at a time
    2.  For each DWORD, it  writes the  [DOE Read Data Mailbox Register](#doe-read-data-mailbox-register)
        to indicate a successful read
    3.  The process is repeated until the entire object is
        read

Note :

Sequence above assumes System Host as the requester of
the mailbox object write. In this case a PCIe compliant DOE mailbox
instance is implemented. Similar mechanism and sequence would apply for
communication with other SoC firmware controllers. For such a DOE
mailbox instance, a fully PCIe compliant implementation is not required.
See [below](#system-level-use-cases)
for more details

Note : Please refer to [PCIE Specification](https://members.pcisig.com/wg/PCI-SIG/document/18363)
for more detailed and up to date information
on the PCIe compliant DOE Mailbox operation basics

Integrated OpenTitan Usage Of DOE Mailbox Mechanism
----------------------------------------------------------------------------

Integrated OpenTitan

-   Shall adopt the basic mechanics defined in the PCIe
    specification
-   Shall support one or more DOE mailbox instances

-   Shall support design options to allow configuration
    of number of mailbox instances depending upon the needs of the
    integrating SoC

-   Interrupt support

    -   Shall support a firmware based mechanism to
        generate an interrupt
    -   Such a mechanism may require a method to ‘write’ to a predefined  address in the
        appropriate address space (System, CTN or other) via the
        corresponding port of a DMA controller
    -   Example: Write to a location within system address space via the
        [SYS port of the Integrated OT DMA controller](../dma/README.md)
        to generate an MSI-interrupt for PCIe
        compatible DOE instance(s)
    -   Shall support a wired interrupt output(s) for each DOE instance.
        Such a mechanism may be applied for DOE instances assigned to agents
        that support wired interrupt  mechanism
    -   Depending upon the application & PCIe compatibility requirement for
        the instance, SoC may decide to use the wired interrupt or firmware
        based MSI interrupt mechanism at the time of SoC integration. Alternatively, for PCIe compatible DOE mailbox instance,
        an SoC may also decide to convert the wired interrupt into an MSI
        via dedicated hardware support at the SoC level

-   Not required to support a dedicated mutex mechanism for more than
    one agent to access the same DOE instance
-   Object Definition; Vendor ID

Integrating SoC

-   For the DOE instance dedicated to System
    Host

    -   Shall provide the plumbing to map into PCIe Config
        address space
    -   Shall provide the plumbing necessary to route the MSI interrupt to
        the appropriate location in the SoC’s  [system address space]()

-   For mailboxes dedicated to other SoC FW
    agents

    -   Shall provide an access controlled path for the SoC
        FW Agent to access the DOE registers
    -   Shall provide the plumbing necessary to route the MSI interrupt to
        the appropriate location in the SoC’s  [relevant address space (System,]()
        [CTN]() [ or other))]()

-   Access control

    -   Shall provide proper access control protection to
        make sure that no requester other than the one to which the mailbox
        is assigned, is able to access the mailbox registers
    -   Access control may be static or dynamic based on
        SoC level access mechanisms

-   Assigning more than one coordinated requesters /
    agents to the same DOE instance

    -   If the SoC chooses to do so then it will be the responsibility of
        the cooperating agents to get ownership of the DOE mailbox in a SoC
        defined synchronization mechanism
    -   Consider an example where there are more than one
        physical instance of SoC firmware based controllers implementing a
        common function like power management. In such a case, the two power
        management controllers may acquire a software mutex or a hardware
        mutex, as defined and implemented by SoC

Mailbox Use Cases
-----------------

### Interprocessor Communication

A basic usage of the DOE mailbox mechanism is to
achieve Interprocessor communication (IPC) between the OpenTitan based
SoC root of trust and other SoC firmware based controllers. An example
scenario is as follows:

Such an IPC mechanism may be deployed during a system secure boot up
operation. Here OT RoT  has the responsibility to fetch firmware images
from external flash, verify / measure  them and place in appropriate
memory locations on the SoC that are protected via access control
mechanisms to prevent further modification of firmware images. Other
firmware based controllers may be configured to boot from such a memory
location. Proper reset sequencing, voltage, clock and other
configuration of the SoC region / subsystem under consideration may be
needed prior to this operation. An SoC power management controller (PMC)
may be responsible for these activities. OT RoT and the PMC may need to
work together to complete the operation to bootstrap the firmware based
controller of a subsystem under consideration. OT RoT
and the PMC may exchange messages via DOE based mailbox mechanism
through predefined message data objects to achieve this coordination.
 More coordination may be required during
runtime as well and may continue to use the mailboxes for further
communication beyond boot time operation

In another example, more than one OT RoT  instance may
exist within an SoC - for example an RoT on each chiplet in an SoC
compiled of multiple chiplets. Such RoTs may have a primary - secondary
relationship, and may require communication to perform different
operations. A dedicated DOE mailbox channel and predefined DOE objects
may be assigned for such communication

### System level use cases

DOE mailbox is used to perform various security
protocols like SPDM based component measurement and authentication.

As per the PCIe specification - “DOE is a prerequisite
Extended Capability for a Function to support in-band access by system
firmware/software using Configuration Requests to Component Measurement
and Authentication (CMA). CMA in turn builds on \[SPDM\].”

#### PCIE component measurement

A  PCIe device, either discrete or integrated within a
system, may need to establish a security trust level with the
appropriate software running on the System Host for various security
based applications like:

-   Allowing a datacenter operator to query the state
    of the platform via remote mechanisms before deploying any workloads
    to the platform. Such mechanisms may involve cryptographic
    measurements of the hardware components including any unique device
    bindings and firmware running on that platform, and attestation to a
    local (e.g sideband management controller) or a remote (e.g.
    datacenter operator) agent. An OpenTitan base root of trust
    integrated within a PCIe device may participate in such an
    authentication protocol, with the responsibility to create such
    measurements and present them to the system software upon request
    via a standard PCIe based DOE mailbox communication channel.
-   Similar authentication scheme may be used for PCIe
    device hot plug support (adding new cards during system runtime)
    where the system software may decide to include the hot plugged
    device within its operation only upon successfully attesting to a
    local agent or a remote agent

#### Setup of Trusted Execution Environments

An SoC may participate in providing Trusted Execution
environments. An integrated root of trust would have the responsibility
to bring up, perform secure boot, measure, establish the proper chain of
trust in order to bootstrap the trusted execution environment. Trusted
Software would use the DOE mailbox communication channel to establish
secure protocols with the additional components (e.g. a new PCIe virtual
function) before allowing them into the trusted execution
boundary.

#### Generic security services

An integrated OpenTitan RoT may provide generic
security services to the SoC or system as a whole, such as secure
storage, secure firmware update, PK crypto based certificate signing,
encryption/decryption. Such operations require exchange of information
(commands as well as data) back and forth between the  requesters of
these security services and OT. DOE mailbox mechanism with properly
defined DOE objects supporting such information exchange is envisioned
to be the method to expose these security services to other
components

Security Properties
----------------------------------------------------------------------------------

&lt;To be Worked on&gt;

Data Object Definition
-----------------------------------------------

### PCIe defined

Following are the PCIe specification defined object types that shall be
supported by the OT DOE implementation

| Vendor ID (PCIe SIG) | Data Object Type | Description                                                                                                                                                                                                   |
|----------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0001               | 0x00             | DOE Discovery. Used by the requester to find the supported data objects by the DOE instance. PCIe specification defines the mechanism for object discovery                                                    |
| 0x0001               | 0x01             | CMA/SPDM. Data Object type for SPDM. Section 6.31 of PCIe specification shows the PCIe bindings. DMTF DSP0274 specifies the SPDM messages                                                                     |
| 0x0001               | 0x02             | Secured SPDM Data Object type for SPDM secure sessions. Also requires support for CMA/SPDM (Type 0x01). Section 6.31.4 of PCIe spec shows the PCIe bindings. DMTF DSP0277 specifies the secured SPDM messages |
| 0x0001               | 0x03             | CMA/SPDM with Connection ID. Also requires support for CMA/SPDM (Type 0x01)                                                                                                                                   |
| 0x0001               | 0x04             | Secured CMA/SPDM with Connection ID. Also requires support for secured CMA/SPDM (Type 0x02)                                                                                                                   |
| 0x0001               | 0x05             | Async Message. Asynchronous messages generated by the device to communicate asynchronous with the Host SW                                                                                                     |
| 0x0001               | 0x06-FF          | Reserved                                                                                                                                                                                                      |

Notes :

1.  Support for the above object types are required for
    the PCIe compatible mailbox(es)
2.  Implementation, processing and handling of the objects & protocols
    behind th em are handled by OT firmware and Host
    software
3.  Non-PCIe DOE mailboxes may choose to support these
    object types if there is a supporting use case
4.  The objects highlighted in red are part of a PCIe
    ECR that is not in the main specification yet

------------------------------------------------------------------------

External DOE Registers
-----------------------

Note : The DOE mailbox is accessible in two different forms

1.  PCIe compatible DOE mailbox - exposed as part of the PCIe configuration space.
    The [DOE Extended Capability Header](#doe-extended-capability-header) and the [DOE Capability Header](#doe-capability-header) registers are supported for such a DOE mailbox instance only.
2.  Firmware to Firmware communication mailboxes - uses the same underlying mechanism to transferring data objects between a firmware requester and a firmware responder.
    However such mailboxes do not require the DOE capability registers.
    For such mailbox instances, these address offsets are utilized to specify / configure the address of the register where a doorbell interrupt shall be sent as well as the corresponding data to be sent.

### DOE Extended Capability Header

| Register | DOE Extended Capability Header |
| Width    | 32 bits                        |
| Offset   | 0x00                           |
| Access   | RO                             |

| Bit Pos | Bit Definition         | Notes                                                                                                                                                               |
|---------|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 15:0    | Capability ID          | PCIe defined Capability ID. Should read value of 0x002E for DOE capability                                                                                          |
| 19:16   | Capability Version     | Second version; Value of 2                                                                                                                                          |
| 31:20   | Next Capability Offset | Offset to the next capability structure. Equal to zero if no other items exist. Can be tool generated to link to other extended capabilities that may be supported. |


### DOE Capability Header

|          |                       |
|----------|-----------------------|
| Register | DOE Capability Header |
| Width    | 32 bits               |
| Offset   | 0x04                  |
| Access   | RO                    |

| Bit Pos | Bit Definition               | Notes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|---------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0       | DOE Interrupt Support        | One when interrupts are supported. In the PCIe world, this means MSI/MSI-x support.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 11:1    | DOE Interrupt Message number | When value is 0: Responder only support MSI (not MSI-X); and same message data for all interrupts including the DOE interrupt. MSI address/data pairs are configured in the MSI or MSI-X capability of the PCIe function hosting the mailbox. When MSI-X is implemented, this message number indexes into the table of address/data pairs to determine the one to use. **Note:** Non-PCIe DOE mailboxes (e.g. Firmware - Firmware communication mailbox) may use the wired interrupt capability. [Please see above for interrupt support.](#integrated-opentitan-usage-of-doe-mailbox-mechanism) |
| 31:12   | Reserved                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

### DOE Interrupt Message Address Register

| Register | DOE Interrupt Message Address Register |
| Width    | 32 bits                                |
| Offset   | 0xFIXME                                |
| Access   | RW                                     |

| Bit Pos | Bit Definition             | Notes                                                                                                                                                                                                                                                                                                                                                     |
|---------|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 31:0    | Interrupt Register Address | Defined only in case of a firmware to firmware mailbox communication. Utilized by the mailbox responder to send an interrupt message to the requester via a write to the configured address. Note that such FW 2 FW mailboxes may primarily be accessible in the CTN address space. As such the configured address is part of the SoC CTN address space. |

### DOE Interrupt Message Data Register

| Register | DOE Interrupt Message Address Register |
| Width    | 32 bits                                |
| Offset   | 0xFIXME                                |
| Access   | RW                                     |

| Bit Pos | Bit Definition          | Notes                                                                                                                                                                                                                                                                                                                                                    |
|---------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 31:0    | Interrupt Register Data | Interrupt message data to be sent to the address configured in the [](#DOE-Interrupt-Message-Address-Register) |

### DOE Control Register

| Register | DOE Control Register |
| Width    | 32 bits              |
| Offset   | 0xFIXME              |
| Access   | RW                   |

Please refer to Table 7-315 of the PCIe specification for detailed information on this register.

| Bit Pos | Bit Definition           | Notes |
|---------|--------------------------|-------|
| 0       | DOE Abort                |       |
| 1       | DOE Interrupt Enable     |       |
| 2       |                          | TBD   |
| 3       | DOE Async Message Enable |       |
| 4:30    | Reserved                 |       |
| 31      | DOE Go                   |       |

### DOE Status Register

| Register | DOE Status Register |
| Width    | 32 bits             |
| Offset   | 0xFIXME             |
| Access   | RW                  |

Please refer to Table 7-316 from the PCIe specification for details on this register.

| Bit Pos | Bit Definition           | Notes |
|---------|--------------------------|-------|
| 0       | DOE Busy                 |       |
| 1       | DOE Interrupt Status     |       |
| 2       | DOE Error                |       |
| 3       | DOE Async Message Status |       |
| 4       |                          | TBD   |
| 5:30    | Reserved                 |       |
| 31      | DOE Object Ready         |       |

### DOE Write Data Mailbox Register

| Register | DOE Status Register |
| Width    | 32 bits             |
| Offset   | 0xFIXME             |
| Access   | RW                  |

Please refer to Table 7-317 in the PCIe specification for details on this register.

| Bit Pos | Bit Definition       | Notes |
|---------|----------------------|-------|
| 0:31    | DOE Write Data DWORD |       |

### DOE Read Data Mailbox Register

| Register | DOE Status Register |
| Width    | 32 bits             |
| Offset   | 0xFIXME             |
| Access   | RW                  |

Please refer to Table 7-317 in the PCIe specification for details on this register.

| Bit Pos | Bit Definition      | Notes |
|---------|---------------------|-------|
| 0:31    | DOE Read Data DWORD |       |

OpenTitan Internal DOE Registers
--------------------------------

The following registers are visible in the OT internal private address
space only. As such, these registers are accessible to the firmware
running on IBEX core only

### Inbox Write Pointer Register

| Register | Inbox Write Pointer Register |
| Width    | 32 bits                      |
| Offset   | 0xFIXME                      |
| Access   | RW                           |

| Bit Pos | Bit Definition | Notes                                                                                                                                                                                                                                                                |
|---------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Wr Pointer     | Pointer to a location within the Inbox memory where the next DWORD will be written. Pointer is initialized to the Inbox memory base address before the start of a transfer. Inbox handler maintains the updated pointer as data DWORDS are received by the DOE inbox |

### Outbox Read Pointer Register

| Register | Outbox Read Pointer Register |
| Width    | 32 bits                      |
| Offset   | 0xFIXME                      |
| Access   | RW                           |

| Bit Pos | Bit Definition | Notes                                                                                                                                                                                                                                                                                                       |
|---------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Rr Pointer     | Pointer to a location within the Outbox memory from where the next DWORD will be read. Pointer is initialized to the Outbox memory base address before the start of a outgoing object transfer. Outbox handler maintains the updated pointer as data DWORDS are read from the DOE instance by the requester |

### DOE Inbox Memory Range Base Register

| Register | DOE Inbox Memory Range Base Register |
| Width    | 32 bits                              |
| Offset   | 0xFIXME                              |
| Access   | RW                                   |

| Bit Pos | Bit Definition         | Notes                                                                                                                                         |
|---------|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Memory Range Base Addr | Base Address to mark the start of the enabled memory range within the OT internal memory space. Note that this address must be DWORD aligned. |

### DOE Inbox Memory Range Limit Register

| Register | DOE Inbox Memory Range Limit Register |
| Width    | 32 bits                               |
| Offset   | 0xFIXME                               |
| Access   | RW                                    |

| Bit Pos | Bit Definition          | Notes                                                                                                                                  |
|---------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Memory Range Limit Addr | Limit to mark the end of the DOE Inbox memory range within the OT internal memory space. Note that this address must be DWORD aligned. |

### DOE Outbox Memory Range Base Register

| Register | DOE Outbox Memory Range Base Register |
| Width    | 32 bits                               |
| Offset   | 0xFIXME                               |
| Access   | RW                                    |

| Bit Pos | Bit Definition         | Notes                                                                                                                                            |
|---------|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Memory Range Base Addr | Base Address to mark the start of the DOE outbox memory range within the OT internal memory space. Note that this address must be DWORD aligned. |

### DOE Outbox Memory Range Limit Register

| Register | DOE Outbox Memory Range Limit Register |
| Width    | 32 bits                                |
| Offset   | 0xFIXME                                |
| Access   | RW                                     |

| Bit Pos | Bit Definition          | Notes                                                                                                                                   |
|---------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| 0:31    | Memory Range Limit Addr | Limit to mark the end of the DOE Outbox memory range within the OT internal memory space. Note that this address must be DWORD aligned. |

### DOE Memory Range Register LockEnable

| Register | DOE Memory Range Register LockEnable |
| Width    | 32 bits                              |
| Offset   | 0xFIXME                              |
| Access   | RW                                   |

| Bit Pos | Bit Definition | Notes                                                                                                                                                                         |
|---------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0       | Lock           | Global Lock bit. Once Set, the inbox and outbox memory range registers shall not be further modifiable. The lock bit, once set, can be cleared only upon next reset assertion |
| 1       | Enable         | Global Enable bit. Once Set, the inbox and outbox memory range registers (base and limit) shall be active.                                                                    |
| 2:31    | Reserved       |                                                                                                                                                                               |

### DOE Outbox Object Size Register

| Register | DOE Outbox Object Size Register |
| Width    | 32 bits                         |
| Offset   | 0xFIXME                         |
| Access   | RW                              |

| Bit Pos | Bit Definition | Notes                                                                                                                                                                                                                                                                                                                                            |
|---------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0:9     | Size           | Indicates the size of the data object to be transferred out. Written by the Responder firmware. Used by Outbox handler to track the size of the message to be read. Note that this size specifies the number of DWORDs to be read. Maximum size supported by any OT DOE instance is 1K DWORDS. (Note that maximum permitted size is 256K DWORDS) |
| 10:31   | Reserved       |                                                                                                                                                                                                                                                                                                                                                  |

Appendix
========

A few important constraints from the PCIe specification for correct mailbox operation and error handling.
Please refer to the PCIe specification section 6.30 for detailed information, specifically the sections titled:

- Response time
- Abort function
- Error handling
