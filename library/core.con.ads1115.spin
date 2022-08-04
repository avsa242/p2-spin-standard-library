{
    -------------------------------------------
    Filename: core.con.ads1115.spin
    Author: Jesse Burt
    Description: ADS1115-specific constants
    Copyright (c) 2021
    Started Dec 29, 2019
    Updated Nov 13, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    I2C_MAX_FREQ_HS     = 3_400_000

    SLAVE_ADDR          = $48 << 1

    T_POR               = 1_000                 ' uSec

' Register definitions
    CONVERSION          = $00

    CONFIG              = $01
    CONFIG_MASK         = $FFFF
        OS              = 15
        MUX             = 12
        PGA             = 9
        MODE            = 8
        DR              = 5
        COMP_MODE       = 4
        COMP_POL        = 3
        COMP_LAT        = 2
        COMP_QUE        = 0
        MUX_BITS        = %111
        PGA_BITS        = %111
        DR_BITS         = %111
        COMP_QUE_BITS   = %11
        OS_MASK         = (1 << OS) ^ CONFIG_MASK
        MUX_MASK        = (MUX_BITS << MUX) ^ CONFIG_MASK
        PGA_MASK        = (PGA_BITS << PGA) ^ CONFIG_MASK
        MODE_MASK       = (1 << MODE) ^ CONFIG_MASK
        DR_MASK         = (DR_BITS << DR) ^ CONFIG_MASK
        COMP_MODE_MASK  = (1 << COMP_MODE) ^ CONFIG_MASK
        COMP_POL_MASK   = (1 << COMP_POL) ^ CONFIG_MASK
        COMP_LAT_MASK   = (1 << COMP_LAT) ^ CONFIG_MASK
        COMP_QUE_MASK   = COMP_QUE_BITS ^ CONFIG_MASK

    LO_THRESH           = $02

    HI_THRESH           = $03

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

