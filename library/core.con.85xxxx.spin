{
    --------------------------------------------
    Filename: core.con.85xxxx.spin
    Author: Jesse Burt
    Description: 85xxxx-specific constants
    Copyright (c) 2021
    Started Oct 27, 2019
    Updated May 20, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000
    SLAVE_ADDR          = $50 << 1

    T_POR               = 1_000                 ' usec

' Register definitions
    RSVD_SLAVE_W        = $F8
    RSVD_SLAVE_R        = $F9

' Page-select bit of slave address (for 1Mbit devices)
    PAGE_SEL            = 1
        PAGE_HI         = 1 << PAGE_SEL

PUB Null
' This is not a top-level object

DAT
{
TERMS OF USE: MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}

