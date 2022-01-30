{
    --------------------------------------------
    Filename: core.con.il3897.spin
    Author: Jesse Burt
    Description: IL3897-specific Low-level constants
    Copyright (c) 2022
    Started Feb 21, 2021
    Updated Jan 21, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MAX_FREQ    = 20_000_000                ' device max SPI bus freq
    SPI_MODE        = 0                         ' 0..3
    T_POR           = 2_000                     ' startup time (usecs)

    DEVID_RESP      = $01                       ' device ID expected response

' Register definitions
    DRV_OUT_CTRL    = $01
    DRVOUT_CTRL_MASK= $07                       ' param 'B' only
        GD          = 2
        SM          = 1
        TB          = 0
        GD_MASK     = (1 << GD) ^ DRVOUT_CTRL_MASK
        SM_MASK     = (1 << SM) ^ DRVOUT_CTRL_MASK
        TB_MASK     = 1 ^ DRVOUT_CTRL_MASK

    GATE_DRV_CTRL   = $03

    SRC_DRV_CTRL    = $04

    BOOST_CTRL      = $0C

    GATE_ST_POS     = $0F

    DEEP_SLP        = $10

    DATA_ENT_MD     = $11
    DATA_ENT_MD_MASK= $07
        AM          = 2
        ID          = 0
        ID_BITS     = %11
        AM_MASK     = (1 << AM) ^ DATA_ENT_MD_MASK
        ID_MASK     = 1 ^ DATA_ENT_MD_MASK

    SWRESET         = $12

    HV_RDY_DET      = $14

    VCI_DET         = $15

    TEMPSENS_CTRL_W = $1A

    TEMPSENS_CTRL_R = $1B

    TEMPSENS_CMD_W  = $1C

    MASTER_ACT      = $20

    DISP_UP_CTRL1   = $21

    DISP_UP_CTRL2   = $22

    WR_RAM_BW       = $24

    WR_RAM_RED      = $26

    RD_RAM          = $27

    VCOM_SNS        = $28

    VCOM_SNS_DUR    = $29

    PRG_VCOM_OTP    = $2A

    WR_VCOM         = $2C

    RD_OTP          = $2D

    STATUS          = $2F

    PRG_WS_OTP      = $30

    LD_WS_OTP       = $31

    WR_LUT          = $32

    PRG_OTP_SEL     = $36

    WR_OTP_SEL      = $37

    DUMMY_LN_PER    = $3A

    GATE_LN_WID     = $3B

    BRD_WV_CTRL     = $3C
    BRD_WV_CTRL_MASK= $F7
        VBDOPT      = 6
        VBDLVL      = 4
        GSTRC       = 2
        GSTRS       = 0
        VBDOPT_BITS = %11
        VBDLVL_BITS = %11
        GSTRS_BITS  = %11
        VBDOPT_MASK = (VBDOPT_BITS << VBDOPT) ^ BRD_WV_CTRL_MASK
        VBDLVL_MASK = (VBDLVL_BITS << VBDLVL) ^ BRD_WV_CTRL_MASK
        GSTRC_MASK  = (1 << GSTRC) ^ BRD_WV_CTRL_MASK
        GSTRS_MASK  = 1 ^ BRD_WV_CTRL_MASK

    RD_RAM_OPT      = $41

    RAM_X_WIND      = $44

    RAM_Y_WIND      = $45

    AUTO_WR_RED_PAT = $46

    AUTO_WR_BW_PAT  = $47

    RAM_X           = $4E

    RAM_Y           = $4F

    ANLG_BLK_CTRL   = $74

    DIGI_BLK_CTRL   = $7E

    NOOP            = $FF

PUB Null{}
' This is not a top-level object

