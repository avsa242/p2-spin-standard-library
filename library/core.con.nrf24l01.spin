{
    --------------------------------------------
    Filename: core.con.nrf24l01.spin
    Author: Jesse Burt
    Description: nRF24L01+ Low-level constant definitions
    Copyright (c) 2021
    Started Jan 6, 2019
    Updated Jan 2, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON
' SPI Configuration
    CPOL                    = 0
    CLK_DELAY               = 1
    SCK_MAX_FREQ            = 10_000_000
    MOSI_BITORDER           = 5             'MSBFIRST
    MISO_BITORDER           = 0             'MSBPRE
    CE_TX                   = 0
    CE_RX                   = 1

' Timings
    TPOR                    = 100_000       ' uSec
    TRXSETTLE               = 130           '
    TTXSETTLE               = 130           '
    THCE                    = 10            '
    TPD2STBY                = 5             ' Maximum

' NRF24L01+ Commands
    R_REG                   = $00
    W_REG                   = $20           ' | with reg to write
    CMD_R_RX_PAYLOAD        = $61           ' %0110_0001
    CMD_W_TX_PAYLOAD        = $A0           ' %1010_0000
    CMD_FLUSH_TX            = $E1           ' %1110_0001
    CMD_FLUSH_RX            = $E2           ' %1110_0010
    CMD_REUSE_TX_PL         = $E3           ' %1110_0011
    CMD_R_RX_PL_WID         = $60           ' %0110_0000
    CMD_W_ACK_PAYLOAD       = $A8           ' %10101_000
    CMD_W_TX_PAYLOAD_NOACK  = $B0           ' %1011_0000
    CMD_NOP                 = $FF           ' %1111_1111


' Register definitions
    CFG                     = $00
    CFG_MASK                = $7F
        MASKINT_RX_DR       = 6
        MASKINT_TX_DS       = 5
        MASKINT_MAX_RT      = 4
        MASKINT             = 4                 ' all 3 of the above
        EN_CRC              = 3
        CRCO                = 2
        PWR_UP              = 1
        PRIM_RX             = 0
        MASKINT_BITS        = %111
        MASKINT_RX_DR_MASK  = (1 << MASKINT_RX_DR) ^ CFG_MASK
        MASKINT_TX_DS_MASK  = (1 << MASKINT_TX_DS) ^ CFG_MASK
        MASKINT_MAX_RT_MASK = (1 << MASKINT_MAX_RT) ^ CFG_MASK
        MASKINT_MASK        = (MASKINT_BITS << MASKINT) ^ CFG_MASK
        EN_CRC_MASK         = (1 << EN_CRC) ^ CFG_MASK
        CRCO_MASK           = (1 << CRCO) ^ CFG_MASK
        PWR_UP_MASK         = (1 << PWR_UP) ^ CFG_MASK
        PRIM_RX_MASK        = 1 ^ CFG_MASK

    EN_AA                   = $01
    EN_AA_MASK              = $3F
        ENAA_P5             = 5
        ENAA_P4             = 4
        ENAA_P3             = 3
        ENAA_P2             = 2
        ENAA_P1             = 1
        ENAA_P0             = 0
        ENAA_BITS           = %111111
        ENAA_MASK           = ENAA_BITS ^ EN_AA_MASK

    EN_RXADDR               = $02
    EN_RXADDR_MASK          = $3F
        ERX_P5              = 5
        ERX_P4              = 4
        ERX_P3              = 3
        ERX_P2              = 2
        ERX_P1              = 1
        ERX_P0              = 0
        EN_ADDR_BITS        = %111111
        EN_ADDR_MASK        = EN_ADDR_BITS ^ EN_RXADDR_MASK

    SETUP_AW                = $03
    SETUP_AW_MASK           = $03
        AW                  = 0
        AW_BITS             = %11
        AW_MASK             = AW_BITS ^ SETUP_AW_MASK

    SETUP_RETR              = $04
    SETUP_RETR_MASK         = $FF
        ARD                 = 4
        ARC                 = 0
        ARD_BITS            = %1111
        ARC_BITS            = %1111
        ARD_MASK            = (ARD_BITS << ARD) ^ SETUP_RETR_MASK
        ARC_MASK            = ARC_BITS ^ SETUP_RETR_MASK

    RF_CH                   = $05
        RFCH                = 0
        RFCH_BITS           = %1111111

    RF_SETUP                = $06               'XXX UNEXPECTED POR VALUE ($00 - expected $0E)
    RF_SETUP_MASK           = $BE
        CONT_WAVE           = 7
        RF_DR_LOW           = 5
        PLL_LOCK            = 4
        RF_DR_HIGH          = 3
        RF_PWR              = 1
        RF_DR_BITS          = %101
        RF_PWR_BITS         = %11
        CONT_WAVE_MASK      = (1 << CONT_WAVE) ^ RF_SETUP_MASK
        RF_DR_LOW_MASK      = (1 << RF_DR_LOW) ^ RF_SETUP_MASK
        PLL_LOCK_MASK       = (1 << PLL_LOCK) ^ RF_SETUP_MASK
        RF_DR_HIGH_MASK     = (1 << RF_DR_HIGH) ^ RF_SETUP_MASK
        RF_PWR_MASK         = (RF_PWR_BITS << RF_PWR) ^ RF_SETUP_MASK

    STATUS                  = $07
    STATUS_MASK             = $7F
        RX_DR               = 6
        TX_DS               = 5
        MAX_RT              = 4
        RX_P_NO             = 1
        TX_FULL             = 0
        RX_P_NO_BITS        = %111
        RX_DR_MASK          = (1 << RX_DR) ^ STATUS_MASK
        TX_DS_MASK          = (1 << TX_DS) ^ STATUS_MASK
        MAX_RT_MASK         = (1 << MAX_RT) ^ STATUS_MASK

    OBSERVE_TX              = $08
        PLOS_CNT            = 4
        ARC_CNT             = 0
        PLOS_CNT_BITS       = %1111
        ARC_CNT_BITS        = %1111

    RPD                     = $09
    RPD_MASK                = $01

    RX_ADDR_P0              = $0A               ' 5 bytes
    RX_ADDR_P1              = $0B               ' 5 bytes
    RX_ADDR_P2              = $0C               ' 1 byte (P2..P5)
        RX_ADDR_P2_MASK     = $FF
    RX_ADDR_P3              = $0D
        RX_ADDR_P3_MASK     = $FF
    RX_ADDR_P4              = $0E
        RX_ADDR_P4_MASK     = $FF
    RX_ADDR_P5              = $0F
        RX_ADDR_P5_MASK     = $FF

    TX_ADDR                 = $10               ' 5 bytes

    RX_PW_P0                = $11
    RX_PW_P1                = $12
    RX_PW_P2                = $13
    RX_PW_P3                = $14
    RX_PW_P4                = $15
    RX_PW_P5                = $16
        RX_PW_BITS          = %111111           ' applies to P0..P5

    FIFO_STATUS             = $17
        TXFIFO_REUSE        = 6
        TXFIFO_FULL         = 5
        TXFIFO_EMPTY        = 4
        RXFIFO_FULL         = 1
        RXFIFO_EMPTY        = 0

    DYNPD                   = $1C
    DYNPD_MASK              = $3F
        DPL_P5              = 5
        DPL_P4              = 4
        DPL_P3              = 3
        DPL_P2              = 2
        DPL_P1              = 1
        DPL_P0              = 0
        DPL_BITS            = %111111
        DPL_MASK            = DPL_BITS ^ DYNPD_MASK

    FEAT                    = $1D
    FEAT_MASK               = $07
        EN_DPL              = 2
        EN_ACK_PAY          = 1
        EN_DYN_ACK          = 0
        EN_DPL_MASK         = (1 << EN_DPL) ^ FEAT_MASK
        EN_ACK_PAY_MASK     = (1 << EN_ACK_PAY) ^ FEAT_MASK
        EN_DYN_ACK_MASK     = 1 ^ FEAT_MASK

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
