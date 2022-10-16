{
    --------------------------------------------
    Filename: core.con.htu21d.spin
    Author: Jesse Burt
    Description: HTU21D-specific constants
    Copyright (c) 2021
    Started Jun 16, 2021
    Updated Jun 16, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $40 << 1                  ' 7-bit format slave address
    T_POR           = 15_000                    ' startup time (usecs)

' Register definitions
    TEMPMEAS_CS     = $E3
    RHMEAS_CS       = $E5
    TEMPMEAS        = $F3
    RHMEAS          = $F5
    WR_USR_REG      = $E6
    RD_USR_REG      = $E7
    USR_REG_MASK    = $C7
        ADCRES_MSB  = 7
        ADCRES_LSB  = 0
        BATT        = 6
        HEATER      = 2
        DIS_OTP_REL = 1
        ADCRES_MASK = ((1 << ADCRES_MSB) | (1 << ADCRES_LSB)) ^ USR_REG_MASK
        BATT_MASK   = (1 << BATT) ^ USR_REG_MASK
        HEATER_MASK = (1 << HEATER) ^ USR_REG_MASK
        DIS_OTP_MASK= (1 << DIS_OTP_REL) ^ USR_REG_MASK

    SOFTRESET       = $FE

PUB null{}
' This is not a top-level object

DAT
{
Copyright 2022 Jesse Burt

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

