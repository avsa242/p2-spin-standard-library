{
    --------------------------------------------
    Filename: core.con.ili9341.spin
    Author: Jesse Burt
    Description: ILI9341-specific constants
    Copyright (c) 2022
    Started Oct 13, 2021
    Updated Jan 15, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' Register definitions
    NOOP        = $00
    SWRESET     = $01
    RDDID       = $D3
    RDDST       = $09

    SLPIN       = $10
    SLPOUT      = $11
    PTLON       = $12
    NORON       = $13

    RDMODE      = $0A
    RDMADCTL    = $0B
    RDPIXFMT    = $0C
    RDIMGFMT    = $0D
    RDSELFDIAG  = $0F

    INVOFF      = $20
    INVON       = $21
    GAMMASET    = $26
    DISPOFF     = $28
    DISPON      = $29

    CASET       = $2A
    PASET       = $2B
    RAMWR       = $2C
    RAMRD       = $2E

    PTLAR       = $30

    MADCTL      = $36
    MADCTL_MASK = $FC
        MY      = 7
        MX      = 6
        MV      = 5
        ML      = 4
        BGR     = 3
        MH      = 2
        MY_MASK = (1 << MY) ^ MADCTL_MASK
        MX_MASK = (1 << MX) ^ MADCTL_MASK
        MV_MASK = (1 << MV) ^ MADCTL_MASK
        ML_MASK = (1 << ML) ^ MADCTL_MASK
        BGR_MASK= (1 << BGR) ^ MADCTL_MASK
        MH_MASK = (1 << MH) ^ MADCTL_MASK

    COLMOD      = $3A

' Access to below requires EXTC pin to be pulled high
    FRMCTR1     = $B1
    FRMCTR2     = $B2
    FRMCTR3     = $B3
    INVCTR      = $B4
    INVCTR_MASK = $07
        NLA     = 2
        NLB     = 1
        NLC     = 0
        INV_N   = (1 << NLA)
        INV_I   = (1 << NLB)
        INV_P   = 1

    DFUNCTR     = $B6

    ETMOD       = $B7
    ETMOD_MASK  = $07
        GON     = 2
        DTE     = 1
        GON_DTE = 1
        GAS     = 0
        GD_BITS = %11
        GON_MASK= (1 << GON) ^ ETMOD_MASK
        DTE_MASK= (1 << DTE) ^ ETMOD_MASK
        GD_MASK = (GD_BITS << GON_DTE) ^ ETMOD_MASK
        GAS_MASK= 1 ^ ETMOD_MASK
        GDR_VGH = %01 << GON_DTE
        GDR_VGL = %10 << GON_DTE
        GDR_NORM= %11 << GON_DTE

    PWCTR1      = $C0
    PWCTR2      = $C1
    PWCTR2_MASK = $17
        VGH     = 1
        VGL     = 0
        VGH_BITS= %11
        VGH_MASK= (VGH_BITS << VGH) ^ PWCTR2_MASK
        VGL_MASK= 1 ^ PWCTR2_MASK

    PWCTR3      = $C2
    PWCTR4      = $C3
    PWCTR5      = $C4
    VMCTR1      = $C5
    VMCTR2      = $C7
    VMCTR2_MASK = $FF
        NVM     = 7
        SETNVM  = (1 << NVM)

    RDID1       = $DA
    RDID2       = $DB
    RDID3       = $DC
    RDID4       = $DD

    GMCTRP1     = $E0
    GMCTRN1     = $E1

    GM3CTRL     = $F2

PUB null{}
' This is not a top-level object
    result := (0)

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

