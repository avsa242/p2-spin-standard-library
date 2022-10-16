{
    --------------------------------------------
    Filename: core.con.aht20.spin
    Author: Jesse Burt
    Description: AHT20-specific constants
    Copyright (c) 2022
    Started Mar 26, 2022
    Updated Mar 27, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    { I2C Configuration }
    I2C_MAX_FREQ    = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $38 << 1                  ' 7-bit format slave address
    T_POR           = 100_000                   ' startup time (usecs)
    T_RES           = 20_000                    ' reset time (usecs)

    DEVID_RESP      = SLAVE_ADDR                ' expected device ID response

    { Register definitions }
    STATUS          = $71
        BUSY        = 7
        CAL_OK      = 3
        ST_BUSY     = (1 << BUSY)
        ST_CAL_OK   = (1 << CAL_OK)
    CMD_MEAS        = $AC
        MEAS_PARMSB = $33
        MEAS_PARLSB = $00
    CMD_SOFT_RST    = $BA
    CMD_CAL         = $E1
        CAL_PARMSB  = $08
        CAL_PARLSB  = $00
    GET_MEAS        = $52_45_41_44              ' pseudo-reg 'R_E_A_D'

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

