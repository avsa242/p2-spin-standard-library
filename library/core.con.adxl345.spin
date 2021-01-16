{
    --------------------------------------------
    Filename: core.con.adxl345.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Mar 14, 2020
    Updated Jan 1, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                        = 1
    CLK_DELAY                   = 1             ' P1 SPI engine
    MOSI_BITORDER               = 5             ' MSBFIRST
    MISO_BITORDER               = 2             ' MSBPOST
    SCL_MAX_FREQ                = 5_000_000     ' P2 SPI engine

' I2C Configuration
    SLAVE_ADDR                  = $1D << 7
    I2C_MAX_FREQ                = 400_000

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
    THRESH_FF                   = $28
    TAP_AXES                    = $2A
    ACT_TAP_STATUS              = $2B

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
        ACTIVITY                = 4
        INACT                   = 3
        FREE_FALL               = 2
        WATERMK                 = 1
        OVERRUN                 = 0
        DATA_RDY_MASK           = (1 << DATA_RDY) ^ INT_MASK
        SING_TAP_MASK           = (1 << SING_TAP) ^ INT_MASK
        DBL_TAP_MASK            = (1 << DBL_TAP) ^ INT_MASK
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

#ifndef __propeller2__
PUB Null
' This is not a top-level object
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
