{
    --------------------------------------------
    Filename: core.con.max9744.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Jul 7, 2018
    Updated Nov 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ            = 400_000
    SLAVE_ADDR              = $4B << 1

' Register definitions
    CMD_VOL_UP              = %11_000100
    CMD_VOL_DN              = %11_000101
    MOD_FILTERLESS          = %01_000000
    MOD_CLASSICPWM          = %01_000001

#ifndef __propeller2__
PUB Null
' This is not a top-level object
#endif
