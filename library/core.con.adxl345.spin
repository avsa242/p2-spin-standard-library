{
    --------------------------------------------
    Filename: core.con.adxl345.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 14, 2020
    Updated Mar 14, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                        = 1
    CLK_DELAY                   = 1             'P1 SPI engine
    MOSI_BITORDER               = 5             'MSBFIRST
    MISO_BITORDER               = 2             'MSBPOST
    SCL_MAX_FREQ                = 5_000_000     'P2 SPI engine

' I2C Configuration
    SLAVE_ADDR                  = $1D << 7
    I2C_MAX_FREQ                = 400_000

    W                           = 0
    R                           = 1 << 7
    MB                          = 1 << 6        ' Multiple-byte transcation bit

' Register definitions
    DEVID                       = $00
        DEVID_RESP              = $E5

    THRESH_TAP                  = $1D
    OFSX                        = $1E
    OFSY                        = $1F
    OFSZ                        = $20
    DUR                         = $21
    LATENT                      = $22
    WINDOW                      = $23
    THRESH_ACT                  = $24
    THRESH_INACT                = $25
    TIME_INACT                  = $26
    ACT_INACT_CTL               = $27
    THRESH_FF                   = $28
    TAP_AXES                    = $2A
    ACT_TAP_STATUS              = $2B

    BW_RATE                     = $2C
    BW_RATE_MASK                = $1F
        FLD_LOW_POWER           = 4
        FLD_RATE                = 0
        BITS_RATE               = %1111
        MASK_LOW_POWER          = BW_RATE_MASK ^ (1 << FLD_LOW_POWER)
        MASK_RATE               = BW_RATE_MASK ^ (BITS_RATE << FLD_RATE)

    POWER_CTL                   = $2D
    POWER_CTL_MASK              = $3F
        FLD_LINK                = 5
        FLD_AUTO_SLEEP          = 4
        FLD_MEASURE             = 3
        FLD_SLEEP               = 2
        FLD_WAKEUP              = 0
        BITS_WAKEUP             = %11
        MASK_LINK               = POWER_CTL_MASK ^ (1 << FLD_LINK)
        MASK_AUTO_SLEEP         = POWER_CTL_MASK ^ (1 << FLD_AUTO_SLEEP)
        MASK_MEASURE            = POWER_CTL_MASK ^ (1 << FLD_MEASURE)
        MASK_SLEEP              = POWER_CTL_MASK ^ (1 << FLD_SLEEP)
        MASK_WAKEUP             = POWER_CTL_MASK ^ (BITS_WAKEUP << FLD_WAKEUP)

    INT_ENABLE                  = $2E
    INT_MASK                    = $FF                               ' These apply to INT_MAP and _SOURCE, as well
        FLD_DATA_READY          = 7                                 '
        FLD_SINGLE_TAP          = 6                                 '
        FLD_DOUBLE_TAP          = 5                                 '
        FLD_ACTIVITY            = 4                                 '
        FLD_INACTIVITY          = 3                                 '
        FLD_FREE_FALL           = 2                                 '
        FLD_WATERMARK           = 1                                 '
        FLD_OVERRUN             = 0                                 '
        MASK_DATA_READY         = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_SINGLE_TAP         = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_DOUBLE_TAP         = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_ACTIVITY           = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_INACTIVITY         = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_FREE_FALL          = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_WATERMARK          = INT_MASK ^ (1 << FLD_DATA_READY)  '
        MASK_OVERRUN            = INT_MASK ^ (1 << FLD_DATA_READY)  '

    INT_MAP                     = $2F

    INT_SOURCE                  = $30

    DATA_FORMAT                 = $31
    DATA_FORMAT_MASK            = $EF
        FLD_SELF_TEST           = 7
        FLD_SPI                 = 6
        FLD_INT_INVERT          = 5
        FLD_FULL_RES            = 3
        FLD_JUSTIFY             = 2
        FLD_RANGE               = 0
        BITS_RANGE              = %11
        MASK_SELF_TEST          = DATA_FORMAT_MASK ^ (1 << FLD_SELF_TEST)
        MASK_SPI                = DATA_FORMAT_MASK ^ (1 << FLD_SPI)
        MASK_INT_INVERT         = DATA_FORMAT_MASK ^ (1 << FLD_INT_INVERT)
        MASK_FULL_RES           = DATA_FORMAT_MASK ^ (1 << FLD_FULL_RES)
        MASK_JUSTIFY            = DATA_FORMAT_MASK ^ (1 << FLD_JUSTIFY)
        MASK_RANGE              = DATA_FORMAT_MASK ^ (BITS_RANGE << FLD_RANGE)

    DATAX0                      = $32
    DATAX1                      = $33
    DATAY0                      = $34
    DATAY1                      = $35
    DATAZ0                      = $36
    DATAZ1                      = $37

    FIFO_CTL                    = $38
    FIFO_CTL_MASK               = $FF
        FLD_FIFO_MODE           = 6
        FLD_TRIGGER             = 5
        FLD_SAMPLES             = 0
        BITS_FIFO_MODE          = %11
        BITS_SAMPLES            = %11111
        MASK_FIFO_MODE          = FIFO_CTL_MASK ^ (BITS_FIFO_MODE << FLD_FIFO_MODE)
        MASK_TRIGGER            = FIFO_CTL_MASK ^ (1 << FLD_TRIGGER)
        MASK_SAMPLES            = FIFO_CTL_MASK ^ (BITS_SAMPLES << FLD_SAMPLES)

    FIFO_STATUS                 = $39
    FIFO_STATUS_MASK            = $BF
        FLD_FIFO_TRIG           = 7
        FLD_ENTRIES             = 0
        BITS_ENTRIES            = %111111

PUB Null
' This is not a top-level object
