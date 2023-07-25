# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
"""
Generates the documentation for the register tool

"""
from reggen.access import SWACCESS_PERMITTED, HWACCESS_PERMITTED
from reggen import (validate,
                    ip_block, enum_entry, field,
                    register, multi_register, window)


def genout(outfile, msg):
    outfile.write(msg)


doc_intro = """

<!-- Start of output generated by `regtool.py --doc` -->

The tables describe each key and the type of the value. The following
types are used:

Type | Description
---- | -----------
"""

swaccess_intro = """

Register fields are tagged using the swaccess key to describe the
permitted access and side-effects. This key must have one of these
values:

"""

hwaccess_intro = """

Register fields are tagged using the hwaccess key to describe the
permitted access from hardware logic and side-effects. This key must
have one of these values:

"""

top_example = """
The basic structure of a register definition file is thus:

```hjson
{
  name: "GP",
  regwidth: "32",
  registers: [
    // register definitions...
  ]
}

```

"""

register_example = """

The basic register definition group will follow this pattern:

```hjson
    { name: "REGA",
      desc: "Description of register",
      swaccess: "rw",
      resval: "42",
      fields: [
        // bit field definitions...
      ]
    }
```

The name and brief description are required. If the swaccess key is
provided it describes the access pattern that will be used by all
bitfields in the register that do not override with their own swaccess
key. This is a useful shortcut because in most cases a register will
have the same access restrictions for all fields. The reset value of
the register may also be provided here or in the individual fields. If
it is provided in both places then they must match, if it is provided
in neither place then the reset value defaults to zero for all except
write-only fields when it defaults to x.

"""

field_example = """

Field names should be relatively short because they will be used
frequently (and need to fit in the register layout picture!) The field
description is expected to be longer and will most likely make use of
the Hjson ability to include multi-line strings. An example with three
fields:

```hjson
    fields: [
      { bits: "15:0",
        name: "RXS",
        desc: '''
        Last 16 oversampled values of RX. These are captured at 16x the baud
        rate clock. This is a shift register with the most recent bit in
        bit 0 and the oldest in bit 15. Only valid when ENRXS is set.
        '''
      }
      { bits: "16",
        name: "ENRXS",
        desc: '''
          If this bit is set the receive oversampled data is collected
          in the RXS field.
        '''
      }
      {bits: "20:19", name: "TXILVL",
       desc: "Trigger level for TX interrupts",
       resval: "2",
       enum: [
               { value: "0", name: "txlvl1", desc: "1 character" },
               { value: "1", name: "txlvl4", desc: "4 characters" },
               { value: "2", name: "txlvl8", desc: "8 characters" },
               { value: "3", name: "txlvl16", desc: "16 characters" }
             ]
      }
    ]
```

In all of these the swaccess parameter is inherited from the register
level, and will be added so this key is always available to the
backend. The RXS and ENRXS will default to zero reset value (unless
something different is provided for the register) and will have the
key added, but TXILVL expicitly sets its reset value as 2.

The missing bits 17 and 18 will be treated as reserved by the tool, as
will any bits between 21 and the maximum in the register.

The TXILVL is an example using an enumeration to specify all valid
values for the field. In this case all possible values are described,
if the list is incomplete then the field is marked with the rsvdenum
key so the backend can take appropriate action. (If the enum field is
more than 7 bits then the checking is not done.)

"""

offset_intro = """

"""

multi_intro = """

The multireg expands on the register required fields and will generate
a list of the generated registers (that contain all required and
generated keys for an actual register).

"""

window_intro = """

A window defines an open region of the register space that can be used
for things that are not registers (for example access to a buffer ram).

"""

regwen_intro = """

Registers can protect themselves from software writes by using the
register attribute regwen. When not an empty string (the default
value), regwen indicates that another register must be true in order
to allow writes to this register. This is useful for the prevention
of software modification.  The register-enable register (call it
REGWEN) must be either one bit or 4 bit in width to support a FI-protected
multi-bit REGWEN. The default value should be true and be rw1c for
preferred security control. This allows all writes to proceed
until at some point software disables future modifications by clearing
REGWEN. An error is reported if REGWEN does not exist, contains more
than one bit, is not `rw1c` or does not default to true. One REGWEN can
protect multiple registers. The REGWEN register must precede those
registers that refer to it in the .hjson register list. An example:

```hjson
    { name: "REGWEN",
      desc: "Register write enable for a bank of registers",
      swaccess: "rw1c",
      fields: [ { bits: "0", resval: "1" } ]
    }
    { name: "REGA",
      swaccess: "rw",
      regwen: "REGWEN",
      ...
    }
    { name: "REGB",
      swaccess: "rw",
      regwen: "REGWEN",
      ...
    }
```
"""

