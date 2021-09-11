{
    --------------------------------------------
    Filename: core.con.hd44780.spin
    Author: Jesse Burt
    Description: HD44780-specific low-level constants
    Copyright (c) 2021
    Started Sep 8, 2021
    Updated Sep 11, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    T_POR           = 1000                      ' startup time (usecs)

' Commands

    CLEAR           = $01
    HOME            = $02                       ' 1.52ms

    ENTRMD_SET      = $04                       ' 37us
        ID          = 1
        SHFT        = 0
        INCR        = 1 << ID
        DECR        = 0 << ID

    DISPONOFF       = $08                       ' .
    DISPONOFF_MASK  = $07
        DONOFF      = 2
        CRS         = 1
        BLINK       = 0
        DISPON      = 1 << DONOFF
        DISPOFF     = DISPON ^ DISPONOFF_MASK
        CRSON       = 1 << CRS
        CRSOFF      = CRSON ^ DISPONOFF_MASK
        CRSBLINK    = 1
        CRSNOBLINK  = CRSBLINK ^ DISPONOFF_MASK

    CRSDISPSHFT     = $10                       ' .
    CRSDISPSHFT_MASK= $0C
        SC          = 3
        RL          = 2
        DISPSHIFT   = 1 << SC
        CRSMOVE     = DISPSHIFT ^ CRSDISPSHFT_MASK
        SHIFTR      = 1 << RL
        SHIFTL      = SHIFTR ^ CRSDISPSHFT_MASK

    FUNCSET         = $20                       ' .
        DL          = 4
        NUMLINES    = 3
        FONT        = 2
        IF_8BIT     = 1 << DL
        IF_4BIT     = 0 << DL
        LINES2      = 1 << NUMLINES
        LINES1      = 0 << NUMLINES
        FNT10PX     = 1 << FONT
        FNT8PX      = 0 << FONT

    CGRAM_ADDR      = $40                       ' .
        ACG         = 0
        ACG_BITS    = %111111

    DDRAM_ADDR      = $80                       ' .
        DADD        = 0
        DADD_BITS   = %1111111


PUB Null{}
' This is not a top-level object

