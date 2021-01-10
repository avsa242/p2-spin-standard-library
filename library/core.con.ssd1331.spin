{
    --------------------------------------------
    Filename: core.con.ssd1331.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started: Nov 18, 2018
    Updated: Jan 8, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    CPOL                    = 0
    MOSI_BITORDER           = 5                 ' MSBFIRST
    SCK_MAX_FREQ            = 6_666_666         ' According to the datasheet
                                                ' (isn't enforced in this
                                                '   driver - ymmv)

' Register map
    DRAWLINE                = $21
    DRAWRECT                = $22
    COPY                    = $23
    CLEAR                   = $25

    FILLCPY                 = $26
    FILLCPY_MASK            = $11
        REVCOPY             = 4
        FILL                = 0
        REVCOPY_MASK        = (1 << REVCOPY) ^ FILLCPY_MASK
        FILL_MASK           = 1 ^ FILLCPY_MASK

    SCROLLSETUP             = $27
    SCROLLSTOP              = $2E
    SCROLLSTART             = $2F
    SETCOLUMN               = $15
    SETROW                  = $75
    CONTRASTA               = $81
    CONTRASTB               = $82
    CONTRASTC               = $83
    MASTERCURRENT           = $87

    SETREMAP                = $A0
    SETREMAP_MASK           = $FF
        COLORFMT            = 6
        COMSPLIT            = 5
        COMREMAP            = 4
        COMLR_SWAP          = 3
        SUBPIX_ORDER        = 2
        SEGREMAP            = 1
        ADDRINC             = 0
        COLORFMT_BITS       = %11
        COLORFMT_MASK       = (COLORFMT_BITS << COLORFMT) ^ SETREMAP_MASK
        COMSPLIT_MASK       = (1 << COMSPLIT) ^ SETREMAP_MASK
        COMREMAP_MASK       = (1 << COMREMAP) ^ SETREMAP_MASK
        COMLR_SWAP_MASK     = (1 << COMLR_SWAP) ^ SETREMAP_MASK
        SUBPIX_ORDER_MASK   = (1 << SUBPIX_ORDER) ^ SETREMAP_MASK
        SEGREMAP_MASK       = (1 << SEGREMAP) ^ SETREMAP_MASK
        ADDRINC_MASK        = 1 ^ SETREMAP_MASK

    STARTLINE               = $A1
    DISPLAYOFFSET           = $A2
    NORMALDISPLAY           = $A4
    DISPLAYALLON            = $A5
    DISPLAYALLOFF           = $A6
    INVERTDISPLAY           = $A7
    SETMULTIPLEX            = $A8
    DISPLAYONDIM            = $AC

    SETMASTER               = $AD
        MASTERCFG_EXT_VCC   = $8E

    DISPLAYOFF              = $AE
    DISPLAYON               = $AF

    PWRMODE                 = $B0
        PWRSAVE_ENA         = $1A
        PWRSAVE_DIS         = $0B

    PRECHG                  = $B1
    PRECHG_MASK             = $FF
        PHASE2              = 4
        PHASE1              = 0
        PHASE2_BITS         = %1111
        PHASE1_BITS         = %1111
        PHASE2_MASK         = (PHASE2_BITS << PHASE2) ^ PRECHG_MASK
        PHASE1_MASK         = PHASE1_BITS ^ PRECHG_MASK

    CLKDIV_FRQ              = $B3
    CLKDIV_FRQ_MASK         = $FF
        FOSCFREQ            = 4
        CLKDIV              = 0
        FOSCFREQ_BITS       = %1111
        CLKDIV_BITS         = %1111
        FOSCFREQ_MASK       = (FOSCFREQ_BITS << FOSCFREQ) ^ CLKDIV_FRQ_MASK
        CLKDIV_MASK         = CLKDIV_BITS ^ CLKDIV_FRQ_MASK

    PRECHGA                 = $8A
    PRECHGB                 = $8B
    PRECHGC                 = $8C
    PRECHGLVL               = $BB
    NOP1                    = $BC
    NOP2                    = $BD
    VCOMH                   = $BE

    NOP3                    = $E3

' Other constants
    SEL_EXTERNAL_VCC        = $8E

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

{
    --------------------------------------------------------------------------------------------------------
    TERMS OF USE: MIT License

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
    LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    --------------------------------------------------------------------------------------------------------
}
