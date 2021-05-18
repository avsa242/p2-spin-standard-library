{
    --------------------------------------------
    Filename: core.con.sx1276.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Oct 6, 2019
    Updated May 18, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ                = 10_000_000
    SPI_MODE                    = 0

    WRITE                       = 1 << 7        ' OR with reg_nr to signal write

    T_POR                       = 10_000        ' usec

' General/shared functionality
    FIFO                        = $00
    OPMODE                      = $01
    OPMODE_MASK                 = $CF
        LONGRANGEMODE           = 7
        MODTYPE                 = 5
        LOWFREQMODEON           = 3
        MODE                    = 0
        MODTYPE_BITS            = %11
        MODE_BITS               = %111
        LONGRANGEMODE_MASK      = (1 << LONGRANGEMODE) ^ OPMODE_MASK
        MODTYPE_MASK            = (MODTYPE_BITS << MODTYPE) ^ OPMODE_MASK
        LOWFREQMODEON_MASK      = (1 << LOWFREQMODEON) ^ OPMODE_MASK
        MODE_MASK               = MODE_BITS ^ OPMODE_MASK

    FRFMSB                      = $06
    FRFMID                      = $07
    FRFLSB                      = $08

    PACFG                       = $09
    PACFG_MASK                  = $FF
        PASELECT                = 7
        MAXPWR                  = 4
        OUTPUTPWR               = 0
        MAXPWR_BITS             = %111
        OUTPUTPWR_BITS          = %1111
        PASELECT_MASK           = (1 << PASELECT) ^ PACFG_MASK
        MAXPWR_MASK             = (MAXPWR_BITS << MAXPWR) ^ PACFG_MASK
        OUTPUTPWR_MASK          = OUTPUTPWR_BITS ^ PACFG_MASK

    PARAMP                      = $0A
    PARAMP_MASK                 = $0F
        PA_RAMP                 = 0
        PA_RAMP_BITS            = %1111

    OCP                         = $0B
    OCP_MASK                    = $3F
        OCPON                   = 5
        OCPTRIM                 = 0
        OCPTRIM_BITS            = %11111
        OCPON_MASK              = (1 << OCPON) ^ OCP_MASK
        OCPTRIM_MASK            = OCPTRIM_BITS ^ OCP_MASK

    LNA                         = $0C
    LNA_MASK                    = $FB
        LNAGAIN                 = 5
        LNABOOSTLF              = 3
        LNABOOSTHF              = 0
        LNAGAIN_BITS            = %111
        LNABOOSTLF_BITS         = %11
        LNABOOSTHF_BITS         = %11
        LNAGAIN_MASK            = (LNAGAIN << LNAGAIN) ^ LNA_MASK
        LNABOOSTLF_MASK         = (LNABOOSTLF << LNABOOSTLF) ^ LNA_MASK
        LNABOOSTHF_MASK         = LNABOOSTHF_BITS ^ LNA_MASK

    DIOMAP1                     = $40
    DIOMAP1_MASK                = $FF
        DIO0MAP                 = 6
        DIO1MAP                 = 4
        DIO2MAP                 = 2
        DIO3MAP                 = 0
        DIO0MAP_MASK            = (1 << DIO0MAP) ^ DIOMAP1_MASK
        DIO1MAP_MASK            = (1 << DIO1MAP) ^ DIOMAP1_MASK
        DIO2MAP_MASK            = (1 << DIO2MAP) ^ DIOMAP1_MASK
        DIO3MAP_MASK            = 1 ^ DIOMAP1_MASK

    DIOMAP2                     = $41
    DIOMAP2_MASK                = $F1
        DIO4MAP                 = 6
        DIO5MAP                 = 4
        DIO4MAP_MASK            = (1 << DIO4MAP) ^ DIOMAP2_MASK
        DIO5MAP_MASK            = (1 << DIO5MAP) ^ DIOMAP2_MASK

    VERSION                     = $42
    TCXO                        = $4B

    PADAC                       = $4D
    PADAC_MASK                  = $07
        PADAC_RSVD              = 3
        PADAC_RSVD_BITS         = %11111
        PADAC_RSVD_DEF          = $10 < PADAC_RSVD
        PA_DAC                  = 0
        PA_DAC_BITS             = %111
        PA_DEF                  = %100
        PA_BOOST                = %111

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
    RXCFG                       = $0D
    RSSICFG                     = $0E
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
        RCCALSTART              = 3
        CLKOUT                  = 0
        CLKOUT_BITS             = %111
        RCCALSTART_MASK         = (1 << RCCALSTART) ^ OSC_MASK
        CLKOUT_MASK             = CLKOUT_BITS ^ OSC_MASK

    PREAMBLEMSB                 = $25
    PREAMBLELSB                 = $26
    SYNCCFG                     = $27
    SYNCVALUE1                  = $28
    SYNCVALUE2                  = $29
    SYNCVALUE3                  = $2A
    SYNCVALUE4                  = $2B
    SYNCVALUE5                  = $2C
    SYNCVALUE6                  = $2D
    SYNCVALUE7                  = $2E
    SYNCVALUE8                  = $2F
    PACKETCFG1                  = $30
    PACKETCFG2                  = $31
    PAYLDLENGTH                 = $32
    NODEADRS                    = $33
    BROADCASTADRS               = $34
    FIFOTHRESH                  = $35
    SEQCFG1                     = $36
    SEQCFG2                     = $37
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
    RXHDRCNTVALUEMSB            = $14   'LORA
    RXHDRCNTVALUELSB            = $15   'LORA
    RXPACKETCNTVALUEMSB         = $16   'LORA
    RXPACKETCNTVALUELSB         = $17   'LORA

    MDMSTAT                     = $18   'LORA
        RXCODERATE              = 5
        MDM_CLR                 = 4
        HDR_VALID               = 3
        RX_ONGOING              = 2
        SIG_SYNCD               = 1
        SIG_DETECT              = 0
        RXCODERATE_BITS         = %111
        MDMSTATUS_BITS          = %11111

    PKTSNRVALUE                 = $19   'LORA
    PKTRSSIVALUE                = $1A   'LORA
    LORA_RSSIVALUE              = $1B   'LORA

    HOPCHANNEL                  = $1C   'LORA
        PLLTIMEOUT              = 7
        CRCONPAYLD              = 6
        FHSSPRES_CHAN           = 0
        FHSSPRES_CHAN_BITS      = %111111

    MDMCFG1                     = $1D   'LORA
    MDMCFG1_MASK                = $FF
        BW                      = 4
        CODERATE                = 1
        IMPL_HDRMODEON          = 0
        BW_BITS                 = %1111
        CODERATE_BITS           = %111
        BW_MASK                 = (BW_BITS << BW) ^ MDMCFG1_MASK
        CODERATE_MASK           = (CODERATE_BITS << CODERATE) ^ MDMCFG1_MASK
        IMPL_HDRMODEON_MASK     = 1 ^ MDMCFG1_MASK

    MDMCFG2                     = $1E   'LORA
    MDMCFG2_MASK                = $FF
        SPREADFACT              = 4
        TXCONTMODE              = 3
        RXPAYLDCRCON            = 2
        SYMBTIMEOUT_MSB         = 0
        SPREADFACT_BITS         = %1111
        SYMBTIMEOUT_MSB_BITS    = %11
        SPREADFACT_MASK         = (SPREADFACT_BITS << SPREADFACT) ^ MDMCFG2_MASK
        TXCONTMODE_MASK         = (1 << TXCONTMODE) ^ MDMCFG2_MASK
        RXPAYLDCRCON_MASK       = (1 << RXPAYLDCRCON) ^ MDMCFG2_MASK
        SYMBTIMEOUTMSB_MASK     = SYMBTIMEOUT_MSB_BITS ^ MDMCFG2_MASK

    SYMBTIMEOUTLSB              = $1F   'LORA
        SYMBTIMEOUT_LSB         = 0
        SYMBTIMEOUT_BITS        = %1111111111

    LORA_PREAMBLEMSB            = $20   'LORA
    LORA_PREAMBLELSB            = $21   'LORA
    LORA_PAYLDLENGTH            = $22   'LORA
    MAXPAYLDLENGTH              = $23   'LORA
    HOPPERIOD                   = $24   'LORA
    FIFORXBYTEADDR              = $25   'LORA

    MDMCFG3                     = $26   'LORA
    MDMCFG3_MASK                = $0C
        LOWDRATEOPT             = 3
        AGCAUTOON               = 2
        LOWDRATEOPT_MASK        = (1 << LOWDRATEOPT) ^ MDMCFG3_MASK
        AGCAUTOON_MASK          = 1 ^ MDMCFG3_MASK

    PPMCORRECTION               = $27   'LORA
    LORA_FEIMSB                 = $28   'LORA
    LORA_FEIMID                 = $29   'LORA
    LORA_FEILSB                 = $2A   'LORA
' $2B - RESERVED
    RSSIWIDEBAND                = $2C   'LORA
' $2D..2E - RESERVED
    IFFREQ1                     = $2F   'LORA
    IFFREQ2                     = $30   'LORA
    DETECTOPT                   = $31   'LORA
' $32 - RESERVED
    INVERTIQ                    = $33   'LORA
' $34..$35 - RESERVED
    HIGHBWOPT1                  = $36   'LORA
    DETECTIONTHRESHOLD          = $37   'LORA
' $38 - RESERVED
    SYNCWORD                    = $39   'LORA
    HIGHBWOPT2                  = $3A   'LORA
    INVERTIQ2                   = $3B
' $3C..$3F - RESERVED

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
