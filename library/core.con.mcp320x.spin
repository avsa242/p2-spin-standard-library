{
    --------------------------------------------
    Filename: core.con.mcp320x.spin
    Author: Jesse Burt
    Description: MCP320x-specific constants
    Copyright (c) 2022
    Started Nov 26, 2019
    Updated Jul 2, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 0
    SCK_MAX_FREQ_5V             = 1_800_000
    SCK_MAX_FREQ_2_7V           = 0_900_000

' Register definitions
    CONFIG                      = $00
        START                   = 3
        SGL_DIFF                = 2
        ODD_SIGN                = 1
        MSBF                    = 0

        START_MEAS              = 1 << START

        SINGLE_ENDED            = 1 << SGL_DIFF
        PSEUDO_DIFF             = 0 << SGL_DIFF

        CH1                     = 1 << ODD_SIGN
        CH0                     = 0 << ODD_SIGN

        IN0POS_IN1NEG           = 1 << ODD_SIGN
        IN0NEG_IN1POS           = 0 << ODD_SIGN

        MSBFIRST                = 1 << MSBF
        LSBFIRST                = 0 << MSBF


PUB Null{}
' This is not a top-level object
