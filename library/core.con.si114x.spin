{
    --------------------------------------------
    Filename: core.con.si114x.spin
    Author: Jesse Burt
    Description: SI114x-specific constants
    Copyright (c) 2022
    Started Jun 1, 2019
    Updated Jul 5, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ                = 3_400_000
    SLAVE_ADDR                  = $60 << 1

    T_POR                       = 25_000        ' usec

' Register definitions
    PART_ID                     = $00
        PART_ID_RESP_1145       = $45
        PART_ID_RESP_1146       = $46
        PART_ID_RESP_1147       = $47

    REV_ID                      = $01
    SEQ_ID                      = $02
        SEQ_ID_RESP             = $08

    INT_CFG                     = $03
        INT_OE                  = 0

    IRQ_ENABLE                  = $04
    IRQ_ENABLE_MASK             = $1D
        PS3_IE                  = 4
        PS2_IE                  = 3
        PS1_IE                  = 2
        ALS_IE                  = 0
        INTSRC_PS3              = (1 << PS3_IE)
        INTSRC_PS2              = (1 << PS2_IE)
        INTSRC_PS1              = (1 << PS1_IE)
        INTSRC_ALS              = 1

    HW_KEY                      = $07
        HW_KEY_EXPECTED         = $17

    MEAS_RATE0                  = $08
    MEAS_RATE1                  = $09

    PS_LED21                    = $0F
        LED2_I                  = 4
        LED1_I                  = 0
        LED2_LI_BITS            = %1111
        LED1_LI_BITS            = %1111

    PS_LED3                     = $10
        LED3_I                  = 0
        LED3_I_BITS             = %1111

    UCOEF0                      = $13
        UCOEF0_DEF              = $7B
    UCOEF1                      = $14
        UCOEF1_DEF              = $6B
    UCOEF2                      = $15
        UCOEF2_DEF              = $01
    UCOEF3                      = $16
        UCOEF3_DEF              = $00

    PARAM_WR                    = $17
    COMMAND                     = $18
    RESPONSE                    = $20

    IRQ_STATUS                  = $21
    IRQ_STATUS_MASK             = $3D
        CMD_INT                 = 5
        PS3_INT                 = 4
        PS2_INT                 = 3
        PS1_INT                 = 2
        ALS_INT                 = 0
        ALS_INT_BITS            = %11

    CAL_DATA                    = $22   '..$2D
    CAL_DATA_LEN                = 11

    ALS_VIS_DATA0               = $22
    ALS_VIS_DATA1               = $23

    ALS_IR_DATA0                = $24
    ALS_IR_DATA1                = $25

    PS1_DATA0                   = $26
    PS1_DATA1                   = $27

    PS2_DATA0                   = $28
    PS2_DATA1                   = $29

    PS3_DATA0                   = $2A
    PS3_DATA1                   = $2B

    AUX_DATA0                   = $2C
    AUX_DATA1                   = $2D

    PARAM_RD                    = $2E

    CHIP_STAT                   = $30
        CHIP_STAT_SLEEP         = %001
        CHIP_STAT_SUSPEND       = %010
        CHIP_STAT_RUNNING       = %100

    ANA_IN_KEY_0                = $3B
    ANA_IN_KEY_1                = $3C
    ANA_IN_KEY_2                = $3D
    ANA_IN_KEY_3                = $3E

' COMMAND register values
    CMD_PARAM_QUERY             = %100 << 5
    CMD_PARAM_SET               = %101 << 5
    CMD_NOP                     = %000_00000
    CMD_RESET                   = %000_00001
    CMD_BUSADDR                 = %000_00010
    CMD_PS_FORCE                = %000_00101
    CMD_GET_CAL                 = %000_10010
    CMD_ALS_FORCE               = %000_00110
    CMD_PSALS_FORCE             = %000_00111
    CMD_PS_PAUSE                = %000_01001
    CMD_ALS_PAUSE               = %000_01010
    CMD_PSALS_PAUSE             = %000_01011
    CMD_PS_AUTO                 = %000_01101
    CMD_ALS_AUTO                = %000_01110
    CMD_PSALS_AUTO              = %000_01111

' RESPONSE register return values
    NO_ERROR                    = %0000
    INVALID_SETTING             = %1000_0000
    PS1_ADC_OVERFLOW            = %1000_1000
    PS2_ADC_OVERFLOW            = %1000_1001
    PS3_ADC_OVERFLOW            = %1000_1010
    ALS_VIS_ADC_OVERFLOW        = %1000_1100
    ALS_IR_ADC_OVERFLOW         = %1000_1101
    AUX_ADC_OVERFLOW            = %1000_1110

' Sequencer RAM Parameters
    I2C_ADDR                    = $00

    CHLIST                      = $01
    CHLIST_MASK                 = $F7
        EN_UV                   = 7
        EN_AUX                  = 6
        EN_ALS_IR               = 5
        EN_ALS_VIS              = 4
        EN_PS3                  = 2
        EN_PS2                  = 1
        EN_PS1                  = 0
        EN_UV_MASK              = (1 << EN_UV) ^ CHLIST_MASK
        EN_AUX_MASK             = (1 << EN_AUX) ^ CHLIST_MASK
        EN_ALS_IR_MASK          = (1 << EN_ALS_IR) ^ CHLIST_MASK
        EN_ALS_VIS_MASK         = (1 << EN_ALS_VIS) ^ CHLIST_MASK
        EN_PS3_MASK             = (1 << EN_PS3) ^ CHLIST_MASK
        EN_PS2_MASK             = (1 << EN_PS2) ^ CHLIST_MASK
        EN_PS1_MASK             = (1 << EN_PS1) ^ CHLIST_MASK


    PSLED12_SELECT              = $02
    PSLED12_SELECT_MASK         = $77
        PS2_LED                 = 4
        PS1_LED                 = 0
        PS2_LED_BITS            = %111
        PS1_LED_BITS            = %111
        PS2_LED_MASK            = (PS2_LED << PS2_LED) ^ PSLED12_SELECT_MASK
        PS1_LED_MASK            = (PS1_LED << PS1_LED) ^ PSLED12_SELECT_MASK

    PSLED3_SELECT               = $03
    PSLED3_SELECT_MASK          = $07
        PS3_LED                 = 0
        PS3_LED_BITS            = %111

    PS_ENCODING                 = $05
    PS_ENCODING_MASK            = $70
        PS3_ALIGN               = 6
        PS2_ALIGN               = 5
        PS1_ALIGN               = 4
        PS3_ALIGN_MASK          = (1 << PS3_ALIGN) ^ PS_ENCODING_MASK
        PS2_ALIGN_MASK          = (1 << PS2_ALIGN) ^ PS_ENCODING_MASK
        PS1_ALIGN_MASK          = (1 << PS1_ALIGN) ^ PS_ENCODING_MASK

    ALS_ENCODING                = $06
    ALS_ENCODING_MASK           = $30
        ALS_IR_ALIGN            = 5
        ALS_VIS_ALIGN           = 4
        ALS_IR_ALIGN_MASK       = (1 << ALS_IR_ALIGN) ^ ALS_ENCODING_MASK
        ALS_VIS_ALIGN_MASK      = (1 << ALS_VIS_ALIGN) ^ ALS_ENCODING_MASK

    PS1_ADCMUX                  = $07
    PS2_ADCMUX                  = $08
    PS3_ADCMUX                  = $09

    PS_ADC_COUNTER              = $0A
    PS_ADC_COUNTER_MASK         = $70
        PS_ADC_REC              = 4
        PS_ADC_REC_BITS         = %111

    PS_ADC_GAIN                 = $0B
    PS_ADC_GAIN_MASK            = $07
        PS_ADCGAIN              = 0
        PS_ADCGAIN_BITS         = %111

    PS_ADC_MISC                 = $0C
    PS_ADC_MISC_MASK            = $22
        PS_RANGE                = 5
        PS_ADC_MODE             = 2
        PS_RANGE_MASK           = (1 << PS_RANGE) ^ PS_ADC_MISC_MASK
        PS_ADC_MODE_MASK        = (1 << PS_ADC_MODE) ^ PS_ADC_MISC_MASK

    ALS_IR_ADCMUX               = $0E

    AUX_ADCMUX                  = $0F
        AUX_ADCMUX_TEMPERATURE  = $65
        AUX_ADCMUX_VDDVOLTAGE   = $75

    ALS_VIS_ADC_COUNTER         = $10
    ALS_VIS_ADC_COUNTER_MASK    = $70
            VIS_ADC_REC         = 4
            VIS_ADC_REC_BITS    = %111

    ALS_VIS_ADC_GAIN            = $11
    ALS_VIS_ADC_GAIN_MASK       = $07
        ALS_VIS_ADCGAIN         = 0
        ALS_VIS_ADCGAIN_BITS    = %111

    ALS_VIS_ADC_MISC            = $12
    ALS_VIS_ADC_MISC_MASK       = $20
        VIS_RANGE               = 5

    LED_REC                     = $1C

    ALS_IR_ADC_COUNTER          = $1D
    ALS_IR_ADC_COUNTER_MASK     = $70
        IR_ADC_REC              = 4
        IR_ADC_REC_BITS         = %111

    ALS_IR_ADC_GAIN             = $1E
    ALS_IR_ADC_GAIN_MASK        = $07
        ALS_IR_ADCGAIN          = 0
        ALS_IR_ADCGAIN_BITS     = %111

    ALS_IR_ADC_MISC             = $1F
    ALS_IR_ADC_MISC_MASK        = $20
        IR_RANGE                = 5

PUB Null{}
' This is not a top-level object

DAT
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

