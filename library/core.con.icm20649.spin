{
    --------------------------------------------
    Filename: core.con.icm20649.spin
    Author: Jesse Burt
    Description: ICM20649-specific constants
    Copyright (c) 2021
    Started Aug 28, 2020
    Updated Jan 30, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C
    I2C_MAX_FREQ                = 400_000
    SLAVE_ADDR                  = $68 << 1

' SPI
    SCK_MAX_FREQ                = 7_000_000
    SPI_MODE                    = 0
    R                           = 1 << 7        ' SPI: read reg
    W                           = 0 << 7        ' SPI: write reg

    TPOR                        = 5_000         ' usec
    A_START_COLD                = 30_000        ' usec
    G_START_COLD                = 35_000        ' usec

' ICM20649 has 4 banks of registers, numbered 0..3. Many register numbers
'   are duplicated across banks, so to work around this (i.e. for register
'   validation in the driver), encode the bank number in the 3rd nibble
'   Example: XG_OFFS_USRH in bank 2 has address $03, but there are registers
'   in other banks that have address $03, so define as XG_OFFS_USRH as $203
' User bank 0
    WHO_AM_I                    = $000
        DEVID_RESP              = $E1

    USER_CTRL                   = $003
    USER_CTRL_MASK              = $FE
        DMP_EN                  = 7
        FIFO_EN                 = 6
        I2C_MST_EN              = 5
        I2C_IF_DIS              = 4
        DMP_RST                 = 3
        SRAM_RST                = 2
        I2C_MST_RST             = 1
        DMP_EN_MASK             = (1 << DMP_EN) ^ USER_CTRL_MASK
        FIFO_EN_MASK            = (1 << FIFO_EN) ^ USER_CTRL_MASK
        I2C_MST_EN_MASK         = (1 << I2C_MST_EN) ^ USER_CTRL_MASK
        I2C_IF_DIS_MASK         = (1 << I2C_IF_DIS) ^ USER_CTRL_MASK
        DMP_RST_MASK            = (1 << DMP_RST) ^ USER_CTRL_MASK
        SRAM_RST_MASK           = (1 << SRAM_RST) ^ USER_CTRL_MASK
        I2C_MST_RST_MASK        = (1 << I2C_MST_RST) ^ USER_CTRL_MASK

    LP_CONFIG                   = $005
    LP_CONFIG_MASK              = $70
        I2C_MST_CYCLE           = 6
        ACCEL_CYCLE             = 5
        GYRO_CYCLE              = 4
        I2C_MST_CYCLE_MASK      = (1 << I2C_MST_CYCLE) ^ LP_CONFIG_MASK
        ACCEL_CYCLE_MASK        = (1 << ACCEL_CYCLE) ^ LP_CONFIG_MASK
        GYRO_CYCLE_MASK         = (1 << GYRO_CYCLE) ^ LP_CONFIG_MASK

    PWR_MGMT_1                  = $006
    PWR_MGMT_1_MASK             = $EF
        DEV_RESET               = 7
        SLEEP                   = 6
        LP_EN                   = 5
        TEMP_DIS                = 3
        CLKSEL                  = 0
        CLKSEL_BITS             = %111
        DEV_RESET_MASK          = (1 << DEV_RESET) ^ PWR_MGMT_1_MASK
        SLEEP_MASK              = (1 << SLEEP) ^ PWR_MGMT_1_MASK
        LP_EN_MASK              = (1 << LP_EN) ^ PWR_MGMT_1_MASK
        TEMP_DIS_MASK           = (1 << TEMP_DIS) ^ PWR_MGMT_1_MASK
        CLKSEL_MASK             = CLKSEL_BITS ^ PWR_MGMT_1_MASK

    PWR_MGMT_2                  = $007
    PWR_MGMT_2_MASK             = $3F
        DIS_ACCEL               = 3
        DIS_GYRO                = 0
        DIS_ACCEL_BITS          = %111
        DIS_GYRO_BITS           = %111
        DIS_ACCEL_MASK          = (DIS_ACCEL_BITS << DIS_ACCEL) ^ PWR_MGMT_2_MASK
        DIS_GYRO_MASK           = (DIS_GYRO_BITS << DIS_GYRO) ^ PWR_MGMT_2_MASK

    INT_PIN_CFG                 = $00F
    INT_PIN_CFG_MASK            = $FE
        INT1_ACTL               = 7
        INT1_OPEN               = 6
        INT1_LATCH_EN           = 5
        INT_ANYRD_2CLR          = 4
        ACTL_FSYNC              = 3
        FSYNC_INT_MODE_EN       = 2
        BYPASS_EN               = 1
        INT1_ACTL_MASK          = (1 << INT1_ACTL) ^ INT_PIN_CFG_MASK
        INT1_OPEN_MASK          = (1 << INT1_OPEN) ^ INT_PIN_CFG_MASK
        INT1_LATCH_EN_MASK      = (1 << INT1_LATCH_EN) ^ INT_PIN_CFG_MASK
        INT_ANYRD2CLR_MASK      = (1 << INT_ANYRD_2CLR) ^ INT_PIN_CFG_MASK
        ACTL_FSYNC_MASK         = (1 << ACTL_FSYNC) ^ INT_PIN_CFG_MASK
        FSYNC_INT_MODE_EN_MASK  = (1 << FSYNC_INT_MODE_EN) ^ INT_PIN_CFG_MASK
        BYPASS_EN_MASK          = (1 << BYPASS_EN) ^ INT_PIN_CFG_MASK

    INT_ENABLE                  = $010
    INT_ENABLE_MASK             = $9F
        REG_WOF_EN              = 7
        DMP_INT2_EN             = 4
        WOM_INT_EN              = 3
        PLL_RDY_EN              = 2
        DMP_INT1_EN             = 1
        I2C_MST_INT_EN          = 0
        REG_WOF_EN_MASK         = (1 << REG_WOF_EN) ^ INT_ENABLE_MASK
        DMP_INT2_EN_MASK        = (1 << DMP_INT2_EN) ^ INT_ENABLE_MASK
        WOM_INT_EN_MASK         = (1 << WOM_INT_EN) ^ INT_ENABLE_MASK
        PLL_RDY_EN_MASK         = (1 << PLL_RDY_EN) ^ INT_ENABLE_MASK
        DMP_INT1_EN_MASK        = (1 << DMP_INT1_EN) ^ INT_ENABLE_MASK
        I2C_MST_INT_EN_MASK     = (1 << I2C_MST_INT_EN) ^ INT_ENABLE_MASK

    INT_ENABLE_1                = $011
    INT_ENABLE_1_MASK           = $E1
        INT2_ACTL               = 7
        INT2_OPEN               = 6
        INT2_LATCH_EN           = 5
        RAW_DATA_0_RDY_EN       = 0
        INT2_ACTL_MASK          = (1 << INT2_ACTL) ^ INT_ENABLE_1_MASK
        INT2_OPEN_MASK          = (1 << INT2_OPEN) ^ INT_ENABLE_1_MASK
        INT2_LATCH_EN_MASK      = (1 << INT2_LATCH_EN) ^ INT_ENABLE_1_MASK
        RAW_DATA_0_RDY_EN_MASK  = 1 ^ INT_ENABLE_1_MASK

    INT_ENABLE_2                = $012
    INT_ENABLE_2_MASK           = $1F
        FIFO_OVRFL_EN           = 0
        FIFO_OVRFL_EN_BITS      = %11111

    INT_ENABLE_3                = $013
    INT_ENABLE_3_MASK           = $1F
        FIFO_WM_EN              = 0
        FIFO_WM_EN_BITS         = %11111

    I2C_MST_STATUS              = $017
    I2C_MST_STATUS_MASK         = $FF
        PASS_THROUGH            = 7
        I2C_SLV4_DONE           = 6
        I2C_LOST_ARB            = 5
        I2C_SLV4_NACK           = 4
        I2C_SLV3_NACK           = 3
        I2C_SLV2_NACK           = 2
        I2C_SLV1_NACK           = 1
        I2C_SLV0_NACK           = 0

    INT_STATUS                  = $019
    INT_STATUS_MASK             = $0F
        WOM_INT                 = 3
        PLL_RDY_INT             = 2
        DMP_INT1                = 1
        I2C_MST_INT             = 0

    INT_STATUS_1                = $01A
    INT_STATUS_1_MASK           = $01
        RAW_DATA_0_RDY_INT      = 0

    INT_STATUS_2                = $01B
    INT_STATUS_2_MASK           = $1F
        FIFO_OVRFL_INT          = 0
        FIFO_OVRFL_INT_BITS     = %11111

    INT_STATUS_3                = $01C
    INT_STATUS_3_MASK           = $1F
        FIFO_WM_INT             = 0
        FIFO_WM_INT_BITS        = %11111

    DELAY_TIMEH                 = $028
    DELAY_TIMEL                 = $029

    ACCEL_XOUT_H                = $02D
    ACCEL_XOUT_L                = $02E
    ACCEL_YOUT_H                = $02F
    ACCEL_YOUT_L                = $030
    ACCEL_ZOUT_H                = $031
    ACCEL_ZOUT_L                = $032

    GYRO_XOUT_H                 = $033
    GYRO_XOUT_L                 = $034
    GYRO_YOUT_H                 = $035
    GYRO_YOUT_L                 = $036
    GYRO_ZOUT_H                 = $037
    GYRO_ZOUT_L                 = $038

    TEMP_OUT_H                  = $039
    TEMP_OUT_L                  = $03A

    EXT_SLV_SENS_DATA_00        = $03B
    EXT_SLV_SENS_DATA_01        = $03C
    EXT_SLV_SENS_DATA_02        = $03D
    EXT_SLV_SENS_DATA_03        = $03E
    EXT_SLV_SENS_DATA_04        = $03F
    EXT_SLV_SENS_DATA_05        = $040
    EXT_SLV_SENS_DATA_06        = $041
    EXT_SLV_SENS_DATA_07        = $042
    EXT_SLV_SENS_DATA_08        = $043
    EXT_SLV_SENS_DATA_09        = $044
    EXT_SLV_SENS_DATA_10        = $045
    EXT_SLV_SENS_DATA_11        = $046
    EXT_SLV_SENS_DATA_12        = $047
    EXT_SLV_SENS_DATA_13        = $048
    EXT_SLV_SENS_DATA_14        = $049
    EXT_SLV_SENS_DATA_15        = $04A
    EXT_SLV_SENS_DATA_16        = $04B
    EXT_SLV_SENS_DATA_17        = $04C
    EXT_SLV_SENS_DATA_18        = $04D
    EXT_SLV_SENS_DATA_19        = $04E
    EXT_SLV_SENS_DATA_20        = $04F
    EXT_SLV_SENS_DATA_21        = $050
    EXT_SLV_SENS_DATA_22        = $051
    EXT_SLV_SENS_DATA_23        = $052

    FIFO_EN_1                   = $066
    FIFO_EN_1_MASK              = $0F

    FIFO_EN_2                   = $067
    FIFO_EN_2_MASK              = $1F

    FIFO_RST                    = $068
    FIFO_RST_MASK               = $1F

    FIFO_MODE                   = $069
    FIFO_MODE_MASK              = $1F

    FIFO_COUNTH                 = $070
    FIFO_COUNTH_MASK            = $1F

    FIFO_COUNTL                 = $071
    FIFO_COUNTL_MASK            = $FF

    FIFO_R_W                    = $072
    FIFO_R_W_MASK               = $FF

    DATA_RDY_STATUS             = $074
    DATA_RDY_STATUS_MASK        = $8F
        WOF_STATUS              = 7
        RAW_DATA_RDY            = 0
        RAW_DATA_RDY_BITS       = %1111

    FIFO_CFG                    = $076
    FIFO_CFG_MASK               = $01

    REG_BANK_SEL                = $07F
    REG_BANK_SEL_MASK           = $30
        USER_BANK               = 4
        USER_BANK_BITS          = %11

' User bank 1
    SELF_TEST_X_GYRO            = $102
    SELF_TEST_Y_GYRO            = $103
    SELF_TEST_Z_GYRO            = $104
    SELF_TEST_X_ACCEL           = $10E
    SELF_TEST_Y_ACCEL           = $10F
    SELF_TEST_Z_ACCEL           = $110

    XA_OFFS_H                   = $114
    XA_OFFS_L                   = $115
    YA_OFFS_H                   = $117
    YA_OFFS_L                   = $118
    ZA_OFFS_H                   = $11A
    ZA_OFFS_L                   = $11B

    TIMEBASE_CORRECTION_PLL     = $128
'   REG_BANK_SEL                = $17F

' User bank 2
    GYRO_SMPLRT_DIV             = $200

    GYRO_CFG1                   = $201
    GYRO_CFG1_MASK              = $3F
        GYRO_DLPFCFG            = 3
        GYRO_FS_SEL             = 1
        GYRO_FCH                = 0
        GYRO_DLPFCFG_BITS       = %111
        GYRO_FS_SEL_BITS        = %11
        GYRO_DLPFCFG_MASK       = (GYRO_DLPFCFG_BITS << GYRO_DLPFCFG) ^ GYRO_CFG1_MASK
        GYRO_FS_SEL_MASK        = (GYRO_FS_SEL_BITS << GYRO_FS_SEL) ^ GYRO_CFG1_MASK
        GYRO_FCH_MASK           = 1 ^ GYRO_CFG1_MASK

    GYRO_CFG2                   = $202
    GYRO_CFG2_MASK              = $3F
        XGYRO_CTEN              = 5
        YGYRO_CTEN              = 4
        ZGYRO_CTEN              = 3
        GYRO_AVGCFG             = 0
        GYRO_AVGCFG_BITS        = %111
        XGYRO_CTEN_MASK         = (1 << XGYRO_CTEN) ^ GYRO_CFG2_MASK
        YGYRO_CTEN_MASK         = (1 << YGYRO_CTEN) ^ GYRO_CFG2_MASK
        ZGYRO_CTEN_MASK         = (1 << ZGYRO_CTEN) ^ GYRO_CFG2_MASK
        GYRO_AVGCFG_MASK        = GYRO_AVGCFG_BITS ^ GYRO_CFG2_MASK

    XG_OFFS_USRH                = $203
    XG_OFFS_USRL                = $204
    YG_OFFS_USRH                = $205
    YG_OFFS_USRL                = $206
    ZG_OFFS_USRH                = $207
    ZG_OFFS_USRL                = $208

    ODR_ALIGN_EN                = $209
    ODR_ALIGN_EN_MASK           = $01

    ACCEL_SMPLRT_DIV            = $210  ' .. $211
    ACCEL_SMPLRT_DIV_MASK       = $0FFF

    ACCEL_INTEL_CTRL            = $212
    ACCEL_INTEL_CTRL_MASK       = $03
        ACCEL_INTEL_EN          = 1
        ACCEL_INTEL_MODE_INT    = 0

    ACCEL_WOM_THR               = $213
    ACCEL_WOM_THR_MASK          = $FF

    ACCEL_CFG                   = $214
    ACCEL_CFG_MASK              = $3F
        ACCEL_DLPFCFG           = 3
        ACCEL_FS_SEL            = 1
        ACCEL_FCH               = 0
        ACCEL_DLPFCFG_BITS      = %111
        ACCEL_FS_SEL_BITS       = %11
        ACCEL_DLPFCFG_MASK      = (ACCEL_DLPFCFG_BITS << ACCEL_DLPFCFG) ^ ACCEL_CFG_MASK
        ACCEL_FS_SEL_MASK       = (ACCEL_FS_SEL_BITS << ACCEL_FS_SEL) ^ ACCEL_CFG_MASK
        ACCEL_FCH_MASK          = 1 ^ ACCEL_CFG_MASK

    ACCEL_CFG_2                 = $215
    ACCEL_CFG_2_MASK            = $1F
        AX_ST_EN_REG            = 4
        AY_ST_EN_REG            = 3
        AZ_ST_EN_REG            = 2
        DEC3_CFG                = 0
        DEC3_CFG_BITS           = %11
        AX_ST_EN_REG_MASK       = (1 << AX_ST_EN_REG) ^ ACCEL_CFG_2_MASK
        AY_ST_EN_REG_MASK       = (1 << AY_ST_EN_REG) ^ ACCEL_CFG_2_MASK
        AZ_ST_EN_REG_MASK       = (1 << AZ_ST_EN_REG) ^ ACCEL_CFG_2_MASK
        DEC3_CFG_MASK           = DEC3_CFG_BITS ^ ACCEL_CFG_2_MASK

    FSYNC_CONFIG                = $252
    FSYNC_CONFIG_MASK           = $BF
        DELAY_TIME_EN           = 7
        WOF_DEGLITCH_EN         = 5
        WOF_EDGE_INT            = 4
        EXT_SYNC_SET            = 0
        EXT_SYNC_SET_BITS       = %1111
        DELAY_TIME_EN_MASK      = (1 << DELAY_TIME_EN) ^ FSYNC_CONFIG_MASK
        WOF_DEGLITCH_EN_MASK    = (1 << WOF_DEGLITCH_EN) ^ FSYNC_CONFIG_MASK
        WOF_EDGE_INT_MASK       = (1 << WOF_EDGE_INT) ^ FSYNC_CONFIG_MASK
        EXT_SYNC_SET_MASK       = EXT_SYNC_SET_BITS ^ FSYNC_CONFIG_MASK

    TEMP_CONFIG                 = $253
    TEMP_CONFIG_MASK            = $07

    MOD_CTRL_USR                = $254
    MOD_CTRL_USR_MASK           = $01
        REG_LP_DMP_EN           = 0

'   REG_BANK_SEL                = $07F

' User bank 3
    I2C_MST_ODR_CONFIG          = $300
    I2C_MST_CTRL                = $301
    I2C_MST_DELAY_CTRL          = $302
    I2C_SLV0_ADDR               = $303
    I2C_SLV0_REG                = $304
    I2C_SLV0_CTRL               = $305
    I2C_SLV0_DO                 = $306
    I2C_SLV1_ADDR               = $307
    I2C_SLV1_REG                = $308
    I2C_SLV1_CTRL               = $309
    I2C_SLV1_DO                 = $30A
    I2C_SLV2_ADDR               = $30B
    I2C_SLV2_REG                = $30C
    I2C_SLV2_CTRL               = $30D
    I2C_SLV2_DO                 = $30E
    I2C_SLV3_ADDR               = $30F
    I2C_SLV3_REG                = $310
    I2C_SLV3_CTRL               = $311
    I2C_SLV3_DO                 = $312
    I2C_SLV4_ADDR               = $313
    I2C_SLV4_REG                = $314
    I2C_SLV4_CTRL               = $315
    I2C_SLV4_DO                 = $316
    I2C_SLV4_DI                 = $317
'   REG_BANK_SEL                = $37F

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

