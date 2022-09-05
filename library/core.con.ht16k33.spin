{
    --------------------------------------------
    Filename: core.con.ht16k33.spin
    Description: HT16K33-specific constants
    Author: Jesse Burt
    Created Oct 9, 2018
    Updated Nov 22, 2020
    Copyright (c) 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR      = $70 << 1
    I2C_MAX_FREQ    = 400_000

    T_POR           = 1_000                     ' usec

' Registers/commands
    DISP_RAM        = $00                       ' Start of display RAM

' command is upper nibble
' parameter is OR'd with it
    OSCILLATOR      = $20

    DISPSETUP       = $80
    DISPSETUP_MASK  = $07
        BLINK       = 1
        ONOFF       = 0
        BLINK_BITS  = %11
        BLINK_MASK  = (BLINK_BITS << BLINK) ^ DISPSETUP_MASK
        ONOFF_MASK  = 1 ^ DISPSETUP_MASK

    ROWINT          = $A0
    BRIGHTNESS      = $E0
    TESTMODE        = $D9

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

