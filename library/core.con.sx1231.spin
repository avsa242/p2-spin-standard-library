{
    --------------------------------------------
    Filename: core.con.sx1231.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Apr 19, 2019
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                        = 0
    CLK_DELAY                   = 10
    SCK_MAX_FREQ                = 10_000_000
    MOSI_BITORDER               = 5             'MSBFIRST
    MISO_BITORDER               = 0             'MSBPRE

    W                           = 1 << 7        ' wnr bit (Write access)

' Register definitions
    FIFO                        = $00

    OPMODE                      = $01
    OPMODE_MASK                 = $FC
        FLD_SEQUENCEROFF        = 7
        FLD_LISTENON            = 6
        FLD_LISTENABORT         = 5
        FLD_MODE                = 2
        BITS_MODE               = %111
        MASK_SEQUENCEROFF       = OPMODE_MASK ^ (1 << FLD_SEQUENCEROFF)
        MASK_LISTENON           = OPMODE_MASK ^ (1 << FLD_LISTENON)
        MASK_LISTENABORT        = OPMODE_MASK ^ (1 << FLD_LISTENABORT)
        MASK_MODE               = OPMODE_MASK ^ (BITS_MODE << FLD_MODE)

    DATAMODUL                   = $02
    DATAMODUL_MASK              = $6B
        FLD_DATAMODE            = 5
        FLD_MODULATIONTYPE      = 3
        FLD_MODULATIONSHAPING   = 0
        BITS_DATAMODE           = %11
        BITS_MODULATIONTYPE     = %01
        BITS_MODULATIONSHAPING  = %11
        MASK_DATAMODE           = DATAMODUL_MASK ^ (BITS_DATAMODE << FLD_DATAMODE)
        MASK_MODULATIONTYPE     = DATAMODUL_MASK ^ (BITS_MODULATIONTYPE << FLD_MODULATIONTYPE)
        MASK_MODULATIONSHAPING  = DATAMODUL_MASK ^ (BITS_MODULATIONSHAPING << FLD_MODULATIONSHAPING)

    BITRATEMSB                  = $03
    BITRATELSB                  = $04
        BITS_BITRATE            = $FFFF

    FDEVMSB                     = $05
    FDEVLSB                     = $06
        BITS_FDEV               = $3FFF

    FRFMSB                      = $07
    FRFMID                      = $08
    FRFLSB                      = $09
        BITS_FRF                = $FF_FF_FF

    OSC1                        = $0A
    OSC1_MASK                   = $80
        FLD_RCCALSTART          = 7
        FLD_RCCALDONE           = 6

    AFCCTRL                     = $0B
    AFCCTRL_MASK                = $20
        FLD_AFCLOWBETAON        = 5

    LOWBAT                      = $0C
    LOWBAT_MASK                 = $1F
        FLD_LOWBATMONITOR       = 4
        FLD_LOWBATON            = 3
        FLD_LOWBATTRIM          = 0
        BITS_LOWBATTRIM         = %111
        MASK_LOWBATMONITOR      = LOWBAT_MASK ^ (1 << FLD_LOWBATMONITOR)
        MASK_LOWBATON           = LOWBAT_MASK ^ (1 << FLD_LOWBATON)
        MASK_LOWBATTRIM         = LOWBAT_MASK ^ (BITS_LOWBATTRIM << FLD_LOWBATTRIM)

    LISTEN1                     = $0D
    LISTEN2                     = $0E
    LISTEN3                     = $0F

    VERSION                     = $10

    PALEVEL                     = $11
    PALEVEL_MASK                = $FF
        FLD_PA0ON               = 7
        FLD_PA1ON               = 6
        FLD_PA2ON               = 5
        FLD_OUTPUTPOWER         = 0
        BITS_PA012              = %111
        BITS_OUTPUTPOWER        = %11111
        MASK_PA0ON              = PALEVEL_MASK ^ (1 << FLD_PA0ON)
        MASK_PA1ON              = PALEVEL_MASK ^ (1 << FLD_PA1ON)
        MASK_PA2ON              = PALEVEL_MASK ^ (1 << FLD_PA2ON)
        MASK_PA012ON            = PALEVEL_MASK ^ (BITS_PA012 << FLD_PA0ON)
        MASK_OUTPUTPOWER        = PALEVEL_MASK ^ (BITS_OUTPUTPOWER << FLD_OUTPUTPOWER)

    PARAMP                      = $12
    PARAMP_MASK                 = $0F
        FLD_PARAMP              = 0
        BITS_PARAMP             = %1111

    OCP                         = $13
    OCP_MASK                    = $1F
        FLD_OCPON               = 4
        FLD_OCPTRIM             = 0
        BITS_OCPTRIM            = %1111
        MASK_OCPON              = OCP_MASK ^ (1 << FLD_OCPON)
        MASK_OCPTRIM            = OCP_MASK ^ (BITS_OCPTRIM << FLD_OCPTRIM)

    LNA                         = $18
    LNA_MASK                    = $BF
        FLD_LNAZIN              = 7
        FLD_LNACURRENTGAIN      = 3
        FLD_LNAGAINSELECT       = 0
        BITS_LNACURRENTGAIN     = %111
        BITS_LNAGAINSELECT      = %111
        MASK_LNAZIN             = LNA_MASK ^ (1 << FLD_LNAZIN)
        MASK_LNACURRENTGAIN     = LNA_MASK ^ (BITS_LNACURRENTGAIN << FLD_LNACURRENTGAIN)
        MASK_LNAGAINSELECT      = LNA_MASK ^ (BITS_LNAGAINSELECT<< FLD_LNAGAINSELECT)

    RXBW                        = $19
    RXBW_MASK                   = $FF
        FLD_DCCFREQ             = 5
        FLD_RXBWMANT            = 3
        FLD_RXBWEXP             = 0
        FLD_RXBW                = 0
        BITS_DCCFREQ            = %111
        BITS_RXBWMANT           = %11
        BITS_RXBWEXP            = %111
        BITS_RXBW               = %11111
        MASK_DCCFREQ            = RXBW_MASK ^ (BITS_DCCFREQ << FLD_DCCFREQ)
        MASK_RXBWMANT           = RXBW_MASK ^ (BITS_RXBWMANT << FLD_RXBWMANT)
        MASK_RXBWEXP            = RXBW_MASK ^ (BITS_RXBWEXP << FLD_RXBWEXP)
        MASK_RXBW               = RXBW_MASK ^ (BITS_RXBW << FLD_RXBW)

    AFCBW                       = $1A
    OOKPEAK                     = $1B
    OOKAVG                      = $1C
    OOKFIX                      = $1D

    AFCFEI                      = $1E
    AFCFEI_MASK                 = $7F
        FLD_FEIDONE             = 6     'R/O
        FLD_FEISTART            = 5     'W/O
        FLD_AFCDONE             = 4     'R/O
        FLD_AFCAUTOCLEARON      = 3     'R/W
        FLD_AFCAUTOON           = 2     'R/W
        FLD_AFCCLEAR            = 1     'W/O
        FLD_AFCSTART            = 0     'W/O
        MASK_FEIDONE            = AFCFEI_MASK ^ (1 << FLD_FEIDONE)
        MASK_FEISTART           = AFCFEI_MASK ^ (1 << FLD_FEISTART)
        MASK_AFCDONE            = AFCFEI_MASK ^ (1 << FLD_AFCDONE)
        MASK_AFCAUTOCLEARON     = AFCFEI_MASK ^ (1 << FLD_AFCAUTOCLEARON)
        MASK_AFCAUTOON          = AFCFEI_MASK ^ (1 << FLD_AFCAUTOON)
        MASK_AFCCLEAR           = AFCFEI_MASK ^ (1 << FLD_AFCCLEAR)
        MASK_AFCSTART           = AFCFEI_MASK ^ (1 << FLD_AFCSTART)

    AFCMSB                      = $1F
    AFCLSB                      = $20
    FEIMSB                      = $21
    FEILSB                      = $22
    RSSICONFIG                  = $23
    RSSIVALUE                   = $24
    DIOMAPPING1                 = $25
    DIOMAPPING2                 = $26

    IRQFLAGS1                   = $27

    IRQFLAGS2                   = $28
    IRQFLAGS2_MASK              = $FF
        FLD_FIFOFULL            = 7
        FLD_FIFONOTEMPTY        = 6
        FLD_FIFOLEVEL           = 5
        FLD_FIFOOVERRUN         = 4
        FLD_PACKETSENT          = 3
        FLD_PAYLOADREADY        = 2
        FLD_CRCOK               = 1
        FLD_LOWBAT              = 0

    RSSITHRESH                  = $29
    RXTIMEOUT1                  = $2A
    RXTIMEOUT2                  = $2B
    PREAMBLEMSB                 = $2C
    PREAMBLELSB                 = $2D

    SYNCCONFIG                  = $2E
    SYNCCONFIG_MASK             = $FF
        FLD_SYNCON              = 7
        FLD_FIFOFILLCONDITION   = 6
        FLD_SYNCSIZE            = 3
        FLD_SYNCTOL             = 0
        BITS_SYNCSIZE           = %111
        BITS_SYNCTOL            = %111
        MASK_SYNCON             = SYNCCONFIG_MASK ^ (1 << FLD_SYNCON)
        MASK_FIFOFILLCONDITION  = SYNCCONFIG_MASK ^ (1 << FLD_FIFOFILLCONDITION)
        MASK_SYNCSIZE           = SYNCCONFIG_MASK ^ (BITS_SYNCSIZE << FLD_SYNCSIZE)
        MASK_SYNCTOL            = SYNCCONFIG_MASK ^ (BITS_SYNCTOL << FLD_SYNCTOL)

    #$2F, SYNCVALUE1, SYNCVALUE2, SYNCVALUE3, SYNCVALUE4, SYNCVALUE5, SYNCVALUE6, SYNCVALUE7, SYNCVALUE8

    PACKETCONFIG1               = $37
    PACKETCONFIG1_MASK          = $FE
        FLD_PACKETFORMAT        = 7
        FLD_DCFREE              = 5
        FLD_CRCON               = 4
        FLD_CRCAUTOCLEAROFF     = 3
        FLD_ADDRESSFILTERING    = 1
        BITS_DCFREE             = %11
        BITS_ADDRESSFILTERING   = %11
        MASK_PACKETFORMAT       = PACKETCONFIG1_MASK ^ (1 << FLD_PACKETFORMAT)
        MASK_DCFREE             = PACKETCONFIG1_MASK ^ (BITS_DCFREE << FLD_DCFREE)
        MASK_CRCON              = PACKETCONFIG1_MASK ^ (1 << FLD_CRCON)
        MASK_CRCAUTOCLEAROFF    = PACKETCONFIG1_MASK ^ (1 << FLD_CRCAUTOCLEAROFF)
        MASK_ADDRESSFILTERING   = PACKETCONFIG1_MASK ^ (BITS_ADDRESSFILTERING << FLD_ADDRESSFILTERING)

    PAYLOADLENGTH               = $38

    NODEADRS                    = $39
    BROADCASTADRS               = $3A

    AUTOMODES                   = $3B
    AUTOMODES_MASK              = $FF
        FLD_ENTERCONDITION      = 5
        FLD_EXITCONDITION       = 2
        FLD_INTERMEDIATEMODE    = 0
        BITS_ENTERCONDITION     = %111
        BITS_EXITCONDITION      = %111
        BITS_INTERMEDIATEMODE   = %11
        MASK_ENTERCONDITION     = AUTOMODES_MASK ^ (BITS_ENTERCONDITION << FLD_ENTERCONDITION)
        MASK_EXITCONDITION      = AUTOMODES_MASK ^ (BITS_EXITCONDITION << FLD_EXITCONDITION)
        MASK_INTERMEDIATEMODE   = AUTOMODES_MASK ^ (BITS_INTERMEDIATEMODE << FLD_INTERMEDIATEMODE)

    FIFOTHRESH                  = $3C
    FIFOTHRESH_MASK             = $FF
        FLD_TXSTARTCONDITION    = 7
        FLD_FIFOTHRESHOLD       = 0
        BITS_FIFOTHRESHOLD      = %1111111
        MASK_TXSTARTCONDITION   = FIFOTHRESH_MASK ^ (1 << FLD_TXSTARTCONDITION)
        MASK_FIFOTHRESHOLD      = FIFOTHRESH_MASK ^ (BITS_FIFOTHRESHOLD << FLD_FIFOTHRESHOLD)

    PACKETCONFIG2               = $3D
    PACKETCONFIG2_MASK          = $F7
        FLD_INTERPACKETDELAY    = 4
        FLD_RESTARTRX           = 2
        FLD_AUTORESTARTRXON     = 1
        FLD_AESON               = 0
        BITS_INTERPACKETDELAY   = %1111
        MASK_INTERPACKETDELAY   = PACKETCONFIG2_MASK ^ (BITS_INTERPACKETDELAY << FLD_INTERPACKETDELAY)
        MASK_RESTARTRX          = PACKETCONFIG2_MASK ^ (1 << FLD_RESTARTRX)
        MASK_AUTORESTARTRXON    = PACKETCONFIG2_MASK ^ (1 << FLD_AUTORESTARTRXON)
        MASK_AESON              = PACKETCONFIG2_MASK ^ (1 << FLD_AESON)

    #$3E, AESKEY1, AESKEY2, AESKEY3, AESKEY4, AESKEY5, AESKEY6, AESKEY7, AESKEY8, {
}         AESKEY9, AESKEY10, AESKEY11, AESKEY12, AESKEY13, AESKEY14, AESKEY15, AESKEY16

    TEMP1                       = $4E
    TEMP1_MASK                  = $0C
        FLD_TEMPMEASSTART       = 3
        FLD_TEMPMEASRUNNING     = 2

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
