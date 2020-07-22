{
    --------------------------------------------
    Filename: core.con.cc1101.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 25, 2019
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                            = 0
    CLK_DELAY                       = 1
    SCK_MAX_FREQ                    = 20_000_000     'Max freq in burst mode
    MOSI_BITORDER                   = 5             'MSBFIRST
    MISO_BITORDER                   = 0             'MSBPRE

    W                               = 0
    R                               = 1 << 7
    BURST                           = 1 << 6

' Register definitions
'   Status byte
    SB_FLD_CHIP_RDY                 = 7
    SB_FLD_STATE                    = 4
    SB_FLD_FIFO_BYTES_AVAILABLE     = 0
    SB_BITS_STATE                   = %111
    SB_BITS_FIFO_BYTES_AVAILABLE    = %1111

    IOCFG2                          = $00
    IOCFG2_MASK                     = $7F
        FLD_GDO2_INV                = 6
        FLD_GDO2_CFG                = 0
        BITS_GDO2_CFG               = %111111
        MASK_GDO2_INV               = IOCFG2_MASK ^ (1 << FLD_GDO2_INV)
        MASK_GDO2_CFG               = IOCFG2_MASK ^ (BITS_GDO2_CFG << FLD_GDO2_CFG)

    IOCFG1                          = $01
    IOCFG1_MASK                     = $FF
        FLD_GDO1_DS                 = 7
        FLD_GDO1_INV                = 6
        FLD_GDO1_CFG                = 0
        BITS_GDO1_CFG               = %111111
        MASK_GDO1_DS                = IOCFG1_MASK ^ (1 << FLD_GDO1_DS)
        MASK_GDO1_INV               = IOCFG1_MASK ^ (1 << FLD_GDO1_INV)
        MASK_GDO1_CFG               = IOCFG1_MASK ^ (BITS_GDO1_CFG << FLD_GDO1_CFG)

    IOCFG0                          = $02
    IOCFG0_MASK                     = $FF
        FLD_TEMP_SENSOR_ENABLE      = 7
        FLD_GDO0_INV                = 6
        FLD_GDO0_CFG                = 0
        BITS_GDO0_CFG               = %111111
        MASK_TEMP_SENSOR_ENABLE     = IOCFG0_MASK ^ (1 << FLD_TEMP_SENSOR_ENABLE)
        MASK_GDO0_INV               = IOCFG0_MASK ^ (1 << FLD_GDO0_INV)
        MASK_GDO0_CFG               = IOCFG0_MASK ^ (BITS_GDO0_CFG << FLD_GDO0_CFG)

    FIFOTHR                         = $03
    FIFOTHR_MASK                    = $7F
        FLD_ADC_RETENTION           = 6
        FLD_CLOSE_IN_RX             = 4
        FLD_FIFO_THR                = 0
        BITS_CLOSE_IN_RX            = %11
        BITS_FIFO_THR               = %1111
        MASK_ADC_RETENTION          = FIFOTHR_MASK ^ (1 << FLD_ADC_RETENTION)
        MASK_CLOSE_IN_RX            = FIFOTHR_MASK ^ (1 << FLD_CLOSE_IN_RX)
        MASK_FIFO_THR               = FIFOTHR_MASK ^ (1 << FLD_FIFO_THR)

    SYNC1                           = $04
    SYNC1_MASK                      = $FF

    SYNC0                           = $05
    SYNC0_MASK                      = $FF

    PKTLEN                          = $06
    PKTLEN_MASK                     = $FF

    PKTCTRL1                        = $07
    PKTCTRL1_MASK                   = $EF
        FLD_PQT                     = 5
        FLD_CRC_AUTOFLUSH           = 3
        FLD_APPEND_STATUS           = 2
        FLD_ADR_CHK                 = 0
        BITS_PQT                    = %111
        BITS_ADR_CHK                = %11
        MASK_PQT                    = PKTCTRL1_MASK ^ (BITS_PQT << FLD_PQT)
        MASK_CRC_AUTOFLUSH          = PKTCTRL1_MASK ^ (1 << FLD_CRC_AUTOFLUSH)
        MASK_APPEND_STATUS          = PKTCTRL1_MASK ^ (1 << FLD_APPEND_STATUS)
        MASK_ADR_CHK                = PKTCTRL1_MASK ^ (BITS_ADR_CHK << FLD_ADR_CHK)

    PKTCTRL0                        = $08
    PKTCTRL0_MASK                   = $77
        FLD_WHITE_DATA              = 6
        FLD_PKT_FORMAT              = 4
        FLD_CRC_EN                  = 2
        FLD_LENGTH_CONFIG           = 0
        BITS_PKT_FORMAT             = %11
        BITS_LENGTH_CONFIG          = %11
        MASK_WHITE_DATA             = PKTCTRL0_MASK ^ (1 << FLD_WHITE_DATA)
        MASK_PKT_FORMAT             = PKTCTRL0_MASK ^ (BITS_PKT_FORMAT << FLD_PKT_FORMAT)
        MASK_CRC_EN                 = PKTCTRL0_MASK ^ (1 << FLD_CRC_EN)
        MASK_LENGTH_CONFIG          = PKTCTRL0_MASK ^ (BITS_LENGTH_CONFIG << FLD_LENGTH_CONFIG)

    ADDR                            = $09
    ADDR_MASK                       = $FF

    CHANNR                          = $0A
    CHANNR_MASK                     = $FF

    FSCTRL1                         = $0B       'IF freq
    FSCTRL1_MASK                    = $1F

    FSCTRL0                         = $0C       'Freq offset
    FSCTRL0_MASK                    = $FF

    FREQ2                           = $0D       'Center freq MSB
    FREQ2_MASK_R                    = $FF
    FREQ2_MASK_W                    = $3F       'BITS 6..7 R/O - always 0

    FREQ1                           = $0E       'Center freq middle byte
    FREQ1_MASK                      = $FF

    FREQ0                           = $0F       'Center freq LSB
    FREQ0_MASK                      = $FF

    FREQ_MASK                       = $1F_FF_FF 'Pseudo field, for FREQ2..FREQ0

    MDMCFG4                         = $10
    MDMCFG4_MASK                    = $FF
        FLD_CHANBW_E                = 6
        FLD_CHANBW_M                = 4
        FLD_CHANBW                  = 4
        FLD_DRATE_E                 = 0
        BITS_CHANBW_E               = %11
        BITS_CHANBW_M               = %11
        BITS_CHANBW                 = %1111
        BITS_DRATE_E                = %1111
        MASK_CHANBW_E               = MDMCFG4_MASK ^ (BITS_CHANBW_E << FLD_CHANBW_E)
        MASK_CHANBW_M               = MDMCFG4_MASK ^ (BITS_CHANBW_M << FLD_CHANBW_M)
        MASK_CHANBW                 = MDMCFG4_MASK ^ (BITS_CHANBW << FLD_CHANBW)
        MASK_DRATE_E                = MDMCFG4_MASK ^ (BITS_DRATE_E)

    MDMCFG3                         = $11 ' DRATE_M
    MDMCFG3_MASK                    = $FF

    MDMCFG2                         = $12
    MDMCFG2_MASK                    = $FF
        FLD_DEM_DCFILT_OFF          = 7
        FLD_MOD_FORMAT              = 4
        FLD_MANCHESTER_EN           = 3
        FLD_SYNC_MODE               = 0
        BITS_MOD_FORMAT             = %111
        BITS_SYNC_MODE              = %111
        MASK_DEM_DCFILT_OFF         = MDMCFG2_MASK ^ (1 << FLD_DEM_DCFILT_OFF)
        MASK_MOD_FORMAT             = MDMCFG2_MASK ^ (BITS_MOD_FORMAT << FLD_MOD_FORMAT)
        MASK_MANCHESTER_EN          = MDMCFG2_MASK ^ (1 << FLD_MANCHESTER_EN)
        MASK_SYNC_MODE              = MDMCFG2_MASK ^ (BITS_SYNC_MODE << FLD_SYNC_MODE)

    MDMCFG1                         = $13
    MDMCFG1_MASK                    = $F3
        FLD_FEC_EN                  = 7
        FLD_NUM_PREAMBLE            = 4
        FLD_CHANSPC_E               = 0
        BITS_NUM_PREAMBLE           = %111
        BITS_CHANSPC_E              = %11
        MASK_FEC_EN                 = MDMCFG1_MASK ^ (1 << FLD_FEC_EN)
        MASK_NUM_PREAMBLE           = MDMCFG1_MASK ^ (BITS_NUM_PREAMBLE << FLD_NUM_PREAMBLE)
        MASK_CHANSPC_E              = MDMCFG1_MASK ^ (BITS_CHANSPC_E << FLD_CHANSPC_E)

    MDMCFG0                         = $14
    MDMCFG0_MASK                    = $FF

    DEVIATN                         = $15
    DEVIATN_MASK                    = $77
        FLD_DEVIATION_E             = 4
        FLD_DEVIATION_M             = 0
        BITS_DEVIATION_E            = %111
        BITS_DEVIATION_M            = %111
        MASK_DEVIATION_E            = DEVIATN_MASK ^ (BITS_DEVIATION_E << FLD_DEVIATION_E)
        MASK_DEVIATION_M            = DEVIATN_MASK ^ (BITS_DEVIATION_M << FLD_DEVIATION_M)

    MCSM2                           = $16
    MCSM2_MASK                      = $1F
        FLD_RX_TIME_RSSI            = 4
        FLD_RX_TIME_QUAL            = 3
        FLD_RX_TIME                 = 0
        BITS_RX_TIME                = %111
        MASK_RX_TIME_RSSI           = MCSM2_MASK ^ (1 << FLD_RX_TIME_RSSI)
        MASK_RX_TIME_QUAL           = MCSM2_MASK ^ (1 << FLD_RX_TIME_QUAL)
        MASK_RX_TIME                = MCSM2_MASK ^ (BITS_RX_TIME << FLD_RX_TIME)

    MCSM1                           = $17
    MCSM1_MASK                      = $3F
        FLD_CCA_MODE                = 4
        FLD_RXOFF_MODE              = 2
        FLD_TXOFF_MODE              = 0
        BITS_CCA_MODE               = %11
        BITS_RXOFF_MODE             = %11
        BITS_TXOFF_MODE             = %11
        MASK_CCA_MODE               = MCSM1_MASK ^ (BITS_CCA_MODE << FLD_CCA_MODE)
        MASK_RXOFF_MODE             = MCSM1_MASK ^ (BITS_RXOFF_MODE << FLD_RXOFF_MODE)
        MASK_TXOFF_MODE             = MCSM1_MASK ^ (BITS_TXOFF_MODE << FLD_TXOFF_MODE)

    MCSM0                           = $18
    MCSM0_MASK                      = $3F
        FLD_FS_AUTOCAL              = 4
        FLD_PO_TIMEOUT              = 2
        FLD_PIN_CTRL_EN             = 1
        FLD_XOSC_FORCE_ON           = 0
        BITS_FS_AUTOCAL             = %11
        BITS_PO_TIMEOUT             = %11
        MASK_FS_AUTOCAL             = MCSM0_MASK ^ (BITS_FS_AUTOCAL << FLD_FS_AUTOCAL)
        MASK_PO_TIMEOUT             = MCSM0_MASK ^ (BITS_PO_TIMEOUT << FLD_PO_TIMEOUT)
        MASK_PIN_CTRL_EN            = MCSM0_MASK ^ (1 << FLD_PIN_CTRL_EN)
        MASK_XOSC_FORCE_ON          = MCSM0_MASK ^ (1 << FLD_XOSC_FORCE_ON)

    FOCCFG                          = $19
    FOCCFG_MASK                     = $3F
        FLD_FOC_BS_CS_GATE          = 5
        FLD_FOC_PRE_K               = 3
        FLD_FOC_POST_K              = 2
        FLD_FOC_LIMIT               = 0
        BITS_FOC_PRE_K              = %11
        BITS_FOC_LIMIT              = %11
        MASK_FOC_BS_CS_GATE         = FOCCFG_MASK ^ (1 << FLD_FOC_BS_CS_GATE)
        MASK_FOC_PRE_K              = FOCCFG_MASK ^ (BITS_FOC_PRE_K << FLD_FOC_PRE_K)
        MASK_FOC_POST_K             = FOCCFG_MASK ^ (1 << FLD_FOC_POST_K)
        MASK_FOC_LIMIT              = FOCCFG_MASK ^ (BITS_FOC_LIMIT << FLD_FOC_LIMIT)

    BSCFG                           = $1A
    BSCFG_MASK                      = $FF
        FLD_BS_PRE_KI               = 6
        FLD_BS_PRE_KP               = 4
        FLD_BS_POST_KI              = 3
        FLD_BS_POST_KP              = 2
        FLD_BS_LIMIT                = 0
        BITS_BS_PRE_KI              = %11
        BITS_BS_PRE_KP              = %11
        BITS_BS_LIMIT               = %11
        MASK_BS_PRE_KI              = BSCFG_MASK ^ (BITS_BS_PRE_KI << FLD_BS_PRE_KI)
        MASK_BS_PRE_KP              = BSCFG_MASK ^ (BITS_BS_PRE_KP << FLD_BS_PRE_KP)
        MASK_BS_POST_KI             = BSCFG_MASK ^ (1 << FLD_BS_POST_KI)
        MASK_BS_POST_KP             = BSCFG_MASK ^ (1 << FLD_BS_POST_KP)
        MASK_BS_LIMIT               = BSCFG_MASK ^ (BITS_BS_LIMIT << FLD_BS_LIMIT)

    AGCCTRL2                        = $1B
    AGCCTRL2_MASK                   = $FF
        FLD_MAX_DVGA_GAIN           = 6
        FLD_MAX_LNA_GAIN            = 3
        FLD_MAGN_TARGET             = 0
        BITS_MAX_DVGA_GAIN          = %11
        BITS_MAX_LNA_GAIN           = %111
        BITS_MAGN_TARGET            = %111
        MASK_MAX_DVGA_GAIN          = AGCCTRL2_MASK ^ (BITS_MAX_DVGA_GAIN << FLD_MAX_DVGA_GAIN)
        MASK_MAX_LNA_GAIN           = AGCCTRL2_MASK ^ (BITS_MAX_LNA_GAIN << FLD_MAX_LNA_GAIN)
        MASK_MAGN_TARGET            = AGCCTRL2_MASK ^ (BITS_MAGN_TARGET << FLD_MAGN_TARGET)

    AGCCTRL1                        = $1C
    AGCCTRL1_MASK                   = $7F
        FLD_AGC_LNA_PRIORITY        = 6
        FLD_CARRIER_SENSE_REL_THR   = 4
        FLD_CARRIER_SENSE_ABS_THR   = 0
        BITS_CARRIER_SENSE_REL_THR  = %11
        BITS_CARRIER_SENSE_ABS_THR  = %111
        MASK_AGC_LNA_PRIORITY       = AGCCTRL1_MASK ^ (1 << FLD_AGC_LNA_PRIORITY)
        MASK_CARRIER_SENSE_REL_THR  = AGCCTRL1_MASK ^ (BITS_CARRIER_SENSE_REL_THR << FLD_CARRIER_SENSE_REL_THR)
        MASK_CARRIER_SENSE_ABS_THR  = AGCCTRL1_MASK ^ (BITS_CARRIER_SENSE_ABS_THR << FLD_CARRIER_SENSE_ABS_THR)

    AGCCTRL0                        = $1D
    AGCCTRL0_MASK                   = $FF
        FLD_HYST_LEVEL              = 6
        FLD_WAIT_TIME               = 4
        FLD_AGC_FREEZE              = 2
        FLD_FILTER_LENGTH           = 0
        BITS_HYST_LEVEL             = %11
        BITS_WAIT_TIME              = %11
        BITS_AGC_FREEZE             = %11
        BITS_FILTER_LENGTH          = %11
        MASK_HYST_LEVEL             = AGCCTRL0_MASK ^ (BITS_HYST_LEVEL << FLD_HYST_LEVEL)
        MASK_WAIT_TIME              = AGCCTRL0_MASK ^ (BITS_WAIT_TIME << FLD_WAIT_TIME)
        MASK_AGC_FREEZE             = AGCCTRL0_MASK ^ (BITS_AGC_FREEZE << FLD_AGC_FREEZE)
        MASK_FILTER_LENGTH          = AGCCTRL0_MASK ^ (BITS_FILTER_LENGTH << FLD_FILTER_LENGTH)

    WOREVT1                         = $1E
    WOREVT1_MASK                    = $FF

    WOREVT0                         = $1F
    WOREVT0_MASK                    = $FF

    WORCTRL                         = $20
    WORCTRL_MASK                    = $FB
        FLD_RC_PD                   = 7
        FLD_EVENT1                  = 4
        FLD_RC_CAL                  = 3
        FLD_WOR_RES                 = 0
        BITS_EVENT1                 = %111
        BITS_WOR_RES                = %11
        MASK_RC_PD                  = WORCTRL_MASK ^ (1 << FLD_RC_PD)
        MASK_EVENT1                 = WORCTRL_MASK ^ (BITS_EVENT1 << FLD_EVENT1)
        MASK_RC_CAL                 = WORCTRL_MASK ^ (1 << FLD_RC_CAL)
        MASK_WOR_RES                = WORCTRL_MASK ^ (BITS_WOR_RES << FLD_WOR_RES)

    FREND1                          = $21
    FREND1_MASK                     = $FF
        FLD_LNA_CURRENT             = 6
        FLD_LNA2MIX_CURRENT         = 4
        FLD_LODIV_BUF_CURRENT_RX    = 2
        FLD_MIX_CURRENT             = 0
        BITS_LNA_CURRENT            = %11
        BITS_LNA2MIX_CURRENT        = %11
        BITS_LODIV_BUF_CURRENT_RX   = %11
        BITS_MIX_CURRENT            = %11
        MASK_LNA_CURRENT            = FREND1_MASK ^ (BITS_LNA_CURRENT << FLD_LNA_CURRENT)
        MASK_LNA2MIX_CURRENT        = FREND1_MASK ^ (BITS_LNA2MIX_CURRENT << FLD_LNA2MIX_CURRENT)
        MASK_LODIV_BUF_CURRENT_RX   = FREND1_MASK ^ (BITS_LODIV_BUF_CURRENT_RX << FLD_LODIV_BUF_CURRENT_RX)
        MASK_MIX_CURRENT            = FREND1_MASK ^ (BITS_MIX_CURRENT << FLD_MIX_CURRENT)

    FREND0                          = $22
    FREND0_MASK                     = $37
        FLD_LODIV_BUFF_CURRENT_TX   = 4
        FLD_PA_POWER                = 0
        BITS_LODIV_BUFF_CURRENT_TX  = %11
        BITS_PA_POWER               = %111
        MASK_LODIV_BUFF_CURRENT_TX  = FREND0_MASK ^ (BITS_LODIV_BUFF_CURRENT_TX << FLD_LODIV_BUFF_CURRENT_TX)
        MASK_PA_POWER               = FREND0_MASK ^ (BITS_PA_POWER << FLD_PA_POWER)

    FSCAL3                          = $23
    FSCAL3_MASK                     = $FF
        FLD_FSCAL3_MSB              = 6
        FLD_CHP_CURR_CAL_EN         = 4
        FLD_FSCAL3_LSB              = 0
        BITS_FSCAL3_MSB             = %11
        BITS_CHP_CURR_CAL_EN        = %11
        BITS_FSCAL3_LSB             = %1111
        MASK_FSCAL3_MSB             = FSCAL3_MASK ^ (BITS_FSCAL3_MSB << FLD_FSCAL3_MSB)
        MASK_CHP_CURR_CAL_EN        = FSCAL3_MASK ^ (BITS_CHP_CURR_CAL_EN << FLD_CHP_CURR_CAL_EN)
        MASK_FSCAL3_LSB             = FSCAL3_MASK ^ (BITS_FSCAL3_LSB << FLD_FSCAL3_LSB)

    FSCAL2                          = $24
    FSCAL2_MASK                     = $3F
        FLD_VCO_CORE_H_EN           = 5
        FLD_FSCAL2                  = 0
        BITS_FSCAL2                 = %11111
        MASK_VCO_CORE_H_EN          = FSCAL2_MASK ^ (1 << FLD_VCO_CORE_H_EN)
        MASK_FSCAL2                 = FSCAL2_MASK ^ (BITS_FSCAL2 << FLD_FSCAL2)

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
        FLD_TEST0_MSB               = 2
        FLD_VCO_SEL_CAL_EN          = 1
        FLD_TEST0_LSB               = 0
        BITS_TEST0_MSB              = %111111
        MASK_TEST0_MSB              = TEST0_MASK ^ (BITS_TEST0_MSB << FLD_TEST0_MSB)
        MASK_VCO_SEL_CAL_EN         = TEST0_MASK ^ (1 << FLD_VCO_SEL_CAL_EN)
        MASK_TEST0_LSB              = TEST0_MASK ^ (1 << FLD_TEST0_LSB)

' Status Regs - set BURST bit to read
    PARTNUM                         = $30 'R/O
    VERSION                         = $31 'R/O
    FREQEST                         = $32 'R/O
    LQI                             = $33 'R/O
    LQI_MASK                        = $FF
        FLD_CRC_OK                  = 7
        FLD_LQI_EST                 = 0
        BITS_LQI_EST                = %1111111
        MASK_CRC_OK                 = LQI_MASK ^ (1 << FLD_CRC_OK)
        MASK_LQI_EST                = LQI_MASK ^ (BITS_LQI_EST << FLD_LQI_EST)

    RSSI                            = $34 'R/O

    MARCSTATE                       = $35 'R/O
    MARCSTATE_MASK                  = $1F
        MARCSTATE_IDLE              = $01 'Machine states
        MARCSTATE_VCOON_MC          = $03
        MARCSTATE_REGON_MC          = $04
        MARCSTATE_MANCAL            = $05
        MARCSTATE_VCOON             = $06
        MARCSTATE_REGON             = $07
        MARCSTATE_STARTCAL          = $08
        MARCSTATE_BWBOOST           = $09
        MARCSTATE_FS_LOCK           = $0A
        MARCSTATE_IFADCON           = $0B
        MARCSTATE_ENDCAL            = $0C
        MARCSTATE_RX                = $0D
        MARCSTATE_RX_END            = $0E
        MARCSTATE_RX_RST            = $0F
        MARCSTATE_TXRX_SWITCH       = $10
        MARCSTATE_RXFIFO_OVERFLOW   = $11
        MARCSTATE_FSTXON            = $12
        MARCSTATE_TX                = $13
        MARCSTATE_TX_END            = $14
        MARCSTATE_RXTX_SWITCH       = $15
        MARCSTATE_TXFIFO_UNDERFLOW  = $16

    WORTIME1                        = $36 'R/O
    WORTIME0                        = $37 'R/O

    PKTSTATUS                       = $38 'R/O
    PKTSTATUS_MASK                  = $FD
        FLD_PKT_CRC_OK              = 7
        FLD_CS                      = 6
        FLD_PQT_REACHED             = 5
        FLD_CCA                     = 4
        FLD_SFD                     = 3
        FLD_GDO2                    = 2
        FLD_GDO0                    = 0
        MASK_PKT_CRC_OK             = PKTSTATUS_MASK ^ (1 << FLD_PKT_CRC_OK)
        MASK_CS                     = PKTSTATUS_MASK ^ (1 << FLD_CS)
        MASK_PQT_REACHED            = PKTSTATUS_MASK ^ (1 << FLD_PQT_REACHED)
        MASK_CCA                    = PKTSTATUS_MASK ^ (1 << FLD_CCA)
        MASK_SFD                    = PKTSTATUS_MASK ^ (1 << FLD_SFD)
        MASK_GDO2                   = PKTSTATUS_MASK ^ (1 << FLD_GDO2)
        MASK_GDO0                   = PKTSTATUS_MASK ^ (1 << FLD_GDO0)

    VCO_VC_DAC                      = $39 'R/O
    TXBYTES                         = $3A
    TXBYTES_MASK                    = $FF
        FLD_TXFIFO_UNDERFLOW        = 7
        FLD_NUM_TXBYTES             = 0
        BITS_NUM_TXBYTES            = %1111111
        MASK_TXFIFO_UNDERFLOW       = TXBYTES_MASK ^ (1 << FLD_TXFIFO_UNDERFLOW)
        MASK_NUM_TXBYTES            = TXBYTES_MASK ^ (1 << FLD_NUM_TXBYTES)

    RXBYTES                         = $3B 'R/O
    RXBYTES_MASK                    = $FF
        FLD_RXFIFO_OVERFLOW         = 7
        FLD_NUM_RXBYTES             = 0
        BITS_NUM_RXBYTES            = %1111111
        MASK_RXFIFO_OVERFLOW        = RXBYTES_MASK ^ (1 << FLD_RXFIFO_OVERFLOW)
        MASK_NUM_RXBYTES            = RXBYTES_MASK ^ (1 << FLD_NUM_RXBYTES)

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
