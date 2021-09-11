{
    --------------------------------------------
    Filename: core.con.sx1231.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started Apr 19, 2019
    Updated Aug 22, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ                = 10_000_000
    SPI_MODE                    = 0

    T_POR                       = 10_000        ' uSec
    T_RESACTIVE                 = 100
    T_RES                       = 5_000

    SPI_WR                      = 1 << 7        ' wnr bit (Write access)

' Register definitions
    FIFO                        = $00

    OPMODE                      = $01
    OPMODE_MASK                 = $FC
        SEQOFF                  = 7
        LISTENON                = 6
        LISTENABT               = 5
        MODE                    = 2
        MODE_BITS               = %111
        SEQOFF_MASK             = (1 << SEQOFF) ^ OPMODE_MASK
        LISTENON_MASK           = (1 << LISTENON) ^ OPMODE_MASK
        LISTENABT_MASK          = (1 << LISTENABT) ^ OPMODE_MASK
        MODE_MASK               = (MODE_BITS << MODE) ^ OPMODE_MASK

    DATAMOD                     = $02
    DATAMOD_MASK                = $6B
        DATAMODE                = 5
        MODTYPE                 = 3
        MODSHP                  = 0
        DATAMODE_BITS           = %11
        MODTYPE_BITS            = %11
        MODSHP_BITS             = %11
        DATAMODE_MASK           = (DATAMODE_BITS << DATAMODE) ^ DATAMOD_MASK
        MODTYPE_MASK            = (MODTYPE_BITS << MODTYPE) ^ DATAMOD_MASK
        MODSHP_MASK             = MODSHP_BITS ^ DATAMOD_MASK

    BITRATEMSB                  = $03
    BITRATELSB                  = $04
        BITRATE_MASK            = $FFFF

    FDEVMSB                     = $05
    FDEVLSB                     = $06
        FDEV_MASK               = $3FFF

    FRFMSB                      = $07
    FRFMID                      = $08
    FRFLSB                      = $09
        FRF_MASK                = $FF_FF_FF

    OSC1                        = $0A
    OSC1_MASK                   = $81
        RCCALSTART              = 7             ' W/O
        RCCALDONE               = 6             ' R/O
        OSC1_RSVD               = %000001
        RCCALSTART_MASK         = (1 << RCCALSTART) ^ OSC1_MASK

    AFCCTRL                     = $0B
    AFCCTRL_MASK                = $20
        AFCLOWBETAON            = 5
        AFCLOWBETAON_MASK       = (1 << AFCLOWBETAON) ^ AFCCTRL_MASK

    LOWBAT                      = $0C
    LOWBAT_MASK                 = $1F
        LOWBATMON               = 4
        LOWBATON                = 3
        LOWBATTRIM              = 0
        LOWBATTRIM_BITS         = %111
        LOWBATMON_MASK          = (1 << LOWBATMON) ^ LOWBAT_MASK
        LOWBATON_MASK           = (1 << LOWBATON) ^ LOWBAT_MASK
        LOWBATTRIM_MASK         = LOWBATTRIM_BITS ^ LOWBAT_MASK

    LISTEN1                     = $0D
    LISTEN2                     = $0E
    LISTEN3                     = $0F

    VERSION                     = $10

    PALVL                       = $11
    PALVL_MASK                  = $FF
        PA0ON                   = 7
        PA1ON                   = 6
        PA2ON                   = 5
        OUTPWR                  = 0
        PA012_BITS              = %111
        OUTPWR_BITS             = %11111
        PA0ON_MASK              = (1 << PA0ON) ^ PALVL_MASK
        PA1ON_MASK              = (1 << PA1ON) ^ PALVL_MASK
        PA2ON_MASK              = (1 << PA2ON) ^ PALVL_MASK
        PA012ON_MASK            = (PA012_BITS << PA2ON) ^ PALVL_MASK
        OUTPWR_MASK             = OUTPWR_BITS ^ PALVL_MASK

    PARAMP                      = $12
    PARAMP_MASK                 = $0F
        PA_RAMP                 = 0
        PA_RAMP_BITS            = %1111

    OCP                         = $13
    OCP_MASK                    = $1F
        OCPON                   = 4
        OCPTRIM                 = 0
        OCPTRIM_BITS            = %1111
        OCPON_MASK              = (1 << OCPON) ^ OCP_MASK
        OCPTRIM_MASK            = OCPTRIM_BITS ^ OCP_MASK

    LNA                         = $18
    LNA_MASK                    = $BF
        LNAZIN                  = 7
        LNACURRGAIN             = 3
        LNAGAINSEL              = 0
        LNACURRGAIN_BITS        = %111
        LNAGAINSEL_BITS         = %111
        LNAZIN_MASK             = (1 << LNAZIN) ^ LNA_MASK
        LNACURRGAIN_MASK        = (LNACURRGAIN_BITS << LNACURRGAIN) ^ LNA_MASK
        LNAGAINSEL_MASK         = LNAGAINSEL_BITS ^ LNA_MASK

    RXBW                        = $19
    RXBW_MASK                   = $FF
        DCCFREQ                 = 5
        RXBWMANT                = 3
        RXBWEXP                 = 0
        RX_BW                   = 0
        DCCFREQ_BITS            = %111
        RXBWMANT_BITS           = %11
        RXBWEXP_BITS            = %111
        RX_BW_BITS              = %11111
        DCCFREQ_MASK            = (DCCFREQ_BITS << DCCFREQ) ^ RXBW_MASK
        RXBWMANT_MASK           = (RXBWMANT_BITS << RXBWMANT) ^ RXBW_MASK
        RXBWEXP_MASK            = (RXBWEXP_BITS << RXBWEXP) ^ RXBW_MASK
        RX_BW_MASK              = RX_BW_BITS ^ RXBW_MASK

    AFCBW                       = $1A
    OOKPEAK                     = $1B
    OOKAVG                      = $1C
    OOKFIX                      = $1D

    AFCFEI                      = $1E
    AFCFEI_MASK                 = $7F
        FEIDONE                 = 6     'R/O
        FEISTART                = 5     'W/O
        AFCDONE                 = 4     'R/O
        AFCAUTOCLRON            = 3     'R/W
        AFCAUTOON               = 2     'R/W
        AFCCLR                  = 1     'W/O
        AFCSTART                = 0     'W/O
        FEIDONE_MASK            = (1 << FEIDONE) ^ AFCFEI_MASK
        FEISTART_MASK           = (1 << FEISTART) ^ AFCFEI_MASK
        AFCDONE_MASK            = (1 << AFCDONE) ^ AFCFEI_MASK
        AFCAUTOCLRON_MASK       = (1 << AFCAUTOCLRON) ^ AFCFEI_MASK
        AFCAUTOON_MASK          = (1 << AFCAUTOON) ^ AFCFEI_MASK
        AFCCLR_MASK             = (1 << AFCCLR) ^ AFCFEI_MASK
        AFCSTART_MASK           = 1 ^ AFCFEI_MASK

    AFCMSB                      = $1F
    AFCLSB                      = $20
    FEIMSB                      = $21
    FEILSB                      = $22

    RSSICFG                     = $23
        RSSIDONE                = %10

    RSSIVALUE                   = $24

    DIOMAP1                     = $25
    DIOMAP1_MASK                = $FF
        DIO0                    = 6
        DIO1                    = 4
        DIO2                    = 2
        DIO3                    = 0
        DIO_BITS                = %11           ' used for all DIOx fields
        DIO0_MASK               = (DIO_BITS << DIO0) ^ DIOMAP1_MASK
        DIO1_MASK               = (DIO_BITS << DIO1) ^ DIOMAP1_MASK
        DIO2_MASK               = (DIO_BITS << DIO2) ^ DIOMAP1_MASK
        DIO3_MASK               = (DIO_BITS << DIO3) ^ DIOMAP1_MASK

    DIOMAP2                     = $26
    DIOMAP2_MASK                = $F7
        DIO4                    = 6
        DIO5                    = 4
        CLKOUT                  = 0
        CLKOUT_BITS             = %111
        DIO4_MASK               = (DIO_BITS << DIO4) ^ DIOMAP2_MASK
        DIO5_MASK               = (DIO_BITS << DIO5) ^ DIOMAP2_MASK
        CLKOUT_MASK             = CLKOUT_BITS ^ DIOMAP2_MASK

    IRQFLAGS1                   = $27

    IRQFLAGS2                   = $28
    IRQFLAGS2_MASK              = $FF
        FIFOFULL                = 7
        FIFONOTEMPTY            = 6
        FIFOLVL                 = 5
        FIFOOVERRUN             = 4
        PKTSENT                 = 3
        PAYLOADREADY            = 2
        CRCOK                   = 1
        LOWBATT                 = 0

    RSSITHRESH                  = $29
    RXTIMEOUT1                  = $2A
    RXTIMEOUT2                  = $2B
    PREAMBLEMSB                 = $2C
    PREAMBLELSB                 = $2D

    SYNCCFG                     = $2E
    SYNCCFG_MASK                = $FF
        SYNCON                  = 7
        FIFOFILLCOND            = 6
        SYNCSIZE                = 3
        SYNCTOL                 = 0
        SYNCSIZE_BITS           = %111
        SYNCTOL_BITS            = %111
        SYNCON_MASK             = (1 << SYNCON) ^ SYNCCFG_MASK
        FIFOFILLCOND_MASK       = (1 << FIFOFILLCOND) ^ SYNCCFG_MASK
        SYNCSIZE_MASK           = (SYNCSIZE_BITS << SYNCSIZE) ^ SYNCCFG_MASK
        SYNCTOL_MASK            = SYNCTOL_BITS ^ SYNCCFG_MASK

    #$2F, SYNCVALUE1, SYNCVALUE2, SYNCVALUE3, SYNCVALUE4, SYNCVALUE5,{
}   SYNCVALUE6, SYNCVALUE7, SYNCVALUE8

    PKTCFG1                     = $37
    PKTCFG1_MASK                = $FE
        PKTFORMAT               = 7
        DCFREE                  = 5
        CRCON                   = 4
        CRCAUTOCLROFF           = 3
        ADDRFILT                = 1
        DCFREE_BITS             = %11
        ADDRFILT_BITS           = %11
        PKTFORMAT_MASK          = (1 << PKTFORMAT) ^ PKTCFG1_MASK
        DCFREE_MASK             = (DCFREE_BITS << DCFREE) ^ PKTCFG1_MASK
        CRCON_MASK              = (1 << CRCON) ^ PKTCFG1_MASK
        CRCAUTOCLROFF_MASK      = (1 << CRCAUTOCLROFF) ^ PKTCFG1_MASK
        ADDRFILT_MASK           = ADDRFILT_BITS ^ PKTCFG1_MASK

    PAYLOADLENGTH               = $38

    NODEADRS                    = $39
    BCASTADRS                   = $3A

    AUTOMODES                   = $3B
    AUTOMODES_MASK              = $FF
        ENTCOND                 = 5
        EXITCOND                = 2
        INTMDTMODE              = 0
        ENTCOND_BITS            = %111
        EXITCOND_BITS           = %111
        INTMDTMODE_BITS         = %11
        ENTCOND_MASK            = (ENTCOND_BITS << ENTCOND) ^ AUTOMODES_MASK
        EXITCOND_MASK           = (EXITCOND_BITS << EXITCOND) ^ AUTOMODES_MASK
        INTMDTMODE_MASK         = INTMDTMODE_BITS ^ AUTOMODES_MASK

    FIFOTHRESH                  = $3C
    FIFOTHRESH_MASK             = $FF
        TXSTARTCOND             = 7
        FIFOTHRESHOLD           = 0
        FIFOTHRESHOLD_BITS      = %1111111
        TXSTARTCOND_MASK        = (1 << TXSTARTCOND) ^ FIFOTHRESH_MASK
        FIFOTHRESHOLD_MASK      = FIFOTHRESHOLD_BITS ^ FIFOTHRESH_MASK

    PKTCFG2                     = $3D
    PKTCFG2_MASK                = $F7
        INTPKTDLY               = 4
        RSTARTRX                = 2
        AUTORSTARTRXON          = 1
        AESON                   = 0
        INTPKTDLY_BITS          = %1111
        INTPKTDLY_MASK          = (INTPKTDLY_BITS << INTPKTDLY) ^ PKTCFG2_MASK
        RSTARTRX_MASK           = (1 << RSTARTRX) ^ PKTCFG2_MASK
        AUTORSTARTRXON_MASK     = (1 << AUTORSTARTRXON) ^ PKTCFG2_MASK
        AESON_MASK              = 1 ^ PKTCFG2_MASK

    #$3E, AESKEY1, AESKEY2, AESKEY3, AESKEY4, AESKEY5, AESKEY6, AESKEY7,{
}   AESKEY8, AESKEY9, AESKEY10, AESKEY11, AESKEY12, AESKEY13, AESKEY14,{
}   AESKEY15, AESKEY16

    TEMP1                       = $4E
    TEMP1_MASK                  = $0C
        TEMPMEASSTART           = 3
        TEMPMEASRUN             = 2

    TEMP2                       = $4F

    TESTLNA                     = $58
    TESTTCXO                    = $59

    TESTPA1                     = $5A
        PA1_NORMAL              = $55
        PA1_BOOST               = $5D

    TESTPA2                     = $5C
        PA2_NORMAL              = $70
        PA2_BOOST               = $7C

    TESTLLBW                    = $5F
    TESTDAGC                    = $6F

    TESTAFC                     = $71

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
