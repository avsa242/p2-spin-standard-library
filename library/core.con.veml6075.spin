{
    --------------------------------------------
    Filename: core.con.veml6075.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Aug 18, 2019
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $10 << 1
    DEV_ID_RESP         = $0026

' Register definitions
    UV_CONF             = $00
    UV_CONF_MASK        = $7F
        FLD_UV_IT       = 4
        FLD_HD          = 3
        FLD_UV_TRIG     = 2
        FLD_UV_AF       = 1
        FLD_SD          = 0
        BITS_UV_IT      = %111
        MASK_UV_IT      = UV_CONF_MASK ^ (BITS_UV_IT << FLD_UV_IT)
        MASK_HD         = UV_CONF_MASK ^ (1 << FLD_HD)
        MASK_UV_TRIG    = UV_CONF_MASK ^ (1 << FLD_UV_TRIG)
        MASK_UV_AF      = UV_CONF_MASK ^ (1 << FLD_UV_AF)
        MASK_SD         = UV_CONF_MASK ^ (1 << FLD_SD)

    UVA_DATA            = $07
    UVB_DATA            = $09
    UVCOMP1             = $0A
    UVCOMP2             = $0B
    DEV_ID              = $0C
        FLD_COMPANY     = 6
        FLD_SLAVE       = 4
        FLD_VERSION     = 0
        BITS_COMPANY    = %11
        BITS_SLAVE      = %11
        BITS_VERSION    = %1111

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
