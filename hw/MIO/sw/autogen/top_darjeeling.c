// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/autogen/top_darjeeling.h"

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_plic_irq_id_t` to
 * `top_darjeeling_plic_peripheral_t`.
 */
const top_darjeeling_plic_peripheral_t
    top_darjeeling_plic_interrupt_for_peripheral[42] = {
  [kTopDarjeelingPlicIrqIdNone] = kTopDarjeelingPlicPeripheralUnknown,
  [kTopDarjeelingPlicIrqIdGpioGpio0] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio1] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio2] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio3] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio4] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio5] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio6] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio7] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio8] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio9] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio10] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio11] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio12] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio13] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio14] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio15] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio16] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio17] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio18] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio19] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio20] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio21] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio22] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio23] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio24] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio25] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio26] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio27] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio28] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio29] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio30] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdGpioGpio31] = kTopDarjeelingPlicPeripheralGpio,
  [kTopDarjeelingPlicIrqIdRvTimerTimerExpiredHart0Timer0] = kTopDarjeelingPlicPeripheralRvTimer,
  [kTopDarjeelingPlicIrqIdAlertHandlerClassa] = kTopDarjeelingPlicPeripheralAlertHandler,
  [kTopDarjeelingPlicIrqIdAlertHandlerClassb] = kTopDarjeelingPlicPeripheralAlertHandler,
  [kTopDarjeelingPlicIrqIdAlertHandlerClassc] = kTopDarjeelingPlicPeripheralAlertHandler,
  [kTopDarjeelingPlicIrqIdAlertHandlerClassd] = kTopDarjeelingPlicPeripheralAlertHandler,
  [kTopDarjeelingPlicIrqIdPwrmgrAonWakeup] = kTopDarjeelingPlicPeripheralPwrmgrAon,
  [kTopDarjeelingPlicIrqIdAonTimerAonWkupTimerExpired] = kTopDarjeelingPlicPeripheralAonTimerAon,
  [kTopDarjeelingPlicIrqIdAonTimerAonWdogTimerBark] = kTopDarjeelingPlicPeripheralAonTimerAon,
  [kTopDarjeelingPlicIrqIdOtbnDone] = kTopDarjeelingPlicPeripheralOtbn,
};


/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_alert_id_t` to
 * `top_darjeeling_alert_peripheral_t`.
 */
const top_darjeeling_alert_peripheral_t
    top_darjeeling_alert_for_peripheral[20] = {
  [kTopDarjeelingAlertIdGpioFatalFault] = kTopDarjeelingAlertPeripheralGpio,
  [kTopDarjeelingAlertIdRvTimerFatalFault] = kTopDarjeelingAlertPeripheralRvTimer,
  [kTopDarjeelingAlertIdPwrmgrAonFatalFault] = kTopDarjeelingAlertPeripheralPwrmgrAon,
  [kTopDarjeelingAlertIdRstmgrAonFatalFault] = kTopDarjeelingAlertPeripheralRstmgrAon,
  [kTopDarjeelingAlertIdRstmgrAonFatalCnstyFault] = kTopDarjeelingAlertPeripheralRstmgrAon,
  [kTopDarjeelingAlertIdClkmgrAonRecovFault] = kTopDarjeelingAlertPeripheralClkmgrAon,
  [kTopDarjeelingAlertIdClkmgrAonFatalFault] = kTopDarjeelingAlertPeripheralClkmgrAon,
  [kTopDarjeelingAlertIdPinmuxAonFatalFault] = kTopDarjeelingAlertPeripheralPinmuxAon,
  [kTopDarjeelingAlertIdAonTimerAonFatalFault] = kTopDarjeelingAlertPeripheralAonTimerAon,
  [kTopDarjeelingAlertIdSramCtrlRetAonFatalError] = kTopDarjeelingAlertPeripheralSramCtrlRetAon,
  [kTopDarjeelingAlertIdRvDmFatalFault] = kTopDarjeelingAlertPeripheralRvDm,
  [kTopDarjeelingAlertIdRvPlicFatalFault] = kTopDarjeelingAlertPeripheralRvPlic,
  [kTopDarjeelingAlertIdOtbnFatal] = kTopDarjeelingAlertPeripheralOtbn,
  [kTopDarjeelingAlertIdOtbnRecov] = kTopDarjeelingAlertPeripheralOtbn,
  [kTopDarjeelingAlertIdSramCtrlMainFatalError] = kTopDarjeelingAlertPeripheralSramCtrlMain,
  [kTopDarjeelingAlertIdSramCtrlMboxFatalError] = kTopDarjeelingAlertPeripheralSramCtrlMbox,
  [kTopDarjeelingAlertIdRvCoreIbexFatalSwErr] = kTopDarjeelingAlertPeripheralRvCoreIbex,
  [kTopDarjeelingAlertIdRvCoreIbexRecovSwErr] = kTopDarjeelingAlertPeripheralRvCoreIbex,
  [kTopDarjeelingAlertIdRvCoreIbexFatalHwErr] = kTopDarjeelingAlertPeripheralRvCoreIbex,
  [kTopDarjeelingAlertIdRvCoreIbexRecovHwErr] = kTopDarjeelingAlertPeripheralRvCoreIbex,
};
