{
    --------------------------------------------
    Filename: core.con.hd44780.spin
    Author: Jesse Burt
    Description: HD44780-specific low-level constants
    Copyright (c) 2021
    Started Sep 8, 2021
    Updated Sep 11, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    T_POR           = 1000                      ' startup time (usecs)

' Commands

    CLEAR           = $01
    HOME            = $02                       ' 1.52ms

    ENTRMD_SET      = $04                       ' 37us
        ID          = 1
        SHFT        = 0
        INCR        = 1 << ID
        DECR        = 0 << ID

    DISPONOFF       = $08                       ' .
    DISPONOFF_MASK  = $07
        DONOFF      = 2
        CRS         = 1
        BLINK       = 0
        DISPON      = 1 << DONOFF
        DISPOFF     = DISPON ^ DISPONOFF_MASK
        CRSON       = 1 << CRS
        CRSOFF      = CRSON ^ DISPONOFF_MASK
        CRSBLINK    = 1
        CRSNOBLINK  = CRSBLINK ^ DISPONOFF_MASK

    CRSDISPSHFT     = $10                       ' .
    CRSDISPSHFT_MASK= $0C
        SC          = 3
        RL          = 2
        DISPSHIFT   = 1 << SC
        CRSMOVE     = DISPSHIFT ^ CRSDISPSHFT_MASK
        SHIFTR      = 1 << RL
        SHIFTL      = SHIFTR ^ CRSDISPSHFT_MASK

    FUNCSET         = $20                       ' .
        DL          = 4
        NUMLINES    = 3
        FONT        = 2
        IF_8BIT     = 1 << DL
        IF_4BIT     = 0 << DL
        LINES2      = 1 << NUMLINES
        LINES1      = 0 << NUMLINES
        FNT10PX     = 1 << FONT
        FNT8PX      = 0 << FONT

    CGRAM_ADDR      = $40                       ' .
        ACG         = 0
        ACG_BITS    = %111111

    DDRAM_ADDR      = $80                       ' .
        DADD        = 0
        DADD_BITS   = %1111111


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

