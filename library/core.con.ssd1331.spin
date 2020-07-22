{
    --------------------------------------------
    Filename: core.con.ssd1331.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started: Nov 18, 2018
    Updated: Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    CPOL                                = 0
    MOSI_BITORDER                       = 5             ' MSBFIRST
    SCK_MAX_FREQ                        = 6_666_666     ' According to the datasheet - though it seems to run at much higher clock speeds

' Register map
    SSD1331_CMD_DRAWLINE                = $21
    SSD1331_CMD_DRAWRECT                = $22
    SSD1331_CMD_COPY                    = $23
    SSD1331_CMD_CLEAR                   = $25

    SSD1331_CMD_FILL                    = $26
    SSD1331_CMD_FILL_MASK               = $11
        FLD_FILL                        = 0
        FLD_REVCOPY                     = 4
        MASK_FILL                       = SSD1331_CMD_FILL_MASK ^ (1 << FLD_FILL)
        MASK_REVCOPY                    = SSD1331_CMD_FILL_MASK ^ (1 << FLD_REVCOPY)

    SSD1331_CMD_SCROLLSETUP             = $27
    SSD1331_CMD_SCROLLSTOP              = $2E
    SSD1331_CMD_SCROLLSTART             = $2F
    SSD1331_CMD_SETCOLUMN               = $15
    SSD1331_CMD_SETROW                  = $75
    SSD1331_CMD_CONTRASTA               = $81
    SSD1331_CMD_CONTRASTB               = $82
    SSD1331_CMD_CONTRASTC               = $83
    SSD1331_CMD_MASTERCURRENT           = $87

    SSD1331_CMD_SETREMAP                = $A0
    SSD1331_CMD_SETREMAP_MASK           = $FF
        FLD_ADDRINC                     = 0
        FLD_SEGREMAP                    = 1
        FLD_SUBPIX_ORDER                = 2
        FLD_COMLR_SWAP                  = 3
        FLD_COMREMAP                    = 4
        FLD_COMSPLIT                    = 5
        FLD_COLORFORMAT                 = 6
        BITS_COLORFORMAT                = %11
        MASK_ADDRINC                    = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_ADDRINC)
        MASK_SEGREMAP                   = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_SEGREMAP)
        MASK_SUBPIX_ORDER               = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_SUBPIX_ORDER)
        MASK_COMLR_SWAP                 = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_COMLR_SWAP)
        MASK_COMREMAP                   = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_COMREMAP)
        MASK_COMSPLIT                   = SSD1331_CMD_SETREMAP_MASK ^ (1 << FLD_COMSPLIT)
        MASK_COLORFORMAT                = SSD1331_CMD_SETREMAP_MASK ^ (BITS_COLORFORMAT << FLD_COLORFORMAT)

    SSD1331_CMD_STARTLINE               = $A1
    SSD1331_CMD_DISPLAYOFFSET           = $A2
    SSD1331_CMD_NORMALDISPLAY           = $A4
    SSD1331_CMD_DISPLAYALLON            = $A5
    SSD1331_CMD_DISPLAYALLOFF           = $A6
    SSD1331_CMD_INVERTDISPLAY           = $A7
    SSD1331_CMD_SETMULTIPLEX            = $A8
    SSD1331_CMD_DISPLAYONDIM            = $AC

    SSD1331_CMD_SETMASTER               = $AD
        MASTERCFG_EXT_VCC               = $8E

    SSD1331_CMD_DISPLAYOFF              = $AE
    SSD1331_CMD_DISPLAYON               = $AF

    SSD1331_CMD_POWERMODE               = $B0
        POWERMODE_POWERSAVE_ENA         = $1A
        POWERMODE_POWERSAVE_DIS         = $0B

    SSD1331_CMD_PRECHARGE               = $B1
    SSD1331_CMD_PRECHARGE_MASK          = $FF
        FLD_PHASE1                      = 0
        FLD_PHASE2                      = 4
        BITS_PHASE1                     = %1111
        BITS_PHASE2                     = %1111
        MASK_PHASE1                     = SSD1331_CMD_PRECHARGE_MASK ^ (BITS_PHASE1)
        MASK_PHASE2                     = SSD1331_CMD_PRECHARGE_MASK ^ (BITS_PHASE2 << FLD_PHASE2)

    SSD1331_CMD_CLOCKDIV                = $B3
    SSD1331_CMD_CLOCKDIV_MASK           = $FF
        FLD_CLKDIV                      = 0
        FLD_FOSCFREQ                    = 4
        BITS_CLKDIV                     = %1111
        BITS_FOSCFREQ                   = %1111
        MASK_CLKDIV                     = SSD1331_CMD_CLOCKDIV_MASK ^ (BITS_CLKDIV)
        MASK_FOSCFREQ                   = SSD1331_CMD_CLOCKDIV_MASK ^ (BITS_FOSCFREQ << FLD_FOSCFREQ)

    SSD1331_CMD_PRECHARGEA              = $8A
    SSD1331_CMD_PRECHARGEB              = $8B
    SSD1331_CMD_PRECHARGEC              = $8C
    SSD1331_CMD_PRECHARGELEVEL          = $BB
    SSD1331_CMD_NOP1                    = $BC
    SSD1331_CMD_NOP2                    = $BD
    SSD1331_CMD_VCOMH                   = $BE

    SSD1331_CMD_NOP3                    = $E3

'' Other constants
    SEL_EXTERNAL_VCC            = $8E

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
