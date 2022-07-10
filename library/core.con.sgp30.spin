{
    --------------------------------------------
    Filename: core.con.sgp30.spin
    Author: Jesse Burt
    Description: SGP30-specific constants
    Copyright (c) 2020
    Started Nov 20, 2020
    Updated Nov 20, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $58 << 1

    T_POR               = 1_000                 ' usec
    T_IDLE              = 500
    T_IAQ_INIT          = 10_000
    T_MEAS_IAQ          = 12_000
    T_GET_IAQ_BASE      = 10_000
    T_SET_ABS_HUM       = 10_000
    T_MEAS_TEST         = 220_000
    T_GET_FEATURES      = 10_000
    T_MEAS_RAW          = 25_000
    T_GET_TVOC_INCBASE  = 10_000
    T_SET_TVOC_BASE     = 10_000
    T_GET_SN            = 900
'   (^^^NOTE: Datasheet says this should be T_IDLE, but empirical testing shows
'   this is about the minimum needed for the sensor to be ready)

' Commands
    IAQ_INIT            = $2003
    MEAS_IAQ            = $2008
    GET_IAQ_BASE        = $2015
    SET_IAQ_BASE        = $201E
    SET_ABS_HUM         = $2061
    MEAS_TEST           = $2032
    GET_FEATURES        = $202F
    MEAS_RAW            = $2050
    GET_TVOC_INCBASE    = $20B3
    SET_TVOC_BASE       = $2077
    GET_SN              = $3682


PUB Null{}
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

