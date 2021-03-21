{
    --------------------------------------------
    Filename: core.con.ds3231.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Nov 17, 2020
    Updated Nov 19, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $68 << 1

    TPOR                = 250_000               'usec

' Register map
    SECONDS             = $00
    SECONDS_MASK        = $7F

    MINUTES             = $01
    MINUTES_MASK        = $7F

    HOURS               = $02
    HOURS_MASK          = $7F
        FMT_1224        = 6
        AMPM            = 5

    DAY                 = $03
    DAY_MASK            = $07

    DATE                = $04
    DATE_MASK           = $3F

    MONTH               = $05
    MONTH_MASK          = $1F

    YEAR                = $06
    YEAR_MASK           = $FF

'
    ALM_MASK            = $FF                   ' applies to all alarm regs
    ALM1_SEC            = $07
    ALM1_MIN            = $08
    ALM1_HR             = $09
    ALM1_DAYDATE        = $0A

    ALM2_MIN            = $0B
    ALM2_HR             = $0C
    ALM2_DAYDATE        = $0D

    ALMX                = 7                     ' msb of above regs
    ALMX_SET            = (1 << ALMX)
    ALMX_MASK           = (1 << ALMX) ^ ALM_MASK

    DYDT                = 6
        ALM_DATE        = 0 << DYDT             ' unused; symbolic only
        ALM_DAY         = 1 << DYDT
    DYDT_MASK           = (1 << DYDT) ^ ALMX_MASK
'

    CONTROL             = $0E
    CONTROL_MASK        = $FF
        EOSC            = 7
        BBSQW           = 6
        CONV            = 5
        RS              = 3
        INTCN           = 2
        A2IE            = 1
        A1IE            = 0
        RS_BITS         = %11
        AIE_BITS        = %11
        EOSC_MASK       = (1 << EOSC) ^ CONTROL_MASK
        BBSQW_MASK      = (1 << BBSQW) ^ CONTROL_MASK
        CONV_MASK       = (1 << CONV) ^ CONTROL_MASK
        RS_MASK         = (RS_BITS << RS) ^ CONTROL_MASK
        INTCN_MASK      = (1 << INTCN) ^ CONTROL_MASK
        A2IE_MASK       = (1 << A2IE) ^ CONTROL_MASK
        A1IE_MASK       = 1 ^ CONTROL_MASK
        AIE_MASK        = AIE_BITS ^ CONTROL_MASK

    CTRL_STAT           = $0F
    CTRL_STAT_MASK      = $8F
        OSF             = 7
        EN32KHZ         = 3
        BSY             = 2
        A2F             = 1
        A1F             = 0
        AXF             = 0                     ' just both of the above
        AXF_BITS        = %11                   ' together
        OSF_MASK        = (1 << OSF) ^ CTRL_STAT_MASK
        EN32KHZ_MASK    = (1 << EN32KHZ) ^ CTRL_STAT_MASK
        BSY_MASK        = (1 << BSY) ^ CTRL_STAT_MASK
        A2F_MASK        = (1 << A2F) ^ CTRL_STAT_MASK
        A1F_MASK        = 1 ^ CTRL_STAT_MASK
        AXF_MASK        = AXF_BITS ^ CTRL_STAT_MASK

    AGE_OFFS            = $10                   ' s8

    TEMP_MSB            = $11                   ' s10
    TEMP_LSB            = $12                   ' LSB is left justified

PUB Null{}
' This is not a top-level object

