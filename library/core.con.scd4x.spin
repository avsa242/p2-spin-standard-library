{
    --------------------------------------------
    Filename: core.con.scd4x.spin
    Author: Jesse Burt
    Description: SCD4x-specific constants
    Copyright (c) 2022
    Started Aug 6, 2022
    Updated Aug 12, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 100_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $62 << 1                  ' 7-bit format slave address
    T_POR           = 1_000_000                 ' startup time (usecs)
    T_RES           = 1_000_000                 ' reset time
    T_CMD           = 1_000                     ' cmd execution time: most commands

    DEVID_RESP      = $00                       ' device ID expected response

    ADC_MAX         = $FFFF                     ' sensor ADC full-scale reading

    START_MEAS      = $21B1

    READ_MEAS       = $EC05

    STOP_MEAS       = $3F86
    T_STOP_MEAS     = 500_000                   ' cmd execution time: stop measurement

    SET_TEMP_OFFS   = $241D

    GET_TEMP_OFFS   = $2318

    SET_SENS_ALT    = $2427

    GET_SENS_ALT    = $2322

    SET_AMB_PRESS   = $E000

    RE_CAL          = $362F
    T_RECAL         = 400_000                   ' cmd execution time: forced re-calibration

    SET_AUTOCAL     = $2416

    GET_AUTOCAL     = $2313

    START_LP_MEAS   = $21AC

    GET_DRDY        = $E4B8
    T_GET_DRDY      = 1_000                     ' cmd execution time: data ready

    PERSIST_SET     = $3615
    T_PERSIST_SET   = 800_000                   ' cmd execution time: write persistent settings

    GET_SN          = $3682

    SELF_TEST       = $3639
    T_SELF_TEST     = 10_000_000                ' cmd execution time: self-test

    FACT_RESET      = $3632
    T_FACT_RESET    = 1_200_000                 ' cmd execution time: factory reset

    REINIT          = $3646
    T_REINIT        = 20_000                    ' cmd execution time: reinit

    MEAS_ONE        = $219D
    T_MEAS_ONE      = 5_000_000                 ' cmd execution time: one-shot measurement

    MEAS_ONE_RHT    = $2196
    T_MEAS_ONE_RHT  = 50_000                    ' cmd execution time: one-shot meas (RH/T only)

    PWR_DN          = $36E0

    WAKE            = $36F6
    T_WAKE          = 20_000                    ' cmd execution time: wake up

PUB null{}
' This is not a top-level object

DAT
{
Copyright 2022 Jesse Burt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

