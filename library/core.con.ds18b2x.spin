{
    --------------------------------------------
    Filename: core.con.ds18b2x.spin
    Author: Jesse Burt
    Description: DS18B20-specific constants
    Copyright (c) 2021
    Started Jul 13, 2019
    Updated Feb 7, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    FAMILY_20   = $28
    FAMILY_22   = $22

    CONV_TEMP   = $44
    COPY_SPAD   = $48
    WR_SPAD     = $4E
    RD_POWER    = $B4
    RD_EE       = $B8
    RD_SPAD     = $BE

' Configuration (ADC res) bits
    R0          = 5
    R1          = 6

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

