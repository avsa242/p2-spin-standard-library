{
    --------------------------------------------
    Filename: core.con.il3820.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Nov 30, 2019
    Updated Jan 27, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                = 0
    SCK_MAX_FREQ            = 4_000_000
    MOSI_BITORDER           = 5             'MSBFIRST

' Register definitions
    DRIVER_OUT_CTRL         = $01
    SH_DRIVER_OUT_CTRL      = $00   '00..02

    GATEDRV_VOLT_CTRL       = $03
    GATEDRV_VOLT_CTRL_MASK  = $FF
    SH_GATEDRV_VOLT_CTRL    = $03
        VGH                 = 4
        VGL                 = 0
        VGH_BITS            = %1111
        VGL_BITS            = %1111
        VGH_MASK            = GATEDRV_VOLT_CTRL_MASK ^ (VGH_BITS << VGH)
        VGL_MASK            = GATEDRV_VOLT_CTRL_MASK ^ (VGL_BITS << VGL)

    SRCDRV_VOLT_CTRL        = $04
    SH_SRCDRV_VOLT_CTRL     = $04

    DISP_CTRL               = $07
    SH_DISP_CTRL            = $05

    GATE_SRC_NONOVERLAP     = $0B
    SH_GATE_SRC_NONOVERLAP  = $06

    BOOST_SOFTST_CTRL       = $0C
    SH_BOOST_SOFTST_CTRL    = $07   '07..09

    GATE_SCAN_START         = $0F
    SH_GATE_SCAN_START      = $0A   '0A..0B

    DEEP_SLP                = $10
    SH_DEEP_SLP             = $0C

    DATA_ENT_MD             = $11
    DATA_ENT_MD_MASK        = $07
    SH_DATA_ENT_MD          = $0D
        AM                  = 3
        ID                  = 0
        ID_BITS             = %11
        AM_MASK             = DATA_ENT_MD_MASK ^ (1 << AM)
        ID_MASK             = DATA_ENT_MD_MASK ^ (ID_BITS << ID)

    SWRESET                 = $12

    TEMP_CTRL_W             = $1A
    SH_TEMP_CTRL_W          = $0E   '0E..0F

    TEMP_CTRL_R             = $1B
    SH_TEMP_CTRL_R          = $10   '10..11

    TEMP_CTRL_W_CMD         = $1C
    SH_TEMP_CTRL_W_CMD      = $12   '12..14



    MASTER_ACT              = $20

    DISP_UPDT_CTRL1         = $21
    DISP_UPDT_CTRL1_MASK    = $9F
    SH_DISP_UPDT_CTRL1      = $15
        OLDRAM_BYP          = 7
        BYP_VAL             = 4
        INITUPDT            = 0
        INITUPDT_BITS       = %11
        OLDRAM_BYP_MASK     = DISP_UPDT_CTRL1_MASK ^ (1 << OLDRAM_BYP)
        BYP_VAL_MASK        = DISP_UPDT_CTRL1_MASK ^ (1 << BYP_VAL)
        INITUPDT_MASK       = DISP_UPDT_CTRL1_MASK ^ (INITUPDT_BITS << INITUPDT)

    DISP_UPDT_CTRL2         = $22
    SH_DISP_UPDT_CTRL2      = $16
        SEQ_ALL             = $FF
        SEQ_CLKEN           = $80
        SEQ_CLK_CP_EN       = $C0
        SEQ_INIT_PATT_DISP  = $0C
        SEQ_INIT_DISP       = $08
        SEQ_PATT_DISP       = $04
        SEQ_CLK_CP_DIS      = $03
        SEQ_CLK_DIS         = $01

    WRITE_RAM               = $24

    VCOM_SENSE_DUR          = $29
    SH_VCOM_SENSE_DUR       = $17

    WRITE_VCOM_REG          = $2C
    SH_WRITE_VCOM_REG       = $18

    WRITE_LUT_REG           = $32

    DUMMY_LINE_PER          = $3A
    DUMMY_LINE_PER_MASK     = $7F
    SH_DUMMY_LINE_PER       = $19


    GATE_LINE_WIDTH         = $3B
    SH_GATE_LINE_WIDTH      = $1A

    BRDR_WAVEFM_CTRL        = $3C
    BRDR_WAVEFM_CTRL_MASK   = $F3
    SH_BRDR_WAVEFM_CTRL     = $1B
        FOLLOWSRC           = 7
        VBD                 = 6
        VBD_LEVEL           = 4
        VBD_TRANS           = 0

    RAM_X_ST_END            = $44
    RAM_Y_ST_END            = $45
    RAM_X_ADDR_AC           = $4E
    RAM_Y_ADDR_AC           = $4F
    NOOP                    = $FF

PUB Null{}
' This is not a top-level object
