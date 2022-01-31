{
    --------------------------------------------
    Filename: core.con.adxl345.spin
    Author: Jesse Burt
    Description: ADXL345-specific low-level constants
    Copyright (c) 2021
    Started Mar 14, 2020
    Updated Nov 13, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SPI_MODE                    = 3
    SPI_MAX_FREQ                = 5_000_000

' I2C Configuration
    SLAVE_ADDR                  = $53 << 1
    I2C_MAX_FREQ                = 400_000

    T_POR                       = 1_400         ' usec
    W                           = 0
    R                           = 1 << 7        ' read
    MB                          = 1 << 6        ' multiple-byte transcation

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
    ACT_INACT_CTL_MASK          = $FF
        ACTACDC                 = 7
        ACTX_EN                 = 6
        ACTY_EN                 = 5
        ACTZ_EN                 = 4
        ACT_EN                  = 4             ' pseudo-field, for XYZ
        INACTACDC               = 3
        INACTX_EN               = 2
        INACTY_EN               = 1
        INACTZ_EN               = 0
        INACT_EN                = 0             ' pseudo-field, for XYZ
        ACT_EN_BITS             = %111
        INACT_EN_BITS           = %111
        ACTACDC_MASK            = (1 << ACTACDC) ^ ACT_INACT_CTL_MASK
        ACT_EN_MASK             = (ACT_EN_BITS << ACT_EN) ^ ACT_INACT_CTL_MASK
        INACTACDC_MASK          = (1 << INACTACDC) ^ ACT_INACT_CTL_MASK
        INACT_EN_MASK           = INACT_EN_BITS ^ ACT_INACT_CTL_MASK


    THRESH_FF                   = $28

    TIME_FF                     = $29

    TAP_AXES                    = $2A
    TAP_AXES_MASK               = $0F
        SUPPRESS                = 3
        TAP_X                   = 2
        TAP_Y                   = 1
        TAP_Z                   = 0
        TAPXYZ                  = 0
        TAPXYZ_BITS             = %111
        SUPPRESS_MASK           = (1 << SUPPRESS) ^ TAP_AXES_MASK
        TAPXYZ_MASK             = TAPXYZ_BITS ^ TAP_AXES_MASK

    ACT_TAP_STATUS              = $2B
    ACT_TAP_STATUS_MASK         = $7F
        ACT_X_SRC               = 6
        ACT_Y_SRC               = 5
        ACT_Z_SRC               = 4
        ASLEEP                  = 3
        TAP_X_SRC               = 2
        TAP_Y_SRC               = 1
        TAP_Z_SRC               = 0
        ACT_SRC_BITS            = %111
        TAP_SRC_BITS            = %111

    BW_RATE                     = $2C
    BW_RATE_MASK                = $1F
        LOW_PWR                 = 4
        RATE                    = 0
        RATE_BITS               = %1111
        LOW_PWR_MASK            = (1 << LOW_PWR) ^ BW_RATE_MASK
        RATE_MASK               = (RATE_BITS << RATE) ^ BW_RATE_MASK

    PWR_CTL                     = $2D
    PWR_CTL_MASK                = $3F
        LINK                    = 5
        AUTO_SLP                = 4
        MEAS                    = 3
        SLP                     = 2
        WAKEUP                  = 0
        WAKEUP_BITS             = %11
        LINK_MASK               = (1 << LINK) ^ PWR_CTL_MASK
        AUTO_SLP_MASK           = (1 << AUTO_SLP) ^ PWR_CTL_MASK
        MEAS_MASK               = (1 << MEAS) ^ PWR_CTL_MASK
        SLP_MASK                = (1 << SLP) ^ PWR_CTL_MASK
        WAKEUP_MASK             = WAKEUP_BITS ^ PWR_CTL_MASK

    INT_ENABLE                  = $2E           ' the below apply to INT_MAP
    INT_MASK                    = $FF           '   and INT_SOURCE, also
        DATA_RDY                = 7
        SING_TAP                = 6
        DBL_TAP                 = 5
        TAP                     = 5
        ACTIVITY                = 4
        INACT                   = 3
        FREE_FALL               = 2
        WATERMK                 = 1
        OVERRUN                 = 0
        TAP_BITS                = %11
        DATA_RDY_MASK           = (1 << DATA_RDY) ^ INT_MASK
        SING_TAP_MASK           = (1 << SING_TAP) ^ INT_MASK
        DBL_TAP_MASK            = (1 << DBL_TAP) ^ INT_MASK
        TAP_MASK                = (TAP_BITS << TAP) ^ INT_MASK
        ACTIVITY_MASK           = (1 << ACTIVITY) ^ INT_MASK
        INACT_MASK              = (1 << INACT) ^ INT_MASK
        FREE_FALL_MASK          = (1 << FREE_FALL) ^ INT_MASK
        WATERMK_MASK            = (1 << WATERMK) ^ INT_MASK
        OVERRUN_MASK            = 1 ^ INT_MASK

    INT_MAP                     = $2F

    INT_SOURCE                  = $30

    DATA_FORMAT                 = $31
    DATA_FORMAT_MASK            = $EF
        SELF_TEST               = 7
        SPI                     = 6
        INT_INVERT              = 5
        FULL_RES                = 3
        JUSTIFY                 = 2
        RANGE                   = 0
        RANGE_BITS              = %11
        SELF_TEST_MASK          = (1 << SELF_TEST) ^ DATA_FORMAT_MASK
        SPI_MASK                = (1 << SPI) ^ DATA_FORMAT_MASK
        INT_INVERT_MASK         = (1 << INT_INVERT) ^ DATA_FORMAT_MASK
        FULL_RES_MASK           = (1 << FULL_RES) ^ DATA_FORMAT_MASK
        JUSTIFY_MASK            = (1 << JUSTIFY) ^ DATA_FORMAT_MASK
        RANGE_MASK              = RANGE_BITS ^ DATA_FORMAT_MASK

    DATAX0                      = $32
    DATAX1                      = $33
    DATAY0                      = $34
    DATAY1                      = $35
    DATAZ0                      = $36
    DATAZ1                      = $37

    FIFO_CTL                    = $38
    FIFO_CTL_MASK               = $FF
        FIFO_MODE               = 6
        TRIGGER                 = 5
        SAMPLES                 = 0
        FIFO_MODE_BITS          = %11
        SAMPLES_BITS            = %11111
        FIFO_MODE_MASK          = (FIFO_MODE_BITS << FIFO_MODE) ^ FIFO_CTL_MASK
        TRIGGER_MASK            = (1 << TRIGGER) ^ FIFO_CTL_MASK
        SAMPLES_MASK            = SAMPLES_BITS ^ FIFO_CTL_MASK

    FIFO_STATUS                 = $39
    FIFO_STATUS_MASK            = $BF
        FIFO_TRIG               = 7
        ENTRIES                 = 0
        ENTRIES_BITS            = %111111

PUB Null
' This is not a top-level object

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
