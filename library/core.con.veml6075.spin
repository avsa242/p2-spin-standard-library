{
    --------------------------------------------
    Filename: core.con.veml6075.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Aug 18, 2019
    Updated May 22, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $10 << 1
    DEV_ID_RESP         = $0026

    T_POR               = 100_000               ' usec

' Register definitions
    UV_CONF             = $00
    UV_CONF_MASK        = $7F
        UV_IT           = 4
        HD              = 3
        UV_TRIG         = 2
        UV_AF           = 1
        SD              = 0
        UV_IT_BITS      = %111
        UV_IT_MASK      = (UV_IT_BITS << UV_IT) ^ UV_CONF_MASK
        HD_MASK         = (1 << HD) ^ UV_CONF_MASK
        UV_TRIG_MASK    = (1 << UV_TRIG) ^ UV_CONF_MASK
        UV_AF_MASK      = (1 << UV_AF) ^ UV_CONF_MASK
        SD_MASK         = (1 << SD) ^ UV_CONF_MASK

    UVA_DATA            = $07
    UVB_DATA            = $09
    UVCOMP1             = $0A
    UVCOMP2             = $0B
    DEV_ID              = $0C
        COMPANY         = 6
        SLAVE           = 4
        VERSION         = 0
        COMPANY_BITS    = %11
        SLAVE_BITS      = %11
        VERSION_BITS    = %1111

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

{
    --------------------------------------------------------------------------------------------------------
    TERMS OF USE: MIT License

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
    LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    --------------------------------------------------------------------------------------------------------
}
