{
    --------------------------------------------
    Filename: core.con.lsm6dsl.spin
    Author: Jesse Burt
    Description: LSM6DSL-specific constants
    Copyright (c) 2021
    Started Feb 18, 2021
    Updated Dec 27, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $6A << 1

' SPI Configuration
    SPI_MAX_FREQ        = 10_000_000            ' device max SPI bus freq
    SPI_MODE            = 0                     ' 0 or 3
    T_POR               = 35_000                ' startup time (usecs)

    DEVID_RESP          = $6A                   ' device ID expected response

    READ                = 1 << 7                ' R/W bit: read

' Register definitions
    FUNC_CFG_ACCESS     = $01
    SENS_SYNC_TIMEFR    = $04
    SENS_SYNC_RESRATIO  = $05

    FIFO_CTRL1          = $06
    FIFO_CTRL1_MASK     = $FF
        FTH_LSB         = 0
        FTH_LSB_BITS    = %11111111

    FIFO_CTRL1_2_MASK   = $CFFF                 ' combined for FTH field

    FIFO_CTRL2          = $07
    FIFO_CTRL2_MASK     = $CF
        TMR_PED_FIFO_EN = 7
        TMR_PED_FIFO_DRD= 6
        FIFO_TEMP_EN    = 3
        FTH_MSB         = 0
        FTH_MSB_BITS    = %111
        FTH_BITS        = %111_11111111         ' FTH_MSB_BITS, FTH_LSB_BITS
        FTH_MSB_MASK    = FTH_MSB_BITS ^ FIFO_CTRL2_MASK
        FTH_MASK        = FTH_BITS ^ FIFO_CTRL1_2_MASK

    FIFO_CTRL3          = $08
    FIFO_CTRL3_MASK     = $3F
        DEC_FIFO_G      = 3
        DEC_FIFO_XL     = 0
        DEC_FIFO_G_BITS = %111
        DEC_FIFO_XL_BITS= %111
        DEC_FIFO_G_MASK = (DEC_FIFO_G_BITS << DEC_FIFO_G) ^ FIFO_CTRL3_MASK
        DEC_FIFO_XL_MASK= DEC_FIFO_XL_BITS ^ FIFO_CTRL3_MASK

    FIFO_CTRL4          = $09

    FIFO_CTRL5          = $0A
    FIFO_CTRL5_MASK     = $7F
        ODR_FIFO        = 3
        FIFO_MODE       = 0
        ODR_FIFO_BITS   = %1111
        FIFO_MODE_BITS  = %111
        ODR_FIFO_MASK   = (ODR_FIFO_BITS << ODR_FIFO) ^ FIFO_CTRL5_MASK
        FIFO_MODE_MASK  = FIFO_MODE_BITS ^ FIFO_CTRL5_MASK

    DRDY_PULSE_CFG_G    = $0B
    INT1_CTRL           = $0D
    INT2_CTRL           = $0E
    WHO_AM_I            = $0F

    CTRL1_XL            = $10
    CTRL1_XL_MASK       = $FF
        ODR_XL          = 4
        FS_XL           = 2
        LPF1_BW_SEL     = 1
        BW0_XL          = 0
        ODR_XL_BITS     = %1111
        FS_XL_BITS      = %11
        ODR_XL_MASK     = (ODR_XL_BITS << ODR_XL) ^ CTRL1_XL_MASK
        FS_XL_MASK      = (FS_XL_BITS << FS_XL) ^ CTRL1_XL_MASK
        LPF1_BW_SEL_MASK= (1 << LPF1_BW_SEL) ^ CTRL1_XL_MASK
        BW0_XL_MASK     = 1 ^ CTRL1_XL_MASK

    CTRL2_G             = $11
    CTRL2_G_MASK        = $FE
        ODR_G           = 4
        FS_G            = 1                     ' FS_125 combined w/FS_G
        FS125_G         = 1
        ODR_G_BITS      = %1111
        FS_G_BITS       = %111
        ODR_G_MASK      = (ODR_G_BITS << ODR_G) ^ CTRL2_G_MASK
        FS_G_MASK       = (FS_G_BITS << FS_G) ^ CTRL2_G_MASK
        FS125_G_MASK    = (1 << FS125_G) ^ CTRL2_G_MASK

    CTRL3_C             = $12
    CTRL3_C_MASK        = $FF
        BOOT            = 7
        BDU             = 6
        H_LACTIVE       = 5
        PP_OD           = 4
        SIM             = 3
        IF_INC          = 2
        BLE             = 1
        SW_RESET        = 0
        RESET           = (1 << SW_RESET)

    CTRL4_C             = $13
    CTRL4_C_MASK        = $FE
        DEN_XL_EN       = 7
        SLP             = 6
        INT2ONINT1      = 5
        DEN_DRDY_I1     = 4
        DRDY_DA         = 3
        I2C_DIS         = 2
        LPF1_SEL_G      = 1
        DEN_XL_EN_MASK  = (1 << DEN_XL_EN) ^ CTRL4_C_MASK
        SLP_MASK        = (1 << SLP) ^ CTRL4_C_MASK
        INT2ONINT1_MASK = (1 << INT2ONINT1) ^ CTRL4_C_MASK
        DEN_DRDY_I1_MASK= (1 << DEN_DRDY_I1) ^ CTRL4_C_MASK
        DRDY_DA_MASK    = (1 << DRDY_DA) ^ CTRL4_C_MASK
        I2C_DIS_MASK    = (1 << I2C_DIS) ^ CTRL4_C_MASK
        LPF1_SEL_G_MASK = (1 << LPF1_SEL_G) ^ CTRL4_C_MASK

    CTRL5_C             = $14

    CTRL6_C             = $15
    CTRL6_C_MASK        = $FB
        TRIG_EN         = 7
        LVL_EN          = 6
        LVL2_EN         = 5
        XL_HM_MODE      = 4
        USR_OFF_W       = 3
        FTYPE           = 0
        FTYPE_BITS      = %11
        TRIG_EN_MASK    = (1 << TRIG_EN) ^ CTRL6_C_MASK
        LVL_EN_MASK     = (1 << LVL_EN) ^ CTRL6_C_MASK
        LVL2_EN_MASK    = (1 << LVL2_EN) ^ CTRL6_C_MASK
        XL_HM_MODE_MASK = (1 << XL_HM_MODE) ^ CTRL6_C_MASK
        USR_OFF_W_MASK  = (1 << USR_OFF_W) ^ CTRL6_C_MASK
        FTYPE_MASK      = FTYPE_BITS ^ CTRL6_C_MASK

    CTRL7_G             = $16
    CTRL8_XL            = $17
    CTRL9_XL            = $18
    CTRL10_C            = $19
    MASTER_CFG          = $1A

    WAKEUP_SRC          = $1B
    WAKEUP_SRC_MASK     = $3F
        FF_IA           = 5
        SLPST_IA        = 4
        WU_IA           = 3
        X_WU            = 2
        Y_WU            = 1
        Z_WU            = 0
        FREEFALL        = (1 << FF_IA)
        SLPING          = (1 << SLPST_IA)
        AWOKEN          = (1 << WU_IA)

    TAP_SRC             = $1C
    TAP_SRC_MASK        = $7F
        TAP_IA          = 6
        SNG_TAP         = 5
        DBL_TAP         = 4
        TAP_SIGN        = 3
        X_TAP           = 2
        Y_TAP           = 1
        Z_ZAP           = 0
        TAPPED          = (1 << TAP_IA)
        X_TAPPED        = (1 << X_TAP)
        Y_TAPPED        = (1 << Y_TAP)
        Z_TAPPED        = 1

    D6D_SRC             = $1D

    STATUS              = $1E
    STATUS_MASK         = $07
        TDA             = 2
        GDA             = 1
        XLDA            = 0
        TRDY            = (1 << TDA)
        GRDY            = (1 << GDA)
        XLRDY           = (1 << XLDA)

    OUT_TEMP_L          = $20
    OUT_TEMP_H          = $21

    OUTX_L_G            = $22
    OUTX_H_G            = $23
    OUTY_L_G            = $24
    OUTY_H_G            = $25
    OUTZ_L_G            = $26
    OUTZ_H_G            = $27

    OUTX_L_XL           = $28
    OUTX_H_XL           = $29
    OUTY_L_XL           = $2A
    OUTY_H_XL           = $2B
    OUTZ_L_XL           = $2C
    OUTZ_H_XL           = $2D

    SENSHUB1            = $2E
    SENSHUB2            = $2F
    SENSHUB3            = $30
    SENSHUB4            = $31
    SENSHUB5            = $32
    SENSHUB6            = $33
    SENSHUB7            = $34
    SENSHUB8            = $35
    SENSHUB9            = $36
    SENSHUB10           = $37
    SENSHUB11           = $38
    SENSHUB12           = $39

    FIFO_STATUS1        = $3A
    FIFO_STATUS1_MASK   = $FF
        DIFF_FIFO       = 0                     ' bits 8..10 in FIFO_STATUS2
        DIFF_FIFO_BITS  = %11111111111

    FIFO_STATUS2        = $3B
    FIFO_STATUS2_MASK   = $F7
        WATERM          = 7
        OVER_RUN        = 6
        FIFOFULL_SM     = 5
        FIFO_EMPTY      = 4
        FIFOWTRMRK      = (1 << WATERM)
        FIFOOVRRUN      = (1 << OVER_RUN)
        FIFOFULL        = (1 << FIFOFULL_SM)
        FIFOEMPTY       = (1 << FIFO_EMPTY)

    FIFO_STATUS3        = $3C

    FIFO_STATUS4        = $3D

    FIFO_DATA_OUT_L     = $3E
    FIFO_DATA_OUT_H     = $3F
    TIMESTAMP0          = $40
    TIMESTAMP1          = $41
    TIMESTAMP2          = $42
    STP_TIMESTMP_L      = $49
    STP_TIMESTMP_H      = $4A
    STP_CNTR_L          = $4B
    STP_CNTR_H          = $4C
    SENSHUB13           = $4D
    SENSHUB14           = $4E
    SENSHUB15           = $4F
    SENSHUB16           = $50
    SENSHUB17           = $51
    SENSHUB18           = $52
    FUNC_SRC1           = $53
    FUNC_SRC2           = $54
    WRIST_TILT_IA       = $55

    TAP_CFG             = $58
    TAP_CFG_MASK        = $FF
        INTS_EN         = 7
        INACT_EN        = 5
        SLOPE_FDS       = 4
        TAP_X_EN        = 3
        TAP_Y_EN        = 2
        TAP_Z_EN        = 1
        TAP_EN          = 1
        LIR             = 0
        INACT_EN_BITS   = %11
        TAP_EN_BITS     = %111
        INTS_EN_MASK    = (1 << INTS_EN) ^ TAP_CFG_MASK
        INACT_EN_MASK   = (INACT_EN_BITS << INACT_EN) ^ TAP_CFG_MASK
        SLOPE_FDS_MASK  = (1 << SLOPE_FDS) ^ TAP_CFG_MASK
        TAP_X_EN_MASK   = (1 << TAP_X_EN) ^ TAP_CFG_MASK
        TAP_Y_EN_MASK   = (1 << TAP_Y_EN) ^ TAP_CFG_MASK
        TAP_Z_EN_MASK   = (1 << TAP_Z_EN) ^ TAP_CFG_MASK
        TAP_EN_MASK     = (TAP_EN_BITS << TAP_EN) ^ TAP_CFG_MASK
        LIR_MASK        = 1 ^ TAP_CFG_MASK
        INTS_ENA        = (1 << INTS_EN)

    TAP_THS_6D          = $59
    TAP_THS_6D_MASK     = $FF
        D4D_EN          = 7
        SIXD_THS        = 5
        TAP_THS         = 0
        SIXD_THS_BITS   = %11
        TAP_THS_BITS    = %11111
        D4D_EN_MASK     = (1 << D4D_EN) ^ TAP_THS_6D_MASK
        SIXD_THS_MASK   = (SIXD_THS_BITS << SIXD_THS) ^ TAP_THS_6D_MASK
        TAP_THS_MASK    = TAP_THS_BITS ^ TAP_THS_6D_MASK

    INT_DUR2            = $5A
    INT_DUR2_MASK       = $FF
        DUR             = 4
        QUIET           = 2
        SHOCK           = 0
        DUR_BITS        = %1111
        QUIET_BITS      = %11
        SHOCK_BITS      = %11
        DUR_MASK        = (DUR_BITS << DUR) ^ INT_DUR2_MASK
        QUIET_MASK      = (QUIET_BITS << QUIET) ^ INT_DUR2_MASK
        SHOCK_MASK      = SHOCK_BITS ^ INT_DUR2_MASK

    WAKEUP_THS          = $5B
    WAKEUP_THS_MASK     = $BF
        SNGL_DBLTAP     = 7
        WK_THS          = 0
        WK_THS_BITS     = %111111
        SNGL_DBLTAP_MASK= (1 << SNGL_DBLTAP) ^ WAKEUP_THS_MASK
        WK_THS_MASK     = WK_THS_BITS ^ WAKEUP_THS_MASK
        WK_THS_MAX      = WK_THS_BITS

    WAKEUP_DUR          = $5C
    WAKEUP_DUR_MASK     = $FF
        FF_DUR_M        = 7
        WAKE_DUR        = 5
        TIMER_HR        = 4
        SLP_DUR         = 0
        WAKE_DUR_BITS   = %11
        SLP_DUR_BITS    = %1111
        WAKE_DUR_MASK   = (WAKE_DUR_BITS << WAKE_DUR) ^ WAKEUP_DUR_MASK
        SLP_DUR_MASK    = (SLP_DUR_BITS << SLP_DUR) ^ WAKEUP_DUR_MASK
        SLP_DUR_MAX     = SLP_DUR_BITS

    FREE_FALL           = $5D
    FREE_FALL_MASK      = $FF
    WAKE_FREE_MASK      = (WAKEUP_DUR_MASK << 8) | FREE_FALL_MASK
        FF_DUR_L        = 3
        FF_THS          = 0
'        FF_DUR_BITS     = %10000000_11111000    ' combine this and prev. reg
        FF_DUR_BITS     = %11111000_10000000    ' combine this and prev. reg
        FF_THS_BITS     = %111
        FF_DUR_MASK     = FF_DUR_BITS ^ WAKE_FREE_MASK
        FF_THS_MASK     = FF_THS_BITS ^ FREE_FALL_MASK

    MD1_CFG             = $5E
    MD1_CFG_MASK        = $FF
        INT1_INACT_ST   = 7
        INT1_SNGL_TAP   = 6
        INT1_WU         = 5
        INT1_FF         = 4
        INT1_DBLTAP     = 3
        INT1_6D         = 2
        INT1_TILT       = 1
        INT1_TMR        = 0

    MD2_CFG             = $5F
    MAST_CMD_CODE       = $60
    SENS_SYNC_SPI_ERR   = $61
    OUT_MAG_RAW_X_L     = $66
    OUT_MAG_RAW_X_H     = $67
    OUT_MAG_RAW_Y_L     = $68
    OUT_MAG_RAW_Y_H     = $69
    OUT_MAG_RAW_Z_L     = $6A
    OUT_MAG_RAW_Z_H     = $6B

    X_OFS_USR           = $73
    Y_OFS_USR           = $74
    Z_OFS_USR           = $75


PUB Null{}
' This is not a top-level object

DAT
{
TERMS OF USE: MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}
