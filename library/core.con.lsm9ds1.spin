{
    --------------------------------------------
    Filename: core.con.lsm9ds1.spin
    Author: Jesse Burt
    Description: LSM9DS1-specific constants
    Copyright (c) 2021
    Started Feb 9, 2019
    Updated Oct 2, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON
' I2C Configuration
    I2C_MAX_FREQ            = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR_XLG          = $6A << 1                  ' 7-bit format slave address
    SLAVE_ADDR_MAG          = $1C << 1
    T_POR                   = 1_000                     ' startup time (usecs)
    MB_I2C                  = 1 << 7

' SPI Configuration
    SPI_MODE                = 3
    SPI_MAX_FREQ            = 10_000_000

    TPOR                    = 110_000           ' usec
    MS_SPI                  = 1 << 6

    WHOAMI_AG_RESP          = $68
    WHOAMI_M_RESP           = $3D
    WHOAMI_BOTH_RESP        = (WHOAMI_AG_RESP << 8) | WHOAMI_M_RESP

' LSM9DS1 Register map
    ACT_THS                 = $04
    ACT_THS_MASK            = $FF
        SLP_ON_INACT        = 7
        ACT_THR             = 0
        ACT_THR_BITS        = %1111111
        SLP_ON_INACT_MASK   = (1 << SLP_ON_INACT) ^ ACT_THS_MASK
        ACT_THR_MASK        = (ACT_THR_BITS << ACT_THR) ^ ACT_THS_MASK

    ACT_DUR                 = $05
    INT_GEN_CFG_XL          = $06
    INT_GEN_THS_X_XL        = $07
    INT_GEN_THS_Y_XL        = $08
    INT_GEN_THS_Z_XL        = $09

    INT_GEN_DUR_XL          = $0A
    INT_GEN_DUR_XL_MASK     = $FF
        WAIT_XL             = 7
        SAMPLES             = 0
        SAMPLES_BITS        = %1111111
        WAIT_XL_MASK        = (1 << WAIT_XL) ^ INT_GEN_DUR_XL_MASK
        SAMPLES_MASK        = SAMPLES ^ INT_GEN_DUR_XL_MASK

    REFERENCE_G             = $0B

    INT1_CTRL               = $0C
    INT1_CTRL_MASK          = $FF

    INT2_CTRL               = $0D
    INT2_CTRL_MASK          = $BF

    WHO_AM_I_XG             = $0F

    CTRL_REG1_G             = $10
    CTRL_REG1_G_MASK        = $FB
        ODR                 = 5
        FS                  = 3
        BW                  = 0
        ODR_BITS            = %111
        FS_BITS             = %11
        BW_BITS             = %11
        ODR_MASK            = (ODR_BITS << ODR) ^ CTRL_REG1_G_MASK
        FS_MASK             = (FS_BITS << FS) ^ CTRL_REG1_G_MASK
        BW_MASK             = (BW_BITS << BW) ^ CTRL_REG1_G_MASK

    CTRL_REG2_G             = $11
    CTRL_REG2_G_MASK        = $0F
        INT_SEL             = 2
        OUT_SEL             = 0
        INT_SEL_BITS        = %11
        OUT_SEL_BITS        = %11
        INT_SEL_MASK        = (INT_SEL_BITS << INT_SEL) ^ CTRL_REG2_G_MASK
        OUT_SEL_MASK        = (OUT_SEL_BITS << OUT_SEL) ^ CTRL_REG2_G_MASK

    CTRL_REG3_G             = $12
    CTRL_REG3_G_MASK        = $CF
        LP_MODE             = 7
        HP_EN               = 6
        HPCF_G              = 0
        HPCF_G_BITS         = %1111
        LP_MODE_BITS        = %1
        LP_MODE_MASK        = (LP_MODE_BITS << LP_MODE) ^ CTRL_REG3_G_MASK
        HP_EN_MASK          = (1 << HP_EN) ^ CTRL_REG3_G_MASK
        HPCF_G_MASK         = (HPCF_G_BITS << HPCF_G) ^ CTRL_REG3_G_MASK

    ORIENT_CFG_G            = $13
    INT_GEN_SRC_G           = $14
    OUT_TEMP_L              = $15
    OUT_TEMP_H              = $16
    STATUS_REG              = $17
        STATUS_REG_MASK     = $7F
        IG_XL               = 6
        IG_G                = 5
        INACT               = 4
        BOOT_STATUS         = 3
        TDA                 = 2
        GDA                 = 1
        XLDA                = 0

    OUT_X_G_L               = $18
    OUT_X_G_H               = $19
    OUT_Y_G_L               = $1A
    OUT_Y_G_H               = $1B
    OUT_Z_G_L               = $1C
    OUT_Z_G_H               = $1D

    CTRL_REG4               = $1E
    CTRL_REG4_MASK          = $3B
        ZEN_G               = 5
        YEN_G               = 4
        XEN_G               = 3
        LIR_XL1             = 1
        XL1_4D              = 0
        EN_G_BITS           = %111
        ZEN_G_MASK          = (1 << ZEN_G) ^ CTRL_REG4_MASK
        YEN_G_MASK          = (1 << YEN_G) ^ CTRL_REG4_MASK
        XEN_G_MASK          = (1 << XEN_G) ^ CTRL_REG4_MASK
        EN_G_MASK           = (EN_G_BITS << XEN_G) ^ CTRL_REG4_MASK
        LIR_XL1_MASK        = (1 << LIR_XL1) ^ CTRL_REG4_MASK
        XL1_4D_MASK         = (1 << XL1_4D) ^ CTRL_REG4_MASK

    CTRL_REG5_XL            = $1F
    CTRL_REG5_XL_MASK       = $F8
        DEC_1               = 7 'xxx combine
        DEC_0               = 6
        ZEN_XL              = 5
        YEN_XL              = 4
        XEN_XL              = 3
        EN_XL               = 3
        EN_XL_BITS          = %111
        DEC_1_MASK          = (1 << DEC_1) ^ CTRL_REG5_XL_MASK  'xxx combine
        DEC_0_MASK          = (1 << DEC_0) ^ CTRL_REG5_XL_MASK
        ZEN_XL_MASK         = (1 << ZEN_XL) ^ CTRL_REG5_XL_MASK
        YEN_XL_MASK         = (1 << YEN_XL) ^ CTRL_REG5_XL_MASK
        XEN_XL_MASK         = (1 << XEN_XL) ^ CTRL_REG5_XL_MASK
        EN_XL_MASK          = (EN_XL_BITS << EN_XL) ^ CTRL_REG5_XL_MASK

    CTRL_REG6_XL            = $20
    CTRL_REG6_XL_MASK       = $FF
        ODR_XL              = 5
        FS_XL               = 3
        BW_SCAL             = 2
        BW_XL               = 0
        ODR_XL_BITS         = %111
        FS_XL_BITS          = %11
        BW_SCAL_BITS        = %1
        BW_XL_BITS          = %11
        ODR_XL_MASK         = (ODR_XL_BITS << ODR_XL) ^ CTRL_REG6_XL_MASK
        FS_XL_MASK          = (FS_XL_BITS << FS_XL) ^ CTRL_REG6_XL_MASK
        BW_SCAL_MASK        = (BW_SCAL_BITS << BW_SCAL) ^ CTRL_REG6_XL_MASK
        BW_XL_MASK          = (BW_XL_BITS << BW_XL) ^ CTRL_REG6_XL_MASK

    CTRL_REG7_XL            = $21
    CTRL_REG7_XL_MASK       = $E5
        HR                  = 7
        DCF                 = 5
        FDS                 = 2
        HPIS1               = 0
        HR_BITS             = %1
        DCF_BITS            = %11
        FDS_BITS            = %1
        HPIS1_BITS          = %1
        HR_MASK             = (HR_BITS << HR) ^ CTRL_REG7_XL_MASK
        DCF_MASK            = (DCF_BITS << DCF) ^ CTRL_REG7_XL_MASK
        FDS_MASK            = (FDS_BITS << FDS) ^ CTRL_REG7_XL_MASK
        HPIS1_MASK          = (HPIS1_BITS << HPIS1) ^ CTRL_REG7_XL_MASK

    CTRL_REG8               = $22
    CTRL_REG8_MASK          = $FF
        BOOT                = 7
        BDU                 = 6
        H_LACTIVE           = 5
        PP_OD               = 4
        SIM                 = 3
        IF_ADD_INC          = 2
        BLE                 = 1
        SW_RESET            = 0
        BOOT_MASK           = (1 << BOOT) ^ CTRL_REG8_MASK
        BDU_MASK            = (1 << BDU) ^ CTRL_REG8_MASK
        H_LACTIVE_MASK      = (1 << H_LACTIVE) ^ CTRL_REG8_MASK
        PP_OD_MASK          = (1 << PP_OD) ^ CTRL_REG8_MASK
        SIM_MASK            = (1 << SIM) ^ CTRL_REG8_MASK
        IF_ADD_INC_MASK     = (1 << IF_ADD_INC) ^ CTRL_REG8_MASK
        BLE_MASK            = (1 << BLE) ^ CTRL_REG8_MASK
        SW_RESET_MASK       = (1 << SW_RESET) ^ CTRL_REG8_MASK
        XLG_SW_RESET        = 1
        XLG_3WSPI           = 1 << SIM

    CTRL_REG9               = $23
    CTRL_REG9_MASK          = $5F
        SLP_G               = 6
        FIFO_TEMP_EN        = 4
        DRDY_BIT            = 3
        I2C_DIS             = 2
        FIFO_EN             = 1
        STOP_ON_FTH         = 0
        SLP_G_BITS          = %1
        FIFO_TEMP_EN_BITS   = %1
        DRDY_BIT_BITS       = %1
        I2C_DIS_BITS        = %1
        FIFO_EN_BITS        = %1
        STOP_ON_FTH_BITS    = %1
        SLP_G_MASK          = (SLP_G_BITS << SLP_G) ^ CTRL_REG9_MASK
        FIFO_TEMP_EN_MASK   = (FIFO_TEMP_EN_BITS << FIFO_TEMP_EN) ^ CTRL_REG9_MASK
        DRDY_BIT_MASK       = (DRDY_BIT_BITS << DRDY_BIT) ^ CTRL_REG9_MASK
        I2C_DIS_MASK        = (I2C_DIS_BITS << I2C_DIS) ^ CTRL_REG9_MASK
        FIFO_EN_MASK        = (FIFO_EN_BITS << FIFO_EN) ^ CTRL_REG9_MASK
        STOP_ON_FTH_MASK    = (STOP_ON_FTH_BITS << STOP_ON_FTH) ^ CTRL_REG9_MASK

    CTRL_REG10              = $24
    INT_GEN_SRC_XL          = $26
    INT_GEN_SRC_XL_MASK     = $7F
        IA_XL               = 6
        ZH_XL               = 5
        ZL_XL               = 4
        YH_XL               = 3
        YL_XL               = 2
        XH_XL               = 1
        XL_XL               = 0


    STATUS_REG_1            = $27

    OUT_X_L_XL              = $28
    OUT_X_H_XL              = $29
    OUT_Y_L_XL              = $2A
    OUT_Y_H_XL              = $2B
    OUT_Z_L_XL              = $2C
    OUT_Z_H_XL              = $2D

    FIFO_CTRL               = $2E
    FIFO_CTRL_MASK          = $FF
        FMODE               = 5
        FTH                 = 0
        FMODE_BITS          = %111
        FTH_BITS            = %11111
        FMODE_MASK          = (FMODE_BITS << FMODE) ^ FIFO_CTRL_MASK
        FTH_MASK            = (FTH_BITS << FTH) ^ FIFO_CTRL_MASK

    FIFO_SRC                = $2F
        FTH_STAT            = 7
        OVRN                = 6
        FSS                 = 0
        FSS_BITS            = %111111

    INT_GEN_CFG_G           = $30

    INT_GEN_THS_XH_G        = $31
    INT_GEN_THS_XL_G        = $32
    INT_GEN_THS_YH_G        = $33
    INT_GEN_THS_YL_G        = $34
    INT_GEN_THS_ZH_G        = $35
    INT_GEN_THS_ZL_G        = $36
    INT_G_BITS              = $7FFF

    INT_GEN_DUR_G           = $37
    INT_GEN_DUR_G_MASK      = $FF
        WAIT_G              = 7
'       SAMPLES             = 0                 ' same as INT_GEN_DUR_XL def
'       SAMPLES_BITS        = %1111111
        WAIT_G_MASK         = (1 << WAIT_XL) ^ INT_GEN_DUR_g_MASK
'       SAMPLES_MASK        = SAMPLES ^ INT_GEN_DUR_g_MASK

    OFFSET_X_REG_L_M        = $05
    OFFSET_X_REG_H_M        = $06
    OFFSET_Y_REG_L_M        = $07
    OFFSET_Y_REG_H_M        = $08
    OFFSET_Z_REG_L_M        = $09
    OFFSET_Z_REG_H_M        = $0A
    WHO_AM_I_M              = $0F

    CTRL_REG1_M             = $20
    CTRL_REG1_M_MASK        = $FF
        TEMP_COMP           = 7
        OM                  = 5
        DO                  = 2
        FAST_ODR            = 1
        ST                  = 0
        OM_BITS             = %11
        DO_BITS             = %111
        TEMP_COMP_MASK      = (1 << TEMP_COMP) ^ CTRL_REG1_M_MASK
        OM_MASK             = (OM_BITS << OM) ^ CTRL_REG1_M_MASK
        DO_MASK             = (DO_BITS << DO) ^ CTRL_REG1_M_MASK
        FAST_ODR_MASK       = (1 << FAST_ODR) ^ CTRL_REG1_M_MASK
        ST_MASK             = (1 << ST) ^ CTRL_REG1_M_MASK

    CTRL_REG2_M             = $21
    CTRL_REG2_M_MASK        = $6C
        FS_M                = 5
        RE_BOOT             = 3
        SOFT_RST            = 2
        FS_M_BITS           = %11
        RE_BOOT_BITS        = %1
        SOFT_RST_BITS       = %1
        FS_M_MASK           = (FS_M_BITS << FS_M) ^ CTRL_REG2_M_MASK
        RE_BOOT_MASK        = (RE_BOOT_BITS << RE_BOOT) ^ CTRL_REG2_M_MASK
        SOFT_RST_MASK       = (SOFT_RST_BITS << SOFT_RST) ^ CTRL_REG2_M_MASK

    CTRL_REG3_M             = $22
    CTRL_REG3_M_MASK        = $A7
        M_I2C_DIS           = 7
        LP                  = 5
        M_SIM               = 2
        MD                  = 0
        MD_BITS             = %11
        M_I2C_DIS_MASK      = (1 << M_I2C_DIS) ^ CTRL_REG3_M_MASK
        LP_MASK             = (1 << LP) ^ CTRL_REG3_M_MASK
        M_SIM_MASK          = (1 << M_SIM) ^ CTRL_REG3_M_MASK
        MD_MASK             = (MD_BITS << MD) ^ CTRL_REG3_M_MASK
        M_3WSPI             = 1 << M_SIM

    CTRL_REG4_M             = $23
    CTRL_REG4_M_MASK        = $0E
        OMZ                 = 2
        BLE_M               = 1
        OMZ_BITS            = %11
        OMZ_MASK            = (OMZ_BITS << OMZ) ^ CTRL_REG4_M_MASK
        BLE_M_MASK          = (1 << BLE_M) ^ CTRL_REG4_M_MASK

    CTRL_REG5_M             = $24
    CTRL_REG5_M_MASK        = $C0
        FAST_READ           = 7
        BDU_M               = 6
        FAST_READ_MASK      = (1 << FAST_READ) ^ CTRL_REG5_M_MASK
        BDU_M_MASK          = (1 << BDU_M) ^ CTRL_REG5_M_MASK

    STATUS_REG_M            = $27
    STATUS_REG_M_MASK       = $FF
        DA                  = 0
        ZYXDA               = 3
        OVERRN              = 4
        ZYXOR               = 7
        DA_BITS             = %1111
        OVERRN_BITS         = %1111
        DA_MASK             = (DA_BITS << DA) ^ STATUS_REG_M_MASK
        OR_MASK             = (OVERRN_BITS << OVERRN) ^ STATUS_REG_M_MASK
        ZYXOR_MASK          = (1 << ZYXOR) ^ STATUS_REG_M_MASK
        ZYXDA_MASK          = (1 << ZYXDA) ^ STATUS_REG_M_MASK

    OUT_X_L_M               = $28
    OUT_X_H_M               = $29
    OUT_Y_L_M               = $2A
    OUT_Y_H_M               = $2B
    OUT_Z_L_M               = $2C
    OUT_Z_H_M               = $2D

    INT_CFG_M               = $30
    INT_CFG_M_MASK          = $E7
        IEN                 = 0
        IEL                 = 1
        IEA                 = 2
        XYZIEN              = 5
        XYZIEN_BITS         = %111
        IEN_MASK            = (1 << IEN) ^ INT_CFG_M_MASK
        IEL_MASK            = (1 << IEL) ^ INT_CFG_M_MASK
        IEA_MASK            = (1 << IEA) ^ INT_CFG_M_MASK
        XYZIEN_MASK         = (XYZIEN_BITS << XYZIEN) ^ INT_CFG_M_MASK

    INT_SRC_M               = $31
        PTH_X               = 7
        PTH_Y               = 6
        PTH_Z               = 5
        NTH_X               = 4
        NTH_Y               = 3
        NTH_Z               = 2
        MROI                = 1
        INT                 = 0
        PTH_BITS            = %111
        NTH_BITS            = %111

    INT_THS_L_M             = $32
    INT_THS_H_M             = $33

    FIFO_OFF                = 0
    FIFO_THS                = 1
    FIFO_CONT_TRIG          = 3
    FIFO_OFF_TRIG           = 4
    FIFO_CONT               = 6

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

