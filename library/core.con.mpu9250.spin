{
    --------------------------------------------
    Filename: core.con.mpu9250.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Sep 2, 2019
    Updated Jan 23, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ                = 400_000
    SLAVE_ADDR                  = $68 << 1
    SLAVE_ADDR_MAG              = $0C << 1

    DEVID_RESP                  = $7148

' Startup time
    TREGRW                      = 100_000       ' usec

' Accelerometer / Gyroscope registers
    SELF_TEST_X_GYRO            = $7100
    SELF_TEST_Y_GYRO            = $7101
    SELF_TEST_Z_GYRO            = $7102
    SELF_TEST_X_ACCEL           = $710D
    SELF_TEST_Y_ACCEL           = $710E
    SELF_TEST_Z_ACCEL           = $710F

    XG_OFFS_USR                 = $7113         '..$14 (LSB)
    YG_OFFS_USR                 = $7115         '..$16 (LSB)
    ZG_OFFS_USR                 = $7117         '..$18 (LSB

    SMPLRT_DIV                  = $7119

    CONFIG                      = $711A
    CONFIG_MASK                 = $7F
        FIFO_MODE               = 6
        EXT_SYNC_SET            = 3
        DLPF_CFG                = 0
        EXT_SYNC_SET_BITS       = %111
        DLPF_CFG_BITS           = %111
        FIFO_MODE_MASK          = (1 << FIFO_MODE) ^ CONFIG_MASK
        EXT_SYNC_SET_MASK       = (EXT_SYNC_SET_BITS << EXT_SYNC_SET) ^ CONFIG_MASK
        DLPF_CFG_MASK           = (DLPF_CFG_BITS << DLPF_CFG) ^ CONFIG_MASK

    GYRO_CFG                    = $711B
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

    ACCEL_CFG                   = $711C
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

    ACCEL_CFG2                  = $711D
    ACCEL_CFG2_MASK             = $0F
        ACCEL_FCH_B             = 3
        A_DLPFCFG               = 0
        A_DLPFCFG_BITS          = %111
        ACCEL_FCH_B_MASK        = (1 << ACCEL_FCH_B) ^ ACCEL_CFG2_MASK
        A_DLPFCFG_MASK          = A_DLPFCFG_BITS ^ ACCEL_CFG2_MASK

    LP_ACCEL_ODR                = $711E

    WOM_THR                     = $711F

    FIFO_EN                     = $7123

    I2C_MST_CTRL                = $7124
    I2C_SLV0_ADDR               = $7125
    I2C_SLV0_REG                = $7126
    I2C_SLV0_CTRL               = $7127
    I2C_SLV1_ADDR               = $7128
    I2C_SLV1_REG                = $7129
    I2C_SLV1_CTRL               = $712A
    I2C_SLV2_ADDR               = $712B
    I2C_SLV2_REG                = $712C
    I2C_SLV2_CTRL               = $712D
    I2C_SLV3_ADDR               = $712E
    I2C_SLV3_REG                = $712F
    I2C_SLV3_CTRL               = $7130
    I2C_SLV4_ADDR               = $7131
    I2C_SLV4_REG                = $7132
    I2C_SLV4_DO                 = $7133
    I2C_SLV4_CTRL               = $7134
    I2C_SLV4_DI                 = $7135
    I2C_MST_STATUS              = $7136

    INT_BYPASS_CFG              = $7137
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

    INT_ENABLE                  = $7138
    INT_ENABLE_MASK             = $59
        WOM_EN                  = 6
        FIFO_OVERFL_EN          = 4
        FSYNC_INT_EN            = 3
        RAW_RDY_EN              = 0
        WOM_EN_MASK             = (1 << WOM_EN) ^ INT_ENABLE_MASK
        FIFO_OVERFL_EN_MASK     = (1 << FIFO_OVERFL_EN) ^ INT_ENABLE_MASK
        FSYNC_INT_EN_MASK       = (1 << FSYNC_INT_EN) ^ INT_ENABLE_MASK
        RAW_RDY_EN_MASK         = (1 << RAW_RDY_EN) ^ INT_ENABLE_MASK

    INT_STATUS                  = $713A
    INT_STATUS_MASK             = $59
        WOM_INT                 = 6
        FIFO_OVERFL_INT         = 4
        FSYNC_INT               = 3
        RAW_DATA_RDY_INT        = 0

    ACCEL_XOUT_H                = $713B
    ACCEL_XOUT_L                = $713C
    ACCEL_YOUT_H                = $713D
    ACCEL_YOUT_L                = $713E
    ACCEL_ZOUT_H                = $713F
    ACCEL_ZOUT_L                = $7140

    TEMP_OUT_H                  = $7141
    TEMP_OUT_L                  = $7142

    GYRO_XOUT_H                 = $7143
    GYRO_XOUT_L                 = $7144
    GYRO_YOUT_H                 = $7145
    GYRO_YOUT_L                 = $7146
    GYRO_ZOUT_H                 = $7147
    GYRO_ZOUT_L                 = $7148

    EXT_SENS_DATA_00            = $7149
    EXT_SENS_DATA_01            = $714A
    EXT_SENS_DATA_02            = $714B
    EXT_SENS_DATA_03            = $714C
    EXT_SENS_DATA_04            = $714D
    EXT_SENS_DATA_05            = $714E
    EXT_SENS_DATA_06            = $714F
    EXT_SENS_DATA_07            = $7150
    EXT_SENS_DATA_08            = $7151
    EXT_SENS_DATA_09            = $7152
    EXT_SENS_DATA_10            = $7153
    EXT_SENS_DATA_11            = $7154
    EXT_SENS_DATA_12            = $7155
    EXT_SENS_DATA_13            = $7156
    EXT_SENS_DATA_14            = $7157
    EXT_SENS_DATA_15            = $7158
    EXT_SENS_DATA_16            = $7159
    EXT_SENS_DATA_17            = $715A
    EXT_SENS_DATA_18            = $715B
    EXT_SENS_DATA_19            = $715C
    EXT_SENS_DATA_20            = $715D
    EXT_SENS_DATA_21            = $715E
    EXT_SENS_DATA_22            = $715F
    EXT_SENS_DATA_23            = $7160

    I2C_SLV0_DO                 = $7163
    I2C_SLV1_DO                 = $7164
    I2C_SLV2_DO                 = $7165
    I2C_SLV3_DO                 = $7166

    I2C_MST_DELAY_CTRL          = $7167

    SIGNAL_PATH_RESET           = $7168

    MOT_DETECT_CTRL             = $7169

    USER_CTRL                   = $716A
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

    PWR_MGMT_1                  = $716B
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

    PWR_MGMT_2                  = $716C
    PWR_MGMT_2_MASK             = $3F
        DIS_XYZA                = 3
        DIS_XYZG                = 0
        DIS_XYZA_BITS           = %111
        DIS_XYZG_BITS           = %111
        DIS_XYZA_MASK           = (DIS_XYZA_BITS << DIS_XYZA) ^ PWR_MGMT_2_MASK
        DIS_XYZG_MASK           = (DIS_XYZG_BITS << DIS_XYZG) ^ PWR_MGMT_2_MASK
        DIS_INVERT              = %111

    FIFO_COUNTH                 = $7172
    FIFO_COUNTL                 = $7173
    FIFO_R_W                    = $7174

    WHO_AM_I                    = $7175
        WHO_AM_I_RESP           = $71

    XA_OFFS_H                   = $7177                       ' ..$78 (LSB)
    YA_OFFS_H                   = $717A                       ' ..$7B (LSB)
    ZA_OFFS_H                   = $717D                       ' ..$7E (LSB)

' Magnetometer registers
    WIA                         = $4800
        WIA_RESP                = $48

    INFO                        = $4801

    ST1                         = $4802
    ST1_MASK                    = $03
        DOR                     = 1
        DRDY                    = 0

    HXL                         = $4803
    HXH                         = $4804
    HYL                         = $4805
    HYH                         = $4806
    HZL                         = $4807
    HZH                         = $4808

    ST2                         = $4809
    ST2_MASK                    = $18
        BITM                    = 4
        HOFL                    = 3

    CNTL1                       = $480A
    CNTL1_MASK                  = $1F
        BIT                     = 4
        MODE                    = 0
        MODE_BITS               = %1111
        BIT_MASK                = (1 << BIT) ^ CNTL1_MASK
        MODE_MASK               = (MODE_BITS << MODE) ^ CNTL1_MASK

    CNTL2                       = $480B
    CNTL2_MASK                  = $01
        SRST                    = 0
        SOFT_RST                = 1 { << SRST }
' RESERVED - $0B

    ASTC                        = $480C
    ASTC_MASK                   = $40
        SELF                    = 6
        SELF_MASK               = (1 << SELF) ^ ASTC_MASK

' TEST 1 - $0D
' TEST 2 - $0E

    I2CDIS                      = $480F

    ASAX                        = $4810
    ASAY                        = $4811
    ASAZ                        = $4812

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

