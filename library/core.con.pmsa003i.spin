{
    --------------------------------------------
    Filename: core.con.pmsa003i.spin
    Author: Jesse Burt
    Description: PMSA0031-specific constants
    Copyright (c) 2022
    Started Aug 29, 2022
    Updated Aug 29, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    { I2C configuration }
    SLAVE_ADDR      = $12 << 1
    I2C_MAX_FREQ    = 100_000

    { timing }
    T_POR           = 2_300                     ' max time between measurements
    T_STABLE        = 30_000                    ' time after powerup before stable data

    { Registers }
    ST_CH1          = $00
    ST_CH2          = $01

    FRMLEN_MSB      = $02
    FRMLEN_LSB      = $03

    PM1_0_STD_MSB   = $04
    PM1_0_STD_LSB   = $05
    PM2_5_STD_MSB   = $06
    PM2_5_STD_LSB   = $07
    PM10_STD_MSB    = $08
    PM10_STD_LSB    = $09

    PM1_0_ATM_MSB   = $0a
    PM1_0_ATM_LSB   = $0b
    PM2_5_ATM_MSB   = $0c
    PM2_5_ATM_LSB   = $0d
    PM10_ATM_MSB    = $0e
    PM10_ATM_LSB    = $0f

    { number of particles with diameter beyond ... in 0.1L of air }
    P0_3_AIR_MSB    = $10                       ' 0.3um
    P0_3_AIR_LSB    = $11
    P0_5_AIR_MSB    = $12                       ' 0.5um
    P0_5_AIR_LSB    = $13
    P1_0_AIR_MSB    = $14                       ' 1.0um
    P1_0_AIR_LSB    = $15
    P2_5_AIR_MSB    = $16                       ' 2.5um
    P2_5_AIR_LSB    = $17
    P5_0_AIR_MSB    = $18                       ' 5.0um
    P5_0_AIR_LSB    = $19
    P10_AIR_MSB     = $1a                       ' 10um
    P10_AIR_LSB     = $1b

    VERSION         = $1c
    ERROR           = $1d

    CKSUM_MSB       = $1e
    CKSUM_LSB       = $1f

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

