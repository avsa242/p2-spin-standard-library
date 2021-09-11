{
    --------------------------------------------
    Filename: core.con.ina219.spin
    Author: Jesse Burt
    Description: INA219-specific low-level constants
    Copyright (c) 2021
    Started Sep 18, 2019
    Updated Aug 20, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 2_560_000
    SLAVE_ADDR          = $40 << 1

    T_POR               = 1_000                 ' usec
    DEVID_RESP          = CONFIG_POR

' Register definitions
    CONFIG              = $00   'RW
    CONFIG_MASK         = $BFFF
    CONFIG_POR          = $399F 'POR value, used to ID the chip
        RST             = 15
        BRNG            = 13
        PG              = 11
        BADC            = 7
        SADC_AVG        = 6
        SADC            = 3
        MODE            = 0
        PG_BITS         = %11
        BADC_BITS       = %1111
        SADC_BITS       = %1111
        MODE_BITS       = %111
        BRNG_MASK       = (1 << BRNG) ^ CONFIG_MASK
        PG_MASK         = (PG_BITS << PG) ^ CONFIG_MASK
        BADC_MASK       = (BADC_BITS << BADC) ^ CONFIG_MASK
        SADC_MASK       = (SADC_BITS << SADC) ^ CONFIG_MASK
        MODE_MASK       = MODE_BITS ^ CONFIG_MASK

    SHUNT_VOLTAGE       = $01   'RO

    BUS_VOLTAGE         = $02
    BUS_VOLTAGE_MASK    = $FFFB
        BD              = 3
        CNVR            = 1
        OVF             = 0

    POWER               = $03

    CURRENT             = $04

    CALIBRATION         = $05
    CALIBRATION_MASK    = $FFFE 'bit 0 is RO

PUB Null{}
' This is not a top-level object

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
