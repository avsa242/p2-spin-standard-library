{
    --------------------------------------------
    Filename: core.con.shtc3.spin
    Author: Jesse Burt
    Description: SHTC3-specific constants
    Copyright (c) 2021
    Started Jul 27, 2020
    Updated Feb 15, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000
    SLAVE_ADDR          = $70 << 1

    T_POR               = 240                   ' usec
    DEVID_RESP          = $0807

' Register definitions

    WAKEUP              = $3517
    LP_RHFIRST          = $401A
    LP_RHFIRST_CS       = $44DE
    NML_RHFIRST         = $58E0
    NML_RHFIRST_CS      = $5C24
    LP_TEMPFIRST        = $609C
    LP_TEMPFIRST_CS     = $6458
    NML_TEMPFIRST       = $7866
    NML_TEMPFIRST_CS    = $7CA2
    RESET               = $805D
    SLEEP               = $B098
    DEVID               = $EFC8

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

