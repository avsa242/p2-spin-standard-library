{
---------------------------------------------------------------------------------------------------
    Filename:       core.con.mcp320x.spin
    Description:    MCP320x-specific constants
    Author:         Jesse Burt
    Started:        Nov 26, 2019
    Updated:        Mar 1, 2024
    Copyright (c) 2024 - See end of file for terms of use.
---------------------------------------------------------------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 0             ' can actually be 3 also
    SCK_MAX_FREQ_5V             = 1_800_000
    SCK_MAX_FREQ_2_7V           = 0_900_000

' Register definitions
    CONFIG                      = $00
        { 2-channel models only }
        START_2CH               = 3
        SGL_DIFF_2CH            = 2
        ODD_SIGN                = 1
        MSBF                    = 0

        START_MEAS_2CH          = 1 << START_2CH
        SINGLE_ENDED_2CH        = 1 << SGL_DIFF_2CH
        PSEUDO_DIFF_2CH         = 0 << SGL_DIFF_2CH
        MSBFIRST                = 1 << MSBF
        LSBFIRST                = 0 << MSBF

        { 4 and 8-channel models only }
        START_4_8CH             = 4
        SGL_DIFF_4_8CH          = 3
        CHANNEL                 = 0
        CHANNEL_BITS            = %111
        START_MEAS_4_8CH        = 1 << START_4_8CH
        SINGLE_ENDED_4_8CH      = 1 << SGL_DIFF_4_8CH
        PSEUDO_DIFF_4_8CH       = 0 << SGL_DIFF_4_8CH


PUB null()
' This is not a top-level object

DAT
{
Copyright 2024 Jesse Burt

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

