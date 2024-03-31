{
----------------------------------------------------------------------------------------------------
    Filename:       core.con.ssd1351.spin
    Description:    SSD1351-specific constants
    Author:         Jesse Burt
    Started:        Mar 11, 2020
    Updated:        Mar 31, 2024
    Copyright (c) 2024 - See end of file for terms of use.
----------------------------------------------------------------------------------------------------
}

CON

' SPI configuration
    SCK_MAX_FREQ            = 20_000_000
    SPI_MODE                = 0

    T_POR                   = 300_000           ' uSec

' D/C states
    CMD                     = 0                 ' D/C low
    DATA                    = 1                 ' D/C high

' Register map
    SETCOLUMN               = $15

    WRITERAM                = $5C
    READRAM                 = $5D
    SETROW                  = $75
    MASTCURRENT             = $87

    HORIZ_SCROLL            = $96       ' 6B CMD
    STOP_SCROLL             = $9E
    START_SCROLL            = $9F

    SETREMAP                = $A0
    SETREMAP_MASK           = $F7
        COLORFMT            = 6
        COMSPLIT            = 5
        COMREMAP            = 4
        SUBPIX_ORDER        = 2
        SEGREMAP            = 1
        ADDRINC             = 0
        COLORFMT_BITS       = %11
        COLORFMT_MASK       = (COLORFMT_BITS << COLORFMT) ^ SETREMAP_MASK
        COMSPLIT_MASK       = (1 << COMSPLIT) ^ SETREMAP_MASK
        COMREMAP_MASK       = (1 << COMREMAP) ^ SETREMAP_MASK
        SUBPIX_ORDER_MASK   = (1 << SUBPIX_ORDER) ^ SETREMAP_MASK
        SEGREMAP_MASK       = (1 << SEGREMAP) ^ SETREMAP_MASK
        ADDRINC_MASK        = 1 ^ SETREMAP_MASK

    STARTLINE               = $A1
    DISPOFFSET              = $A2

    DISPALLOFF              = $A4
    DISPALLON               = $A5
    NMLDISP                 = $A6
    INVDISP                 = $A7

    FUNCSEL                 = $AB

    DISPOFF                 = $AE
    DISPON                  = $AF

    NOOP2                   = $B0

    PRECHG                  = $B1
    PRECHG_MASK             = $FF
        PHASE2              = 4
        PHASE1              = 0
        PHASE2_BITS         = %1111
        PHASE1_BITS         = %1111
        PHASE2_MASK         = (PHASE2_BITS << PHASE2) ^ PRECHG_MASK
        PHASE1_MASK         = PHASE1_BITS ^ PRECHG_MASK

    DISPENH                 = $B2       ' 4B CMD. B2 00 00 00 = NML, B2 A4 00 00 = ENH PERF

    CLKDIV                  = $B3       ' LOCKED BY $FD ON POR
    CLKDIV_MASK             = $FF
        FOSCFREQ            = 4
        CLK_DIV             = 0
        FOSCFREQ_BITS       = %1111
        CLK_DIV_BITS        = %1111
        FOSCFREQ_MASK       = (FOSCFREQ_BITS << FOSCFREQ) ^ CLKDIV_MASK
        CLK_DIV_MASK        = CLK_DIV_BITS ^ CLKDIV_MASK

    SETSEGLOWVOLTAGE        = $B4       ' 4B CMD. B4 A0 B5 55 = EXTERNAL VSL (POR)

    SETGPIO                 = $B5
    SETGPIO_MASK            = $0F
        GPIO1               = 2
        GPIO0               = 0
        GPIO1_BITS          = %11
        GPIO0_BITS          = %11
        GPIO1_MASK          = (GPIO1_BITS << GPIO1) ^ SETGPIO_MASK
        GPIO0_MASK          = GPIO0_BITS ^ SETGPIO_MASK

    SETSECPRECHG            = $B6
    SETSECPRECHG_MASK       = $0F

    GRAYSCL_LUT             = $B8       ' 64B CMD. B8 [A1..A63 = 00..B4]
    GRAYSCL_RESET           = $B9       ' DEFAULT LINEAR LUT (0, 2, 4, 6 .. 122, 124)

    PRECHGLEVEL             = $BB
    VCOMH                   = $BE

    SETCNTRSTABC            = $C1       ' 4B CMD
    MASTCNTRST_CURR_CTRL    = $C7

    SETMUXRATIO             = $CA

    NOOP3                   = $D1
    NOOP4                   = $E3

    SETLOCK                 = $FD
' Other constants
    SEL_EXTERNAL_VCC        = $8E

PUB null{}
' This is not a top-level object

DAT
{
Copyright 2024 Jesse Burt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

