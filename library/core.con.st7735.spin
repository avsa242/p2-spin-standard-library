{
    --------------------------------------------
    Filename: core.con.st7735.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started Mar 07, 2020
    Updated Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    CPOL                        = 0
    SCK_DELAY                   = 1
    SCK_MAX_FREQ                = 15_151_515    ' According to datasheet; seems to work fine at 20MHz, though
    MOSI_BITORDER               = 5             'MSBFIRST
    MISO_BITORDER               = 0             'MSBPRE

    FOSC                        = 625_000       ' Display controller oscillator freq
' Register definitions
    NOOP                        = $00
    SOFT_RESET                  = $01
    RDDID                       = $04
    RDDST                       = $09
    RDDPM                       = $0A
    RDD_MADCTL                  = $0B
    RDD_COLMOD                  = $0C
    RDDIM                       = $0D
    RDDSM                       = $0E
    SLPIN                       = $10
    SLPOUT                      = $11
    PTLON                       = $12
    NORON                       = $13
    INVOFF                      = $20
    INVON                       = $21
    GAMSET                      = $26
    DISPOFF                     = $28
    DISPON                      = $29
    CASET                       = $2A
    RASET                       = $2B
    RAMWR                       = $2C
    RGBSET                      = $2D
    RAMRD                       = $2E
    PTLAR                       = $30
    TEOFF                       = $34
    TEON                        = $35

    MADCTL                      = $36
    MADCTL_MASK                 = $FC
        FLD_MY                  = 7
        FLD_MX                  = 6
        FLD_MV                  = 5
        FLD_ML                  = 4
        FLD_RGB                 = 3
        FLD_MH                  = 2
        MASK_MY                 = MADCTL_MASK ^ (1 << FLD_MY)
        MASK_MX                 = MADCTL_MASK ^ (1 << FLD_MX)
        MASK_MV                 = MADCTL_MASK ^ (1 << FLD_MV)
        MASK_ML                 = MADCTL_MASK ^ (1 << FLD_ML)
        MASK_RGB                = MADCTL_MASK ^ (1 << FLD_RGB)
        MASK_MH                 = MADCTL_MASK ^ (1 << FLD_MH)

    IDMOFF                      = $38
    IDMON                       = $39

    COLMOD                      = $3A
    COLMOD_MASK                 = $07
        FLD_IFPF                = 0
        BITS_IFPF               = %111

    FRMCTR1                     = $B1
        FLD_RTNA                = 0
        FLD_FPA                 = 0
        FLD_BPA                 = 0
        BITS_RTNA               = %1111
        BITS_FPA                = %111111
        BITS_BPA                = %111111

    FRMCTR2                     = $B2

    FRMCTR3                     = $B3

    INVCTR                      = $B4
        FLD_NL                  = 0
        FLD_NLC                 = 0
        FLD_NLB                 = 1
        FLD_NLA                 = 2

    DISSET5                     = $B6
        FLD_EQ                  = 0
        FLD_SDT                 = 2
        FLD_NO                  = 4
        FLD_PT                  = 0
        FLTD_PTG                = 2
        BITS_EQ                 = %11
        BITS_SDT                = %11
        BITS_NO                 = %11
        BITS_PT                 = %11
        BITS_PTG                = %11

    PWCTR1                      = $C0
        FLD_VRHP                = 0
        FLD_AVDD                = 5
        FLD_VRHN                = 0
        FLD_MODE                = 6
        BITS_VRHP               = %11111
        BITS_AVDD               = %111
        BITS_VRHN               = %11111
        BITS_MODE               = %11
        MASK_VRHP               = $FF ^ (BITS_VRHP << FLD_VRHP)
        MASK_AVDD               = $FF ^ (BITS_AVDD << FLD_AVDD)

    PWCTR2                      = $C1
        FLD_VGHBT               = 0
        FLD_VGLSEL              = 2
        FLD_VGH25               = 6
        BITS_VGHBT              = %11
        BITS_VGLSEL             = %11
        BITS_VGH25              = %11
        MASK_VGHBT              = $CF ^ (BITS_VGHBT << FLD_VGHBT)
        MASK_VGLSEL             = $CF ^ (BITS_VGLSEL << FLD_VGLSEL)
        MASK_VGH25              = $CF ^ (BITS_VGH25 << FLD_VGH25)

    PWCTR3                      = $C2
        FLD_AP                  = 0                                     ' These apply to PWCTR4 and 5, as well
        FLD_SAP                 = 3
        FLD_DCMSB               = 6
        FLD_DCLSB               = 0
        BITS_AP                 = %111
        BITS_SAP                = %111
        BITS_DCMSB              = %11
        BITS_DCLSB              = %11111111
        MASK_AP                 = $FF ^ (BITS_AP << FLD_AP)
        MASK_SAP                = $FF ^ (BITS_SAP << FLD_SAP)
        MASK_DCMSB              = $FF ^ (BITS_DCMSB << FLD_DCMSB)

    PWCTR4                      = $C3
    PWCTR5                      = $C4

    VMCTR1                      = $C5
    VMCTR1_MASK                 = $3F
        FLD_VCOMS               = 0
        BITS_VCOMS              = %111111

    VMOFCTR                     = $C7
    VMOFCTR_MASK                = $1F
        FLD_VMF                 = 0
        BITS_VMF                = %11111

'   WRID2                       = $D1
'   WRID3                       = $D2

'   NVCTR1                      = $D9

    RDID1                       = $DA
    RDID2                       = $DB
    RDID3                       = $DC
'   NVCTR2                      = $DE
'   NVCTR3                      = $DF

    GMCTRP1                     = $E0

    GMCTRN1                     = $E1

    PWCTR6                      = $FC

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
