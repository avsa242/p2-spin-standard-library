{
    --------------------------------------------
    Filename: core.con.24xxxx.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Oct 26, 2019
    Updated Oct 27, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000         ' Datasheet specifies 1MHz max at 5.0V, 400kHz at 2.7V
    SLAVE_ADDR          = $50 << 1

    T_WR                = 10                ' Write cycle time (ms)
    T_WR_B              = 5                 ' Write cycle time, for parts with process letter "B"

PUB Null
' This is not a top-level object
