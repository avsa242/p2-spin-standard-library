{
    --------------------------------------------
    Filename: core.con.ds28cm00.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Feb 16, 2019
    Updated Mar 16, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $50 << 1

'' Register definitions
    DEV_FAMILY          = $00
    SN_0_7              = $01
    SN_8_15             = $02
    SN_16_23            = $03
    SN_24_31            = $04
    SN_32_39            = $05
    SN_40_47            = $06
    CRC                 = $07
    CTRL_REG            = $08
    CTRL_REG_MASK       = $01
        FLD_CM          = 0

    CM_I2C              = 0
    CM_SMBUS            = 1

PUB Null
'' This is not a top-level object
