{
    --------------------------------------------
    Filename: core.con.scd30.spin
    Author: Jesse Burt
    Description: SCD30-specific low-level constants
    Copyright (c) 2021
    Started Jul 10, 2021
    Updated Jul 18, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 100_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $61 << 1                  ' 7-bit format slave address
    T_POR           = 2_000_000                 ' startup time (usecs)
    T_RES           = 23_000                    ' reset/warm startup time
    T_WRRD          = 4_000                     ' delay between wr/rd headers

' Register definitions
    CONTMEAS        = $0010
    STOPMEAS        = $0104
    GETDRDY         = $0202
    READMEAS        = $0300
    SETMEASINTERV   = $4600
    ALTITUDECOMP    = $5102
    SETRECALVAL     = $5204
    AUTOSELFCAL     = $5306
    SETTEMPOFFS     = $5403
    FWVER           = $D100
    SOFTRESET       = $D304

PUB Null{}
' This is not a top-level object

