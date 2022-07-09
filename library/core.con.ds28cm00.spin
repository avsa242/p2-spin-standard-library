{
    --------------------------------------------
    Filename: core.con.ds28cm00.spin
    Author: Jesse Burt
    Description: DS28CM00-specific constants
    Copyright (c) 2021
    Started Feb 16, 2019
    Updated May 19, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $50 << 1

    T_POR               = 1_000                 ' usec

' Register definitions
    DEV_FAMILY          = $00
        DEVID_RESP      = $70                   ' Family code
    SN_0_7              = $01
    SN_8_15             = $02
    SN_16_23            = $03
    SN_24_31            = $04
    SN_32_39            = $05
    SN_40_47            = $06
    CRC                 = $07
    CTRL_REG            = $08
    CTRL_REG_MASK       = $01
        CM              = 0

    CM_I2C              = 0
    CM_SMBUS            = 1

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

