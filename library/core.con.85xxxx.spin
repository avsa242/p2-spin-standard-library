{
    --------------------------------------------
    Filename: core.con.85xxxx.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Oct 27, 2019
    Updated May 20, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000
    SLAVE_ADDR          = $50 << 1

    T_POR               = 1_000                 ' usec

' Register definitions
    RSVD_SLAVE_W        = $F8
    RSVD_SLAVE_R        = $F9

' Page-select bit of slave address (for 1Mbit devices)
    PAGE_SEL            = 1
        PAGE_HI         = 1 << PAGE_SEL

PUB Null
' This is not a top-level object
