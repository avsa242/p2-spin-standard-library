{
    --------------------------------------------
    Filename: core.con.mpu9250.spin
    Author: Jesse Burt
    Description: MPU9250-specific constants
    Copyright (c) 2022
    Started Sep 2, 2019
    Updated Sep 4, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ                = 400_000
    SLAVE_ADDR                  = $68 << 1
    SLAVE_ADDR_MAG              = $0C << 1

    XL_G                        = $71 << 8
    MAG                         = $48 << 8
    DEVID_RESP                  = $7148

' Startup time
    TREGRW                      = 100_000       ' usec

' Accelerometer / Gyroscope registers
    SELF_TEST_X_GYRO            = XL_G | $00
    SELF_TEST_Y_GYRO            = XL_G | $01
    SELF_TEST_Z_GYRO            = XL_G | $02
    SELF_TEST_X_ACCEL           = XL_G | $0D
    SELF_TEST_Y_ACCEL           = XL_G | $0E
    SELF_TEST_Z_ACCEL           = XL_G | $0F

    XG_OFFS_USR                 = XL_G | $13    '..$14 (LSB)
    YG_OFFS_USR                 = XL_G | $15    '..$16 (LSB)
    ZG_OFFS_USR                 = XL_G | $17    '..$18 (LSB

    SMPLRT_DIV                  = XL_G | $19

    CONFIG                      = XL_G | $1A
    CONFIG_MASK                 = $7F
        FIFO_MODE               = 6
        EXT_SYNC_SET            = 3
        DLPF_CFG                = 0
        EXT_SYNC_SET_BITS       = %111
        DLPF_CFG_BITS           = %111
        FIFO_MODE_MASK          = (1 << FIFO_MODE) ^ CONFIG_MASK
        EXT_SYNC_SET_MASK       = (EXT_SYNC_SET_BITS << EXT_SYNC_SET) ^ CONFIG_MASK
        DLPF_CFG_MASK           = (DLPF_CFG_BITS << DLPF_CFG) ^ CONFIG_MASK

    GYRO_CFG                    = XL_G | $1B
    GYRO_CFG_MASK               = $FB
        XGYRO_CTEN              = 7
        YGYRO_CTEN              = 6
        ZGYRO_CTEN              = 5
        GYRO_FS_SEL             = 3
        FCH_B                   = 0
        GYRO_FS_SEL_BITS        = %11
        FCH_B_BITS              = %11
        XGYRO_CTEN_MASK         = (1 << XGYRO_CTEN) ^ GYRO_CFG_MASK
        YGYRO_CTEN_MASK         = (1 << YGYRO_CTEN) ^ GYRO_CFG_MASK
        ZGYRO_CTEN_MASK         = (1 << ZGYRO_CTEN) ^ GYRO_CFG_MASK
        GYRO_FS_SEL_MASK        = (GYRO_FS_SEL_BITS << GYRO_FS_SEL) ^ GYRO_CFG_MASK
        FCH_B_MASK              = FCH_B_BITS ^ GYRO_CFG_MASK

    ACCEL_CFG                   = XL_G | $1C
    ACCEL_CFG_MASK              = $F8
        AX_ST_EN                = 7
        AY_ST_EN                = 6
        AZ_ST_EN                = 5
        ACCEL_FS_SEL            = 3
        ACCEL_FS_SEL_BITS       = %11
        AX_ST_EN_MASK           = (1 << AX_ST_EN) ^ ACCEL_CFG_MASK
        AY_ST_EN_MASK           = (1 << AY_ST_EN) ^ ACCEL_CFG_MASK
        AZ_ST_EN_MASK           = (1 << AZ_ST_EN) ^ ACCEL_CFG_MASK
        ACCEL_FS_SEL_MASK       = ACCEL_FS_SEL_BITS ^ ACCEL_CFG_MASK

    ACCEL_CFG2                  = XL_G | $1D
    ACCEL_CFG2_MASK             = $0F
        ACCEL_FCH_B             = 3
        A_DLPFCFG               = 0
        A_DLPFCFG_BITS          = %111
        ACCEL_FCH_B_MASK        = (1 << ACCEL_FCH_B) ^ ACCEL_CFG2_MASK
        A_DLPFCFG_MASK          = A_DLPFCFG_BITS ^ ACCEL_CFG2_MASK

    LP_ACCEL_ODR                = XL_G | $1E

    WOM_THR                     = XL_G | $1F

    FIFO_EN                     = XL_G | $23

    I2C_MST_CTRL                = XL_G | $24
    I2C_SLV0_ADDR               = XL_G | $25
    I2C_SLV0_REG                = XL_G | $26
    I2C_SLV0_CTRL               = XL_G | $27
    I2C_SLV1_ADDR               = XL_G | $28
    I2C_SLV1_REG                = XL_G | $29
    I2C_SLV1_CTRL               = XL_G | $2A
    I2C_SLV2_ADDR               = XL_G | $2B
    I2C_SLV2_REG                = XL_G | $2C
    I2C_SLV2_CTRL               = XL_G | $2D
    I2C_SLV3_ADDR               = XL_G | $2E
    I2C_SLV3_REG                = XL_G | $2F
    I2C_SLV3_CTRL               = XL_G | $30
    I2C_SLV4_ADDR               = XL_G | $31
    I2C_SLV4_REG                = XL_G | $32
    I2C_SLV4_DO                 = XL_G | $33
    I2C_SLV4_CTRL               = XL_G | $34
    I2C_SLV4_DI                 = XL_G | $35
    I2C_MST_STATUS              = XL_G | $36

    INT_BYPASS_CFG              = XL_G | $37
    INT_BYPASS_CFG_MASK         = $FE
        ACTL                    = 7
        OPEN                    = 6
        LATCH_INT_EN            = 5
        INT_ANYRD_2CLR          = 4
        ACTL_FSYNC              = 3
        FSYNC_INTMODE_EN        = 2
        BYPASS_EN               = 1
        ACTL_MASK               = (1 << ACTL) ^ INT_BYPASS_CFG_MASK
        OPEN_MASK               = (1 << OPEN) ^ INT_BYPASS_CFG_MASK
        LATCH_INT_EN_MASK       = (1 << LATCH_INT_EN) ^ INT_BYPASS_CFG_MASK
        INT_ANYRD_2CLR_MASK     = (1 << INT_ANYRD_2CLR) ^ INT_BYPASS_CFG_MASK
        ACTL_FSYNC_MASK         = (1 << ACTL_FSYNC) ^ INT_BYPASS_CFG_MASK
        FSYNC_INTMODE_EN_MASK   = (1 << FSYNC_INTMODE_EN) ^ INT_BYPASS_CFG_MASK
        BYPASS_EN_MASK          = (1 << BYPASS_EN) ^ INT_BYPASS_CFG_MASK

    INT_ENABLE                  = XL_G | $38
    INT_ENABLE_MASK             = $59
        WOM_EN                  = 6
        FIFO_OVERFL_EN          = 4
        FSYNC_INT_EN            = 3
        RAW_RDY_EN              = 0
        WOM_EN_MASK             = (1 << WOM_EN) ^ INT_ENABLE_MASK
        FIFO_OVERFL_EN_MASK     = (1 << FIFO_OVERFL_EN) ^ INT_ENABLE_MASK
        FSYNC_INT_EN_MASK       = (1 << FSYNC_INT_EN) ^ INT_ENABLE_MASK
        RAW_RDY_EN_MASK         = (1 << RAW_RDY_EN) ^ INT_ENABLE_MASK

    INT_STATUS                  = XL_G | $3A
    INT_STATUS_MASK             = $59
        WOM_INT                 = 6
        FIFO_OVERFL_INT         = 4
        FSYNC_INT               = 3
        RAW_DATA_RDY_INT        = 0

    ACCEL_XOUT_H                = XL_G | $3B
    ACCEL_XOUT_L                = XL_G | $3C
    ACCEL_YOUT_H                = XL_G | $3D
    ACCEL_YOUT_L                = XL_G | $3E
    ACCEL_ZOUT_H                = XL_G | $3F
    ACCEL_ZOUT_L                = XL_G | $40

    TEMP_OUT_H                  = XL_G | $41
    TEMP_OUT_L                  = XL_G | $42

    GYRO_XOUT_H                 = XL_G | $43
    GYRO_XOUT_L                 = XL_G | $44
    GYRO_YOUT_H                 = XL_G | $45
    GYRO_YOUT_L                 = XL_G | $46
    GYRO_ZOUT_H                 = XL_G | $47
    GYRO_ZOUT_L                 = XL_G | $48

    EXT_SENS_DATA_00            = XL_G | $49
    EXT_SENS_DATA_01            = XL_G | $4A
    EXT_SENS_DATA_02            = XL_G | $4B
    EXT_SENS_DATA_03            = XL_G | $4C
    EXT_SENS_DATA_04            = XL_G | $4D
    EXT_SENS_DATA_05            = XL_G | $4E
    EXT_SENS_DATA_06            = XL_G | $4F
    EXT_SENS_DATA_07            = XL_G | $50
    EXT_SENS_DATA_08            = XL_G | $51
    EXT_SENS_DATA_09            = XL_G | $52
    EXT_SENS_DATA_10            = XL_G | $53
    EXT_SENS_DATA_11            = XL_G | $54
    EXT_SENS_DATA_12            = XL_G | $55
    EXT_SENS_DATA_13            = XL_G | $56
    EXT_SENS_DATA_14            = XL_G | $57
    EXT_SENS_DATA_15            = XL_G | $58
    EXT_SENS_DATA_16            = XL_G | $59
    EXT_SENS_DATA_17            = XL_G | $5A
    EXT_SENS_DATA_18            = XL_G | $5B
    EXT_SENS_DATA_19            = XL_G | $5C
    EXT_SENS_DATA_20            = XL_G | $5D
    EXT_SENS_DATA_21            = XL_G | $5E
    EXT_SENS_DATA_22            = XL_G | $5F
    EXT_SENS_DATA_23            = XL_G | $60

    I2C_SLV0_DO                 = XL_G | $63
    I2C_SLV1_DO                 = XL_G | $64
    I2C_SLV2_DO                 = XL_G | $65
    I2C_SLV3_DO                 = XL_G | $66

    I2C_MST_DELAY_CTRL          = XL_G | $67

    SIGNAL_PATH_RESET           = XL_G | $68

    MOT_DETECT_CTRL             = XL_G | $69

    USER_CTRL                   = XL_G | $6A
    USER_CTRL_MASK              = $77
        FIFOEN                  = 6
        I2C_MST_EN              = 5
        I2C_IF_DIS              = 4
        FIFO_RST                = 2
        I2C_MST_RST             = 1
        SIG_COND_RST            = 0
        FIFOEN_MASK             = (1 << FIFOEN) ^ USER_CTRL_MASK
        I2C_MST_EN_MASK         = (1 << I2C_MST_EN) ^ USER_CTRL_MASK
        I2C_IF_DIS_MASK         = (1 << I2C_IF_DIS) ^ USER_CTRL_MASK
        FIFO_RST_MASK           = (1 << FIFO_RST) ^ USER_CTRL_MASK
        I2C_MST_RST_MASK        = (1 << I2C_MST_RST) ^ USER_CTRL_MASK
        SIG_COND_RST_MASK       = (1 << SIG_COND_RST) ^ USER_CTRL_MASK

    PWR_MGMT_1                  = XL_G | $6B
    PWR_MGMT_1_MASK             = $FF
        H_RESET                 = 7
        SLEEP                   = 6
        CYCLE                   = 5
        GYRO_STDBY              = 4
        PD_PTAT                 = 3
        CLKSEL                  = 0
        CLKSEL_BITS             = %111
        H_RESET_MASK            = (1 << H_RESET) ^ PWR_MGMT_1_MASK
        SLEEP_MASK              = (1 << SLEEP) ^ PWR_MGMT_1_MASK
        CYCLE_MASK              = (1 << CYCLE) ^ PWR_MGMT_1_MASK
        GYRO_STDBY_MASK         = (1 << GYRO_STDBY) ^ PWR_MGMT_1_MASK
        PD_PTAT_MASK            = (1 << PD_PTAT) ^ PWR_MGMT_1_MASK
        CLKSEL_MASK             = CLKSEL_BITS ^ PWR_MGMT_1_MASK
        XLG_SOFT_RST            = 1 << H_RESET

    PWR_MGMT_2                  = XL_G | $6C
    PWR_MGMT_2_MASK             = $3F
        DIS_XYZA                = 3
        DIS_XYZG                = 0
        DIS_XYZA_BITS           = %111
        DIS_XYZG_BITS           = %111
        DIS_XYZA_MASK           = (DIS_XYZA_BITS << DIS_XYZA) ^ PWR_MGMT_2_MASK
        DIS_XYZG_MASK           = (DIS_XYZG_BITS << DIS_XYZG) ^ PWR_MGMT_2_MASK
        DIS_INVERT              = %111

    FIFO_COUNTH                 = XL_G | $72
    FIFO_COUNTL                 = XL_G | $73
    FIFO_R_W                    = XL_G | $74

    WHO_AM_I                    = XL_G | $75
        WHO_AM_I_RESP           = $71

    XA_OFFS_H                   = XL_G | $77    ' ..$78 (LSB)
    YA_OFFS_H                   = XL_G | $7A    ' ..$7B (LSB)
    ZA_OFFS_H                   = XL_G | $7D    ' ..$7E (LSB)

' Magnetometer registers
    WIA                         = MAG | $00
        WIA_RESP                = $48

    INFO                        = MAG | $01

    ST1                         = MAG | $02
    ST1_MASK                    = $03
        DOR                     = 1
        DRDY                    = 0

    HXL                         = MAG | $03
    HXH                         = MAG | $04
    HYL                         = MAG | $05
    HYH                         = MAG | $06
    HZL                         = MAG | $07
    HZH                         = MAG | $08

    ST2                         = MAG | $09
    ST2_MASK                    = $18
        BITM                    = 4
        HOFL                    = 3

    CNTL1                       = MAG | $0A
    CNTL1_MASK                  = $1F
        BIT                     = 4
        MODE                    = 0
        MODE_BITS               = %1111
        BIT_MASK                = (1 << BIT) ^ CNTL1_MASK
        MODE_MASK               = (MODE_BITS << MODE) ^ CNTL1_MASK

    CNTL2                       = MAG | $0B
    CNTL2_MASK                  = $01
        SRST                    = 0
        SOFT_RST                = 1 { << SRST }
' RESERVED - $0B

    ASTC                        = MAG | $0C
    ASTC_MASK                   = $40
        SELF                    = 6
        SELF_MASK               = (1 << SELF) ^ ASTC_MASK

' TEST 1 - $0D
' TEST 2 - $0E

    I2CDIS                      = MAG | $0F

    ASAX                        = MAG | $10
    ASAY                        = MAG | $11
    ASAZ                        = MAG | $12

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

