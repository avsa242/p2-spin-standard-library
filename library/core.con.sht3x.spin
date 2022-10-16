{
    --------------------------------------------
    Filename: core.con.sht3x.spin
    Author: Jesse Burt
    Description: SHT3x-specific constants
    Copyright (c) 2022
    Started Nov 19, 2017
    Updated Jan 8, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR              = $44 << 1
    I2C_MAX_FREQ            = 1_000_000

    T_POR                   = 1_000             ' usec

    ADC_MAX                 = 65535
    ADC_MAX_X100            = ADC_MAX * 100

' Periodic measurement commands
    MEAS_PER_0_5            = $2000 ' MSB |
        RPT_HI_0_5          = $0032 '       LSB
        RPT_MED_0_5         = $0024 '       LSB
        RPT_LO_0_5          = $002F '       LSB
        MEAS_P_HI_0_5       = MEAS_PER_0_5 | RPT_HI_0_5
        MEAS_P_MED_0_5      = MEAS_PER_0_5 | RPT_MED_0_5
        MEAS_P_LO_0_5       = MEAS_PER_0_5 | RPT_LO_0_5

    MEAS_PER_1              = $2100 ' MSB |
        RPT_HI_1            = $0030 '       LSB
        RPT_MED_1           = $0026 '       LSB
        RPT_LO_1            = $002D '       LSB
        MEAS_P_HI_1         = MEAS_PER_1 | RPT_HI_1
        MEAS_P_MED_1        = MEAS_PER_1 | RPT_MED_1
        MEAS_P_LO_1         = MEAS_PER_1 | RPT_LO_1

    MEAS_PER_2              = $2200 ' MSB |
        RPT_HI_2            = $0036 '       LSB
        RPT_MED_2           = $0020 '       LSB
        RPT_LO_2            = $002B '       LSB
        MEAS_P_HI_2         = MEAS_PER_2 | RPT_HI_2
        MEAS_P_MED_2        = MEAS_PER_2 | RPT_MED_2
        MEAS_P_LO_2         = MEAS_PER_2 | RPT_LO_2

    MEAS_PER_4              = $2300 ' MSB |
        RPT_HI_4            = $0034 '       LSB
        RPT_MED_4           = $0022 '       LSB
        RPT_LO_4            = $0029 '       LSB
        MEAS_P_HI_4         = MEAS_PER_4 | RPT_HI_4
        MEAS_P_MED_4        = MEAS_PER_4 | RPT_MED_4
        MEAS_P_LO_4         = MEAS_PER_4 | RPT_LO_4

    MEAS_PER_10             = $2700 ' MSB |
        RPT_HI_10           = $0037 '       LSB
        RPT_MED_10          = $0021 '       LSB
        RPT_LO_10           = $002A '       LSB
        MEAS_P_HI_10        = MEAS_PER_10 | RPT_HI_10
        MEAS_P_MED_10       = MEAS_PER_10 | RPT_MED_10
        MEAS_P_LO_10        = MEAS_PER_10 | RPT_LO_10

' One-shot measurement commands (without clock-stretching)
    MEAS_HIGHREP            = $2400
    MEAS_MEDREP             = $240B
    MEAS_LOWREP             = $2416

' One-shot measurement commands (with clock-stretching)
    ART                     = $2B32
    MEAS_HIGHREP_CS         = $2C06
    MEAS_MEDREP_CS          = $2C0D
    MEAS_LOWREP_CS          = $2C10

    CLRSTATUS               = $3041
    HEATERDIS               = $3066
    HEATEREN                = $306D
    BREAK_STOP              = $3093
    SOFTRESET               = $30A2
    READ_SN                 = $3780

    ALERTLIM_WR_LO_SET      = $6100
    ALERTLIM_WR_LO_CLR      = $610B
    ALERTLIM_WR_HI_CLR      = $6116
    ALERTLIM_WR_HI_SET      = $611D

    FETCHDATA               = $E000

    ALERTLIM_RD_LO_SET      = $E102
    ALERTLIM_RD_LO_CLR      = $E109
    ALERTLIM_RD_HI_CLR      = $E114
    ALERTLIM_RD_HI_SET      = $E11F

    ALERTLIM_MASK           = $FFFF
        ALERTLIM_RH         = 9
        ALERTLIM_TEMP       = 0
        ALERTLIM_RH_BITS    = %1111111
        ALERTLIM_TEMP_BITS  = %111111111
        ALERTLIM_RH_MASK    = (ALERTLIM_RH_BITS << ALERTLIM_RH) ^ ALERTLIM_MASK
        ALERTLIM_TEMP_MASK  = (ALERTLIM_TEMP_BITS << ALERTLIM_TEMP) ^ ALERTLIM_MASK

    STATUS                  = $F32D
    STATUS_MASK             = $AC13
        ALERTPENDING        = 15
        HEATER              = 13
        RHALERT             = 11
        TEMPALERT           = 10
        RESET               = 4
        CMDSTAT             = 1
        CMDCRC              = 0

PUB null
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

