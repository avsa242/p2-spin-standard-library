{
    --------------------------------------------
    Filename: core.con.l3gd20h.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Jul 11, 2020
    Updated Jan 26, 2021
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
    SPI_MODE            = 3
    MS_SPI              = 1 << 6
    R                   = 1 << 7

' Register definitions
    WHO_AM_I            = $0F
        DEVID_RESP      = $D7

    CTRL1               = $20
    CTRL1_MASK          = $FF
        DR              = 6
        BW              = 4
        PD              = 3
        XYZEN           = 0
        DR_BITS         = %11
        BW_BITS         = %11
        XYZEN_BITS      = %111
        DR_MASK         = (DR_BITS << DR) ^ CTRL1_MASK
        BW_MASK         = (BW_BITS << BW) ^ CTRL1_MASK
        PD_MASK         = (1 << PD) ^ CTRL1_MASK
        XYZEN_MASK      = (XYZEN_BITS << XYZEN) ^ CTRL1_MASK

    CTRL2               = $21
    CTRL2_MASK          = $FF
        EXTREN          = 7
        LVLEN           = 6
        HPM             = 4
        HPCF            = 0
        HPM_BITS        = %11
        HPCF_BITS       = %1111
        EXTREN_MASK     = (1 << EXTREN) ^ CTRL2_MASK
        LVLEN_MASK      = (1 << LVLEN) ^ CTRL2_MASK
        HPM_MASK        = (HPM_BITS << HPM) ^ CTRL2_MASK
        HPCF_MASK       = (HPCF_BITS << HPCF) ^ CTRL2_MASK

    CTRL3               = $22
    CTRL3_MASK          = $FF
        INT1_IG         = 7
        INT1_BOOT       = 6
        INT1            = 6
        H_LACTIVE       = 5
        PP_OD           = 4
        INT2_DRDY       = 3
        INT2_FTH        = 2
        INT2_ORUN       = 1
        INT2_EMPTY      = 0
        INT2            = 0
        INT1_BITS       = %11
        INT2_BITS       = %1111
        INT1_IG_MASK    = (1 << INT1_IG) ^ CTRL3_MASK
        INT1_BOOT_MASK  = (1 << INT1_BOOT) ^ CTRL3_MASK
        INT1_MASK       = (INT1_BITS << INT1) ^ CTRL3_MASK
        H_LACTIVE_MASK  = (1 << H_LACTIVE) ^ CTRL3_MASK
        PP_OD_MASK      = (1 << PP_OD) ^ CTRL3_MASK
        INT2_DRDY_MASK  = (1 << INT2_DRDY) ^ CTRL3_MASK
        INT2_FTH_MASK   = (1 << INT2_FTH) ^ CTRL3_MASK
        INT2_ORUN_MASK  = (1 << INT2_ORUN) ^ CTRL3_MASK
        INT2_EMPTY_MASK = (1 << INT2_EMPTY) ^ CTRL3_MASK
        INT2_MASK       = (INT2_BITS << INT2) ^ CTRL3_MASK

    CTRL4               = $23
    CTRL4_MASK          = $FF
        BDU             = 7
        BLE             = 6
        FS              = 4
        IMPEN           = 3
        ST              = 1
        SIM             = 0
        FS_BITS         = %11
        ST_BITS         = %11
        BDU_MASK        = (1 << BDU) ^ CTRL4_MASK
        BLE_MASK        = (1 << BLE) ^ CTRL4_MASK
        FS_MASK         = (FS_BITS << FS) ^ CTRL4_MASK
        IMPEN_MASK      = (1 << IMPEN) ^ CTRL4_MASK
        ST_MASK         = (ST_BITS << ST) ^ CTRL4_MASK
        SIM_MASK        = (1 << BDU) ^ CTRL4_MASK

    CTRL5               = $24
    CTRL5_MASK          = $FF
        BOOT            = 7
        FIFO_EN         = 6
        STOPONFTH       = 5
        HPEN            = 4
        IG_SEL          = 2
        OUT_SEL         = 0
        IG_SEL_BITS     = %11
        OUT_SEL_BITS    = %11
        BOOT_MASK       = (1 << BOOT) ^ CTRL5_MASK
        FIFO_EN_MASK    = (1 << FIFO_EN) ^ CTRL5_MASK
        STOPONFTH_MASK  = (1 << STOPONFTH) ^ CTRL5_MASK
        HPEN_MASK       = (1 << HPEN) ^ CTRL5_MASK
        IG_SEL_MASK     = (IG_SEL_BITS << IG_SEL) ^ CTRL5_MASK
        OUT_SEL_MASK    = (OUT_SEL_BITS << OUT_SEL) ^ CTRL5_MASK

    REFERENCE           = $25
    REFERENCE_MASK      = $FF

    OUT_TEMP            = $26
    STATUS              = $27
        ZYXOR           = 7
        Z_OR            = 6
        Y_OR            = 5
        X_OR            = 4
        ZYXDA           = 3
        ZDA             = 2
        YDA             = 1
        XDA             = 0

    OUT_X_L             = $28
    OUT_X_H             = $29
    OUT_Y_L             = $2A
    OUT_Y_H             = $2B
    OUT_Z_L             = $2C
    OUT_Z_H             = $2D

    FIFO_CTRL           = $2E
    FIFO_CTRL_MASK      = $FF
        FM              = 5
        FTH             = 0
        FM_BITS         = %111
        FTH_BITS        = %11111
        FM_MASK         = (FM_BITS << FM) ^ FIFO_CTRL_MASK
        FTH_MASK        = (FTH_BITS << FTH) ^ FIFO_CTRL_MASK

    FIFO_SRC            = $2F
        FTHS            = 7
        OVRN            = 6
        EMPTY           = 5
        FSS             = 0
        FSS_BITS        = %11111

    IG_CFG              = $30
    IG_CFG_MASK         = $FF
        ANDOR           = 7
        LIR             = 6
        ZHIE            = 5
        ZLIE            = 4
        YHIE            = 3
        YLIE            = 2
        XHIE            = 1
        XLIE            = 0

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
        DCRM            = 7
        THSX            = 0
        THSX_BITS       = %1111111
        DCRM_MASK       = (1 << DCRM) ^ IG_THS_XH_MASK
        THSX_MASK       = (THSX_BITS << THSX) ^ IG_THS_XH_MASK

    IG_THS_XL           = $33
    IG_THS_YH           = $34
    IG_THS_YH_MASK      = $7F
    IG_THS_YL           = $35
    IG_THS_ZH           = $36
    IG_THS_ZH_MASK      = $7F
    IG_THS_ZL           = $37

    IG_DURATION         = $38
    IG_DURATION_MASK    = $FF
        WAIT            = 7
        D               = 0
        D_BITS          = %1111111
        WAIT_MASK       = (1 << WAIT) ^ IG_DURATION_MASK
        D_MASK          = (D_BITS << D) ^ IG_DURATION_MASK

    LOW_ODR             = $39
    LOW_ODR_MASK        = $2D
        DRDY_HL         = 5
        I2C_DIS         = 3
        SW_RES          = 2
        LOWODR          = 0
        DRDY_HL_MASK    = (1 << DRDY_HL) ^ LOW_ODR_MASK
        I2C_DIS_MASK    = (1 << I2C_DIS) ^ LOW_ODR_MASK
        SW_RES_MASK     = (1 << SW_RES) ^ LOW_ODR_MASK
        LOWODR_MASK     = (1 << LOWODR) ^ LOW_ODR_MASK

PUB Null{}
' This is not a top-level object

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
