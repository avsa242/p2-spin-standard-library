{
    --------------------------------------------
    Filename: core.con.mcp320x.spin
    Author: Jesse Burt
    Description: MCP320x-specific constants
    Copyright (c) 2022
    Started Nov 26, 2019
    Updated Aug 6, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 0             ' can actually be 3 also
    SCK_MAX_FREQ_5V             = 1_800_000
    SCK_MAX_FREQ_2_7V           = 0_900_000

' Register definitions
    CONFIG                      = $00
        START                   = 3
        SGL_DIFF                = 2
        ODD_SIGN                = 1
        MSBF                    = 0

        START_MEAS              = 1 << START

        SINGLE_ENDED            = 1 << SGL_DIFF
        PSEUDO_DIFF             = 0 << SGL_DIFF

        CH1                     = 1 << ODD_SIGN
        CH0                     = 0 << ODD_SIGN

        IN0POS_IN1NEG           = 1 << ODD_SIGN
        IN0NEG_IN1POS           = 0 << ODD_SIGN

        MSBFIRST                = 1 << MSBF
        LSBFIRST                = 0 << MSBF


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

