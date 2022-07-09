{
    --------------------------------------------
    Filename: core.con.lis3dh.spin
    Author: Jesse Burt
    Description: LIS3DH-specific constants
    Copyright (c) 2022
    Started Mar 15, 2020
    Updated Apr 9, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    SLAVE_ADDR          = $18 << 1
    I2C_MAX_FREQ        = 400_000

' SPI Configuration
    SPI_MODE            = 0
    SCK_MAX_FREQ        = 10_000_000    ' P2/SPIN2

    W                   = 0
    R                   = 1 << 7
    MS_SPI              = 1 << 6
    MS_I2C              = 1 << 7

    TPOR                = 5             ' ms

' Register definitions
    STATUS_REG_AUX      = $07
    OUT_ADC1_L          = $08
    OUT_ADC1_H          = $09
    OUT_ADC2_L          = $0A
    OUT_ADC2_H          = $0B
    OUT_ADC3_L          = $0C
    OUT_ADC3_H          = $0D

    WHO_AM_I            = $0F
    WHO_AM_I_RESP       = $33

    CTRL_REG0           = $1E
    TEMP_CFG_REG        = $1F

    CTRL_REG1           = $20
    CTRL_REG1_MASK      = $FF
        ODR             = 4
        LPEN            = 3
        XYZEN           = 0
        ODR_BITS        = %1111
        XYZEN_BITS      = %111
        ODR_MASK        = (ODR_BITS << ODR) ^ CTRL_REG1_MASK
        LPEN_MASK       = (1 << LPEN) ^ CTRL_REG1_MASK
        XYZEN_MASK      = (XYZEN_BITS << XYZEN) ^ CTRL_REG1_MASK

    CTRL_REG2           = $21

    CTRL_REG3           = $22
    CTRL_REG3_MASK      = $FE
        I1_CLICK        = 7
        I1_IA1          = 6
        I1_IA2          = 5
        I1_ZYXDA        = 4
        I1_321DA        = 3
        I1_WTM          = 2
        I1_OVERRUN      = 1
        I1_CLICK_MASK   = (1 << I1_CLICK) ^ CTRL_REG3_MASK
        I1_IA1_MASK     = (1 << I1_IA1) ^ CTRL_REG3_MASK
        I1_IA2_MASK     = (1 << I1_IA2) ^ CTRL_REG3_MASK
        I1_ZYXDA_MASK   = (1 << I1_ZYXDA) ^ CTRL_REG3_MASK
        I1_321DA_MASK   = (1 << I1_321DA) ^ CTRL_REG3_MASK
        I1_WTM_MASK     = (1 << I1_WTM) ^ CTRL_REG3_MASK
        I1_OVERRUN_MASK = (1 << I1_OVERRUN) ^ CTRL_REG3_MASK

    CTRL_REG4           = $23
    CTRL_REG4_MASK      = $FF
        BDU             = 7
        BLE             = 6
        FS              = 4
        HR              = 3
        ST              = 1
        SIM             = 0
        FS_BITS         = %11
        ST_BITS         = %11
        BDU_MASK        = (1 << BDU) ^ CTRL_REG4_MASK
        BLE_MASK        = (1 << BLE) ^ CTRL_REG4_MASK
        FS_MASK         = (FS_BITS << FS) ^ CTRL_REG4_MASK
        HR_MASK         = (1 << HR) ^ CTRL_REG4_MASK
        ST_MASK         = (ST_BITS << ST) ^ CTRL_REG4_MASK
        SIM_MASK        = (1 << SIM) ^ CTRL_REG4_MASK
        SPI_3W          = (1 << SIM)

    CTRL_REG5           = $24
    CTRL_REG5_MASK      = $CF
        BOOT            = 7
        FIFO_EN         = 6
        LIR_INT1        = 3
        D4D_INT1        = 2
        LIR_INT2        = 1
        D4D_INT2        = 0
        BOOT_MASK       = (1 << BOOT) ^ CTRL_REG5_MASK
        FIFO_EN_MASK    = (1 << FIFO_EN) ^ CTRL_REG5_MASK
        LIR_INT1_MASK   = (1 << LIR_INT1) ^ CTRL_REG5_MASK
        D4D_INT1_MASK   = (1 << D4D_INT1) ^ CTRL_REG5_MASK
        LIR_INT2_MASK   = (1 << LIR_INT2) ^ CTRL_REG5_MASK
        D4D_INT2_MASK   = (1 << D4D_INT2) ^ CTRL_REG5_MASK

    CTRL_REG6           = $25
    CTRL_REG6_MASK      = $FA
        I2_CLICK        = 7
        I2_IA1          = 6
        I2_IA2          = 5
        I2_BOOT         = 4
        I2_ACT          = 3
        INT_POL         = 1
        I2_CLICK_MASK   = (1 << I2_CLICK) ^ CTRL_REG6_MASK
        I2_IA1_MASK     = (1 << I2_IA1) ^ CTRL_REG6_MASK
        I2_IA2_MASK     = (1 << I2_IA2) ^ CTRL_REG6_MASK
        I2_BOOT_MASK    = (1 << I2_BOOT) ^ CTRL_REG6_MASK
        I2_ACT_MASK     = (1 << I2_ACT) ^ CTRL_REG6_MASK
        INT_POL_MASK    = (1 << INT_POL) ^ CTRL_REG6_MASK

    REFERENCE           = $26

    STATUS_REG          = $27
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

    FIFO_CTRL_REG       = $2E
    FIFO_CTRL_REG_MASK  = $FF
        FM              = 6
        TR              = 5
        FTH             = 0
        FM_BITS         = %11
        FTH_BITS        = %11111
        FM_MASK         = (FM_BITS << FM) ^ FIFO_CTRL_REG_MASK
        TR_MASK         = (1 << TR) ^ FIFO_CTRL_REG_MASK
        FTH_MASK        = (FTH_BITS << FTH) ^ FIFO_CTRL_REG_MASK

    FIFO_SRC_REG        = $2F
    FIFO_SRC_REG_MASK   = $FF
        WTM             = 7
        OVRN_FIFO       = 6
        EMPTY           = 5
        FSS             = 0
        FSS_BITS        = %11111
        WTM_MASK        = (1 << WTM) ^ FIFO_SRC_REG_MASK
        OVRN_FIFO_MASK  = (1 << OVRN_FIFO) ^ FIFO_SRC_REG_MASK
        EMPTY_MASK      = (1 << EMPTY) ^ FIFO_SRC_REG_MASK
        FSS_MASK        = (FSS_BITS << FSS) ^ FIFO_SRC_REG_MASK

    INT1_CFG            = $30
    INT1_CFG_MASK       = $FF
        AOI             = 7
        SIXD            = 6
        ZHIE            = 5
        ZLIE            = 4
        YHIE            = 3
        YLIE            = 2
        XHIE            = 1
        XLIE            = 0
        IE_BITS         = %111111
        AOI_MASK        = (1 << AOI) ^ INT1_CFG_MASK
        SIXD_MASK       = (1 << SIXD) ^ INT1_CFG_MASK
        ZHIE_MASK       = (1 << ZHIE) ^ INT1_CFG_MASK
        ZLIE_MASK       = (1 << ZLIE) ^ INT1_CFG_MASK
        YHIE_MASK       = (1 << YHIE) ^ INT1_CFG_MASK
        YLIE_MASK       = (1 << YLIE) ^ INT1_CFG_MASK
        XHIE_MASK       = (1 << XHIE) ^ INT1_CFG_MASK
        XLIE_MASK       = (1 << XLIE) ^ INT1_CFG_MASK
        FFALL           = (1 << AOI)
        WKUP            = (0 << AOI)

    INT1_SRC            = $31
    INT1_SRC_MASK       = $7F
        IA              = 6
        ZH              = 5
        ZL              = 4
        YH              = 3
        YL              = 2
        XH              = 1
        XL              = 0
        XYZ_BITS        = %111111

    INT1_THS            = $32
    INT1_DUR            = $33
    INT2_CFG            = $34
    INT2_SRC            = $35
    INT2_THS            = $36
    INT2_DUR            = $37

    CLICK_CFG           = $38

    CLICK_SRC           = $39
    CLICK_SRC_MASK      = $7F
        CLICK_IA        = 6
        DCLICK          = 5
        SCLICK          = 4
        SIGN            = 3
        Z               = 2
        Y               = 1
        X               = 0

    CLICK_THS           = $3A
    TIME_LIMIT          = $3B
    TIME_LATENCY        = $3C
    TIME_WINDOW         = $3D
    ACT_THS             = $3E
    ACT_DUR             = $3F

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

