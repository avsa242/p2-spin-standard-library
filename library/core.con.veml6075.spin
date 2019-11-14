{
    --------------------------------------------
    Filename: core.con.veml6075.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Aug 18, 2019
    Updated Aug 18, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $10 << 1
    DEV_ID_RESP         = $0026

' Register definitions
    UV_CONF             = $00
    UV_CONF_MASK        = $7F
        FLD_UV_IT       = 4
        FLD_HD          = 3
        FLD_UV_TRIG     = 2
        FLD_UV_AF       = 1
        FLD_SD          = 0
        BITS_UV_IT      = %111
        MASK_UV_IT      = UV_CONF_MASK ^ (BITS_UV_IT << FLD_UV_IT)
        MASK_HD         = UV_CONF_MASK ^ (1 << FLD_HD)
        MASK_UV_TRIG    = UV_CONF_MASK ^ (1 << FLD_UV_TRIG)
        MASK_UV_AF      = UV_CONF_MASK ^ (1 << FLD_UV_AF)
        MASK_SD         = UV_CONF_MASK ^ (1 << FLD_SD)

    UVA_DATA            = $07
    UVB_DATA            = $09
    UVCOMP1             = $0A
    UVCOMP2             = $0B
    DEV_ID              = $0C
        FLD_COMPANY     = 6
        FLD_SLAVE       = 4
        FLD_VERSION     = 0
        BITS_COMPANY    = %11
        BITS_SLAVE      = %11
        BITS_VERSION    = %1111

PUB Null
' This is not a top-level object
