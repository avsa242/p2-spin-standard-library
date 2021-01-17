{
    --------------------------------------------
    Filename: core.con.mcp9808.spin2
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Jul 26, 2020
    Updated Jan 17, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ    = 400_000
    SLAVE_ADDR      = $18 << 1

' Register definitions
    RFU             = $00           ' R/O

    CONFIG          = $01           ' R/W
    CONFIG_MASK     = $07FF
        HYST        = 9
        SHDN        = 8
        CRTLOC      = 7
        WINLOC      = 6
        INTCLR      = 5
        ALTSTAT     = 4
        ALTCNT      = 3
        ALTSEL      = 2
        ALTPOL      = 1
        ALTMOD      = 0
        HYST_BITS   = %11
        HYST_MASK   = (HYST_BITS << HYST) ^ CONFIG_MASK
        SHDN_MASK   = (1 << SHDN) ^ CONFIG_MASK
        CRTLOC_MASK = (1 << CRTLOC) ^ CONFIG_MASK
        WINLOC_MASK = (1 << WINLOC) ^ CONFIG_MASK
        INTCLR_MASK = (1 << INTCLR) ^ CONFIG_MASK
        ALTSTAT_MASK= (1 << ALTSTAT) ^ CONFIG_MASK
        ALTCNT_MASK = (1 << ALTCNT) ^ CONFIG_MASK
        ALTSEL_MASK = (1 << ALTSEL) ^ CONFIG_MASK
        ALTPOL_MASK = (1 << ALTPOL) ^ CONFIG_MASK
        ALTMOD_MASK = (1 << ALTMOD) ^ CONFIG_MASK

    ALERT_UPPER     = $02           ' R/W
    ALERT_LOWER     = $03           ' R/W
    ALERT_CRIT      = $04           ' R/W
    TEMP            = $05           ' R/O
    MFR_ID          = $06           ' R/O
    DEV_ID          = $07           ' R/O
        DEVID_RESP  = $0054_0400    ' Expected response: MFR_DEV
    RESOLUTION      = $08           ' R/W

#ifndef __propeller2__
PUB Null{}
' This is not a top-level object
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

