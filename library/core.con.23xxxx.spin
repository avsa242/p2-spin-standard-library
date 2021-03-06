{
    --------------------------------------------
    Filename: core.con.23lcxxxx.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started May 20, 2019
    Updated Mar 6, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 0
    SCK_MAX_FREQ                = 20_000_000

' Register definitions
    WRMR                        = $01
    WRMR_MASK                   = $C0
        WR_MODE                 = 6
        WR_MODE_BITS            = %11

    WRITE                       = $02
    READ                        = $03
    RDMR                        = $05
    RDMR_MASK                   = $C0
        RD_MODE                 = 6
        RD_MODE_BITS            = %11

    EQIO                        = $38
    EDIO                        = $3B
    RSTIO                       = $FF

PUB Null
' This is not a top-level object