doc_tail = """

(end of output generated by `regtool.py --doc`)

"""


def doc_tbl_head(outfile, use):
    if use is not None:
        genout(outfile, "\nKey | Kind | Type | Description of Value\n")
        genout(outfile, "--- | ---- | ---- | --------------------\n")
    else:
        genout(outfile, "\nKey | Description\n")
        genout(outfile, "--- | -----------\n")


def doc_tbl_line(outfile, key, use, desc):
    if use is not None:
        desc_key, desc_txt = desc
        val_type = (validate.val_types[desc_key][0]
                    if desc_key is not None else None)
    else:
        assert isinstance(desc, str)
        val_type = None
        desc_txt = desc

    if val_type is not None:
        genout(
            outfile, '{} | {} | {} | {}\n'.format(key, validate.key_use[use],
                                                  val_type, desc_txt))
    else:
        genout(outfile, key + " | " + desc_txt + "\n")


def document(outfile):
    genout(outfile, doc_intro)
    for x in validate.val_types:
        genout(
            outfile,
            validate.val_types[x][0] + " | " + validate.val_types[x][1] + "\n")

    genout(outfile, swaccess_intro)
    doc_tbl_head(outfile, None)
    for key, value in SWACCESS_PERMITTED.items():
        doc_tbl_line(outfile, key, None, value[0])

    genout(outfile, hwaccess_intro)
    doc_tbl_head(outfile, None)
    for key, value in HWACCESS_PERMITTED.items():
        doc_tbl_line(outfile, key, None, value[0])

    genout(
        outfile, "\n\nThe top level of the JSON is a group containing "
        "the following keys:\n")
    doc_tbl_head(outfile, 1)
    for k, v in ip_block.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)
    for k, v in ip_block.OPTIONAL_FIELDS.items():
        doc_tbl_line(outfile, k, 'o', v)
    genout(outfile, top_example)

    genout(
        outfile, "\n\nThe list of registers includes register definition "
        "groups containing the following keys:\n")
    doc_tbl_head(outfile, 1)
    for k, v in register.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)
    for k, v in register.OPTIONAL_FIELDS.items():
        doc_tbl_line(outfile, k, 'o', v)
    genout(outfile, register_example)

    genout(
        outfile, "\n\nIn the fields list each field definition is a group "
        "itself containing the following keys:\n")
    doc_tbl_head(outfile, 1)
    for k, v in field.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)
    for k, v in field.OPTIONAL_FIELDS.items():
        doc_tbl_line(outfile, k, 'o', v)
    genout(outfile, field_example)

    genout(outfile, "\n\nDefinitions in an enumeration group contain:\n")
    doc_tbl_head(outfile, 1)
    for k, v in enum_entry.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)

    genout(
        outfile, "\n\nThe list of registers may include single entry groups "
        "to control the offset, open a window or generate registers:\n")
    doc_tbl_head(outfile, 1)
    for x in validate.list_optone:
        doc_tbl_line(outfile, x, 'o', validate.list_optone[x])

    genout(outfile, offset_intro)
    genout(outfile, regwen_intro)

    genout(outfile, window_intro)
    doc_tbl_head(outfile, 1)
    for k, v in window.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)
    for k, v in window.OPTIONAL_FIELDS.items():
        doc_tbl_line(outfile, k, 'o', v)

    genout(outfile, multi_intro)
    doc_tbl_head(outfile, 1)
    for k, v in multi_register.REQUIRED_FIELDS.items():
        doc_tbl_line(outfile, k, 'r', v)
    for k, v in multi_register.OPTIONAL_FIELDS.items():
        doc_tbl_line(outfile, k, 'o', v)

    genout(outfile, doc_tail)
