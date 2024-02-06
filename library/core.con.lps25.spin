{
    --------------------------------------------
    Filename: core.con.lps25.spin
    Author: Jesse Burt
    Description: LPS25-specific low-level constants
    Copyright (c) 2021
    Started Jun 22, 2021
    Updated Sep 28, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ        = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR          = $5D << 1                  ' 7-bit format slave address
    T_POR               = 1_000                     ' startup time (usecs)
    MB_I2C              = 1 << 7

' SPI configuration
    SPI_MAX_FREQ        = 10_000_000
    SPI_MODE            = 3
    MS_SPI              = 1 << 6
    READ_SPI            = 1 << 7


    DEVID_RESP          = $BD                       ' device ID expected response

' Register definitions
' RESERVED $00..$07
    REF_P_XL            = $08
    REF_P_L             = $09
    REF_P_H             = $0A
' RESERVED $0D..$0E
    WHO_AM_I            = $0F

    RES_CONF            = $10
    RES_CONF_MASK       = $0F
        AVGT            = 2
        AVGP            = 0
        AVGT_BITS       = %11
        AVGP_BITS       = %11
        AVGT_MASK       = (AVGT_BITS << AVGT) ^ RES_CONF_MASK
        AVGP_MASK       = AVGP_BITS ^ RES_CONF_MASK

' RESERVED $11..$1F
    CTRL_REG1           = $20
    CTRL_REG1_MASK      = $FF
        PD              = 7
        ODR             = 4
        DIFF_EN         = 3
        BDU             = 2
        RESET_AZ        = 1
        SIM             = 0
        ODR_BITS        = %111
        PD_MASK         = (1 << PD) ^ CTRL_REG1_MASK
        ODR_MASK        = (ODR_BITS << ODR) ^ CTRL_REG1_MASK
        DIFF_EN_MASK    = (1 << DIFF_EN) ^ CTRL_REG1_MASK
        BDU_MASK        = (1 << BDU) ^ CTRL_REG1_MASK
        RESET_AZ_MASK   = (1 << RESET_AZ) ^ CTRL_REG1_MASK
        SIM_MASK        = 1 ^ CTRL_REG1_MASK

    CTRL_REG2           = $21
    CTRL_REG2_MASK      = $FF
        BOOT            = 7
        FIFO_EN         = 6
        STOP_ON_FTH     = 5
        FIFO_MEAN_DEC   = 4
        I2C_DIS         = 3
        SWRESET         = 2
        AUTO_ZERO       = 1
        ONE_SHOT        = 0
        BOOT_MASK       = (1 << BOOT) ^ CTRL_REG2_MASK
        FIFO_EN_MASK    = (1 << FIFO_EN) ^ CTRL_REG2_MASK
        STOP_ON_FTH_MASK= (1 << STOP_ON_FTH) ^ CTRL_REG2_MASK
        FFO_MN_DEC_MASK = (1 << FIFO_MEAN_DEC) ^ CTRL_REG2_MASK
        I2C_DIS_MASK    = (1 << I2C_DIS) ^ CTRL_REG2_MASK
        SWRESET_MASK    = (1 << SWRESET) ^ CTRL_REG2_MASK
        AUTO_ZERO_MASK  = (1 << AUTO_ZERO) ^ CTRL_REG2_MASK
        ONE_SHOT_MASK   = 1 ^ CTRL_REG2_MASK
        RESET           = 1 << SWRESET
        MEASURE         = 1

    CTRL_REG3           = $22
    CTRL_REG3_MASK      = $C3
        INT_H_L         = 7
        PP_OD           = 6
        INT_S2          = 1
        INT_S1          = 0
        INT_H_L_MASK    = (1 << INT_H_L) ^ CTRL_REG3_MASK
        PP_OD_MASK      = (1 << PP_OD) ^ CTRL_REG3_MASK
        INT_S_BITS      = %11
        INT_S2_MASK     = (1 << INT_S2) ^ CTRL_REG3_MASK
        INT_S1_MASK     = 1 ^ CTRL_REG3_MASK
        INT_S_MASK      = INT_S_BITS ^ CTRL_REG3_MASK

    CTRL_REG4           = $23
    CTRL_REG4_MASK      = $0F
        F_EMPTY         = 3
        F_FTH           = 2
        F_OVR           = 1
        DRDY            = 0

    INTERRUPT_CFG       = $24
    INTERRUPT_CFG_MASK  = $07
        LIR             = 2
        PL_E            = 1
        PH_E            = 0
        PE_BITS         = %11
        LIR_MASK        = (1 << LIR) ^ INTERRUPT_CFG_MASK
        PL_E_MASK       = (1 << PL_E) ^ INTERRUPT_CFG_MASK
        PH_E_MASK       = 1 ^ INTERRUPT_CFG_MASK
        PE_MASK         = PE_BITS ^ INTERRUPT_CFG_MASK

    INT_SOURCE          = $25

' RESERVED $26

    STATUS_REG          = $27
    STATUS_REG_MASK     = $33
        P_OR            = 5
        T_OR            = 4
        P_DA            = 1
        T_DA            = 0
        POVR            = 1 << P_OR
        TOVR            = 1 << T_OR
        PDRDY           = 1 << P_DA
        TDRDY           = 1

    PRESS_OUT_XL        = $28
    PRESS_OUT_L         = $29
    PRESS_OUT_H         = $2A
    TEMP_OUT_L          = $2B
    TEMP_OUT_H          = $2C
' RESERVED $2D

    FIFO_CTRL           = $2E
    FIFO_CTRL_MASK      = $FF
        F_MODE          = 5
        WTM_POINT       = 0
        F_MODE_BITS     = %111
        WTM_POINT_BITS  = %11111
        F_MODE_MASK     = (F_MODE_BITS << F_MODE) ^ FIFO_CTRL_MASK
        WTM_POINT_MASK  = WTM_POINT_BITS ^ FIFO_CTRL_MASK

    FIFO_STATUS         = $2F
    FIFO_STATUS_MASK    = $FF
        FTH_FIFO        = 7
        OVR             = 6
        EMPTY_FIFO      = 5
        FSS             = 0
        FSS_BITS        = %11111

    THS_P_L             = $30
    THS_P_H             = $31
' RESERVED $32..$38
    RPDS_L              = $39
    RPDS_H              = $3A

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

