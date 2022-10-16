{
    --------------------------------------------
    Filename: core.con.l3g4200d.spin
    Author: Jesse Burt
    Description: L3G4200D-specific constants
    Copyright (c) 2021
    Started Nov 27, 2019
    Updated May 4, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ                = 10_000_000
    SPI_MODE                    = 3
    T_POR                       = 10_000        ' usec
    DEVID_RESP                  = $D3

' I2C Configuration
    I2C_MAX_FREQ                = 400_000
    SLAVE_ADDR                  = $68 << 1

' Register definitions
    WHO_AM_I                    = $0F

    CTRL_REG1                   = $20
    CTRL_REG1_MASK              = $FF
        DR                      = 6
        BW                      = 4
        PD                      = 3
        ZEN                     = 2
        YEN                     = 1
        XEN                     = 0
        XYZEN                   = 0
        DR_BITS                 = %11
        BW_BITS                 = %11
        XYZEN_BITS              = %111
        DR_MASK                 = (DR_BITS << DR) ^ CTRL_REG1_MASK
        BW_MASK                 = (BW_BITS << BW) ^ CTRL_REG1_MASK
        PD_MASK                 = (1 << PD) ^ CTRL_REG1_MASK
        ZEN_MASK                = (1 << ZEN) ^ CTRL_REG1_MASK
        YEN_MASK                = (1 << YEN) ^ CTRL_REG1_MASK
        XEN_MASK                = (1 << XEN) ^ CTRL_REG1_MASK
        XYZEN_MASK              = (XYZEN_BITS << XYZEN) ^ CTRL_REG1_MASK

    CTRL_REG2                   = $21
    CTRL_REG2_MASK              = $3F
        HPM                     = 4
        HPCF                    = 0
        HPM_BITS                = %11
        HPCF_BITS               = %1111
        HPM_MASK                = (HPM_BITS << HPM) ^ CTRL_REG2_MASK
        HPCF_MASK               = HPCF_BITS ^ CTRL_REG2_MASK

    CTRL_REG3                   = $22
    CTRL_REG3_MASK              = $FF
        I1_INT1                 = 7
        I1_BOOT                 = 6
        INT1                    = 6
        H_LACTIVE               = 5
        PP_OD                   = 4
        I2_DRDY                 = 3
        I2_WTM                  = 2
        I2_ORUN                 = 1
        I2_EMPTY                = 0
        INT2                    = 0
        INT1_BITS               = %11
        INT2_BITS               = %1111
        I1_INT1_MASK            = (1 << I1_INT1) ^ CTRL_REG3_MASK
        I1_BOOT_MASK            = (1 << I1_BOOT) ^ CTRL_REG3_MASK
        H_LACTIVE_MASK          = (1 << H_LACTIVE) ^ CTRL_REG3_MASK
        INT1_MASK               = (INT1_BITS << INT1) ^ CTRL_REG3_MASK
        PP_OD_MASK              = (1 << PP_OD) ^ CTRL_REG3_MASK
        I2_DRDY_MASK            = (1 << I2_DRDY) ^ CTRL_REG3_MASK
        I2_WTM_MASK             = (1 << I2_WTM) ^ CTRL_REG3_MASK
        I2_ORUN_MASK            = (1 << I2_ORUN) ^ CTRL_REG3_MASK
        I2_EMPTY_MASK           = (1 << I2_EMPTY) ^ CTRL_REG3_MASK
        INT2_MASK               = INT2_BITS ^ CTRL_REG3_MASK

    CTRL_REG4                   = $23
    CTRL_REG4_MASK              = $F7
        BDU                     = 7
        BLE                     = 6
        FS                      = 4
        ST                      = 1
        SIM                     = 0
        FS_BITS                 = %11
        ST_BITS                 = %11
        BDU_MASK                = (1 << BDU) ^ CTRL_REG4_MASK
        BLE_MASK                = (1 << BLE) ^ CTRL_REG4_MASK
        FS_MASK                 = (FS_BITS << FS) ^ CTRL_REG4_MASK
        ST_MASK                 = (ST_BITS << ST) ^ CTRL_REG4_MASK
        SIM_MASK                = 1 ^ CTRL_REG4_MASK

    CTRL_REG5                   = $24
    CTRL_REG5_MASK              = $DF
        BOOT                    = 7
        FIFO_EN                 = 6
        HPEN                    = 4
        INT1_SEL                = 2
        OUT_SEL                 = 0
        INT1_SEL_BITS           = %11
        OUT_SEL_BITS            = %11
        BOOT_MASK               = (1 << BOOT) ^ CTRL_REG5_MASK
        FIFO_EN_MASK            = (1 << FIFO_EN) ^ CTRL_REG5_MASK
        HPEN_MASK               = (1 << HPEN) ^ CTRL_REG5_MASK
        INT1_SEL_MASK           = (INT1_SEL_BITS << INT1_SEL) ^ CTRL_REG5_MASK
        OUT_SEL_MASK            = OUT_SEL_BITS ^ CTRL_REG5_MASK

    REFERENCE                   = $25
    REFERENCE_MASK              = $FF
        REF                     = %11111111

    OUT_TEMP                    = $26

    STATUS_REG                  = $27
        ZYXOR                   = 7
        Z_OR                    = 6
        Y_OR                    = 5
        X_OR                    = 4
        ZYXDA                   = 3
        ZDA                     = 2
        YDA                     = 1
        XDA                     = 0

    OUT_X_L                     = $28
    OUT_X_H                     = $29
    OUT_Y_L                     = $2A
    OUT_Y_H                     = $2B
    OUT_Z_L                     = $2C
    OUT_Z_H                     = $2D

    FIFO_CTRL_REG               = $2E
    FIFO_SRC_REG                = $2F

    INT1_CFG                    = $30
    INT1_SRC                    = $31

    INT1_THS_XH                 = $32
    INT1_THS_XL                 = $32
    INT1_THS_X_MASK             = $7FFF

    INT1_THS_YH                 = $32
    INT1_THS_YL                 = $32
    INT1_THS_Y_MASK             = $7FFF

    INT1_THS_ZH                 = $32
    INT1_THS_ZL                 = $32
    INT1_THS_Z_MASK             = $7FFF

    INT1_DURATION               = $32
    INT1_DURATION_MASK          = $FF
        WAIT                    = 7
        D                       = 0
        D_BITS                  = %1111111
        WAIT_MASK               = (1 << WAIT) ^ INT1_DURATION_MASK
        D_MASK                  = D_BITS ^ INT1_DURATION_MASK


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

