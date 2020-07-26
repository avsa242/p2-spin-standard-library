{
    --------------------------------------------
    Filename: core.con.mcp9808.spin2
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Jul 26, 2020
    Updated Jul 26, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ    = 400_000
    SLAVE_ADDR      = $18 << 1

'' Register definitions
    RFU             = $00           ' R/O

    CONFIG          = $01           ' R/W
    CONFIG_MASK     = $07FF
        FLD_HYST    = 9
        FLD_SHDN    = 8
        FLD_CRTLOC  = 7
        FLD_WINLOC  = 6
        FLD_INTCLR  = 5
        FLD_ALTSTAT = 4
        FLD_ALTCNT  = 3
        FLD_ALTSEL  = 2
        FLD_ALTPOL  = 1
        FLD_ALTMOD  = 0
        BITS_HYST   = %11
        MASK_HYST   = CONFIG_MASK ^ (BITS_HYST << FLD_HYST)
        MASK_SHDN   = CONFIG_MASK ^ (1 << FLD_SHDN)
        MASK_CRTLOC = CONFIG_MASK ^ (1 << FLD_CRTLOC)
        MASK_WINLOC = CONFIG_MASK ^ (1 << FLD_WINLOC)
        MASK_INTCLR = CONFIG_MASK ^ (1 << FLD_INTCLR)
        MASK_ALTSTAT= CONFIG_MASK ^ (1 << FLD_ALTSTAT)
        MASK_ALTCNT = CONFIG_MASK ^ (1 << FLD_ALTCNT)
        MASK_ALTSEL = CONFIG_MASK ^ (1 << FLD_ALTSEL)
        MASK_ALTPOL = CONFIG_MASK ^ (1 << FLD_ALTPOL)
        MASK_ALTMOD = CONFIG_MASK ^ (1 << FLD_ALTMOD)

    ALERT_UPPER     = $02           ' R/W
    ALERT_LOWER     = $03           ' R/W
    ALERT_CRIT      = $04           ' R/W
    TEMP            = $05           ' R/O
    MFR_ID          = $06           ' R/O
    DEV_ID          = $07           ' R/O
        DEVID_RESP  = $0054_0400    ' Expected response: MFR_DEV
    RESOLUTION      = $08           ' R/W

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
