{
    --------------------------------------------
    Filename: core.con.pcf8563.spin
    Author: Jesse Burt
    Description: PCF8563-specific constants
    Copyright (c) 2020
    Started Sep 6, 2020
    Updated Sep 7, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ      = 400_000
    SLAVE_ADDR        = $51 << 1

' Register definitions
    CTRLSTAT1       = $00
    CTRLSTAT1_MASK  = $A8
        TEST1       = 7
        STOP        = 5
        TESTC       = 3
        TEST1_MASK  = (1 << TEST1) ^ CTRLSTAT1_MASK
        STOP_MASK   = (1 << STOP) ^ CTRLSTAT1_MASK
        TESTC_MASK  = (1 << TESTC) ^ CTRLSTAT1_MASK

    CTRLSTAT2       = $01
    CTRLSTAT2_MASK  = $1F
        TI_TP       = 4
        AF          = 3
        TF          = 2
        AIE         = 1
        TIE         = 0
        IF_BITS     = %11
        IE_BITS     = %11
        TI_TP_MASK  = (1 << TI_TP) ^ CTRLSTAT2_MASK
        AF_MASK     = (1 << AF) ^ CTRLSTAT2_MASK
        TF_MASK     = (1 << TF) ^ CTRLSTAT2_MASK
        AIE_MASK    = (1 << AIE) ^ CTRLSTAT2_MASK
        TIE_MASK    = 1 ^ CTRLSTAT2_MASK
        IE_MASK     = IE_BITS ^ CTRLSTAT2_MASK

    VL_SECS         = $02
    VL_SECS_MASK    = $FF
        VL          = 7
        SECS        = 0
        SECS_BITS   = %1111111
        VL_MASK     = (1 << VL) ^ VL_SECS_MASK
        SECS_MASK   = SECS_BITS ^ VL_SECS_MASK

    MINUTES         = $03
    MINUTES_MASK    = $7F

    HOURS           = $04
    HOURS_MASK      = $3F

    DAYS            = $05
    DAYS_MASK       = $3F

    WEEKDAYS        = $06
    WEEKDAYS_MASK   = $07

    CENTMONTHS      = $07
    CENTMONTHS_MASK = $1F

    YEARS           = $08
    YEARS_MASK      = $FF

    MIN_ALARM       = $09
    MIN_ALARM_MASK  = $FF
        AE_M        = 7
        MININT      = 0
        MININT_BITS = %1111111
        AE_M_MASK   = (1 << AE_M) ^ MIN_ALARM_MASK
        MININT_MASK = MININT_BITS ^ MIN_ALARM_MASK

    HR_ALARM        = $0A
    HR_ALARM_MASK   = $FF
        AE_H        = 7
        HRINT       = 0
        HRINT_BITS  = %111111
        AE_H_MASK   = (1 << AE_H) ^ HR_ALARM_MASK
        HRINT_MASK  = HRINT_BITS ^ HR_ALARM_MASK

    DAY_ALARM       = $0B
    DAY_ALARM_MASK  = $BF
        AE_D        = 7
        DAYINT      = 0
        DAYINT_BITS = %111111
        AE_D_MASK   = (1 << AE_D) ^ DAY_ALARM_MASK
        DAYINT_MASK = DAYINT_BITS ^ DAY_ALARM_MASK

    WKDAY_ALARM     = $0C
    WKDAY_ALARM_MASK= $87
        AE_W        = 7
        WDINT       = 0
        WDINT_BITS  = %111
        AE_W_MASK   = (1 << AE_W) ^ WKDAY_ALARM_MASK
        WDINT_MASK  = WDINT_BITS ^ WKDAY_ALARM_MASK

    CTRL_CLKOUT     = $0D
    CTRL_CLKOUT_MASK= $83
        FE          = 7
        FD          = 0
        FD_BITS     = %11
        FE_MASK     = (1 << FE) ^ CTRL_CLKOUT_MASK
        FD_MASK     = FD_BITS ^ CTRL_CLKOUT_MASK

    CTRL_TIMER      = $0E
    CTRL_TIMER_MASK = $83
        TE          = 7
        TD          = 0
        TD_BITS     = %11
        TE_MASK     = (1 << TE) ^ CTRL_TIMER_MASK
        TD_MASK     = TD_BITS ^ CTRL_TIMER_MASK

    TIMER           = $0F
    TIMER_MASK      = $FF


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

