{
    --------------------------------------------
    Filename: core.con.ssd1351.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started: Mar 11, 2020
    Updated: May 9, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    CPOL                                = 0
    MOSI_BITORDER                       = 5             ' MSBFIRST
    SCK_MAX_FREQ                        = 20_000_000

' Register map
    SETCOLUMN                           = $15

    WRITERAM                            = $5C
    READRAM                             = $5D
    SETROW                              = $75
    MASTERCURRENT                       = $87

    HORIZ_SCROLL                        = $96       ' 6B CMD
    STOP_SCROLL                         = $9E
    START_SCROLL                        = $9F

    SETREMAP                            = $A0
    SETREMAP_MASK                       = $F7
        FLD_ADDRINC                     = 0
        FLD_SEGREMAP                    = 1
        FLD_SUBPIX_ORDER                = 2
        FLD_COMREMAP                    = 4
        FLD_COMSPLIT                    = 5
        FLD_COLORFORMAT                 = 6
        BITS_COLORFORMAT                = %11
        MASK_ADDRINC                    = SETREMAP_MASK ^ (1 << FLD_ADDRINC)
        MASK_SEGREMAP                   = SETREMAP_MASK ^ (1 << FLD_SEGREMAP)
        MASK_SUBPIX_ORDER               = SETREMAP_MASK ^ (1 << FLD_SUBPIX_ORDER)
        MASK_COMREMAP                   = SETREMAP_MASK ^ (1 << FLD_COMREMAP)
        MASK_COMSPLIT                   = SETREMAP_MASK ^ (1 << FLD_COMSPLIT)
        MASK_COLORFORMAT                = SETREMAP_MASK ^ (BITS_COLORFORMAT << FLD_COLORFORMAT)

    STARTLINE                           = $A1
    DISPLAYOFFSET                       = $A2

    DISPLAYALLOFF                       = $A4
    DISPLAYALLON                        = $A5
    NORMALDISPLAY                       = $A6
    INVERTDISPLAY                       = $A7

    FUNCSEL                             = $AB

    DISPLAYOFF                          = $AE
    DISPLAYON                           = $AF

    NOOP2                               = $B0

    PRECHARGE                           = $B1
    PRECHARGE_MASK                      = $FF
        FLD_PHASE1                      = 0
        FLD_PHASE2                      = 4
        BITS_PHASE1                     = %1111
        BITS_PHASE2                     = %1111
        MASK_PHASE1                     = PRECHARGE_MASK ^ (BITS_PHASE1)
        MASK_PHASE2                     = PRECHARGE_MASK ^ (BITS_PHASE2 << FLD_PHASE2)

    DISPENH                             = $B2       ' 4B CMD. B2 00 00 00 = NORMAL, B2 A4 00 00 = ENH PERF

    CLOCKDIV                            = $B3       ' LOCKED BY $FD ON POR
    CLOCKDIV_MASK                       = $FF
        FLD_CLKDIV                      = 0
        FLD_FOSCFREQ                    = 4
        BITS_CLKDIV                     = %1111
        BITS_FOSCFREQ                   = %1111
        MASK_CLKDIV                     = CLOCKDIV_MASK ^ (BITS_CLKDIV)
        MASK_FOSCFREQ                   = CLOCKDIV_MASK ^ (BITS_FOSCFREQ << FLD_FOSCFREQ)

    SETSEGLOWVOLTAGE                    = $B4       ' 4B CMD. B4 A0 B5 55 = EXTERNAL VSL (POR)
    SETGPIO                             = $B5
    SETGPIO_MASK                        = $0F
        FLD_GPIO0                       = 0
        FLD_GPIO1                       = 2
        BITS_GPIO0                      = %11
        BITS_GPIO1                      = %11
        MASK_GPIO0                      = BITS_GPIO0 ^ (BITS_GPIO0 << FLD_GPIO0)
        MASK_GPIO1                      = BITS_GPIO1 ^ (BITS_GPIO1 << FLD_GPIO1)

    SETSECPRECHG                        = $B6
    SETSECPRECHG_MASK                   = $0F

    GRAYSCALE_LUT                       = $B8       ' 64B CMD. B8 [A1..A63 = 00..B4]
    GRAYSCALE_RESET                     = $B9       ' DEFAULT LINEAR LUT (0, 2, 4, 6 .. 122, 124)

    PRECHARGELEVEL                      = $BB
    VCOMH                               = $BE

    SETCONTRASTABC                      = $C1       ' 4B CMD
    MASTERCONTRAST_CURR_CTRL            = $C7

    SETMUXRATIO                         = $CA

    NOOP3                               = $D1
    NOOP4                               = $E3

    SETLOCK                             = $FD
' Other constants
    SEL_EXTERNAL_VCC                    = $8E

PUB Null
'' This is not a top-level object
