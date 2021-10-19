{
    --------------------------------------------
    Filename: core.con.il3897.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Feb 21, 2021
    Updated Feb 21, 2021
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

    GATE_DRV_CTRL   = $03

    SRC_DRV_CTRL    = $04

    BOOST_CTRL      = $0C

    GATE_ST_POS     = $0F

    DEEP_SLP        = $10

    DATA_ENT_MD     = $11

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

    BRD_WAVE_CTRL   = $3C

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

