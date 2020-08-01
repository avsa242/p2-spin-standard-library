{
    --------------------------------------------
    Filename: core.con.lsm303dlhc.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Jul 29, 2020
    Updated Aug 1, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    XL_SLAVE_ADDR       = $19 << 1
    MAG_SLAVE_ADDR      = $1E << 1

    RD_MULTI            = 1 << 7

' Register definitions
    CTRL_REG1           = $3220
    CTRL_REG1_MASK      = $FF
        FLD_ODR         = 4
        FLD_LPEN        = 3
        FLD_ZEN         = 2
        FLD_YEN         = 1
        FLD_XEN         = 0
        FLD_XYZEN       = 0
        BITS_ODR        = %1111
        BITS_XYZEN      = %111
        MASK_ODR        = CTRL_REG1_MASK ^ (BITS_ODR << FLD_ODR)
        MASK_LPEN       = CTRL_REG1_MASK ^ (1 << FLD_LPEN)
        MASK_ZEN        = CTRL_REG1_MASK ^ (1 << FLD_ZEN)
        MASK_YEN        = CTRL_REG1_MASK ^ (1 << FLD_YEN)
        MASK_XEN        = CTRL_REG1_MASK ^ (1 << FLD_XEN)
        MASK_XYZEN      = CTRL_REG1_MASK ^ (BITS_XYZEN << FLD_XYZEN)

    CTRL_REG2           = $3221

    CTRL_REG3           = $3222
    CTRL_REG3_MASK      = $FE
        FLD_I1_CLICK    = 7
        FLD_I1_IA1      = 6
        FLD_I1_IA2      = 5
        FLD_I1_ZYXDA    = 4
        FLD_I1_321DA    = 3
        FLD_I1_WTM      = 2
        FLD_I1_OVERRUN  = 1
        MASK_I1_CLICK   = CTRL_REG3_MASK ^ (1 << FLD_I1_CLICK)
        MASK_I1_IA1     = CTRL_REG3_MASK ^ (1 << FLD_I1_IA1)
        MASK_I1_IA2     = CTRL_REG3_MASK ^ (1 << FLD_I1_IA2)
        MASK_I1_ZYXDA   = CTRL_REG3_MASK ^ (1 << FLD_I1_ZYXDA)
        MASK_I1_321DA   = CTRL_REG3_MASK ^ (1 << FLD_I1_321DA)
        MASK_I1_WTM     = CTRL_REG3_MASK ^ (1 << FLD_I1_WTM)
        MASK_I1_OVERRUN = CTRL_REG3_MASK ^ (1 << FLD_I1_OVERRUN)

    CTRL_REG4           = $3223
    CTRL_REG4_MASK      = $F8
        FLD_BDU         = 7
        FLD_BLE         = 6
        FLD_FS          = 4
        FLD_HR          = 3
'        FLD_SIM         = 0
        BITS_FS         = %11
        MASK_BDU        = CTRL_REG4_MASK ^ (1 << FLD_BDU)
        MASK_BLE        = CTRL_REG4_MASK ^ (1 << FLD_BLE)
        MASK_FS         = CTRL_REG4_MASK ^ (BITS_FS << FLD_FS)
        MASK_HR         = CTRL_REG4_MASK ^ (1 << FLD_HR)
'        MASK_SIM        = CTRL_REG4_MASK ^ (1 << FLD_SIM)

    CTRL_REG5           = $3224
    CTRL_REG5_MASK      = $CF
        FLD_BOOT        = 7
        FLD_FIFO_EN     = 6
        FLD_LIR_INT1    = 3
        FLD_D4D_INT1    = 2
        FLD_LIR_INT2    = 1
        FLD_D4D_INT2    = 0
        MASK_BOOT       = CTRL_REG5_MASK ^ (1 << FLD_BOOT)
        MASK_FIFO_EN    = CTRL_REG5_MASK ^ (1 << FLD_FIFO_EN)
        MASK_LIR_INT1   = CTRL_REG5_MASK ^ (1 << FLD_LIR_INT1)
        MASK_D4D_INT1   = CTRL_REG5_MASK ^ (1 << FLD_D4D_INT1)
        MASK_LIR_INT2   = CTRL_REG5_MASK ^ (1 << FLD_LIR_INT2)
        MASK_D4D_INT2   = CTRL_REG5_MASK ^ (1 << FLD_D4D_INT2)

    CTRL_REG6           = $3225
    REFERENCE           = $3226

    STATUS_REG          = $3227
        FLD_ZYXOR       = 7
        FLD_ZOR         = 6
        FLD_YOR         = 5
        FLD_XOR         = 4
        FLD_ZYXDA       = 3
        FLD_ZDA         = 2
        FLD_YDA         = 1
        FLD_XDA         = 0

    OUT_X_L             = $3228
    OUT_X_H             = $3229
    OUT_Y_L             = $322A
    OUT_Y_H             = $322B
    OUT_Z_L             = $322C
    OUT_Z_H             = $322D

    FIFO_CTRL_REG       = $322E
    FIFO_CTRL_REG_MASK  = $FF
        FLD_FM          = 6
        FLD_TR          = 5
        FLD_FTH         = 0
        BITS_FM         = %11
        BITS_FTH        = %11111
        MASK_FM         = FIFO_CTRL_REG_MASK ^ (BITS_FM << FLD_FM)
        MASK_TR         = FIFO_CTRL_REG_MASK ^ (1 << FLD_TR)
        MASK_FTH        = FIFO_CTRL_REG_MASK ^ (BITS_FTH << FLD_FTH)

    FIFO_SRC_REG        = $322F
    FIFO_SRC_REG_MASK   = $FF
        FLD_WTM         = 7
        FLD_OVRN_FIFO   = 6
        FLD_EMPTY       = 5
        FLD_FSS         = 0
        BITS_FSS        = %11111
        MASK_WTM        = FIFO_SRC_REG_MASK ^ (1 << FLD_WTM)
        MASK_OVRN_FIFO  = FIFO_SRC_REG_MASK ^ (1 << FLD_OVRN_FIFO)
        MASK_EMPTY      = FIFO_SRC_REG_MASK ^ (1 << FLD_EMPTY)
        MASK_FSS        = FIFO_SRC_REG_MASK ^ (BITS_FSS << FLD_FSS)

    INT1_CFG            = $3230
    INT1_SRC            = $3231
    INT1_THS            = $3232
    INT1_DURATION       = $3233
    INT2_CFG            = $3234
    INT2_SRC            = $3235
    INT2_THS            = $3236
    INT2_DURATION       = $3237

    CLICK_CFG           = $3238

    CLICK_SRC           = $3239
    CLICK_SRC_MASK      = $7F
        FLD_CLICK_IA    = 6
        FLD_DCLICK      = 5
        FLD_SCLICK      = 4
        FLD_SIGN        = 3
        FLD_Z           = 2
        FLD_Y           = 1
        FLD_X           = 0

    CLICK_THS           = $323A

    TIME_LIMIT          = $323B

    TIME_LATENCY        = $323C

    TIME_WINDOW         = $323D

    CRA_REG_M           = $3C00
    CRA_REG_M_MASK      = $9C
        FLD_TEMP_EN     = 7
        FLD_DO          = 2
        BITS_DO         = %111
        MASK_TEMP_EN    = CRA_REG_M_MASK ^ (1 << FLD_TEMP_EN)
        MASK_DO         = CRA_REG_M_MASK ^ (BITS_DO << FLD_DO)

    CRB_REG_M           = $3C01
    CRB_REG_M_MASK      = $E0
        FLD_GN          = 5
        BITS_GN         = %111

    MR_REG_M            = $3C02
    MR_REG_M_MASK       = $03
        FLD_MD          = 0
        BITS_MD         = %11

    OUT_X_H_M           = $3C03
    OUT_X_L_M           = $3C04
    OUT_Y_H_M           = $3C05
    OUT_Y_L_M           = $3C06
    OUT_Z_H_M           = $3C07
    OUT_Z_L_M           = $3C08

    SR_REG_M            = $3C09
        FLD_LOCK        = 1
        FLD_DRDY        = 0
        BITS_LOCK       = %1
        BITS_DRDY       = %1

    IRA_REG_M           = $3C0A
    IRB_REG_M           = $3C0B
    IRC_REG_M           = $3C0C
    TEMP_OUT_H_M        = $3C31
    TEMP_OUT_H_L        = $3C32

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif
