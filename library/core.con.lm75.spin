{
    --------------------------------------------
    Filename: core.con.lm75.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started May 19, 2019
    Updated Nov 19, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $48 << 1

' Register definitions
    TEMP                = $00
    TEMP_MASK           = $FF80

    CONFIG              = $01
    CONFIG_MASK         = $1F
        FAULTQ          = 3
        OS_POL          = 2
        COMP_INT        = 1
        SHUTDOWN        = 0
        FAULTQ_BITS     = %11
        OS_POL_MASK     = (1 << OS_POL) ^ CONFIG
        COMP_INT_MASK   = (1 << COMP_INT) ^ CONFIG
        FAULTQ_MASK     = (FAULTQ_BITS << FAULTQ) ^ CONFIG
        SHUTDOWN_MASK   = 1 ^ CONFIG

    T_HYST              = $02
    T_HYST_MASK         = $FF80

    T_OS                = $03
    T_OS_MASK           = $FF80

PUB Null{}
' This is not a top-level object
