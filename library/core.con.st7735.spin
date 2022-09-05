{
    --------------------------------------------
    Filename: core.con.st7735.spin
    Author: Jesse Burt
    Description: ST7735-specific constants
    Copyright (c) 2022
    Started Mar 07, 2020
    Updated Sep 5, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ    = 15_151_515                ' datasheet max (YMMV)
    SPI_MODE        = 0

    FOSC            = 625_000                   ' Display controller osc. freq

' D/C pin states
    CMD             = 0
    DATA            = 1

' Register definitions
    NOOP            = $00
    SOFT_RESET      = $01
    RDDID           = $04
    RDDST           = $09
    RDDPM           = $0A
    RDD_MADCTL      = $0B
    RDD_COLMOD      = $0C
    RDDIM           = $0D
    RDDSM           = $0E
    SLPIN           = $10
    SLPOUT          = $11
    PTLON           = $12
    NORON           = $13
    INVOFF          = $20
    INVON           = $21
    GAMSET          = $26
    DISPOFF         = $28
    DISPON          = $29
    CASET           = $2A
    RASET           = $2B
    RAMWR           = $2C
    RGBSET          = $2D
    RAMRD           = $2E
    PTLAR           = $30
    TEOFF           = $34
    TEON            = $35

    MADCTL          = $36
    MADCTL_MASK     = $FC
        MY          = 7
        MX          = 6
        MV          = 5
        ML          = 4
        RGB         = 3
        MH          = 2
        MY_MASK     = (1 << MY) ^ MADCTL_MASK
        MX_MASK     = (1 << MX) ^ MADCTL_MASK
        MV_MASK     = (1 << MV) ^ MADCTL_MASK
        ML_MASK     = (1 << ML) ^ MADCTL_MASK
        RGB_MASK    = (1 << RGB) ^ MADCTL_MASK
        MH_MASK     = (1 << MH) ^ MADCTL_MASK

    IDMOFF          = $38
    IDMON           = $39

    COLMOD          = $3A
    COLMOD_MASK     = $07
        IFPF        = 0
        IFPF_BITS   = %111

    FRMCTR1         = $B1
        RTNA        = 0
        FPA         = 0
        BPA         = 0
        RTNA_BITS   = %1111
        FPA_BITS    = %111111
        BPA_BITS    = %111111

    FRMCTR2         = $B2

    FRMCTR3         = $B3

    INVCTR          = $B4
        NLA         = 2
        NLB         = 1
        NLC         = 0
        NL          = 0

    DISSET5         = $B6
'-- cmd byte 1
        NO          = 4
        SDT         = 2
        EQ          = 0
        NO_BITS     = %11
        SDT_BITS    = %11
        EQ_BITS     = %11
'-- cmd byte 2
        PTG         = 2
        PT          = 0
        PTG_BITS    = %11
        PT_BITS     = %11

    PWCTR1          = $C0
    PWCTR1_MASK     = $FF
'-- cmd byte 1
        AVDD        = 5
        VRHP        = 0
        AVDD_BITS   = %111
        VRHP_BITS   = %11111
        AVDD_MASK   = (AVDD_BITS << AVDD) ^ PWCTR1_MASK
        VRHP_MASK   = VRHP_BITS ^ PWCTR1_MASK
'-- cmd byte 2
        VRHN        = 0
        VRHN_BITS   = %11111
'-- cmd byte 3
        MODE        = 6
        MODE_BITS   = %11

    PWCTR2          = $C1
    PWCTR2_MASK     = $CF
        VGH25       = 6
        VGLSEL      = 2
        VGHBT       = 0
        VGH25_BITS  = %11
        VGLSEL_BITS = %11
        VGHBT_BITS  = %11
        VGH25_MASK  = (VGH25_BITS << VGH25) ^ PWCTR2_MASK
        VGLSEL_MASK = (VGLSEL_BITS << VGLSEL) ^ PWCTR2_MASK
        VGHBT_MASK  = VGHBT_BITS ^ PWCTR2_MASK

    PWCTR3          = $C2
    PWCTR345_MASK   = $FF                       ' for each one of A, B, C
'-- cmd byte 1                                  '
        DCMSB       = 6                         '
        SAP         = 3                         ' (PWCTR3, 4, 5)
        AP          = 0                         '
        DCMSB_BITS  = %11                       '
        SAP_BITS    = %111                      '
        AP_BITS     = %111                      '
        DCMSB_MASK  = (DCMSB_BITS << DCMSB) ^ PWCTR345_MASK
        SAP_MASK    = (SAP_BITS << SAP) ^ PWCTR345_MASK
        AP_MASK     = AP_BITS ^ PWCTR345_MASK
'-- cmd byte 2
        DCLSB       = 0
        DCLSB_BITS  = %11111111

    PWCTR4          = $C3
    PWCTR5          = $C4

    VMCTR1          = $C5
    VMCTR1_MASK     = $3F
        VCOMS       = 0
        VCOMS_BITS  = %111111

    VMOFCTR         = $C7
    VMOFCTR_MASK    = $1F
        VMF         = 0
        VMF_BITS    = %11111

'   WRID2           = $D1
'   WRID3           = $D2

'   NVCTR1          = $D9

    RDID1           = $DA
    RDID2           = $DB
    RDID3           = $DC
'   NVCTR2          = $DE
'   NVCTR3          = $DF

    GMCTRP1         = $E0

    GMCTRN1         = $E1

    PWCTR6          = $FC

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

