{
    --------------------------------------------
    Filename: core.con.ina219.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Sep 18, 2019
    Updated Sep 22, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 2_560_000
    SLAVE_ADDR          = $40 << 1

'' Register definitions

    CONFIG              = $00   'RW
    CONFIG_MASK         = $BFFF
    CONFIG_POR          = $399F 'POR value, used to ID the chip
        FLD_RST         = 15
        FLD_BRNG        = 13
        FLD_PG          = 11
        FLD_BADC        = 7
        FLD_SADC_AVG    = 6
        FLD_SADC        = 3
        FLD_MODE        = 0
        BITS_PG         = %11
        BITS_BADC       = %1111
        BITS_SADC       = %1111
        MASK_BRNG       = CONFIG_MASK ^ (1 << FLD_BRNG)
        MASK_PG         = CONFIG_MASK ^ (BITS_PG << FLD_PG)
        MASK_BADC       = CONFIG_MASK ^ (BITS_BADC << FLD_BADC)
        MASK_SADC       = CONFIG_MASK ^ (BITS_SADC << FLD_SADC)

    SHUNT_VOLTAGE       = $01   'RO

    BUS_VOLTAGE         = $02
    BUS_VOLTAGE_MASK    = $FFFB
    FLD_BD              = 3
    FLD_CNVR            = 1
    FLD_OVF             = 0

    POWER               = $03

    CURRENT             = $04

    CALIBRATION         = $05
    CALIBRATION_MASK    = $FFFE 'bit 0 is RO


PUB Null
'' This is not a top-level object
