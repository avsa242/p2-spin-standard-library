{
    --------------------------------------------
    Filename: core.con.mlx90614.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 17, 2019
    Updated Dec 7, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ            = 100_000
    I2C_MIN_FREQ            = 10_000
    SLAVE_ADDR              = $5A << 1

    TPOR                    = 250_000           ' usec

' Commands
    CMD_RAM                 = $00
    CMD_EEPROM              = $20
    CMD_READFLAGS           = $F0
    CMD_SLEEPMODE           = $FF

' Registers
'   EEPROM
    EE_FLAGS_MASK           = $00B0
        EEBUSY              = 7
        EE_DEAD             = 5
        INIT                = 4

    EE_TO_MAX               = $00

    EE_TO_MIN               = $01

    EE_PWMCTRL              = $02
        PWM_PERIOD          = 9
        PWM_REPNUM          = 4
        TRPWMB              = 3
        PPODB               = 2
        EN_PWM              = 1
        PWM_EXT_MODE        = 0
        PWM_PERIOD_BITS     = %1111111
        PWM_REPNUM_BITS     = %11111

    EE_TA_RANGE             = $03

    EE_EMISS_CORR           = $04

    EE_CFG                  = $05
    EE_CFG_MASK             = $FFFF
    EE_CFG_RECOMMEND_MASK   = $8777 ' Help keep from altering bits 14..11, 7, 3, per Melexis Datasheet
        SENSOR_TST          = 15
        K12                 = 14
        GAIN                = 11
        FIR                 = 8
        KS_SIGN             = 7
        IR_ZONES            = 6
        TA_TOBJ             = 4
        REPEAT_SENS_TST     = 3
        IIR                 = 0
        GAIN_BITS           = %111
        FIR_BITS            = %111
        TA_TOBJ_BITS        = %11
        IIR_BITS            = %111
        SENSOR_TST_MASK     = (1 << SENSOR_TST) ^ EE_CFG_MASK
        K12_MASK            = (1 << K12) ^ EE_CFG_MASK
        GAIN_MASK           = (GAIN_BITS << GAIN) ^ EE_CFG_MASK
        FIR_MASK            = (FIR_BITS << FIR) ^ EE_CFG_MASK
        KS_SIGN_MASK        = (1 << KS_SIGN) ^ EE_CFG_MASK
        IR_ZONES_MASK       = (1 << IR_ZONES) ^ EE_CFG_MASK
        TA_TOBJ_MASK        = (TA_TOBJ_BITS << TA_TOBJ) ^ EE_CFG_MASK
        REPEAT_SENS_TST_MASK= (1 << REPEAT_SENS_TST) ^ EE_CFG_MASK
        IIR_MASK            = IIR_BITS ^ EE_CFG_MASK

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
