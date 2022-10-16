{
    --------------------------------------------
    Filename: core.con.max9744.spin
    Author: Jesse Burt
    Description: MAX9744-specific constants
    Copyright (c) 2021
    Started Jul 7, 2018
    Updated May 1, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ            = 400_000
    SLAVE_ADDR              = $4B << 1

' Register definitions
    CMD_VOL_UP              = %11_000100
    CMD_VOL_DN              = %11_000101
    MOD_FILTERLESS          = %01_000000
    MOD_CLASSICPWM          = %01_000001

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

