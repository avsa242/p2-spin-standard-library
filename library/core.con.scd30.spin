{
    --------------------------------------------
    Filename: core.con.scd30.spin
    Author: Jesse Burt
    Description: SCD30-specific low-level constants
    Copyright (c) 2021
    Started Jul 10, 2021
    Updated Jul 18, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 100_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $61 << 1                  ' 7-bit format slave address
    T_POR           = 2_000_000                 ' startup time (usecs)
    T_RES           = 23_000                    ' reset/warm startup time
    T_WRRD          = 4_000                     ' delay between wr/rd headers

' Register definitions
    CONTMEAS        = $0010
    STOPMEAS        = $0104
    GETDRDY         = $0202
    READMEAS        = $0300
    SETMEASINTERV   = $4600
    ALTITUDECOMP    = $5102
    SETRECALVAL     = $5204
    AUTOSELFCAL     = $5306
    SETTEMPOFFS     = $5403
    FWVER           = $D100
    SOFTRESET       = $D304

PUB Null{}
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

