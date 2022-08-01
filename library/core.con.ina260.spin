{
    --------------------------------------------
    Filename: core.con.ina260.spin
    Author: Jesse Burt
    Description: INA260-specific constants
    Started Nov 13, 2019
    Updated Jul 31, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    FAST_MAX            = 400_000
    HI_MAX              = 2_940_000
    I2C_MAX_FREQ        = HI_MAX

    SLAVE_ADDR          = $40 << 1

    DEVID_RESP          = $22705449 ' DieID << 16 | MfrID

    T_POR               = 1_000                 ' usec

' Register definitions

    CONFIG              = $00
    CONFIG_MASK         = $8FFF
        RESET           = 15
        AVG             = 9
        VBUSCT          = 6
        ISHCT           = 3
        MODE            = 0
        RSVD_BITS       = %110 << 12    ' Reserved bits
        AVG_BITS        = %111
        VBUSCT_BITS     = %111
        ISHCT_BITS      = %111
        MODE_BITS       = %111
        RESET_MASK      = (1 << RESET) ^ CONFIG_MASK
        AVG_MASK        = (AVG << AVG) ^ CONFIG_MASK
        VBUSCT_MASK     = (VBUSCT << VBUSCT) ^ CONFIG_MASK
        ISHCT_MASK      = (ISHCT << ISHCT) ^ CONFIG_MASK
        MODE_MASK       = MODE_BITS ^ CONFIG_MASK
        SOFT_RES        = (1 << RESET)

    CURRENT             = $01

    BUS_VOLTAGE         = $02

    POWER               = $03

    ENABLE              = $06
    ENABLE_MASK         = $FC1F
        OCL             = 15
        UCL             = 14
        BOL             = 13
        BUL             = 12
        POL             = 11
        CNVR            = 10
        AFF             = 4
        CVRF            = 3
        OVF             = 2
        APOL            = 1
        LEN             = 0
        ALERTS          = 10
        ALERTS_BITS     = %111111
        OCL_MASK        = (1 << OCL) ^ ENABLE_MASK
        UCL_MASK        = (1 << UCL) ^ ENABLE_MASK
        BOL_MASK        = (1 << BOL) ^ ENABLE_MASK
        BUL_MASK        = (1 << BUL) ^ ENABLE_MASK
        POL_MASK        = (1 << POL) ^ ENABLE_MASK
        CNVR_MASK       = (1 << CNVR) ^ ENABLE_MASK
        AFF_MASK        = (1 << AFF) ^ ENABLE_MASK
        CVRF_MASK       = (1 << CVRF) ^ ENABLE_MASK
        OVF_MASK        = (1 << OVF) ^ ENABLE_MASK
        APOL_MASK       = (1 << APOL) ^ ENABLE_MASK
        LEN_MASK        = (1 << LEN) ^ ENABLE_MASK
        ALERTS_MASK     = (ALERTS_BITS << ALERTS) ^ ENABLE_MASK
        DRDY            = (1 << CNVR)
        OVERFL          = (1 << OVF)

    ALERT_LIMIT         = $07

    MFR_ID              = $FE

    DIE_ID              = $FF

PUB null{}
' This is not a top-level object

DAT
{
Copyright (c) 2022 Jesse Burt

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

