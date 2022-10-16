{
    --------------------------------------------
    Filename: core.con.23lcxxxx.spin
    Author: Jesse Burt
    Description: 23xxxx-specific constants
    Copyright (c) 2021
    Started May 20, 2019
    Updated Mar 6, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 0
    SCK_MAX_FREQ                = 20_000_000

' Register definitions
    WRMR                        = $01
    WRMR_MASK                   = $C0
        WR_MODE                 = 6
        WR_MODE_BITS            = %11

    WRITE                       = $02
    READ                        = $03
    RDMR                        = $05
    RDMR_MASK                   = $C0
        RD_MODE                 = 6
        RD_MODE_BITS            = %11

    EQIO                        = $38
    EDIO                        = $3B
    RSTIO                       = $FF

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

