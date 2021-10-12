{
    --------------------------------------------
    Filename: core.con.pcf8574.spin
    Author: Jesse Burt
    Description: PCF8574-specific low-level constants
    Copyright (c) 2021
    Started Sep 6, 2021
    Updated Oct 12, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 100_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $20 << 1                  ' 7-bit format slave address
    T_POR           = 1000                      ' startup time (usecs)

PUB Null{}
' This is not a top-level object

