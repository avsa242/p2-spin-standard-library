{
    --------------------------------------------
    Filename: core.con.max31856.spin
    Author: Jesse Burt
    Description: Low-level driver constants
    Copyright (c) 2020
    Created: Sep 30, 2018
    Updated: Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Clock Polarity/Mode
    CPOL                = 1
    CLK_DELAY           = 10
    SCK_MAX_HZ          = 5_000_000
    MOSI_BITORDER       = 5             'MSBFIRST
    MISO_BITORDER       = 2             'MSBPOST

' Read register addresses ORd with $80 to form Write Addresses
    WRITE_REG           = $80

    CR0                 = $00
    CR0_MASK            = $FF
        FLD_CMODE       = 7
        FLD_ONESHOT     = 6
        FLD_OCFAULT     = 4
        FLD_CJ          = 3
        FLD_FAULT       = 2
        FLD_FAULTCLR    = 1
        FLD_NOTCHFILT   = 0
        BITS_OCFAULT    = %11
        MASK_CMODE      = CR0_MASK ^ (1 << FLD_CMODE)
        MASK_ONESHOT    = CR0_MASK ^ (1 << FLD_ONESHOT)
        MASK_OCFAULT    = CR0_MASK ^ (BITS_OCFAULT << FLD_OCFAULT)
        MASK_CJ         = CR0_MASK ^ (1 << FLD_CJ)
        MASK_FAULT      = CR0_MASK ^ (1 << FLD_FAULT)
        MASK_FAULTCLR   = CR0_MASK ^ (1 << FLD_FAULTCLR)
        MASK_NOTCHFILT  = CR0_MASK ^ (1 << FLD_NOTCHFILT)

    CR1                 = $01
    CR1_MASK            = $7F
        FLD_AVGSEL      = 4
        FLD_TC_TYPE     = 0
        BITS_AVGSEL     = %111
        BITS_TC_TYPE    = %1111
        MASK_AVGSEL     = CR1_MASK ^ (BITS_AVGSEL << FLD_AVGSEL)
        MASK_TC_TYPE    = CR1_MASK ^ (BITS_TC_TYPE << FLD_TC_TYPE)

    MASK                = $02
    MASK_MASK           = $3F
        FLD_CJ_HIGH     = 5
        FLD_CJ_LOW      = 4
        FLD_TC_HIGH     = 3
        FLD_TC_LOW      = 2
        FLD_OV_UV       = 1
        FLD_OPEN        = 0
        MASK_CJ_HIGH    = MASK_MASK ^ (1 << FLD_CJ_HIGH)
        MASK_CJ_LOW     = MASK_MASK ^ (1 << FLD_CJ_LOW)
        MASK_TC_HIGH    = MASK_MASK ^ (1 << FLD_TC_HIGH)
        MASK_TC_LOW     = MASK_MASK ^ (1 << FLD_TC_LOW)
        MASK_OV_UV      = MASK_MASK ^ (1 << FLD_OV_UV)
        MASK_OPEN       = MASK_MASK ^ (1 << FLD_OPEN)

    CJHF                = $03

    CJLF                = $04

    LTHFTH              = $05
    LTHFTL              = $06

    LTLFTH              = $07
    LTLFTL              = $08

    CJTO                = $09

    CJTH                = $0A
    CJTL                = $0B

    LTCBH               = $0C
    LTCBM               = $0D
    LTCBL               = $0E
    
    SR                  = $0F

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
