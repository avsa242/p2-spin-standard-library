{
    --------------------------------------------
    Filename: core.con.mma8452q.spin
    Author: Jesse Burt
    Description: MMA8452Q-specific constants
    Copyright (c) 2021
    Started May 9, 2021
    Updated Nov 8, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ        = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR          = $1C << 1                  ' 7-bit format slave address
    T_POR               = 2_000                     ' startup time (usecs)

    DEVID_RESP          = $2A                       ' device ID expected response

' Register definitions
    STATUS              = $00
        ZYXOW           = 7
        ZOW             = 6
        YOW             = 5
        XOW             = 4
        ZYXDR           = 3
        ZDR             = 2
        YDR             = 1
        XDR             = 0
        ZYX_OW          = 1 << ZYXOW
        ZYX_DR          = 1 << ZYXDR

    OUT_X_MSB           = $01
    OUT_X_LSB           = $02
    OUT_Y_MSB           = $03
    OUT_Y_LSB           = $04
    OUT_Z_MSB           = $05
    OUT_Z_LSB           = $06

    SYSMOD              = $0B
    INT_SOURCE          = $0C
    WHO_AM_I            = $0D

    XYZ_DATA_CFG        = $0E
    XYZ_DATA_CFG_MASK   = $13
        HPF_OUT         = 4
        FS              = 0
        FS_BITS         = %11
        HPF_OUT_MASK    = (1 << HPF_OUT) ^ XYZ_DATA_CFG_MASK
        FS_MASK         = FS_BITS ^ XYZ_DATA_CFG_MASK

    HP_FILT_CUTOFF      = $0F
    HP_FILT_CUTOFF_MASK = $33
        PLS_HPF_BYP     = 5
        PLS_LPF_EN      = 4
        SEL             = 0
        SEL_BITS        = %11
        PLS_HPF_BYP_MASK= (1 << PLS_HPF_BYP) ^ HP_FILT_CUTOFF_MASK
        PLS_LPF_EN_MASK = (1 << PLS_LPF_EN) ^ HP_FILT_CUTOFF_MASK
        SEL_MASK        = SEL_BITS ^ HP_FILT_CUTOFF_MASK

    PL_STATUS           = $10
    PL_STATUS_MASK      = $C7
        NEWLP           = 7
        LO              = 6
        LAPO            = 1
        BAFRO           = 0
        LAPO_BITS       = %11
        LAPOBAFRO_BITS  = %111
        PORT_UP         = %00
        PORT_DN         = %01
        LAND_RT         = %10
        LAND_LT         = %11
        FRONT           = %0
        BACK            = %1

    PL_CFG              = $11
    PL_CFG_MASK         = $C0
        PDBCNTM         = 7
        PL_EN           = 6
        PDBCNTM_MASK    = (1 << PDBCNTM) ^ PL_CFG_MASK
        PL_EN_MASK      = 1 ^ PL_CFG_MASK

    PL_COUNT            = $12
    PL_BF_ZCOMP         = $13
    P_L_THS_REG         = $14

    FF_MT_CFG           = $15
    FF_MT_CFG_MASK      = $F8
        FELE            = 7
        FOAE            = 6
        FZEFE           = 5
        FYEFE           = 4
        FXEFE           = 3
        FEFE            = 3
        FEFE_BITS       = %111
        FELE_MASK       = (1 << FELE) ^ FF_MT_CFG_MASK
        FOAE_MASK       = (1 << FOAE) ^ FF_MT_CFG_MASK
        FEFE_MASK       = FEFE_BITS ^ FF_MT_CFG_MASK

    FF_MT_SRC           = $16
    FF_MT_SRC_MASK      = $BF
        FEA             = 7
        ZHE             = 5
        ZHP             = 4
        YHE             = 3
        YHP             = 2
        XHE             = 1
        XHP             = 0

    FF_MT_THS           = $17
    FF_MT_THS_MASK      = $FF
        FDBCNTM         = 7
        FF_THS          = 0
        FF_THS_BITS     = %1111111
        FDBCNTM_MASK    = (1 << FDBCNTM) ^ FF_MT_THS_MASK
        FF_THS_MASK     = FF_THS_BITS ^ FF_MT_THS_MASK

    FF_MT_CNT           = $18

    TRANSIENT_CFG       = $1D
    TRANSIENT_CFG_MASK  = $3F
        TELE            = 4
        ZTEFE           = 3
        YTEFE           = 2
        XTEFE           = 1
        TEFE            = 1
        HPF_BYP         = 0
        TEFE_BITS       = %111
        TELE_MASK       = (1 << TELE) ^ TRANSIENT_CFG_MASK
        ZTEFE_MASK      = (1 << ZTEFE) ^ TRANSIENT_CFG_MASK
        YTEFE_MASK      = (1 << YTEFE) ^ TRANSIENT_CFG_MASK
        XTEFE_MASK      = (1 << XTEFE) ^ TRANSIENT_CFG_MASK
        TEFE_MASK       = (TEFE_BITS << ZTEFE) ^ TRANSIENT_CFG_MASK
        HPF_BYP_MASK    = 1 ^ TRANSIENT_CFG_MASK

    TRANSIENT_SRC       = $1E
    TRANSIENT_THS       = $1F
    TRANSIENT_THS_MASK  = $FF
        TDBCNTM         = 7
        THS             = 0
        THS_BITS        = %1111111
        TDBCNTM_MASK    = (1 << TDBCNTM) ^ TRANSIENT_THS_MASK
        THS_MASK        = THS_BITS ^ TRANSIENT_THS_MASK

    TRANSIENT_CNT       = $20

    PULSE_CFG           = $21
    PULSE_CFG_MASK      = $FF
        DPA             = 7
        ELE             = 6
        ZDPEFE          = 5
        ZSPEFE          = 4
        YDPEFE          = 3
        YSPEFE          = 2
        XDPEFE          = 1
        XSPEFE          = 0
        PEFE_BITS       = %111111
        DPA_MASK        = (1 << DPA) ^ PULSE_CFG_MASK
        ELE_MASK        = (1 << ELE) ^ PULSE_CFG_MASK
        ZDPEFE_MASK     = (1 << ZDPEFE) ^ PULSE_CFG_MASK
        ZSPEFE_MASK     = (1 << ZSPEFE) ^ PULSE_CFG_MASK
        YDPEFE_MASK     = (1 << YDPEFE) ^ PULSE_CFG_MASK
        YSPEFE_MASK     = (1 << YSPEFE) ^ PULSE_CFG_MASK
        XDPEFE_MASK     = (1 << XDPEFE) ^ PULSE_CFG_MASK
        XSPEFE_MASK     = (1 << XSPEFE) ^ PULSE_CFG_MASK
        PEFE_MASK       = PEFE_BITS ^ PULSE_CFG_MASK

    PULSE_SRC           = $22
    PULSE_SRC_MASK      = $FF
        EA              = 7
        AXZ             = 6
        AXY             = 5
        AXX             = 4
        DPE             = 3
        POLZ            = 2
        POLY            = 1
        POLX            = 0

    PULSE_THSX          = $23
    PULSE_THSY          = $24
    PULSE_THSZ          = $25
    PULSE_TMLT          = $26
    PULSE_LTCY          = $27
    PULSE_WIND          = $28
    ASLP_CNT            = $29

    CTRL_REG1           = $2A
    CTRL_REG1_MASK      = $FF
        ASLP_RATE       = 6
        DR              = 3
        LNOISE          = 2
        F_READ          = 1
        ACTIVE          = 0
        ASLP_RATE_BITS  = %11
        DR_BITS         = %111
        ASLP_RATE_MASK  = (ASLP_RATE_BITS << ASLP_RATE) ^ CTRL_REG1_MASK
        DR_MASK         = (DR_BITS << DR) ^ CTRL_REG1_MASK
        LNOISE_MASK     = (1 << LNOISE) ^ CTRL_REG1_MASK
        F_READ_MASK     = (1 << F_READ) ^ CTRL_REG1_MASK
        ACTIVE_MASK     = 1 ^ CTRL_REG1_MASK

    CTRL_REG2           = $2B
    CTRL_REG2_MASK      = $DF
        ST              = 7
        RST             = 6
        SMODS           = 3
        SLPE            = 2
        MODS            = 0
        SMODS_BITS      = %11
        MODS_BITS       = %11
        ST_MASK         = (1 << ST) ^ CTRL_REG2_MASK
        RST_MASK        = (1 << RST) ^ CTRL_REG2_MASK
        SMODS_MASK      = (SMODS_BITS << SMODS) ^ CTRL_REG2_MASK
        SLPE_MASK       = (1 << SLPE) ^ CTRL_REG2_MASK
        MODS_MASK       = MODS_BITS ^ CTRL_REG2_MASK
        RESET           = 1 << RST

    CTRL_REG3           = $2C
    CTRL_REG3_MASK      = $7B
        WAKE_TRANS      = 6
        WAKE_LNDPRT     = 5
        WAKE_PULSE      = 4
        WAKE_FF_MT      = 3
        WAKE            = 3
        IPOL            = 1
        PP_OD           = 0
        WAKE_BITS       = %1111
        WAKE_TRANS_MASK = (1 << WAKE_TRANS) ^ CTRL_REG3_MASK
        WAKE_LNDPRT_MASK= (1 << WAKE_LNDPRT) ^ CTRL_REG3_MASK
        WAKE_PULSE_MASK = (1 << WAKE_PULSE) ^ CTRL_REG3_MASK
        WAKE_FF_MT_MASK = (1 << WAKE_FF_MT) ^ CTRL_REG3_MASK
        WAKE_MASK       = (WAKE_BITS << WAKE) ^ CTRL_REG3_MASK
        IPOL_MASK       = (1 << IPOL) ^ CTRL_REG3_MASK
        PP_OD_MASK      = 1 ^ CTRL_REG3_MASK

    CTRL_REG4           = $2D
    CTRL_REG4_MASK      = $BD
        INT_EN_ASLP     = 7
        INT_EN_TRANS    = 5
        INT_EN_LNDPRT   = 4
        INT_EN_PULSE    = 3
        INT_EN_FF_MT    = 2
        INT_EN_DRDY     = 0
        IE_ASLP_MASK    = (1 << INT_EN_ASLP) ^ CTRL_REG4_MASK
        IE_TRANS_MASK   = (1 << INT_EN_TRANS) ^ CTRL_REG4_MASK
        IE_LNDPRT_MASK  = (1 << INT_EN_LNDPRT) ^ CTRL_REG4_MASK
        IE_PULSE_MASK   = (1 << INT_EN_PULSE) ^ CTRL_REG4_MASK
        IE_FF_MT_MASK   = (1 << INT_EN_FF_MT) ^ CTRL_REG4_MASK
        IE_DRDY_MASK    = 1 ^ CTRL_REG4_MASK

    CTRL_REG5           = $2E
    CTRL_REG5_MASK      = $BD

    OFF_X               = $2F
    OFF_Y               = $30
    OFF_Z               = $31

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

