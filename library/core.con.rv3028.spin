{
    --------------------------------------------
    Filename: core.con.rv3028.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Mar 13, 2021
    Updated Mar 13, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $52 << 1                  ' 7-bit format slave address
    T_POR           = 66_000                    ' startup time (usecs)

    DEVID_RESP      = $33                       ' device ID expected response

' Register definitions
    SECONDS         = $00
    MINUTES         = $01
    HOURS           = $02
        AMPM        = 5

    WKDAY           = $03
    DATE            = $04
    MONTH           = $05
    YEAR            = $06
    MIN_ALM         = $07
        AE_M        = 7

    HRS_ALM         = $08
        AE_H        = 7

    WKD_ALM         = $09
        AE_WD       = 7

    TIMER_LSB       = $0A
    TIMER_MSB       = $0B
    TIMER_MASK      = $0FFF

    TMRSTAT_LSB     = $0C
    TMRSTAT_MSB     = $0D

    STATUS          = $0E
    STATUS_MASK     = $FF
        EEBUSY      = 7
        CLKF        = 6
        BSF         = 5
        UF          = 4
        TF          = 3
        AF          = 2
        EVF         = 1
        SINT        = 1                         ' interrupt/event bits (6..1)
        PORF        = 0
        SINT_BITS   = %111111                   ' interrupt/event bits (6..1)
        EEBUSY_MASK = (1 << EEBUSY) ^ STATUS_MASK
        CLKF_MASK   = (1 << CLKF) ^ STATUS_MASK
        BSF_MASK    = (1 << BSF) ^ STATUS_MASK
        UF_MASK     = (1 << UF) ^ STATUS_MASK
        TF_MASK     = (1 << TF) ^ STATUS_MASK
        AF_MASK     = (1 << AF) ^ STATUS_MASK
        EVF_MASK    = (1 << EVF) ^ STATUS_MASK
        PORF_MASK   = (1 << PORF) ^ STATUS_MASK
        SINT_MASK   = (SINT_BITS << SINT) ^ STATUS_MASK

    CTRL1           = $0F
    CTRL1_MASK      = $BF
        TRPT        = 7
        WADA        = 5
        USEL        = 4
        EERD        = 3
        TE          = 2
        TD          = 0
        TD_BITS     = %11
        TRPT_MASK   = (1 << TRPT) ^ CTRL1_MASK
        WADA_MASK   = (1 << WADA) ^ CTRL1_MASK
        USEL_MASK   = (1 << USEL) ^ CTRL1_MASK
        EERD_MASK   = (1 << EERD) ^ CTRL1_MASK
        TE_MASK     = (1 << TE) ^ CTRL1_MASK
        TD_MASK     = (1 << TD) ^ CTRL1_MASK

    CTRL2           = $10
    CTRL2_MASK      = $FF
        TSE         = 7
        CLKIE       = 6
        UIE         = 5
        TIE         = 4
        AIE         = 3
        EIE         = 2
        IE          = 2
        HR12_24     = 1
        RESET       = 0
        IE_BITS     = %11111
        TSE_MASK    = (1 << TSE) ^ CTRL2_MASK
        CLKIE_MASK  = (1 << CLKIE) ^ CTRL2_MASK
        UIE_MASK    = (1 << UIE) ^ CTRL2_MASK
        TIE_MASK    = (1 << TIE) ^ CTRL2_MASK
        AIE_MASK    = (1 << AIE) ^ CTRL2_MASK
        EIE_MASK    = (1 << EIE) ^ CTRL2_MASK
        IE_MASK     = (IE_BITS << IE) ^ CTRL2_MASK
        HR12_24_MASK= (1 << HR12_24) ^ CTRL2_MASK
        RESET_MASK  = 1 ^ CTRL2_MASK

    GPBITS          = $11
    GPBITS_MASK     = $7F
        GP          = 0
        GP_BITS     = %1111111

    CLK_INTMASK     = $12
    CLK_INTMASK_MASK= $0F
        CEIE        = 1 << 3
        CAIE        = 1 << 2
        CTIE        = 1 << 1
        CUIE        = 1 << 0

    EVT_CTRL        = $13
    EVT_CTRL_MASK   = $77
        EHL         = 6
        ET          = 4
        TSR         = 2
        TSOW        = 1
        TSS         = 0
        ET_BITS     = %11
        EHL_MASK    = (1 << EHL) ^ EVT_CTRL_MASK
        ET_MASK     = (ET_BITS << ET) ^ EVT_CTRL_MASK
        TSR_MASK    = (1 << TSR) ^ EVT_CTRL_MASK
        TSOW_MASK   = (1 << TSOW) ^ EVT_CTRL_MASK
        TSS_MASK    = 1 ^ EVT_CTRL_MASK

    CNT_TS          = $14
    SEC_TS          = $15
    MIN_TS          = $16
    HRS_TS          = $17
    DATE_TS         = $18
    MON_TS          = $19
    YEAR_TS         = $1A
    UNIX_LSB        = $1B
    UNIX_MB1        = $1C
    UNIX_MB2        = $1D
    UNIX_MSB        = $1E
    USR_RAM1        = $1F
    USR_RAM2        = $20
    PWD_LSB         = $21
    PWD_MB1         = $22
    PWD_MB2         = $23
    PWD_MSB         = $24
    EE_ADDR         = $25
    EE_DATA         = $26
    EE_CMD          = $27
    ID              = $28
    EE_PW_EN        = $30
    EE_PW_LSB       = $31
    EE_PW_MB1       = $32
    EE_PW_MB2       = $33
    EE_PW_MSB       = $34
    EE_CLKOUT       = $35
    EE_CLKOUT_MASK  = $CF
        CLKOE       = 7
        CLKSY       = 6
        PORIE       = 3
        FD          = 0
        FD_BITS     = %111
        CLKOE_MASK  = (1 << CLKOE) ^ EE_CLKOUT_MASK
        CLKSY_MASK  = (1 << CLKSY) ^ EE_CLKOUT_MASK
        PORIE_MASK  = (1 << PORIE) ^ EE_CLKOUT_MASK
        FD_MASK     = FD_BITS ^ EE_CLKOUT_MASK

    EE_OFFS         = $36                       ' LSB = 0.9537ppm (s9)
    EE_BACKUP       = $37
    EE_BACKUP_MASK  = $FF
        EEOFFS      = 7
        BSIE        = 6
        TCE         = 5
        FEDE        = 4
        BSM         = 2
        TCR         = 0
        BSM_BITS    = %11
        TCR_BITS    = %11
        EEOFFS_MASK = (1 << EEOFFS) ^ EE_BACKUP_MASK
        BSIE_MASK   = (1 << BSIE) ^ EE_BACKUP_MASK
        TCE_MASK    = (1 << TCE) ^ EE_BACKUP_MASK
        FEDE_MASK   = (1 << FEDE) ^ EE_BACKUP_MASK
        BSM_MASK    = (1 << BSM) ^ EE_BACKUP_MASK
        TCR_MASK    = (1 << TCR) ^ EE_BACKUP_MASK

    USR_EE_ST       = $00
    USR_EE_END      = $2A


PUB null{}
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

