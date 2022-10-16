{
    --------------------------------------------
    Filename: core.con.il3820.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2022
    Started Nov 30, 2019
    Updated Feb 7, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                = 0
    SCK_MAX_FREQ            = 4_000_000

    T_POR                   = 200_000

' Register definitions
    DRV_OUT_CTRL            = $01
    DRV_OUT_CTRL_B_MASK     = $07
        GD                  = 2
        SM                  = 1
        TB                  = 0
        GD_MASK             = (1 << GD) ^ DRV_OUT_CTRL_B_MASK
        SM_MASK             = (1 << SM) ^ DRV_OUT_CTRL_B_MASK
        TB_MASK             = 1 ^ DRV_OUT_CTRL_B_MASK

    GATE_DRV_CTRL           = $03
    GATE_DRV_CTRL_MASK      = $FF
        VGH                 = 4
        VGL                 = 0
        VGH_BITS            = %1111
        VGL_BITS            = %1111
        VGH_MASK            = (VGH_BITS << VGH) ^ GATE_DRV_CTRL_MASK
        VGL_MASK            = (VGL_BITS << VGL) ^ GATE_DRV_CTRL_MASK

    SRC_DRV_CTRL            = $04

    DISP_CTRL               = $07

    GATE_SRC_NONOVRLAP      = $0B

    BOOST_CTRL              = $0C

    GATE_ST_POS             = $0F

    DEEP_SLP                = $10

    DATA_ENT_MD             = $11
    DATA_ENT_MD_MASK        = $07
        AM                  = 3
        ID                  = 0
        ID_BITS             = %11
        AM_MASK             = (1 << AM) ^ DATA_ENT_MD_MASK
        ID_MASK             = ID_BITS ^ DATA_ENT_MD_MASK

    SWRESET                 = $12

    TEMP_CTRL_W             = $1A

    TEMP_CTRL_R             = $1B

    TEMP_CTRL_W_CMD         = $1C

    MASTER_ACT              = $20

    DISP_UP_CTRL1           = $21
    DISP_UP_CTRL1_MASK      = $9F
        OLDRAM_BYP          = 7
        BYP_VAL             = 4
        INITUPDT            = 0
        INITUPDT_BITS       = %11
        OLDRAM_BYP_MASK     = (1 << OLDRAM_BYP) ^ DISP_UP_CTRL1_MASK
        BYP_VAL_MASK        = (1 << BYP_VAL) ^ DISP_UP_CTRL1_MASK
        INITUPDT_MASK       = INITUPDT_BITS ^ DISP_UP_CTRL1_MASK

    DISP_UP_CTRL2           = $22
        SEQ_ALL             = $FF
        SEQ_CLKEN           = $80
        SEQ_CLK_CP_EN       = $C0
        SEQ_INIT_PATT_DISP  = $0C
        SEQ_INIT_DISP       = $08
        SEQ_PATT_DISP       = $04
        SEQ_CLK_CP_DIS      = $03
        SEQ_CLK_DIS         = $01

    WR_RAM_BW               = $24

    VCOM_SNS_DUR            = $29

    WR_VCOM                 = $2C

    WR_LUT                  = $32

    DUMMY_LN_PER            = $3A
    DUMMY_LN_PER_MASK       = $7F

    GATE_LN_WD              = $3B

    BRD_WV_CTRL             = $3C
    BRD_WV_CTRL_MASK        = $F3
        FOLLOWSRC           = 7
        VBD                 = 6
        VBD_LEVEL           = 4
        VBD_TRANS           = 0

    RAM_X_WIND              = $44
    RAM_Y_WIND              = $45
    RAM_X                   = $4E
    RAM_Y                   = $4F
    ANLG_BLK_CTRL           = $74
    DIGI_BLK_CTRL           = $7E
    NOOP                    = $FF

PUB null{}
' This is not a top-level object

DAT
{
Copyright 2022 Jesse Burt

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

