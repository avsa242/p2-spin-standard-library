{
    --------------------------------------------
    Filename: core.con.sht3x.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Nov 19, 2017
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR              = $44 << 1                  ' Default slave address
    I2C_DEF_FREQ            = 400_000                   ' Set a reasonable default bus frequency
    I2C_MAX_FREQ            = 1_000_000                 ' SHT3X supports I2C FM up to 1MHz

    ADC_MAX                 = 65535
    ADC_MAX_X100            = ADC_MAX * 100

' Periodic measurement commands
    MEAS_PERIODIC_0_5       = $2000 ' MSB |
        RPT_HI_0_5          = $0032 '       LSB
        RPT_MED_0_5         = $0024 '       LSB
        RPT_LO_0_5          = $002F '       LSB

    MEAS_PERIODIC_1         = $2100 ' MSB |
        RPT_HI_1            = $0030 '       LSB
        RPT_MED_1           = $0026 '       LSB
        RPT_LO_1            = $002D '       LSB

    MEAS_PERIODIC_2         = $2200 ' MSB |
        RPT_HI_2            = $0036 '       LSB
        RPT_MED_2           = $0020 '       LSB
        RPT_LO_2            = $002B '       LSB

    MEAS_PERIODIC_4         = $2300 ' MSB |
        RPT_HI_4            = $0034 '       LSB
        RPT_MED_4           = $0022 '       LSB
        RPT_LO_4            = $0029 '       LSB

    MEAS_PERIODIC_10        = $2700 ' MSB |
        RPT_HI_10           = $0037 '       LSB
        RPT_MED_10          = $0021 '       LSB
        RPT_LO_10           = $002A '       LSB

' One-shot measurement commands (without clock-stretching)
    MEAS_HIGHREP            = $2400
    MEAS_MEDREP             = $240B
    MEAS_LOWREP             = $2416

' One-shot measurement commands (with clock-stretching)
    ART                     = $2B32
    MEAS_HIGHREP_STRETCH    = $2C06
    MEAS_MEDREP_STRETCH     = $2C0D
    MEAS_LOWREP_STRETCH     = $2C10

    CLEARSTATUS             = $3041
    HEATERDIS               = $3066
    HEATEREN                = $306D
    BREAK_STOP              = $3093
    SOFTRESET               = $30A2
    READ_SERIALNUM          = $3780

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
        FLD_ALERTLIM_TEMP   = 0
        BITS_ALERTLIM_TEMP  = %111111111
        MASK_ALERTLIM_TEMP  = ALERTLIM_MASK ^ (BITS_ALERTLIM_TEMP << FLD_ALERTLIM_TEMP)
        FLD_ALERTLIM_RH     = 9
        BITS_ALERTLIM_RH    = %1111111
        MASK_ALERTLIM_RH    = ALERTLIM_MASK ^ (BITS_ALERTLIM_RH << FLD_ALERTLIM_RH)

    STATUS                  = $F32D
    STATUS_MASK             = $AC13
        FLD_CMDCRC          = 0
        FLD_CMDSTAT         = 1
        FLD_RESET           = 4
        FLD_TEMPALERT       = 10
        FLD_RHALERT         = 11
        FLD_HEATER          = 13
        FLD_ALERTPENDING    = 15

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
