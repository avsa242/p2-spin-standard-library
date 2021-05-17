{
    --------------------------------------------
    Filename: core.con.mlx90621
    Author: Jesse Burt
    Copyright (c) 2021
    Started: Nov 11, 2018
    Updated: May 17, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 1_000_000
    SLAVE_ADDR          = $60 << 1

    EE_MAX_FREQ         = 400_000
    EE_SLAVE_ADDR       = $50 << 1

    T_POR               = 3_000                 ' usec

' Register definitions
    CMD_READREG         = $02
    CMD_WRITEREG_CFG    = $03
    CMD_WRITEREG_OSCTRIM= $04
    CMD_STEP_MEASURE    = $0801

    PTAT                = $40
    COMP_PIXEL          = $41

    CONFIG              = $92
    CONFIG_MASK         = $5EFF
        ADCHIGHREF      = 14
        EEPROMENA       = 12
        I2CFMP          = 11
        RESET           = 10
        MEASURING       = 9
        OPMODE          = 7
        MEASMODE        = 6
        ADCRES          = 4
        REFRATE         = 0
        ADCRES_BITS     = %11
        REFRATE_BITS    = %1111
        ADCHIGHREF_MASK = (1 << ADCHIGHREF) ^ CONFIG_MASK
        EEPROMENA_MASK  = (1 << EEPROMENA) ^ CONFIG_MASK
        I2CFMP_MASK     = (1 << I2CFMP) ^ CONFIG_MASK
        RESET_MASK      = (1 << RESET) ^ CONFIG_MASK
        MEASURING_MASK  = (1 << MEASURING) ^ CONFIG_MASK
        OPMODE_MASK     = (1 << OPMODE) ^ CONFIG_MASK
        MEASMODE_MASK   = (1 << MEASMODE) ^ CONFIG_MASK
        ADCRES_MASK     = (ADCRES_BITS << ADCRES) ^ CONFIG_MASK
        REFRATE_MASK    = REFRATE_BITS ^ CONFIG_MASK

    OSC_TRIM                = $93
    OSC_TRIM_MASK           = $007F

PUB Null
'' This is not a top-level object
