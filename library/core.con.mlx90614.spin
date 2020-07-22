{
    --------------------------------------------
    Filename: core.con.mlx90614.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 17, 2019
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ            = 100_000
    I2C_MIN_FREQ            = 10_000
    SLAVE_ADDR              = $5A << 1

' Register definitions

    CMD_RAM                 = $00
    CMD_EEPROM              = $20
    CMD_READFLAGS           = $F0
    CMD_SLEEPMODE           = $FF

'   EEPROM
    EE_FLAGS_MASK           = $00B0
        FLD_EEBUSY          = 7
        FLD_EE_DEAD         = 5
        FLD_INIT            = 4

    EE_TO_MAX               = $00

    EE_TO_MIN               = $01

    EE_PWMCTRL              = $02
        FLD_PWM_EXT_MODE    = 0
        FLD_EN_PWM          = 1
        FLD_PPODB           = 2
        FLD_TRPWMB          = 3
        FLD_PWM_REPNUM      = 4
        FLD_PWM_PERIOD      = 9
        BITS_PWM_REPNUM     = %11111
        BITS_PWM_PERIOD     = %1111111

    EE_TA_RANGE             = $03

    EE_EMISS_CORR           = $04

    EE_CONFIG               = $05
    EE_CONFIG_MASK          = $FFFF
    EE_CONFIG_RECOMMEND_MASK= $8777 'Help keep from altering bits 14..11, 7, 3, per Melexis Datasheet
        FLD_IIR             = 0
        FLD_REPEAT_SENS_TST = 3
        FLD_TA_TOBJ         = 4
        FLD_IR_ZONES        = 6
        FLD_KS_SIGN         = 7
        FLD_FIR             = 8
        FLD_GAIN            = 11
        FLD_K12             = 14
        FLD_SENSOR_TST      = 15
        BITS_IIR            = %111
        BITS_TA_TOBJ        = %11
        BITS_FIR            = %111
        BITS_GAIN           = %111
        MASK_IIR            = EE_CONFIG_MASK ^ (BITS_IIR << FLD_IIR)
        MASK_REPEAT_SENS_TST= EE_CONFIG_MASK ^ (1 << FLD_REPEAT_SENS_TST)
        MASK_TA_TOBJ        = EE_CONFIG_MASK ^ (BITS_TA_TOBJ << FLD_TA_TOBJ)
        MASK_IR_ZONES       = EE_CONFIG_MASK ^ (1 << FLD_IR_ZONES)
        MASK_KS_SIGN        = EE_CONFIG_MASK ^ (1 << FLD_KS_SIGN)
        MASK_FIR            = EE_CONFIG_MASK ^ (BITS_FIR << FLD_FIR)
        MASK_GAIN           = EE_CONFIG_MASK ^ (BITS_GAIN << FLD_GAIN)
        MASK_K12            = EE_CONFIG_MASK ^ (1 << FLD_K12)
        MASK_SENSOR_TST     = EE_CONFIG_MASK ^ (1 << FLD_SENSOR_TST)

    EE_MLX_SLAVEADDR        = $0E

    EE_ID_1                 = $1C
    EE_ID_2                 = $1D
    EE_ID_3                 = $1E
    EE_ID_4                 = $1F

'   RAM
    IR_CH_1                 = $03
    IR_CH_2                 = $05
    T_A                     = $06
    T_OBJ1                  = $07
    T_OBJ2                  = $08

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
