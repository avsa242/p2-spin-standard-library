{
    --------------------------------------------
    Filename: core.con.shtc3.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Jul 27, 2020
    Updated Feb 15, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000
    SLAVE_ADDR          = $70 << 1

    T_POR               = 240                   ' usec
    DEVID_RESP          = $0807

' Register definitions

    WAKEUP              = $3517
    LP_RHFIRST          = $401A
    LP_RHFIRST_CS       = $44DE
    NML_RHFIRST         = $58E0
    NML_RHFIRST_CS      = $5C24
    LP_TEMPFIRST        = $609C
    LP_TEMPFIRST_CS     = $6458
    NML_TEMPFIRST       = $7866
    NML_TEMPFIRST_CS    = $7CA2
    RESET               = $805D
    SLEEP               = $B098
    DEVID               = $EFC8

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif
