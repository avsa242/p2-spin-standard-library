{
    --------------------------------------------
    Filename: core.con.sx1276.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Oct 6, 2019
    Updated Oct 11, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                        = 0
    CLK_DELAY                   = 10
    MOSI_BITORDER               = 5             'MSBFIRST
    MISO_BITORDER               = 0             'MSBPRE

    WRITE                       = 1 << 7

' General/shared functionality
    FIFO                        = $00
    OPMODE                      = $01
    OPMODE_MASK                 = $CF
        FLD_LONGRANGEMODE       = 7
        FLD_MODULATIONTYPE      = 5
        FLD_LOWFREQUENCYMODEON  = 3
        FLD_MODE                = 0
        BITS_MODULATIONTYPE     = %11
        BITS_MODE               = %111
        MASK_LONGRANGEMODE      = OPMODE_MASK ^ (1 << FLD_LONGRANGEMODE)
        MASK_MODULATIONTYPE     = OPMODE_MASK ^ (BITS_MODULATIONTYPE << FLD_MODULATIONTYPE)
        MASK_LOWFREQUENCYMODEON = OPMODE_MASK ^ (1 << FLD_LOWFREQUENCYMODEON)
        MASK_MODE               = OPMODE_MASK ^ (BITS_MODE << FLD_MODE)

    FRFMSB                      = $06
    FRFMID                      = $07
    FRFLSB                      = $08

    PACONFIG                    = $09
    PACONFIG_MASK               = $FF
        FLD_PASELECT            = 7
        FLD_MAXPOWER            = 4
        FLD_OUTPUTPOWER         = 0
        BITS_MAXPOWER           = %111
        BITS_OUTPUTPOWER        = %1111
        MASK_PASELECT           = PACONFIG_MASK ^ (1 << FLD_PASELECT)
        MASK_MAXPOWER           = PACONFIG_MASK ^ (BITS_MAXPOWER << FLD_MAXPOWER)
        MASK_OUTPUTPOWER        = PACONFIG_MASK ^ (BITS_OUTPUTPOWER << FLD_OUTPUTPOWER)

    PARAMP                      = $0A
    PARAMP_MASK                 = $0F
        FLD_PARAMP              = 0
        BITS_PARAMP             = %1111

    OCP                         = $0B
    OCP_MASK                    = $3F
        FLD_OCPON               = 5
        FLD_OCPTRIM             = 0
        BITS_OCPTRIM            = %11111
        MASK_OCPON              = OCP_MASK ^ (1 << FLD_OCPON)
        MASK_OCPTRIM            = OCP_MASK ^ (BITS_OCPTRIM << FLD_OCPTRIM)

    LNA                         = $0C
    LNA_MASK                    = $FB
        FLD_LNAGAIN             = 5
        FLD_LNABOOSTLF          = 3
        FLD_LNABOOSTHF          = 0
        BITS_LNAGAIN            = %111
        BITS_LNABOOSTLF         = %11
        BITS_LNABOOSTHF         = %11
        MASK_LNAGAIN            = LNA_MASK ^ (BITS_LNAGAIN << FLD_LNAGAIN)
        MASK_LNABOOSTLF         = LNA_MASK ^ (BITS_LNABOOSTLF << FLD_LNABOOSTLF)
        MASK_LNABOOSTHF         = LNA_MASK ^ (BITS_LNABOOSTHF << FLD_LNABOOSTHF)

    DIOMAPPING1                 = $40
    DIOMAPPING1_MASK            = $FF
        FLD_DIO0MAPPING         = 6
        FLD_DIO1MAPPING         = 4
        FLD_DIO2MAPPING         = 2
        FLD_DIO3MAPPING         = 0
        MASK_DIO0MAPPING        = DIOMAPPING1_MASK ^ (1 << FLD_DIO0MAPPING)
        MASK_DIO1MAPPING        = DIOMAPPING1_MASK ^ (1 << FLD_DIO1MAPPING)
        MASK_DIO2MAPPING        = DIOMAPPING1_MASK ^ (1 << FLD_DIO2MAPPING)
        MASK_DIO3MAPPING        = DIOMAPPING1_MASK ^ (1 << FLD_DIO3MAPPING)

    DIOMAPPING2                 = $41
    DIOMAPPING2_MASK            = $F1
        FLD_DIO4MAPPING         = 6
        FLD_DIO5MAPPING         = 4
        MASK_DIO4MAPPING        = DIOMAPPING2_MASK ^ (1 << FLD_DIO4MAPPING)
        MASK_DIO5MAPPING        = DIOMAPPING2_MASK ^ (1 << FLD_DIO5MAPPING)

    VERSION                     = $42
    TCXO                        = $4B

    PADAC                       = $4D
    PADAC_MASK                  = $07
        FLD_PADAC_RSVD          = 3
        BITS_PADAC_RSVD         = %11111
        FLD_PADAC               = 0
        BITS_PADAC              = %111

    FORMERTEMP                  = $5B
    AGCREF                      = $61
    AGCTHRESH1                  = $62
    AGCTHRESH2                  = $63
    AGCTHRESH3                  = $64

' FSK/OOK-specific functionality
    BITRATEMSB                  = $02
    BITRATELSB                  = $03
    FDEVMSB                     = $04
    FDEVLSB                     = $05
    RXCONFIG                    = $0D
    RSSICONFIG                  = $0E
    RSSICOLLISION               = $0F
    RSSITHRESH                  = $10
    RSSIVALUE                   = $11
    RXBW                        = $12
    AFCBW                       = $13
    OOKPEAK                     = $14
    OOKFIX                      = $15
    OOKAVG                      = $16
' $17..$19 - RESERVED
    AFCFEI                      = $1A
    AFCMSB                      = $1B
    AFCLSB                      = $1C
    FEIMSB                      = $1D
    FEILSB                      = $1E
    PREAMBLEDETECT              = $1F
    RXTIMEOUT1                  = $20
    RXTIMEOUT2                  = $21
    RXTIMEOUT3                  = $22
    RXDELAY                     = $23

    OSC                         = $24
    OSC_MASK                    = $0F
        FLD_RCCALSTART          = 3
        FLD_CLKOUT              = 0
        BITS_CLKOUT             = %111
        MASK_RCCALSTART         = OSC_MASK ^ (1 << FLD_RCCALSTART)
        MASK_CLKOUT             = OSC_MASK ^ (BITS_CLKOUT << FLD_CLKOUT)

    PREAMBLEMSB                 = $25
    PREAMBLELSB                 = $26
    SYNCCONFIG                  = $27
    SYNCVALUE1                  = $28
    SYNCVALUE2                  = $29
    SYNCVALUE3                  = $2A
    SYNCVALUE4                  = $2B
    SYNCVALUE5                  = $2C
    SYNCVALUE6                  = $2D
    SYNCVALUE7                  = $2E
    SYNCVALUE8                  = $2F
    PACKETCONFIG1               = $30
    PACKETCONFIG2               = $31
    PAYLOADLENGTH               = $32
    NODEADRS                    = $33
    BROADCASTADRS               = $34
    FIFOTHRESH                  = $35
    SEQCONFIG1                  = $36
    SEQCONFIG2                  = $37
    TIMERRESOL                  = $38
    TIMER1COEF                  = $39
    TIMER2COEF                  = $3A
    IMAGECAL                    = $3B
    TEMP                        = $3C
    LOWBAT                      = $3D
    IRQFLAGS1                   = $3E
    IRQFLAGS2                   = $3F
    PLLHOP                      = $44
    BITRATEFRAC                 = $5D

' LoRa-specific functionality
    FIFOADDRPTR                 = $0D   'LORA
    FIFOTXBASEADDR              = $0E   'LORA
    FIFORXBASEADDR              = $0F   'LORA
    FIFORXCURRENTADDR           = $10   'LORA
    IRQFLAGS_MASK               = $11   'LORA
    IRQFLAGS                    = $12   'LORA
    RXNBBYTES                   = $13   'LORA
    RXHEADERCNTVALUEMSB         = $14   'LORA
    RXHEADERCNTVALUELSB         = $15   'LORA
    RXPACKETCNTVALUEMSB         = $16   'LORA
    RXPACKETCNTVALUELSB         = $17   'LORA

    MODEMSTAT                   = $18   'LORA
        FLD_RXCODINGRATE        = 5
        BITS_RXCODINGRATE       = %111
        BITS_MODEMSTATUS        = %11111

    PKTSNRVALUE                 = $19   'LORA
    PKTRSSIVALUE                = $1A   'LORA
    LORA_RSSIVALUE              = $1B   'LORA

    HOPCHANNEL                  = $1C   'LORA
        FLD_PLLTIMEOUT          = 7
        FLD_CRCONPAYLOAD        = 6
        FLD_FHSSPRESENTCHANNEL  = 0
        BITS_FHSSPRESENTCHANNEL = %111111

    MODEMCONFIG1                = $1D   'LORA
    MODEMCONFIG1_MASK           = $FF
        FLD_BW                  = 4
        FLD_CODINGRATE          = 1
        FLD_IMPL_HEADERMODEON   = 0
        BITS_BW                 = %1111
        BITS_CODINGRATE         = %111
        MASK_BW                 = MODEMCONFIG1_MASK ^ (BITS_BW << FLD_BW)
        MASK_CODINGRATE         = MODEMCONFIG1_MASK ^ (BITS_CODINGRATE << FLD_CODINGRATE)
        MASK_IMPL_HEADERMODEON  = MODEMCONFIG1_MASK ^ (1 << FLD_IMPL_HEADERMODEON)

    MODEMCONFIG2                = $1E   'LORA
    MODEMCONFIG2_MASK           = $FF
        FLD_SPREADINGFACTOR     = 4
        FLD_TXCONTINUOUSMODE    = 3
        FLD_RXPAYLOADCRCON      = 2
        FLD_SYMBTIMEOUT_MSB     = 0
        BITS_SPREADINGFACTOR    = %1111
        BITS_SYMBTIMEOUT_MSB    = %11
        MASK_SPREADINGFACTOR    = MODEMCONFIG2_MASK ^ (BITS_SPREADINGFACTOR << FLD_SPREADINGFACTOR)
        MASK_TXCONTINUOUSMODE   = MODEMCONFIG2_MASK ^ (1 << FLD_TXCONTINUOUSMODE)
        MASK_RXPAYLOADCRCON     = MODEMCONFIG2_MASK ^ (1 << FLD_RXPAYLOADCRCON)
        MASK_SYMBTIMEOUTMSB     = MODEMCONFIG2_MASK ^ (BITS_SYMBTIMEOUT_MSB << FLD_SYMBTIMEOUT_MSB)

    SYMBTIMEOUTLSB              = $1F   'LORA
        FLD_SYMBTIMEOUT_LSB     = 0
        BITS_SYMBTIMEOUT        = %1111111111

    LORA_PREAMBLEMSB            = $20   'LORA
    LORA_PREAMBLELSB            = $21   'LORA
    LORA_PAYLOADLENGTH          = $22   'LORA
    MAXPAYLOADLENGTH            = $23   'LORA
    HOPPERIOD                   = $24   'LORA
    FIFORXBYTEADDR              = $25   'LORA

    MODEMCONFIG3                = $26   'LORA
    MODEMCONFIG3_MASK           = $0C
        FLD_LOWDATARATEOPTIMIZE = 3
        FLD_AGCAUTOON           = 2
        MASK_LOWDATARATEOPTIMIZE= MODEMCONFIG3_MASK ^ (1 << FLD_LOWDATARATEOPTIMIZE)
        MASK_AGCAUTOON          = MODEMCONFIG3_MASK ^ (1 << FLD_AGCAUTOON)

    PPMCORRECTION               = $27   'LORA
    LORA_FEIMSB                 = $28   'LORA
    LORA_FEIMID                 = $29   'LORA
    LORA_FEILSB                 = $2A   'LORA
' $2B - RESERVED
    RSSIWIDEBAND                = $2C   'LORA
' $2D..2E - RESERVED
    IFFREQ1                     = $2F   'LORA
    IFFREQ2                     = $30   'LORA
    DETECTOPTIMIZE              = $31   'LORA
' $32 - RESERVED
    INVERTIQ                    = $33   'LORA
' $34..$35 - RESERVED
    HIGHBWOPTIMIZE1             = $36   'LORA
    DETECTIONTHRESHOLD          = $37   'LORA
' $38 - RESERVED
    SYNCWORD                    = $39   'LORA
    HIGHBWOPTIMIZE2             = $3A   'LORA
    INVERTIQ2                   = $3B
' $3C..$3F - RESERVED

PUB Null
' This is not a top-level object
