{
    --------------------------------------------
    Filename: core.con.ina260.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Nov 13, 2019
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    FAST_MAX            = 400_000
    HI_MAX              = 2_940_000
    I2C_MAX_FREQ        = HI_MAX

    SLAVE_ADDR          = $40 << 1

    DEVID_RESP          = $22705449 ' DieID << 16 | MfrID

' Register definitions

    CONFIG              = $00
    CONFIG_MASK         = $8FFF
        FLD_RESET       = 15
        FLD_AVG         = 9
        FLD_VBUSCT      = 6
        FLD_ISHCT       = 3
        FLD_MODE        = 0
        BITS_RSVD       = %110 << 12    ' Reserved bits
        BITS_AVG        = %111
        BITS_VBUSCT     = %111
        BITS_ISHCT      = %111
        BITS_MODE       = %111
        MASK_RESET      = CONFIG_MASK ^ (1 << FLD_RESET)
        MASK_AVG        = CONFIG_MASK ^ (BITS_AVG << FLD_AVG)
        MASK_VBUSCT     = CONFIG_MASK ^ (BITS_VBUSCT << FLD_VBUSCT)
        MASK_ISHCT      = CONFIG_MASK ^ (BITS_ISHCT << FLD_ISHCT)
        MASK_MODE       = CONFIG_MASK ^ (BITS_MODE << FLD_MODE)

    CURRENT             = $01

    BUS_VOLTAGE         = $02

    POWER               = $03

    MASK_ENABLE         = $06
    MASK_ENABLE_MASK    = $FC1F
        FLD_OCL         = 15
        FLD_UCL         = 14
        FLD_BOL         = 13
        FLD_BUL         = 12
        FLD_POL         = 11
        FLD_CNVR        = 10
        FLD_AFF         = 4
        FLD_CVRF        = 3
        FLD_OVF         = 2
        FLD_APOL        = 1
        FLD_LEN         = 0
        FLD_ALERTS      = 10
        BITS_ALERTS     = %111111
        MASK_OCL        = MASK_ENABLE_MASK ^ (1 << FLD_OCL)
        MASK_UCL        = MASK_ENABLE_MASK ^ (1 << FLD_UCL)
        MASK_BOL        = MASK_ENABLE_MASK ^ (1 << FLD_BOL)
        MASK_BUL        = MASK_ENABLE_MASK ^ (1 << FLD_BUL)
        MASK_POL        = MASK_ENABLE_MASK ^ (1 << FLD_POL)
        MASK_CNVR       = MASK_ENABLE_MASK ^ (1 << FLD_CNVR)
        MASK_AFF        = MASK_ENABLE_MASK ^ (1 << FLD_AFF)
        MASK_CVRF       = MASK_ENABLE_MASK ^ (1 << FLD_CVRF)
        MASK_OVF        = MASK_ENABLE_MASK ^ (1 << FLD_OVF)
        MASK_APOL       = MASK_ENABLE_MASK ^ (1 << FLD_APOL)
        MASK_LEN        = MASK_ENABLE_MASK ^ (1 << FLD_LEN)
        MASK_ALERTS     = MASK_ENABLE_MASK ^ (BITS_ALERTS << FLD_ALERTS)

    ALERT_LIMIT         = $07

    MFR_ID              = $FE

    DIE_ID              = $FF

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

DAT
{
    --------------------------------------------------------------------------------------------------------
    TERMS OF USE: MIT License

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
    LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    --------------------------------------------------------------------------------------------------------
}
