{
    --------------------------------------------
    Filename: core.con.l3gd20h.spin
    Author:
    Description:
    Copyright (c) 2020
    Started Jul 11, 2020
    Updated Jul 11, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C
    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $6A << 1
    MS_I2C              = 1 << 7

' SPI
    SCK_MAX_FREQ        = 10_000_000
    CPOL                = 1                                 ' 0 seems to work
    MS_SPI              = 1 << 6
    R                   = 1 << 7

' Register definitions
    WHO_AM_I            = $0F
        DEVID_RESP      = $D7

    CTRL1               = $20
    CTRL1_MASK          = $FF
        FLD_DR          = 6
        FLD_BW          = 4
        FLD_PD          = 3
        FLD_XYZEN       = 0
        BITS_DR         = %11
        BITS_BW         = %11
        BITS_XYZEN      = %111
        MASK_DR         = CTRL1_MASK ^ (BITS_DR << FLD_DR)
        MASK_BW         = CTRL1_MASK ^ (BITS_BW << FLD_BW)
        MASK_PD         = CTRL1_MASK ^ (1 << FLD_PD)
        MASK_XYZEN      = CTRL1_MASK ^ (BITS_XYZEN << FLD_XYZEN)

    CTRL2               = $21
    CTRL2_MASK          = $FF
        FLD_EXTREN      = 7
        FLD_LVLEN       = 6
        FLD_HPM         = 4
        FLD_HPCF        = 0
        BITS_HPM        = %11
        BITS_HPCF       = %1111
        MASK_EXTREN     = CTRL2_MASK ^ (1 << FLD_EXTREN)
        MASK_LVLEN      = CTRL2_MASK ^ (1 << FLD_LVLEN)
        MASK_HPM        = CTRL2_MASK ^ (BITS_HPM << FLD_HPM)
        MASK_HPCF       = CTRL2_MASK ^ (BITS_HPCF << FLD_HPCF)

    CTRL3               = $22
    CTRL3_MASK          = $FF
        FLD_INT1_IG     = 7
        FLD_INT1_BOOT   = 6
        FLD_INT1        = 6
        FLD_H_LACTIVE   = 5
        FLD_PP_OD       = 4
        FLD_INT2_DRDY   = 3
        FLD_INT2_FTH    = 2
        FLD_INT2_ORUN   = 1
        FLD_INT2_EMPTY  = 0
        FLD_INT2        = 0
        BITS_INT1       = %11
        BITS_INT2       = %1111
        MASK_INT1_IG    = CTRL3_MASK ^ (1 << FLD_INT1_IG)
        MASK_INT1_BOOT  = CTRL3_MASK ^ (1 << FLD_INT1_BOOT)
        MASK_INT1       = CTRL3_MASK ^ (BITS_INT1 << FLD_INT1)
        MASK_H_LACTIVE  = CTRL3_MASK ^ (1 << FLD_H_LACTIVE)
        MASK_PP_OD      = CTRL3_MASK ^ (1 << FLD_PP_OD)
        MASK_INT2_DRDY  = CTRL3_MASK ^ (1 << FLD_INT2_DRDY)
        MASK_INT2_FTH   = CTRL3_MASK ^ (1 << FLD_INT2_FTH)
        MASK_INT2_ORUN  = CTRL3_MASK ^ (1 << FLD_INT2_ORUN)
        MASK_INT2_EMPTY = CTRL3_MASK ^ (1 << FLD_INT2_EMPTY)
        MASK_INT2       = CTRL3_MASK ^ (BITS_INT2 << FLD_INT2)

    CTRL4               = $23
    CTRL4_MASK          = $FF
        FLD_BDU         = 7
        FLD_BLE         = 6
        FLD_FS          = 4
        FLD_IMPEN       = 3
        FLD_ST          = 1
        FLD_SIM         = 0
        BITS_FS         = %11
        BITS_ST         = %11
        MASK_BDU        = CTRL4_MASK ^ (1 << FLD_BDU)
        MASK_BLE        = CTRL4_MASK ^ (1 << FLD_BLE)
        MASK_FS         = CTRL4_MASK ^ (BITS_FS << FLD_FS)
        MASK_IMPEN      = CTRL4_MASK ^ (1 << FLD_IMPEN)
        MASK_ST         = CTRL4_MASK ^ (BITS_ST << FLD_ST)
        MASK_SIM        = CTRL4_MASK ^ (1 << FLD_BDU)

    CTRL5               = $24
    CTRL5_MASK          = $FF
        FLD_BOOT        = 7
        FLD_FIFO_EN     = 6
        FLD_STOPONFTH   = 5
        FLD_HPEN        = 4
        FLD_IG_SEL      = 2
        FLD_OUT_SEL     = 0
        BITS_IG_SEL     = %11
        BITS_OUT_SEL    = %11
        MASK_BOOT       = CTRL5_MASK ^ (1 << FLD_BOOT)
        MASK_FIFO_EN    = CTRL5_MASK ^ (1 << FLD_FIFO_EN)
        MASK_STOPONFTH  = CTRL5_MASK ^ (1 << FLD_STOPONFTH)
        MASK_HPEN       = CTRL5_MASK ^ (1 << FLD_HPEN)
        MASK_IG_SEL     = CTRL5_MASK ^ (BITS_IG_SEL << FLD_IG_SEL)
        MASK_OUT_SEL    = CTRL5_MASK ^ (BITS_OUT_SEL << FLD_OUT_SEL)

    REFERENCE           = $25
    REFERENCE_MASK      = $FF

    OUT_TEMP            = $26
    STATUS              = $27
        FLD_ZYXOR       = 7
        FLD_ZOR         = 6
        FLD_YOR         = 5
        FLD_XOR         = 4
        FLD_ZYXDA       = 3
        FLD_ZDA         = 2
        FLD_YDA         = 1
        FLD_XDA         = 0

    OUT_X_L             = $28
    OUT_X_H             = $29
    OUT_Y_L             = $2A
    OUT_Y_H             = $2B
    OUT_Z_L             = $2C
    OUT_Z_H             = $2D

    FIFO_CTRL           = $2E
    FIFO_CTRL_MASK      = $FF
        FLD_FM          = 5
        FLD_FTH         = 0
        BITS_FM         = %111
        BITS_FTH        = %11111
        MASK_FM         = FIFO_CTRL_MASK ^ (BITS_FM << FLD_FM)
        MASK_FTH        = FIFO_CTRL_MASK ^ (BITS_FTH << FLD_FTH)

    FIFO_SRC            = $2F
        FTH             = 1 << 7
        OVRN            = 1 << 6
        EMPTY           = 1 << 5
        FSS             = %11111

    IG_CFG              = $30
    IG_CFG_MASK         = $FF
        FLD_ANDOR       = 7
        FLD_LIR         = 6
        FLD_ZHIE        = 5
        FLD_ZLIE        = 4
        FLD_YHIE        = 3
        FLD_YLIE        = 2
        FLD_XHIE        = 1
        FLD_XLIE        = 0

    IG_SRC              = $31
        IA              = 1 << 6
        ZH              = 1 << 5
        ZL              = 1 << 4
        YH              = 1 << 3
        YL              = 1 << 2
        XH              = 1 << 1
        XL              = 1

    IG_THS_XH           = $32
    IG_THS_XH_MASK      = $FF
        FLD_DCRM        = 7
        FLD_THSX        = 0
        BITS_THSX       = %1111111
        MASK_DCRM       = IG_THS_XH_MASK ^ (1 << FLD_DCRM)
        MASK_THSX       = IG_THS_XH_MASK ^ (BITS_THSX << FLD_THSX)

    IG_THS_XL           = $33
    IG_THS_YH           = $34
    IG_THS_YH_MASK      = $7F
    IG_THS_YL           = $35
    IG_THS_ZH           = $36
    IG_THS_ZH_MASK      = $7F
    IG_THS_ZL           = $37

    IG_DURATION         = $38
    IG_DURATION_MASK    = $FF
        FLD_WAIT        = 7
        FLD_D           = 0
        BITS_D          = %1111111
        MASK_WAIT       = IG_DURATION_MASK ^ (1 << FLD_WAIT)
        MASK_D          = IG_DURATION_MASK ^ (BITS_D << FLD_D)

    LOW_ODR             = $39
    LOW_ODR_MASK        = $2D
        FLD_DRDY_HL     = 5
        FLD_I2C_DIS     = 3
        FLD_SW_RES      = 2
        FLD_LOW_ODR     = 0
        MASK_DRDY_HL    = LOW_ODR_MASK ^ (1 << FLD_DRDY_HL)
        MASK_I2C_DIS    = LOW_ODR_MASK ^ (1 << FLD_I2C_DIS)
        MASK_SW_RES     = LOW_ODR_MASK ^ (1 << FLD_SW_RES)
        MASK_LOW_ODR    = LOW_ODR_MASK ^ (1 << FLD_LOW_ODR)

PUB Null
' This is not a top-level object
