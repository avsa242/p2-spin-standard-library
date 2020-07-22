{
    --------------------------------------------
    Filename: core.con.lis3dh.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 15, 2020
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    SLAVE_ADDR                  = $18 << 1
    I2C_MAX_FREQ                = 400_000

' SPI Configuration
    CPOL                        = 0             ' Datasheet diagrams imply it's 1, but it doesn't work
    MOSI_BITORDER               = 5             ' MSBFIRST
    MISO_BITORDER               = 0             ' MSBPRE
    SCK_DELAY                   = 1             ' P1/SPIN1
    SCK_MAX_FREQ                = 10_000_000    ' P2/SPIN2

    W                           = 0
    R                           = 1 << 7
    MS_SPI                      = 1 << 6
    MS_I2C                      = 1 << 7

    TPOR                        = 5             ' ms

' Register definitions
    STATUS_REG_AUX              = $07
    OUT_ADC1_L                  = $08
    OUT_ADC1_H                  = $09
    OUT_ADC2_L                  = $0A
    OUT_ADC2_H                  = $0B
    OUT_ADC3_L                  = $0C
    OUT_ADC3_H                  = $0D

    WHO_AM_I                    = $0F
    WHO_AM_I_RESP               = $33

    CTRL_REG0                   = $1E
    TEMP_CFG_REG                = $1F

    CTRL_REG1                   = $20
    CTRL_REG1_MASK              = $FF
        FLD_ODR                 = 4
        FLD_LPEN                = 3
        FLD_XYZEN               = 0
        BITS_ODR                = %1111
        BITS_XYZEN              = %111
        MASK_ODR                = CTRL_REG1_MASK ^ (BITS_ODR << FLD_ODR)
        MASK_LPEN               = CTRL_REG1_MASK ^ (1 << FLD_LPEN)
        MASK_XYZEN              = CTRL_REG1_MASK ^ (BITS_XYZEN << FLD_XYZEN)

    CTRL_REG2                   = $21

    CTRL_REG3                   = $22
    CTRL_REG3_MASK              = $FE
        FLD_I1_CLICK            = 7
        FLD_I1_IA1              = 6
        FLD_I1_IA2              = 5
        FLD_I1_ZYXDA            = 4
        FLD_I1_321DA            = 3
        FLD_I1_WTM              = 2
        FLD_I1_OVERRUN          = 1
        MASK_I1_CLICK           = CTRL_REG3_MASK ^ (1 << FLD_I1_CLICK)
        MASK_I1_IA1             = CTRL_REG3_MASK ^ (1 << FLD_I1_IA1)
        MASK_I1_IA2             = CTRL_REG3_MASK ^ (1 << FLD_I1_IA2)
        MASK_I1_ZYXDA           = CTRL_REG3_MASK ^ (1 << FLD_I1_ZYXDA)
        MASK_I1_321DA           = CTRL_REG3_MASK ^ (1 << FLD_I1_321DA)
        MASK_I1_WTM             = CTRL_REG3_MASK ^ (1 << FLD_I1_WTM)
        MASK_I1_OVERRUN         = CTRL_REG3_MASK ^ (1 << FLD_I1_OVERRUN)

    CTRL_REG4                   = $23
    CTRL_REG4_MASK              = $FF
        FLD_BDU                 = 7
        FLD_BLE                 = 6
        FLD_FS                  = 4
        FLD_HR                  = 3
        FLD_ST                  = 1
        FLD_SIM                 = 0
        BITS_FS                 = %11
        BITS_ST                 = %11
        MASK_BDU                = CTRL_REG4_MASK ^ (1 << FLD_BDU)
        MASK_BLE                = CTRL_REG4_MASK ^ (1 << FLD_BLE)
        MASK_FS                 = CTRL_REG4_MASK ^ (BITS_FS << FLD_FS)
        MASK_HR                 = CTRL_REG4_MASK ^ (1 << FLD_HR)
        MASK_ST                 = CTRL_REG4_MASK ^ (BITS_ST << FLD_ST)
        MASK_SIM                = CTRL_REG4_MASK ^ (1 << FLD_SIM)

    CTRL_REG5                   = $24
    CTRL_REG5_MASK              = $CF
        FLD_BOOT                = 7
        FLD_FIFO_EN             = 6
        FLD_LIR_INT1            = 3
        FLD_D4D_INT1            = 2
        FLD_LIR_INT2            = 1
        FLD_D4D_INT2            = 0
        MASK_BOOT               = CTRL_REG5_MASK ^ (1 << FLD_BOOT)
        MASK_FIFO_EN            = CTRL_REG5_MASK ^ (1 << FLD_FIFO_EN)
        MASK_LIR_INT1           = CTRL_REG5_MASK ^ (1 << FLD_LIR_INT1)
        MASK_D4D_INT1           = CTRL_REG5_MASK ^ (1 << FLD_D4D_INT1)
        MASK_LIR_INT2           = CTRL_REG5_MASK ^ (1 << FLD_LIR_INT2)
        MASK_D4D_INT2           = CTRL_REG5_MASK ^ (1 << FLD_D4D_INT2)

    CTRL_REG6                   = $25
    REFERENCE                   = $26

    STATUS_REG                  = $27
        FLD_ZYXOR               = 7
        FLD_ZOR                 = 6
        FLD_YOR                 = 5
        FLD_XOR                 = 4
        FLD_ZYXDA               = 3
        FLD_ZDA                 = 2
        FLD_YDA                 = 1
        FLD_XDA                 = 0

    OUT_X_L                     = $28
    OUT_X_H                     = $29
    OUT_Y_L                     = $2A
    OUT_Y_H                     = $2B
    OUT_Z_L                     = $2C
    OUT_Z_H                     = $2D

    FIFO_CTRL_REG               = $2E
    FIFO_CTRL_REG_MASK          = $FF
        FLD_FM                  = 6
        FLD_TR                  = 5
        FLD_FTH                 = 0
        BITS_FM                 = %11
        BITS_FTH                = %11111
        MASK_FM                 = FIFO_CTRL_REG_MASK ^ (BITS_FM << FLD_FM)
        MASK_TR                 = FIFO_CTRL_REG_MASK ^ (1 << FLD_TR)
        MASK_FTH                = FIFO_CTRL_REG_MASK ^ (BITS_FTH << FLD_FTH)

    FIFO_SRC_REG                = $2F
    FIFO_SRC_REG_MASK           = $FF
        FLD_WTM                 = 7
        FLD_OVRN_FIFO           = 6
        FLD_EMPTY               = 5
        FLD_FSS                 = 0
        BITS_FSS                = %11111
        MASK_WTM                = FIFO_SRC_REG_MASK ^ (1 << FLD_WTM)
        MASK_OVRN_FIFO          = FIFO_SRC_REG_MASK ^ (1 << FLD_OVRN_FIFO)
        MASK_EMPTY              = FIFO_SRC_REG_MASK ^ (1 << FLD_EMPTY)
        MASK_FSS                = FIFO_SRC_REG_MASK ^ (BITS_FSS << FLD_FSS)

    INT1_CFG                    = $30

    INT1_SRC                    = $31
    INT1_SRC_MASK               = $7F
        FLD_IA                  = 6
        FLD_ZH                  = 5
        FLD_ZL                  = 4
        FLD_YH                  = 3
        FLD_YL                  = 2
        FLD_XH                  = 1
        FLD_XL                  = 0
        BITS_XYZ                = %111111

    INT1_THS                    = $32
    INT1_DURATION               = $33
    INT2_CFG                    = $34
    INT2_SRC                    = $35
    INT2_THS                    = $36
    INT2_DURATION               = $37

    CLICK_CFG                   = $38

    CLICK_SRC                   = $39
    CLICK_SRC_MASK              = $7F
        FLD_CLICK_IA            = 6
        FLD_DCLICK              = 5
        FLD_SCLICK              = 4
        FLD_SIGN                = 3
        FLD_Z                   = 2
        FLD_Y                   = 1
        FLD_X                   = 0

    CLICK_THS                   = $3A
    TIME_LIMIT                  = $3B
    TIME_LATENCY                = $3C
    TIME_WINDOW                 = $3D
    ACT_THS                     = $3E
    ACT_DUR                     = $3F

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

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
