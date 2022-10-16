{
    --------------------------------------------
    Filename: core.con.mma7455.spin
    Author: Jesse Burt
    Description: MMA7455-specific constants
    Copyright (c) 2021
    Started Nov 27, 2019
    Updated Dec 30, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $1D << 1
    DEVID_RESP          = $55

' Register definitions
    XOUTL               = $00
    XOUTH               = $01
    YOUTL               = $02
    YOUTH               = $03
    ZOUTL               = $04
    ZOUTH               = $05
    XOUT8               = $06
    YOUT8               = $07
    ZOUT8               = $08

    STATUS              = $09
    STATUS_MASK         = $07
        PERR            = 2
        DOVR            = 1
        DRDY            = 0

    DETSRC              = $0A
    TOUT                = $0B
' RESERVED - $0C
    I2CAD               = $0D
    USRINF              = $0E
    WHOAMI              = $0F
    XOFFL               = $10
    XOFFH               = $11
    YOFFL               = $12
    YOFFH               = $13
    ZOFFL               = $14
    ZOFFH               = $15

    MCTL                = $16
    MCTL_MASK           = $7F
        DRPD            = 6
        SPI3W           = 5
        STON            = 4
        GLVL            = 2
        MODE            = 0
        GLVL_BITS       = %11
        MODE_BITS       = %11
        DRPD_MASK       = (1 << DRPD) ^ MCTL_MASK
        SPI3W_MASK      = (1 << SPI3W) ^ MCTL_MASK
        STON_MASK       = (1 << STON) ^ MCTL_MASK
        GLVL_MASK       = (GLVL_BITS << GLVL) ^ MCTL_MASK
        MODE_MASK       = MODE_BITS ^ MCTL_MASK
        DRPD_EN         = DRPD_MASK
        DRPD_DIS        = (1 << DRPD)
        DRPD_BIT        = (1 << DRPD)

    INTRST              = $17
    INTRST_MASK         = $03
        CLR_INT2        = 1
        CLR_INT1        = 0
        CLR_INT_BITS    = %11
        CLR_INT_MASK    = CLR_INT_BITS ^ INTRST_MASK

    CTL1                = $18
    CTL1_MASK           = $FF
        DFBW            = 7
        THOPT           = 6
        ZDA             = 5
        YDA             = 4
        XDA             = 3
        ZYXDA           = 3
        INTREG          = 1
        INTPIN          = 0
        INTMASK         = 0                     ' pseudo field: all except DFBW
        ZYXDA_BITS      = %111
        INTREG_BITS     = %11
        INTMASK_BITS    = %1111111
        DFBW_MASK       = (1 << DFBW) ^ CTL1_MASK
        THOPT_MASK      = (1 << THOPT) ^ CTL1_MASK
        ZYXDA_MASK      = (ZYXDA_BITS << ZYXDA) ^ CTL1_MASK
        INTREG_MASK     = (INTREG_BITS << INTREG) ^ CTL1_MASK
        INTPIN_MASK     = 1 ^ CTL1_MASK
        INTMASK_MASK    = INTMASK_BITS ^ CTL1_MASK
        ZYXDA_INV       = ZYXDA_BITS << ZYXDA

    CTL2                = $19
    LDTH                = $1A
    PDTH                = $1B
    PW                  = $1C
    LT                  = $1D
    TW                  = $1E
' RESERVED - $1F


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

