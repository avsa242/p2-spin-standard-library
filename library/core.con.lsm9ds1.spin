{
    --------------------------------------------
    Filename: core.con.lsm9ds1.spin
    Author: Jesse Burt
    Description: LSM9DS1 low-level constants
    Copyright (c) 2020
    Started Feb 9, 2019
    Updated Jan 12, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON
' SPI Configuration
    CPOL                    = 1
    CLK_DELAY               = 1
    SCK_MAX_FREQ            = 10_000_000
    MOSI_BITORDER           = 5             'MSBFIRST
    MISO_BITORDER           = 2             'MSBPOST

    WHOAMI_AG_RESP          = $68
    WHOAMI_M_RESP           = $3D
    WHOAMI_BOTH_RESP        = (WHOAMI_AG_RESP << 8) | WHOAMI_M_RESP

' LSM9DS1 Register map
    ACT_THS                 = $04
    ACT_THS_MASK            = $FF
        FLD_SLEEP_ON_INACT  = 7
        FLD_ACT_THS         = 0
        BITS_ACT_THS        = %1111111
        MASK_SLEEP_ON_INACT = ACT_THS_MASK ^ (1 << FLD_SLEEP_ON_INACT)
        MASK_ACT_THS        = ACT_THS_MASK ^ (BITS_ACT_THS << FLD_ACT_THS)

    ACT_DUR                 = $05
    INT_GEN_CFG_XL          = $06
    INT_GEN_THS_X_XL        = $07
    INT_GEN_THS_Y_XL        = $08
    INT_GEN_THS_Z_XL        = $09
    INT_GEN_DUR_XL          = $0A
    REFERENCE_G             = $0B

    INT1_CTRL               = $0C
    INT1_CTRL_MASK          = $FF
        FLD_INT1_IG_G       = 7
        FLD_INT1_IG_XL      = 6
        FLD_INT1_FSS5       = 5
        FLD_INT1_OVR        = 4
        FLD_INT1_FTH        = 3
        FLD_INT1_BOOT       = 2
        FLD_INT1_DRDY_G     = 1
        FLD_INT1_DRDY_XL    = 0
        MASK_INT1_IG_G      = INT1_CTRL_MASK ^ (1 << FLD_INT1_IG_G)
        MASK_INT1_IG_XL     = INT1_CTRL_MASK ^ (1 << FLD_INT1_IG_XL)
        MASK_INT1_FSS5      = INT1_CTRL_MASK ^ (1 << FLD_INT1_FSS5)
        MASK_INT1_OVR       = INT1_CTRL_MASK ^ (1 << FLD_INT1_OVR)
        MASK_INT1_FTH       = INT1_CTRL_MASK ^ (1 << FLD_INT1_FTH)
        MASK_INT1_BOOT      = INT1_CTRL_MASK ^ (1 << FLD_INT1_BOOT)
        MASK_INT1_DRDY_G    = INT1_CTRL_MASK ^ (1 << FLD_INT1_DRDY_G)
        MASK_INT1_DRDY_XL   = INT1_CTRL_MASK ^ (1 << FLD_INT1_DRDY_XL)

    INT2_CTRL               = $0D
    WHO_AM_I_XG             = $0F

    CTRL_REG1_G             = $10
    CTRL_REG1_G_MASK        = $FB
        FLD_ODR             = 5
        FLD_FS              = 3
        FLD_BW              = 0
        BITS_ODR            = %111
        BITS_FS             = %11
        BITS_BW             = %11
        MASK_ODR            = CTRL_REG1_G_MASK ^ (BITS_ODR << FLD_ODR)
        MASK_FS             = CTRL_REG1_G_MASK ^ (BITS_FS << FLD_FS)
        MASK_BW             = CTRL_REG1_G_MASK ^ (BITS_BW << FLD_BW)

    CTRL_REG2_G             = $11
    CTRL_REG2_G_MASK        = $0F
        FLD_INT_SEL         = 2
        FLD_OUT_SEL         = 0
        BITS_INT_SEL        = %11
        BITS_OUT_SEL        = %11
        MASK_INT_SEL        = CTRL_REG2_G_MASK ^ (BITS_INT_SEL << FLD_INT_SEL)
        MASK_OUT_SEL        = CTRL_REG2_G_MASK ^ (BITS_OUT_SEL << FLD_OUT_SEL)

    CTRL_REG3_G             = $12
    CTRL_REG3_G_MASK        = $CF
        FLD_LP_MODE         = 7
        FLD_HP_EN           = 6
        FLD_HPCF_G          = 0
        BITS_HPCF_G         = %1111
        BITS_LP_MODE        = %1
        MASK_LP_MODE        = CTRL_REG3_G_MASK ^ (BITS_LP_MODE << FLD_LP_MODE)
        MASK_HP_EN          = CTRL_REG3_G_MASK ^ (1 << FLD_HP_EN)
        MASK_HPCF_G         = CTRL_REG3_G_MASK ^ (BITS_HPCF_G << FLD_HPCF_G)

    ORIENT_CFG_G            = $13
    INT_GEN_SRC_G           = $14
    OUT_TEMP_L              = $15
    OUT_TEMP_H              = $16
    STATUS_REG              = $17
        STATUS_REG_MASK     = $7F
        FLD_IG_XL           = 6
        FLD_IG_G            = 5
        FLD_INACT           = 4
        FLD_BOOT_STATUS     = 3
        FLD_TDA             = 2
        FLD_GDA             = 1
        FLD_XLDA            = 0

    OUT_X_G_L               = $18
    OUT_X_G_H               = $19
    OUT_Y_G_L               = $1A
    OUT_Y_G_H               = $1B
    OUT_Z_G_L               = $1C
    OUT_Z_G_H               = $1D

    CTRL_REG4               = $1E
    CTRL_REG4_MASK          = $3B
        FLD_ZEN_G           = 5
        FLD_YEN_G           = 4
        FLD_XEN_G           = 3
        FLD_LIR_XL1         = 1
        FLD_4D_XL1          = 0
        BITS_EN_G           = %111
        MASK_ZEN_G          = CTRL_REG4_MASK ^ (1 << FLD_ZEN_G)
        MASK_YEN_G          = CTRL_REG4_MASK ^ (1 << FLD_YEN_G)
        MASK_XEN_G          = CTRL_REG4_MASK ^ (1 << FLD_XEN_G)
        MASK_EN_G           = CTRL_REG4_MASK ^ (BITS_EN_G << FLD_XEN_G)
        MASK_LIR_XL1        = CTRL_REG4_MASK ^ (1 << FLD_LIR_XL1)
        MASK_4D_XL1         = CTRL_REG4_MASK ^ (1 << FLD_4D_XL1)

    CTRL_REG5_XL            = $1F
    CTRL_REG5_XL_MASK       = $F8
        FLD_DEC_1           = 7
        FLD_DEC_0           = 6
        FLD_ZEN_xL          = 5
        FLD_YEN_XL          = 4
        FLD_XEN_XL          = 3
        BITS_EN_XL          = %111
        MASK_DEC_1          = CTRL_REG5_XL_MASK ^ (1 << FLD_DEC_1)
        MASK_DEC_0          = CTRL_REG5_XL_MASK ^ (1 << FLD_DEC_0)
        MASK_ZEN_XL         = CTRL_REG5_XL_MASK ^ (1 << FLD_ZEN_XL)
        MASK_YEN_XL         = CTRL_REG5_XL_MASK ^ (1 << FLD_YEN_XL)
        MASK_XEN_XL         = CTRL_REG5_XL_MASK ^ (1 << FLD_XEN_XL)
        MASK_EN_XL          = CTRL_REG5_XL_MASK ^ (BITS_EN_XL << FLD_XEN_XL)

    CTRL_REG6_XL            = $20
    CTRL_REG6_XL_MASK       = $FF
        FLD_ODR_XL          = 5
        FLD_FS_XL           = 3
        FLD_BW_SCAL         = 2
        FLD_BW_XL           = 0
        BITS_ODR_XL         = %111
        BITS_FS_XL          = %11
        BITS_BW_SCAL        = %1
        BITS_BW_XL          = %11
        MASK_ODR_XL         = CTRL_REG6_XL_MASK ^ (BITS_ODR_XL << FLD_ODR_XL)
        MASK_FS_XL          = CTRL_REG6_XL_MASK ^ (BITS_FS_XL << FLD_FS_XL)
        MASK_BW_SCAL        = CTRL_REG6_XL_MASK ^ (BITS_BW_SCAL << FLD_BW_SCAL)
        MASK_BW_XL          = CTRL_REG6_XL_MASK ^ (BITS_BW_XL << FLD_BW_XL)

    CTRL_REG7_XL            = $21
    CTRL_REG7_XL_MASK       = $E5
        FLD_HR              = 7
        FLD_DCF             = 5
        FLD_FDS             = 2
        FLD_HPIS1           = 0
        BITS_HR             = %1
        BITS_DCF            = %11
        BITS_FDS            = %1
        BITS_HPIS1          = %1
        MASK_HR             = CTRL_REG7_XL_MASK ^ (BITS_HR << FLD_HR)
        MASK_DCF            = CTRL_REG7_XL_MASK ^ (BITS_DCF << FLD_DCF)
        MASK_FDS            = CTRL_REG7_XL_MASK ^ (BITS_FDS << FLD_FDS)
        MASK_HPIS1          = CTRL_REG7_XL_MASK ^ (BITS_HPIS1 << FLD_HPIS1)

    CTRL_REG8               = $22
    CTRL_REG8_MASK          = $FF
        FLD_BOOT            = 7
        FLD_BDU             = 6
        FLD_H_LACTIVE       = 5
        FLD_PP_OD           = 4
        FLD_SIM             = 3
        FLD_IF_ADD_INC      = 2
        FLD_BLE             = 1
        FLD_SW_RESET        = 0
        MASK_BOOT           = CTRL_REG8_MASK ^ (1 << FLD_BOOT)
        MASK_BDU            = CTRL_REG8_MASK ^ (1 << FLD_BDU)
        MASK_H_LACTIVE      = CTRL_REG8_MASK ^ (1 << FLD_H_LACTIVE)
        MASK_PP_OD          = CTRL_REG8_MASK ^ (1 << FLD_PP_OD)
        MASK_SIM            = CTRL_REG8_MASK ^ (1 << FLD_SIM)
        MASK_IF_ADD_INC     = CTRL_REG8_MASK ^ (1 << FLD_IF_ADD_INC)
        MASK_BLE            = CTRL_REG8_MASK ^ (1 << FLD_BLE)
        MASK_SW_RESET       = CTRL_REG8_MASK ^ (1 << FLD_SW_RESET)

    CTRL_REG9               = $23
    CTRL_REG9_MASK          = $5F
        FLD_SLEEP_G         = 6
        FLD_FIFO_TEMP_EN    = 4
        FLD_DRDY_MASK_BIT   = 3
        FLD_I2C_DISABLE     = 2
        FLD_FIFO_EN         = 1
        FLD_STOP_ON_FTH     = 0
        BITS_SLEEP_G        = %1
        BITS_FIFO_TEMP_EN   = %1
        BITS_DRDY_MASK_BIT  = %1
        BITS_I2C_DISABLE    = %1
        BITS_FIFO_EN        = %1
        BITS_STOP_ON_FTH    = %1
        MASK_SLEEP_G        = CTRL_REG9_MASK ^ (BITS_SLEEP_G << FLD_SLEEP_G)
        MASK_FIFO_TEMP_EN   = CTRL_REG9_MASK ^ (BITS_FIFO_TEMP_EN << FLD_FIFO_TEMP_EN)
        MASK_DRDY_MASK_BIT  = CTRL_REG9_MASK ^ (BITS_DRDY_MASK_BIT << FLD_DRDY_MASK_BIT)
        MASK_I2C_DISABLE    = CTRL_REG9_MASK ^ (BITS_I2C_DISABLE << FLD_I2C_DISABLE)
        MASK_FIFO_EN        = CTRL_REG9_MASK ^ (BITS_FIFO_EN << FLD_FIFO_EN)
        MASK_STOP_ON_FTH    = CTRL_REG9_MASK ^ (BITS_STOP_ON_FTH << FLD_STOP_ON_FTH)

    CTRL_REG10              = $24
    INT_GEN_SRC_XL          = $26
    INT_GEN_SRC_XL_MASK     = $7F
        FLD_IA_XL           = 6
        FLD_ZH_XL           = 5
        FLD_ZL_XL           = 4
        FLD_YH_XL           = 3
        FLD_YL_XL           = 2
        FLD_XH_XL           = 1
        FLD_XL_XL           = 0


    STATUS_REG_1            = $27
    OUT_X_L_XL              = $28
    OUT_X_H_XL              = $29
    OUT_Y_L_XL              = $2A
    OUT_Y_H_XL              = $2B
    OUT_Z_L_XL              = $2C
    OUT_Z_H_XL              = $2D

    FIFO_CTRL               = $2E
    FIFO_CTRL_MASK          = $FF
        FLD_FMODE           = 5
        FLD_FTH             = 0
        BITS_FMODE          = %111
        BITS_FTH            = %11111
        MASK_FMODE          = FIFO_CTRL_MASK ^ (BITS_FMODE << FLD_FMODE)
        MASK_FTH            = FIFO_CTRL_MASK ^ (BITS_FTH << FLD_FTH)

    FIFO_SRC                = $2F
        FLD_FTH_STAT        = 7
        FLD_FSS             = 0
        BITS_FSS            = %111111

    INT_GEN_CFG_G           = $30
    INT_GEN_THS_XH_G        = $31
    INT_GEN_THS_XL_G        = $32
    INT_GEN_THS_YH_G        = $33
    INT_GEN_THS_YL_G        = $34
    INT_GEN_THS_ZH_G        = $35
    INT_GEN_THS_ZL_G        = $36
    INT_GEN_DUR_G           = $37
    OFFSET_X_REG_L_M        = $05
    OFFSET_X_REG_H_M        = $06
    OFFSET_Y_REG_L_M        = $07
    OFFSET_Y_REG_H_M        = $08
    OFFSET_Z_REG_L_M        = $09
    OFFSET_Z_REG_H_M        = $0A
    WHO_AM_I_M              = $0F

    CTRL_REG1_M             = $20
    CTRL_REG1_M_MASK        = $FF
        FLD_TEMP_COMP       = 7
        FLD_OM              = 5
        FLD_DO              = 2
        FLD_FAST_ODR        = 1
        FLD_ST              = 0
        BITS_OM             = %11
        BITS_DO             = %111
        MASK_TEMP_COMP      = CTRL_REG1_M_MASK ^ (1 << FLD_TEMP_COMP)
        MASK_OM             = CTRL_REG1_M_MASK ^ (BITS_OM << FLD_OM)
        MASK_DO             = CTRL_REG1_M_MASK ^ (BITS_DO << FLD_DO)
        MASK_FAST_ODR       = CTRL_REG1_M_MASK ^ (1 << FLD_FAST_ODR)
        MASK_ST             = CTRL_REG1_M_MASK ^ (1 << FLD_ST)

    CTRL_REG2_M             = $21
    CTRL_REG2_M_MASK        = $6C
        FLD_FS_M            = 5
        FLD_REBOOT          = 3
        FLD_SOFT_RST        = 2
        BITS_FS_M           = %11
        BITS_REBOOT         = %1
        BITS_SOFT_RST       = %1
        MASK_FS_M           = CTRL_REG2_M_MASK ^ (BITS_FS_M << FLD_FS_M)
        MASK_REBOOT         = CTRL_REG2_M_MASK ^ (BITS_REBOOT << FLD_REBOOT)
        MASK_SOFT_RST       = CTRL_REG2_M_MASK ^ (BITS_SOFT_RST << FLD_SOFT_RST)

    CTRL_REG3_M             = $22
    CTRL_REG3_M_MASK        = $A7
        FLD_M_I2C_DISABLE   = 7
        FLD_LP              = 5
        FLD_M_SIM           = 2
        FLD_MD              = 0
        BITS_MD             = %11
        MASK_M_I2C_DISABLE  = CTRL_REG3_M_MASK ^ (1 << FLD_M_I2C_DISABLE)
        MASK_LP             = CTRL_REG3_M_MASK ^ (1 << FLD_LP)
        MASK_M_SIM          = CTRL_REG3_M_MASK ^ (1 << FLD_M_SIM)
        MASK_MD             = CTRL_REG3_M_MASK ^ (BITS_MD << FLD_MD)

    CTRL_REG4_M             = $23
    CTRL_REG4_M_MASK        = $0E
        FLD_OMZ             = 2
        FLD_BLE_M           = 1
        BITS_OMZ            = %11
        MASK_OMZ            = CTRL_REG4_M_MASK ^ (BITS_OMZ << FLD_OMZ)
        MASK_BLE_M          = CTRL_REG4_M_MASK ^ (1 << FLD_BLE_M)

    CTRL_REG5_M             = $24
    CTRL_REG5_M_MASK        = $C0
        FLD_FAST_READ       = 7
        FLD_BDU_M           = 6
        MASK_FAST_READ      = CTRL_REG5_M_MASK ^ (1 << FLD_FAST_READ)
        MASK_BDU_M          = CTRL_REG5_M_MASK ^ (1 << FLD_BDU_M)

    STATUS_REG_M            = $27
    STATUS_REG_M_MASK       = $FF
        FLD_DA              = 0
        FLD_ZYXDA           = 3
        FLD_OR              = 4
        FLD_ZYXOR           = 7
        BITS_DA             = %1111
        BITS_OR             = %1111
        MASK_DA             = STATUS_REG_M_MASK ^ (BITS_DA << FLD_DA)
        MASK_OR             = STATUS_REG_M_MASK ^ (BITS_OR << FLD_OR)
        MASK_ZYXOR          = STATUS_REG_M_MASK ^ (1 << FLD_ZYXOR)
        MASK_ZYXDA          = STATUS_REG_M_MASK ^ (1 << FLD_ZYXDA)

    OUT_X_L_M               = $28
    OUT_X_H_M               = $29
    OUT_Y_L_M               = $2A
    OUT_Y_H_M               = $2B
    OUT_Z_L_M               = $2C
    OUT_Z_H_M               = $2D

    INT_CFG_M               = $30
    INT_CFG_M_MASK          = $E7
        FLD_IEN             = 0
        FLD_IEL             = 1
        FLD_IEA             = 2
        FLD_XYZIEN          = 5
        BITS_XYZIEN         = %111
        MASK_IEN            = INT_CFG_M_MASK ^ (1 << FLD_IEN)
        MASK_IEL            = INT_CFG_M_MASK ^ (1 << FLD_IEL)
        MASK_IEA            = INT_CFG_M_MASK ^ (1 << FLD_IEA)
        MASK_XYZIEN         = INT_CFG_M_MASK ^ (BITS_XYZIEN << FLD_XYZIEN)

    INT_SRC_M               = $31
        FLD_PTH_X           = 7
        FLD_PTH_Y           = 6
        FLD_PTH_Z           = 5
        FLD_NTH_X           = 4
        FLD_NTH_Y           = 3
        FLD_NTH_Z           = 2
        FLD_MROI            = 1
        FLD_INT             = 0
        BITS_PTH            = %111
        BITS_NTH            = %111

    INT_THS_L_M             = $32
    INT_THS_H_M             = $33

    FIFO_OFF                = 0
    FIFO_THS                = 1
    FIFO_CONT_TRIG          = 3
    FIFO_OFF_TRIG           = 4
    FIFO_CONT               = 6

PUB Null
'' This is not a top-level object
