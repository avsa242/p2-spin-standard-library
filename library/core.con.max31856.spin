{
    --------------------------------------------
    Filename: core.con.max31856.spin
    Author: Jesse Burt
    Description: Low-level driver constants
    Copyright (c) 2020
    Created: Sep 30, 2018
    Updated: Dec 6, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Clock Polarity/Mode
    CPOL                = 1             ' 0 or 1
    CLK_DELAY           = 1
    SCK_MAX_FREQ        = 5_000_000
    MOSI_BITORDER       = 5             'MSBFIRST
    MISO_BITORDER       = 2             'MSBPOST

' Read register addresses ORd with $80 to form Write Addresses
    WRITE_REG           = $80

    CR0                 = $00
    CR0_MASK            = $FF
        CMODE           = 7
        ONESHOT         = 6
        OCFAULT         = 4
        CJ              = 3
        FAULT           = 2
        FAULTCLR        = 1
        NOTCHFILT       = 0
        OCFAULT_BITS    = %11
        CMODE_MASK      = (1 << CMODE) ^ CR0_MASK
        ONESHOT_MASK    = (1 << ONESHOT) ^ CR0_MASK
        OCFAULT_MASK    = (OCFAULT_BITS << OCFAULT) ^ CR0_MASK
        CJ_MASK         = (1 << CJ) ^ CR0_MASK
        FAULT_MASK      = (1 << FAULT) ^ CR0_MASK
        FAULTCLR_MASK   = (1 << FAULTCLR) ^ CR0_MASK
        NOTCHFILT_MASK  = 1 ^ CR0_MASK

    CR1                 = $01
    CR1_MASK            = $7F
        AVGSEL          = 4
        TC_TYPE         = 0
        AVGSEL_BITS     = %111
        TC_TYPE_BITS    = %1111
        AVGSEL_MASK     = (AVGSEL_BITS << AVGSEL) ^ CR1_MASK
        TC_TYPE_MASK    = TC_TYPE_BITS ^ CR1_MASK

    FAULTMASK           = $02
    FAULTMASK_MASK      = $3F
        RSVD            = 6
        CJ_HIGH         = 5
        CJ_LOW          = 4
        TC_HIGH         = 3
        TC_LOW          = 2
        OV_UV           = 1
        OPEN            = 0
        RSVD_BITS       = %11
        CJ_HIGH_MASK    = (1 << CJ_HIGH) ^ FAULTMASK_MASK
        CJ_LOW_MASK     = (1 << CJ_LOW) ^ FAULTMASK_MASK
        TC_HIGH_MASK    = (1 << TC_HIGH) ^ FAULTMASK_MASK
        TC_LOW_MASK     = (1 << TC_LOW) ^ FAULTMASK_MASK
        OV_UV_MASK      = (1 << OV_UV) ^ FAULTMASK_MASK
        OPEN_MASK       = 1 ^ FAULTMASK_MASK

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
