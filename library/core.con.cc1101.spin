{
    --------------------------------------------
    Filename: core.con.cc1101.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Mar 25, 2019
    Updated May 16, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ                    = 20_000_000' Max freq in burst mode
    SPI_MODE                        = 0

    W                               = 0
    R                               = 1 << 7
    BURST                           = 1 << 6

    T_POR                           = 5_000     ' usec

' Register definitions
'   Status byte
    CHIP_RDY                        = 7
    STATE                           = 4
    FIFO_BYTES_AVAIL                = 0
    STATE_BITS                      = %111
    FIFO_BYTES_AVAIL_BITS           = %1111

    IOCFG2                          = $00
    IOCFG2_MASK                     = $7F
        GDO2_INV                    = 6
        GDO2_CFG                    = 0
        GDO2_CFG_BITS               = %111111
        GDO2_INV_MASK               = (1 << GDO2_INV) ^ IOCFG2_MASK
        GDO2_CFG_MASK               = (GDO2_CFG_BITS << GDO2_CFG) ^ IOCFG2_MASK

    IOCFG1                          = $01
    IOCFG1_MASK                     = $FF
        GDO1_DS                     = 7
        GDO1_INV                    = 6
        GDO1_CFG                    = 0
        GDO1_CFG_BITS               = %111111
        GDO1_DS_MASK                = (1 << GDO1_DS) ^ IOCFG1_MASK
        GDO1_INV_MASK               = (1 << GDO1_INV) ^ IOCFG1_MASK
        GDO1_CFG_MASK               = (GDO1_CFG_BITS << GDO1_CFG) ^ IOCFG1_MASK

    IOCFG0                          = $02
    IOCFG0_MASK                     = $FF
        TEMPSENS_ENA                = 7
        GDO0_INV                    = 6
        GDO0_CFG                    = 0
        GDO0_CFG_BITS               = %111111
        TEMPSENS_ENA_MASK           = (1 << TEMPSENS_ENA) ^ IOCFG0_MASK
        GDO0_INV_MASK               = (1 << GDO0_INV) ^ IOCFG0_MASK
        GDO0_CFG_MASK               = (GDO0_CFG_BITS << GDO0_CFG) ^ IOCFG0_MASK

    FIFOTHR                         = $03
    FIFOTHR_MASK                    = $7F
        ADC_RETENTION               = 6
        CLOSE_IN_RX                 = 4
        FIFO_THR                    = 0
        CLOSE_IN_RX_BITS            = %11
        FIFO_THR_BITS               = %1111
        ADC_RETENTION_MASK          = (1 << ADC_RETENTION) ^ FIFOTHR_MASK
        CLOSE_IN_RX_MASK            = (1 << CLOSE_IN_RX) ^ FIFOTHR_MASK
        FIFO_THR_MASK               = (1 << FIFO_THR) ^ FIFOTHR_MASK

    SYNC1                           = $04
    SYNC1_MASK                      = $FF

    SYNC0                           = $05
    SYNC0_MASK                      = $FF

    PKTLEN                          = $06
    PKTLEN_MASK                     = $FF

    PKTCTRL1                        = $07
    PKTCTRL1_MASK                   = $EF
        PQT                         = 5
        CRC_AUTOFLUSH               = 3
        APPEND_STATUS               = 2
        ADR_CHK                     = 0
        PQT_BITS                    = %111
        ADR_CHK_BITS                = %11
        PQT_MASK                    = (PQT_BITS << PQT) ^ PKTCTRL1_MASK
        CRC_AUTOFLUSH_MASK          = (1 << CRC_AUTOFLUSH) ^ PKTCTRL1_MASK
        APPEND_STATUS_MASK          = (1 << APPEND_STATUS) ^ PKTCTRL1_MASK
        ADR_CHK_MASK                = (ADR_CHK_BITS << ADR_CHK) ^ PKTCTRL1_MASK

    PKTCTRL0                        = $08
    PKTCTRL0_MASK                   = $77
        WHITE_DATA                  = 6
        PKT_FORMAT                  = 4
        CRC_EN                      = 2
        LEN_CFG                     = 0
        PKT_FORMAT_BITS             = %11
        LEN_CFG_BITS                = %11
        WHITE_DATA_MASK             = (1 << WHITE_DATA) ^ PKTCTRL0_MASK
        PKT_FORMAT_MASK             = (PKT_FORMAT_BITS << PKT_FORMAT) ^ PKTCTRL0_MASK
        CRC_EN_MASK                 = (1 << CRC_EN) ^ PKTCTRL0_MASK
        LEN_CFG_MASK                = (LEN_CFG_BITS << LEN_CFG) ^ PKTCTRL0_MASK

    ADDR                            = $09
    ADDR_MASK                       = $FF

    CHANNR                          = $0A
    CHANNR_MASK                     = $FF

    FSCTRL1                         = $0B       'IF freq
    FSCTRL1_MASK                    = $1F

    FSCTRL0                         = $0C       'Freq offset
    FSCTRL0_MASK                    = $FF

    FREQ2                           = $0D       'Center freq MSB
    FREQ2_R_BITS                    = $FF
    FREQ2_W_BITS                    = $3F       'BITS 6..7 R/O - always 0

    FREQ1                           = $0E       'Center freq middle byte
    FREQ1_MASK                      = $FF

    FREQ0                           = $0F       'Center freq LSB
    FREQ0_MASK                      = $FF

    FREQ_MASK                       = $1F_FF_FF 'Pseudo field, for FREQ2..FREQ0

    MDMCFG4                         = $10
    MDMCFG4_MASK                    = $FF
        CHANBW_E                    = 6
        CHANBW_M                    = 4
        CHANBW                      = 4
        DRATE_E                     = 0
        CHANBW_E_BITS               = %11
        CHANBW_M_BITS               = %11
        CHANBW_BITS                 = %1111
        DRATE_E_BITS                = %1111
        CHANBW_E_MASK               = (CHANBW_E_BITS << CHANBW_E) ^ MDMCFG4_MASK
        CHANBW_M_MASK               = (CHANBW_M_BITS << CHANBW_M) ^ MDMCFG4_MASK
        CHANBW_MASK                 = (CHANBW_BITS << CHANBW) ^ MDMCFG4_MASK
        DRATE_E_MASK                = DRATE_E_BITS ^ MDMCFG4_MASK

    MDMCFG3                         = $11 ' DRATE_M
    MDMCFG3_MASK                    = $FF

    MDMCFG2                         = $12
    MDMCFG2_MASK                    = $FF
        DCFILT_OFF                  = 7
        MOD_FORMAT                  = 4
        MANCHST_EN                  = 3
        SYNC_MODE                   = 0
        MOD_FORMAT_BITS             = %111
        SYNC_MODE_BITS              = %111
        DCFILT_OFF_MASK             = (1 << DCFILT_OFF) ^ MDMCFG2_MASK
        MOD_FORMAT_MASK             = (MOD_FORMAT_BITS << MOD_FORMAT) ^ MDMCFG2_MASK
        MANCHST_EN_MASK             = (1 << MANCHST_EN) ^ MDMCFG2_MASK
        SYNC_MODE_MASK              = (SYNC_MODE_BITS << SYNC_MODE) ^ MDMCFG2_MASK

    MDMCFG1                         = $13
    MDMCFG1_MASK                    = $F3
        FEC_EN                      = 7
        NUM_PREAMBLE                = 4
        CHANSPC_E                   = 0
        NUM_PREAMBLE_BITS           = %111
        CHANSPC_E_BITS              = %11
        FEC_EN_MASK                 = (1 << FEC_EN) ^ MDMCFG1_MASK
        NUM_PREAMBLE_MASK           = (NUM_PREAMBLE_BITS << NUM_PREAMBLE) ^ MDMCFG1_MASK
        CHANSPC_E_MASK              = (CHANSPC_E_BITS << CHANSPC_E) ^ MDMCFG1_MASK

    MDMCFG0                         = $14
    MDMCFG0_MASK                    = $FF

    DEVIATN                         = $15
    DEVIATN_MASK                    = $77
        DEVIAT_E                    = 4
        DEVIAT_M                    = 0
        DEVIAT_E_BITS               = %111
        DEVIAT_M_BITS               = %111
        DEVIAT_E_MASK               = (DEVIAT_E_BITS << DEVIAT_E) ^ DEVIATN_MASK
        DEVIAT_M_MASK               = (DEVIAT_M_BITS << DEVIAT_M) ^ DEVIATN_MASK

    MCSM2                           = $16
    MCSM2_MASK                      = $1F
        RXTIME_RSSI                 = 4
        RXTIME_QUAL                 = 3
        RXTIME                      = 0
        RXTIME_BITS                 = %111
        RXTIME_RSSI_MASK            = (1 << RXTIME_RSSI) ^ MCSM2_MASK
        RXTIME_QUAL_MASK            = (1 << RXTIME_QUAL) ^ MCSM2_MASK
        RXTIME_MASK                 = (RXTIME_BITS << RXTIME) ^ MCSM2_MASK

    MCSM1                           = $17
    MCSM1_MASK                      = $3F
        CCA_MODE                    = 4
        RXOFF_MODE                  = 2
        TXOFF_MODE                  = 0
        CCA_MODE_BITS               = %11
        RXOFF_MODE_BITS             = %11
        TXOFF_MODE_BITS             = %11
        CCA_MODE_MASK               = (CCA_MODE_BITS << CCA_MODE) ^ MCSM1_MASK
        RXOFF_MODE_MASK             = (RXOFF_MODE_BITS << RXOFF_MODE) ^ MCSM1_MASK
        TXOFF_MODE_MASK             = (TXOFF_MODE_BITS << TXOFF_MODE) ^ MCSM1_MASK

    MCSM0                           = $18
    MCSM0_MASK                      = $3F
        FS_AUTOCAL                  = 4
        PO_TIMEOUT                  = 2
        PIN_CTRL_EN                 = 1
        XOSC_FORCE_ON               = 0
        FS_AUTOCAL_BITS             = %11
        PO_TIMEOUT_BITS             = %11
        FS_AUTOCAL_MASK             = (FS_AUTOCAL_BITS << FS_AUTOCAL) ^ MCSM0_MASK
        PO_TIMEOUT_MASK             = (PO_TIMEOUT_BITS << PO_TIMEOUT) ^ MCSM0_MASK
        PIN_CTRL_EN_MASK            = (1 << PIN_CTRL_EN) ^ MCSM0_MASK
        XOSC_FORCE_ON_MASK          = (1 << XOSC_FORCE_ON) ^ MCSM0_MASK

    FOCCFG                          = $19
    FOCCFG_MASK                     = $3F
        FOC_BS_CS_GATE              = 5
        FOC_PRE_K                   = 3
        FOC_POST_K                  = 2
        FOC_LIMIT                   = 0
        FOC_PRE_K_BITS              = %11
        FOC_LIMIT_BITS              = %11
        FOC_BS_CS_GATE_MASK         = (1 << FOC_BS_CS_GATE) ^ FOCCFG_MASK
        FOC_PRE_K_MASK              = (FOC_PRE_K_BITS << FOC_PRE_K) ^ FOCCFG_MASK
        FOC_POST_K_MASK             = (1 << FOC_POST_K) ^ FOCCFG_MASK
        FOC_LIMIT_MASK              = (FOC_LIMIT_BITS << FOC_LIMIT) ^ FOCCFG_MASK

    BSCFG                           = $1A
    BSCFG_MASK                      = $FF
        BS_PRE_KI                   = 6
        BS_PRE_KP                   = 4
        BS_POST_KI                  = 3
        BS_POST_KP                  = 2
        BS_LIMIT                    = 0
        BS_PRE_KI_BITS              = %11
        BS_PRE_KP_BITS              = %11
        BS_LIMIT_BITS               = %11
        BS_PRE_KI_MASK              = (BS_PRE_KI_BITS << BS_PRE_KI) ^ BSCFG_MASK
        BS_PRE_KP_MASK              = (BS_PRE_KP_BITS << BS_PRE_KP) ^ BSCFG_MASK
        BS_POST_KI_MASK             = (1 << BS_POST_KI) ^ BSCFG_MASK
        BS_POST_KP_MASK             = (1 << BS_POST_KP) ^ BSCFG_MASK
        BS_LIMIT_MASK               = (BS_LIMIT_BITS << BS_LIMIT) ^ BSCFG_MASK

    AGCCTRL2                        = $1B
    AGCCTRL2_MASK                   = $FF
        MAX_DVGA_GAIN               = 6
        MAX_LNA_GAIN                = 3
        MAGN_TARGET                 = 0
        MAX_DVGA_GAIN_BITS          = %11
        MAX_LNA_GAIN_BITS           = %111
        MAGN_TARGET_BITS            = %111
        MAX_DVGA_GAIN_MASK          = (MAX_DVGA_GAIN_BITS << MAX_DVGA_GAIN) ^ AGCCTRL2_MASK
        MAX_LNA_GAIN_MASK           = (MAX_LNA_GAIN_BITS << MAX_LNA_GAIN) ^ AGCCTRL2_MASK
        MAGN_TARGET_MASK            = (MAGN_TARGET_BITS << MAGN_TARGET) ^ AGCCTRL2_MASK

    AGCCTRL1                        = $1C
    AGCCTRL1_MASK                   = $7F
        AGC_LNA_PRIORITY            = 6
        CSENSE_REL_THR              = 4
        CSENSE_ABS_THR              = 0
        CSENSE_REL_THR_BITS         = %11
        CSENSE_ABS_THR_BITS         = %111
        AGC_LNA_PRIORITY_MASK       = (1 << AGC_LNA_PRIORITY) ^ AGCCTRL1_MASK
        CSENSE_REL_THR_MASK         = (CSENSE_REL_THR_BITS << CSENSE_REL_THR) ^ AGCCTRL1_MASK
        CSENSE_ABS_THR_MASK         = (CSENSE_ABS_THR_BITS << CSENSE_ABS_THR) ^ AGCCTRL1_MASK

    AGCCTRL0                        = $1D
    AGCCTRL0_MASK                   = $FF
        HYST_LEVEL                  = 6
        WAIT_TIME                   = 4
        AGC_FREEZE                  = 2
        FILT_LEN                    = 0
        HYST_LEVEL_BITS             = %11
        WAIT_TIME_BITS              = %11
        AGC_FREEZE_BITS             = %11
        FILT_LEN_BITS               = %11
        HYST_LEVEL_MASK             = (HYST_LEVEL_BITS << HYST_LEVEL) ^ AGCCTRL0_MASK
        WAIT_TIME_MASK              = (WAIT_TIME_BITS << WAIT_TIME) ^ AGCCTRL0_MASK
        AGC_FREEZE_MASK             = (AGC_FREEZE_BITS << AGC_FREEZE) ^ AGCCTRL0_MASK
        FILT_LEN_MASK               = (FILT_LEN_BITS << FILT_LEN) ^ AGCCTRL0_MASK

    WOREVT1                         = $1E
    WOREVT1_MASK                    = $FF

    WOREVT0                         = $1F
    WOREVT0_MASK                    = $FF

    WORCTRL                         = $20
    WORCTRL_MASK                    = $FB
        RC_PD                       = 7
        EVENT1                      = 4
        RC_CAL                      = 3
        WOR_RES                     = 0
        EVENT1_BITS                 = %111
        WOR_RES_BITS                = %11
        RC_PD_MASK                  = (1 << RC_PD) ^ WORCTRL_MASK
        EVENT1_MASK                 = (EVENT1_BITS << EVENT1) ^ WORCTRL_MASK
        RC_CAL_MASK                 = (1 << RC_CAL) ^ WORCTRL_MASK
        WOR_RES_MASK                = (WOR_RES_BITS << WOR_RES) ^ WORCTRL_MASK

    FREND1                          = $21
    FREND1_MASK                     = $FF
        LNA_CURRENT                 = 6
        LNA2MIX_CURRENT             = 4
        LODIV_BUF_CURR_RX           = 2
        MIX_CURRENT                 = 0
        LNA_CURRENT_BITS            = %11
        LNA2MIX_CURRENT_BITS        = %11
        LODIV_BUF_CURR_RX_BITS      = %11
        MIX_CURRENT_BITS            = %11
        LNA_CURRENT_MASK            = (LNA_CURRENT_BITS << LNA_CURRENT) ^ FREND1_MASK
        LNA2MIX_CURRENT_MASK        = (LNA2MIX_CURRENT_BITS << LNA2MIX_CURRENT) ^ FREND1_MASK
        LODIV_BUF_CURR_RX_MASK      = (LODIV_BUF_CURR_RX_BITS << LODIV_BUF_CURR_RX) ^ FREND1_MASK
        MIX_CURRENT_MASK            = (MIX_CURRENT_BITS << MIX_CURRENT) ^ FREND1_MASK

    FREND0                          = $22
    FREND0_MASK                     = $37
        LODIV_BUF_CURR_TX           = 4
        PA_POWER                    = 0
        LODIV_BUF_CURR_TX_BITS      = %11
        PA_POWER_BITS               = %111
        LODIV_BUF_CURR_TX_MASK      = (LODIV_BUF_CURR_TX_BITS << LODIV_BUF_CURR_TX) ^ FREND0_MASK
        PA_POWER_MASK               = (PA_POWER_BITS << PA_POWER) ^ FREND0_MASK

    FSCAL3                          = $23
    FSCAL3_MASK                     = $FF
        FSCAL3_MSB                  = 6
        CHP_CURR_CAL_EN             = 4
        FSCAL3_LSB                  = 0
        FSCAL3_MSB_BITS             = %11
        CHP_CURR_CAL_EN_BITS        = %11
        FSCAL3_LSB_BITS             = %1111
        FSCAL3_MSB_MASK             = (FSCAL3_MSB_BITS << FSCAL3_MSB) ^ FSCAL3_MASK
        CHP_CURR_CAL_EN_MASK        = (CHP_CURR_CAL_EN_BITS << CHP_CURR_CAL_EN) ^ FSCAL3_MASK
        FSCAL3_LSB_MASK             = (FSCAL3_LSB_BITS << FSCAL3_LSB) ^ FSCAL3_MASK

    FSCAL2                          = $24
    FSCAL2_MASK                     = $3F
        VCO_CORE_H_EN               = 5
        FS_CAL2                     = 0
        FS_CAL2_BITS                = %11111
        VCO_CORE_H_EN_MASK          = (1 << VCO_CORE_H_EN) ^ FSCAL2_MASK
        FS_CAL2_MASK                = (FS_CAL2_BITS << FS_CAL2) ^ FSCAL2_MASK

    FSCAL1                          = $25
    FSCAL1_MASK                     = $3F

    FSCAL0                          = $26
    FSCAL0_MASK                     = $7F

    RCCTRL1                         = $27
    RCCTRL1_MASK                    = $7F

    RCCTRL0                         = $28
    RCCTRL0_MASK                    = $7F

    FSTEST                          = $29   'DATASHEET: FOR TEST ONLY - DO NOT WRITE
    FSTEST_MASK                     = $FF

    PTEST                           = $2A
    PTEST_MASK                      = $FF

    AGCTEST                         = $2B   'DATASHEET: FOR TEST ONLY - DO NOT WRITE
    AGCTEST_MASK                    = $FF

    TEST2                           = $2C
    TEST2_MASK                      = $FF

    TEST1                           = $2D
    TEST1_MASK                      = $FF

    TEST0                           = $2E
    TEST0_MASK                      = $FF
        TEST0_MSB                   = 2
        VCO_SEL_CAL_EN              = 1
        TEST0_LSB                   = 0
        TEST0_MSB_BITS              = %111111
        TEST0_MSB_MASK              = (TEST0_MSB_BITS << TEST0_MSB) ^ TEST0_MASK
        VCO_SEL_CAL_EN_MASK         = (1 << VCO_SEL_CAL_EN) ^ TEST0_MASK
        TEST0_LSB_MASK              = (1 << TEST0_LSB) ^ TEST0_MASK

' Status Regs - set BURST bit to read
    PARTNUM                         = $30 'R/O
    VERSION                         = $31 'R/O
    FREQEST                         = $32 'R/O
    LQI                             = $33 'R/O
    LQI_MASK                        = $FF
        CRC_OK                      = 7
        LQI_EST                     = 0
        LQI_EST_BITS                = %1111111
        CRC_OK_MASK                 = (1 << CRC_OK) ^ LQI_MASK
        LQI_EST_MASK                = (LQI_EST_BITS << LQI_EST) ^ LQI_MASK

    RSSI                            = $34 'R/O

    MARCSTATE                       = $35 'R/O
    MARCSTATE_MASK                  = $1F
        IDLE                        = $01 'Machine states
        VCOON_MC                    = $03
        REGON_MC                    = $04
        MANCAL                      = $05
        VCOON                       = $06
        REGON                       = $07
        STARTCAL                    = $08
        BWBOOST                     = $09
        FS_LOCK                     = $0A
        IFADCON                     = $0B
        ENDCAL                      = $0C
        RX                          = $0D
        RX_END                      = $0E
        RX_RST                      = $0F
        TXRX_SWITCH                 = $10
        RXFIFO_OVERF                = $11
        FSTXON                      = $12
        TX                          = $13
        TX_END                      = $14
        RXTX_SWITCH                 = $15
        TXFIFO_UNDERF               = $16

    WORTIME1                        = $36 'R/O
    WORTIME0                        = $37 'R/O

    PKTSTATUS                       = $38 'R/O
    PKTSTATUS_MASK                  = $FD
        PKT_CRC_OK                  = 7
        CS                          = 6
        PQT_REACHED                 = 5
        CCA                         = 4
        SFD                         = 3
        GDO2                        = 2
        GDO0                        = 0
        PKT_CRC_OK_MASK             = (1 << PKT_CRC_OK) ^ PKTSTATUS_MASK
        CS_MASK                     = (1 << CS) ^ PKTSTATUS_MASK
        PQT_REACHED_MASK            = (1 << PQT_REACHED) ^ PKTSTATUS_MASK
        CCA_MASK                    = (1 << CCA) ^ PKTSTATUS_MASK
        SFD_MASK                    = (1 << SFD) ^ PKTSTATUS_MASK
        GDO2_MASK                   = (1 << GDO2) ^ PKTSTATUS_MASK
        GDO0_MASK                   = (1 << GDO0) ^ PKTSTATUS_MASK

    VCO_VC_DAC                      = $39 'R/O
    TXBYTES                         = $3A
    TXBYTES_MASK                    = $FF
        TXFIFO_UNDERFL              = 7
        NUM_TXBYTES                 = 0
        NUM_TXBYTES_BITS            = %1111111
        TXFIFO_UNDERFL_MASK         = (1 << TXFIFO_UNDERFL) ^ TXBYTES_MASK
        NUM_TXBYTES_MASK            = (1 << NUM_TXBYTES) ^ TXBYTES_MASK

    RXBYTES                         = $3B 'R/O
    RXBYTES_MASK                    = $FF
        RXFIFO_OVERFL               = 7
        NUM_RXBYTES                 = 0
        NUM_RXBYTES_BITS            = %1111111
        RXFIFO_OVERFL_MASK          = (1 << RXFIFO_OVERFL) ^ RXBYTES_MASK
        NUM_RXBYTES_MASK            = (1 << NUM_RXBYTES) ^ RXBYTES_MASK

    RCCTRL1_STATUS                  = $3C 'R/O
    RCCTRL1_STATUS_MASK             = $7F

    RCCTRL0_STATUS                  = $3D 'R/O
    RCCTRL0_STATUS_MASK             = $7F

' Command strobes
    CS_SRES                         = $30
    CS_SFSTXON                      = $31
    CS_SXOFF                        = $32
    CS_SCAL                         = $33
    CS_SRX                          = $34
    CS_STX                          = $35
    CS_SIDLE                        = $36
    CS_SWOR                         = $38
    CS_SPWD                         = $39
    CS_SFRX                         = $3A
    CS_SFTX                         = $3B
    CS_SWORRST                      = $3C
    CS_SNOP                         = $3D

    PATABLE                         = $3E 'PA power control
    FIFO                            = $3F 'TX and RX FIFO access (differentiated by R/W bit)

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
