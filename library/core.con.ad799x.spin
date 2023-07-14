{
    --------------------------------------------
    Filename: core.con.ad799x.spin
    Author:
    Description:
    Copyright (c) 2023
    Started MMMM DDDD, YYYY
    Updated MMMM DDDD, YYYY
    See end of file for terms of use.
    --------------------------------------------
}

CON

    { I2C Configuration }
    I2C_MAX_FREQ            = 3_400_000         ' device max I2C bus freq
    SLAVE_ADDR              = $23 << 1          ' 7-bit format slave address
    T_POR                   = 200               ' startup time (usecs)


    { Register definitions }
    CONV                    = $00
        ALRT_FLAG           = 15
        ZERO                = 14
        CH_ID1              = 13
        CH_ID0              = 12
        CH_ID               = 12
        CH_ID_BITS          = %11 << CH_ID
        CONV_BITS           = %1111_1111_1111

    ALERT_STATUS            = $01

    CONFIG                  = $02
#ifdef AD799X_8CH
    { 8-ch models only (AD7997, AD7998) }
    CONFIG_MASK             = $0fff
    CONFIG_REGSZ            = 2
        CH8                 = 11
        CH8_BITS            = 1 << CH8
        CH7                 = 10
        CH7_BITS            = 1 << CH7
        CH6                 = 9
        CH6_BITS            = 1 << CH6
        CH5                 = 8
        CH5_BITS            = 1 << CH5
        CH_BITS             = %1111_1111
        CH_MASK             = (CH_BITS << CH) ^ CONFIG_MASK
#else
    { 4-ch models only (AD7993, AD7994) }
    CONFIG_MASK             = $ff
    CONFIG_REGSZ            = 1
#endif
        { all models }
        CH4                 = 7
        CH4_BITS            = 1 << CH4
        CH3                 = 6
        CH3_BITS            = 1 << CH3
        CH2                 = 5
        CH2_BITS            = 1 << CH2
        CH1                 = 4
        CH1_BITS            = 1 << CH1
        CH                  = 4
        CH_BITS             = %1111
        CH_MASK             = (CH_BITS << CH) ^ CONFIG_MASK
        FLTR                = 3
        FLTR_MASK           = (1 << FLTR) ^ CONFIG_MASK
        ALERT_EN            = 2
        BUSY_ALERT          = 1
        ALT_BSY_BITS        = %11
        ALT_BSY_MASK        = (ALT_BSY_BITS << BUSY_ALERT) ^ CONFIG_MASK
        ALRT_BSY_POL        = 0
        ALRT_BSY_POL_MASK   = 1 ^ CONFIG_MASK

    CYC_TMR                 = $03
    CYC_TMR_MASK            = $c7
        SMP_DLY             = 7
        SMP_DLY_MASK        = (1 << SMP_DLY) ^ CYC_TMR_MASK
        BITT_DLY            = 6
        BITT_DLY_MASK       = (1 << BITT_DLY) ^ CYC_TMR_MASK
        CYC                 = 0
        CYC_BITS            = %111
        CYC_MASK            = CYC_BITS ^ CYC_TMR_MASK

    CH1_LO_THR              = $04
    CH1_HI_THR              = $05
    CH1_HYST                = $06

    CH2_LO_THR              = $07
    CH2_HI_THR              = $08
    CH2_HYST                = $09

    CH3_LO_THR              = $0a
    CH3_HI_THR              = $0b
    CH3_HYST                = $0c

    CH4_LO_THR              = $0d
    CH4_HI_THR              = $0e
    CH4_HYST                = $06f


PUB null{}
' This is not a top-level object

DAT
{
Copyright 2023 Jesse Burt

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

