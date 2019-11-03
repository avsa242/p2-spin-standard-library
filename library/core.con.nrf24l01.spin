{
    --------------------------------------------
    Filename: core.con.nrf24l01.spin
    Author: Jesse Burt
    Description: nRF24L01+ Low-level constant definitions
    Copyright (c) 2019
    Started Jan 6, 2019
    Updated Jul 17, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON
' SPI Configuration
    CPOL                        = 0
    CLK_DELAY                   = 10
    MOSI_BITORDER               = 5             'MSBFIRST
    MISO_BITORDER               = 0             'MSBPRE
    CE_TX                       = 0
    CE_RX                       = 1

' Timings
    TPOR                        = 100
    TPD2STBY                    = 5             ' Maximum

' NRF24L01+ Commands
    NRF24_R_REG                 = %000_00000
    NRF24_W_REG                 = %001_00000
    NRF24_R_RX_PAYLOAD          = $61           ' %0110_0001
    NRF24_W_TX_PAYLOAD          = $A0           ' %1010_0000
    NRF24_FLUSH_TX              = $E1           ' %1110_0001
    NRF24_FLUSH_RX              = $E2           ' %1110_0010
    NRF24_REUSE_TX_PL           = $E3           ' %1110_0011
    NRF24_R_RX_PL_WID           = $60           ' %0110_0000
    NRF24_W_ACK_PAYLOAD         = $A8           ' %10101_000
    NRF24_W_TX_PAYLOAD_NOACK    = $B0           ' %1011_0000
    NRF24_NOP                   = $FF           ' %1111_1111


' Register definitions (individual fields set in/read from registers are indented)
    NRF24_CONFIG                = $00
    NRF24_CONFIG_MASK           = $7F
        FLD_PRIM_RX             = 0             ' Set TX/RX mode
        MASK_PRIM_RX            = NRF24_CONFIG_MASK ^ (1 << FLD_PRIM_RX)
        FLD_PWR_UP              = 1
        MASK_PWR_UP             = NRF24_CONFIG_MASK ^ (1 << FLD_PWR_UP)
        FLD_CRCO                = 2
        MASK_CRCO               = NRF24_CONFIG_MASK ^ (1 << FLD_CRCO)
        FLD_EN_CRC              = 3
        MASK_EN_CRC             = NRF24_CONFIG_MASK ^ (1 << FLD_EN_CRC)
        FLD_MASK_MAX_RT         = 4
        FLD_MASK_TX_DS          = 5
        FLD_MASK_RX_DR          = 6
        BITS_INTS               = %111
        MASK_INTS               = NRF24_CONFIG_MASK ^ (BITS_INTS << FLD_MASK_MAX_RT)

    NRF24_EN_AA                 = $01
    NRF24_EN_AA_MASK            = $3F
        FLD_ENAA_P0             = 0
        FLD_ENAA_P1             = 1
        FLD_ENAA_P2             = 2
        FLD_ENAA_P3             = 3
        FLD_ENAA_P4             = 4
        FLD_ENAA_P5             = 5
        BITS_ENAA               = %111111
        MASK_ENAA               = NRF24_EN_AA_MASK ^ (BITS_ENAA << FLD_ENAA_P0)

    NRF24_EN_RXADDR             = $02
    NRF24_EN_RXADDR_MASK        = $3F
        FLD_ERX_P0              = 0
        FLD_ERX_P1              = 1
        FLD_ERX_P2              = 2
        FLD_ERX_P3              = 3
        FLD_ERX_P4              = 4
        FLD_ERX_P5              = 5
        BITS_EN_RXADDR          = %111111
        MASK_EN_RXADDR          = NRF24_EN_RXADDR_MASK ^ (BITS_EN_RXADDR << FLD_ERX_P0)

    NRF24_SETUP_AW              = $03
    NRF24_SETUP_AW_MASK         = $03
        FLD_AW                  = 0
        BITS_AW                 = %11
        MASK_AW                 = NRF24_SETUP_AW_MASK ^ (BITS_AW << FLD_AW)

    NRF24_SETUP_RETR            = $04
    NRF24_SETUP_RETR_MASK       = $FF
        FLD_ARD                 = 4
        BITS_ARD                = %1111
        MASK_ARD                = NRF24_SETUP_RETR_MASK ^ (BITS_ARD << FLD_ARD)

        FLD_ARC                 = 0
        BITS_ARC                = %1111
        MASK_ARC                = NRF24_SETUP_RETR_MASK ^ (BITS_ARC << FLD_ARC)

    NRF24_RF_CH                 = $05           ' RF Channel frequency. F0 = 2400 + RF_CH (MHz)
        FLD_RF_CH               = 0
        BITS_RF_CH              = %1111111

    NRF24_RF_SETUP              = $06           'XXX UNEXPECTED POR VALUE ($00 - expected $0E)
    NRF24_RF_SETUP_MASK         = $BE
        FLD_RF_PWR              = 1             ' Power Amplifier
        BITS_RF_PWR             = %11
        MASK_RF_PWR             = NRF24_RF_SETUP_MASK ^ (BITS_RF_PWR << FLD_RF_PWR)
        FLD_RF_DR_HIGH          = 3             ' RF Data rates
        MASK_RF_DR_HIGH         = NRF24_RF_SETUP_MASK ^ (1 << FLD_RF_DR_HIGH)
        FLD_PLL_LOCK            = 4
        MASK_PLL_LOCK           = NRF24_RF_SETUP_MASK ^ (1 << FLD_PLL_LOCK)
        FLD_RF_DR_LOW           = 5
        MASK_RF_DR_LOW          = NRF24_RF_SETUP_MASK ^ (1 << FLD_RF_DR_LOW)
                                                ' Bit 6 reserved - set to 0
        FLD_CONT_WAVE           = 7
        MASK_CONT_WAVE          = NRF24_RF_SETUP_MASK ^ (1 << FLD_CONT_WAVE)

    NRF24_STATUS                = $07
    NRF24_STATUS_MASK           = $7F
        FLD_TX_FULL             = 0
        FLD_RX_P_NO             = 1
        FLD_MAX_RT              = 4
        FLD_TX_DS               = 5
        FLD_RX_DR               = 6
        BITS_RX_P_NO            = %111
        BITS_MAX_RT             = %1
        BITS_TX_DS              = %1
        BITS_RX_DR              = %1
        MASK_MAX_RT             = NRF24_STATUS_MASK ^ (BITS_MAX_RT << FLD_MAX_RT)
        MASK_RX_DR              = NRF24_STATUS_MASK ^ (BITS_RX_DR << FLD_RX_DR)
        MASK_TX_DS              = NRF24_STATUS_MASK ^ (BITS_TX_DS << FLD_TX_DS)

    NRF24_OBSERVE_TX            = $08
        FLD_ARC_CNT             = 0            ' Retransmission count (current transaction)
        BITS_ARC_CNT            = %1111
        FLD_PLOS_CNT            = 4            ' Retransmission count (since last channel change)
        BITS_PLOS_CNT           = %1111

    NRF24_RPD                   = $09           ' Received Power Detector (RPD). Bit 0: > -64dBm = 1, < -64dBm = 0
        FLD_RPD                 = 0

    NRF24_RX_ADDR_P0            = $0A
    NRF24_RX_ADDR_P1            = $0B
    NRF24_RX_ADDR_P2            = $0C
        MASK_RX_ADDR_P2         = $FF
    NRF24_RX_ADDR_P3            = $0D
        MASK_RX_ADDR_P3         = $FF
    NRF24_RX_ADDR_P4            = $0E
        MASK_RX_ADDR_P4         = $FF
    NRF24_RX_ADDR_P5            = $0F
        MASK_RX_ADDR_P5         = $FF

    NRF24_TX_ADDR               = $10

    NRF24_RX_PW_P0              = $11
        FLD_RX_PW_P0            = 0
        BITS_RX_PW_P0           = %111111
    NRF24_RX_PW_P1              = $12
        FLD_RX_PW_P1            = 0
        BITS_RX_PW_P1           = %111111
    NRF24_RX_PW_P2              = $13
        FLD_RX_PW_P2            = 0
        BITS_RX_PW_P2           = %111111
    NRF24_RX_PW_P3              = $14
        FLD_RX_PW_P3            = 0
        BITS_RX_PW_P3           = %111111
    NRF24_RX_PW_P4              = $15
        FLD_RX_PW_P4            = 0
        BITS_RX_PW_P4           = %111111
    NRF24_RX_PW_P5              = $16
        FLD_RX_PW_P5            = 0
        BITS_RX_PW_P5           = %111111

    NRF24_FIFO_STATUS           = $17
        FLD_RXFIFO_EMPTY        = 0
        FLD_RXFIFO_FULL         = 1
        FLD_TXFIFO_EMPTY        = 4
        FLD_TXFIFO_FULL         = 5
        FLD_TXFIFO_REUSE        = 6

    NRF24_DYNPD                 = $1C
    NRF24_DYNPD_MASK            = $3F
        FLD_DPL_P0              = 0
        FLD_DPL_P1              = 0
        FLD_DPL_P2              = 0
        FLD_DPL_P3              = 0
        FLD_DPL_P4              = 0
        FLD_DPL_P5              = 0
        BITS_DPL                = %111111
        MASK_DPL                = NRF24_DYNPD_MASK ^ (BITS_DPL << FLD_DPL_P0)

    NRF24_FEATURE               = $1D
    NRF24_FEATURE_MASK          = $07
        FLD_EN_DYN_ACK          = 0
        BITS_EN_DYN_ACK         = %1
        MASK_EN_DYN_ACK         = NRF24_FEATURE_MASK ^ (BITS_EN_DYN_ACK << FLD_EN_DYN_ACK)
        FLD_EN_ACK_PAY          = 1
        BITS_EN_ACK_PAY         = %1
        MASK_EN_ACK_PAY         = NRF24_FEATURE_MASK ^ (BITS_EN_ACK_PAY << FLD_EN_ACK_PAY)
        FLD_EN_DPL              = 2
        BITS_EN_DPL             = %1
        MASK_EN_DPL             = NRF24_FEATURE_MASK ^ (BITS_EN_DPL << FLD_EN_DPL)

PUB Null
'' This is not a top-level object
