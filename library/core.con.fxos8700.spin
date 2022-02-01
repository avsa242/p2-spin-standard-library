{
    --------------------------------------------
    Filename: core.con.fxos8700.spin
    Author: Jesse Burt
    Description: FXOS8700-specific constants
    Copyright (c) 2021
    Started Sep 19, 2020
    Updated Nov 20, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SCK_MAX_FREQ        = 1_000_000
    I2C_MAX_FREQ        = 400_000

' Slave address options
'   Unfortunately, these aren't mapped logically in the chip, so
'   here are some constants to use, instead
    SLAVE_ADDR          = $1E << 1                  ' %00
    SLAVE_ADDR_1E       = SLAVE_ADDR                ' %00 (default)
    SLAVE_ADDR_1D       = $1D << 1                  ' %01
    SLAVE_ADDR_1C       = $1C << 1                  ' %10
    SLAVE_ADDR_1F       = $1F << 1                  ' %11

' SPI R/W bit (7)
    R                   = 0
    W                   = 1 << 7

    TPOR                = 1000                      ' uSec

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

    F_STATUS            = $00                       ' Same reg as STATUS above
        F_OVF           = 7                         ' This context applies only
        F_WMRK_FLAG     = 6                         '   if operating in a FIFO
        F_CNT           = 0                         '   mode
        F_CNT_BITS      = %111111

    OUT_X_MSB           = $01
    OUT_X_LSB           = $02
    OUT_Y_MSB           = $03
    OUT_Y_LSB           = $04
    OUT_Z_MSB           = $05
    OUT_Z_LSB           = $06

'$07, $08 RESERVED

    F_SETUP             = $09
    F_SETUP_MASK        = $FF
        F_MODE          = 6
        F_WMRK          = 0
        F_MODE_BITS     = %11
        F_WMRK_BITS     = %111111
        F_MODE_MASK     = (F_MODE_BITS << F_MODE) ^ F_SETUP_MASK
        F_WMRK_MASK     = F_WMRK_BITS ^ F_SETUP_MASK

    TRIG_CFG            = $0A
    SYSMOD_REG          = $0B
    SYSMOD_REGMASK      = $FF
        FGERR           = 7
        FGT             = 2
        SYSMOD          = 0
        FGT_BITS        = %11111
        SYSMOD_BITS     = %11
        FGERR_MASK      = (1 << FGERR) ^ SYSMOD_REGMASK
        FGT_MASK        = (FGT_BITS << FGT) ^ SYSMOD_REGMASK
        SYSMOD_MASK     = SYSMOD_BITS ^ SYSMOD_REGMASK

    INT_SOURCE          = $0C

    WHO_AM_I            = $0D
        DEVID_RESP      = $C7

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

    PL_CNT              = $12
    PL_BF_ZCOMP         = $13
    PL_THS_REG          = $14

    FFMT_CFG            = $15
    FFMT_CFG_MASK       = $F8
        FELE            = 7
        FOAE            = 6
        FZEFE           = 5
        FYEFE           = 4
        FXEFE           = 3
        FEFE            = 3
        FEFE_BITS       = %111
        FELE_MASK       = (1 << FELE) ^ FFMT_CFG_MASK
        FOAE_MASK       = (1 << FOAE) ^ FFMT_CFG_MASK
        FEFE_MASK       = FEFE_BITS ^ FFMT_CFG_MASK

    FFMT_SRC            = $16
    FFMT_SRC_MASK       = $BF
        FEA             = 7
        ZHE             = 5
        ZHP             = 4
        YHE             = 3
        YHP             = 2
        XHE             = 1
        XHP             = 0

    FFMT_THS            = $17
    FFMT_THS_MASK       = $FF
        FDBCNTM         = 7
        FF_THS          = 0
        FF_THS_BITS     = %1111111
        FDBCNTM_MASK    = (1 << FDBCNTM) ^ FFMT_THS_MASK
        FF_THS_MASK     = FF_THS_BITS ^ FFMT_THS_MASK

    FFMT_CNT            = $18

' $19..$1C RESERVED

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
        SRESET          = (1 << RST)

    CTRL_REG3           = $2C
    CTRL_REG3_MASK      = $FF
        FIFO_GATE       = 7
        WAKE_TRANS      = 6
        WAKE_LNDPRT     = 5
        WAKE_PULSE      = 4
        WAKE_FFMT       = 3
        WAKE_VECM       = 2
        WAKE            = 2                     ' pseudo field: all WAKE fields
        IPOL            = 1
        PP_OD           = 0
        WAKE_BITS       = %11111
        FIFO_GATE_MASK  = (1 << FIFO_GATE) ^ CTRL_REG3_MASK
        WAKE_TRANS_MASK = (1 << WAKE_TRANS) ^ CTRL_REG3_MASK
        WAKE_LNDPRT_MASK= (1 << WAKE_LNDPRT) ^ CTRL_REG3_MASK
        WAKE_PULSE_MASK = (1 << WAKE_PULSE) ^ CTRL_REG3_MASK
        WAKE_FFMT_MASK  = (1 << WAKE_FFMT) ^ CTRL_REG3_MASK
        WAKE_VECM_MASK  = (1 << WAKE_VECM) ^ CTRL_REG3_MASK
        WAKE_MASK       = (WAKE_BITS << WAKE) ^ CTRL_REG3_MASK
        IPOL_MASK       = (1 << IPOL) ^ CTRL_REG3_MASK
        PP_OD_MASK      = 1 ^ CTRL_REG3_MASK

    CTRL_REG4           = $2D
    CTRL_REG4_MASK      = $BD
        INT_EN_ASLP     = 7
        INT_EN_FIFO     = 6
        INT_EN_TRANS    = 5
        INT_EN_LNDPRT   = 4
        INT_EN_PULSE    = 3
        INT_EN_FF_MT    = 2
        INT_EN_VECM     = 1
        INT_EN_DRDY     = 0
        IE_ASLP_MASK    = (1 << INT_EN_ASLP) ^ CTRL_REG4_MASK
        IE_FIFO_MASK    = (1 << INT_EN_FIFO) ^ CTRL_REG4_MASK
        IE_TRANS_MASK   = (1 << INT_EN_TRANS) ^ CTRL_REG4_MASK
        IE_LNDPRT_MASK  = (1 << INT_EN_LNDPRT) ^ CTRL_REG4_MASK
        IE_PULSE_MASK   = (1 << INT_EN_PULSE) ^ CTRL_REG4_MASK
        IE_FF_MT_MASK   = (1 << INT_EN_FF_MT) ^ CTRL_REG4_MASK
        IE_VECM_MASK    = (1 << INT_EN_VECM) ^ CTRL_REG4_MASK
        IE_DRDY_MASK    = 1 ^ CTRL_REG4_MASK

    CTRL_REG5           = $2E
    CTRL_REG5_MASK      = $BD

    OFF_X               = $2F
    OFF_Y               = $30
    OFF_Z               = $31

    M_DR_STATUS         = $32
    M_DR_STATUS_MASK    = $FF
' Bitfields same as STATUS ($00)

    M_OUT_X_MSB         = $33
    M_OUT_X_LSB         = $34
    M_OUT_Y_MSB         = $35
    M_OUT_Y_LSB         = $36
    M_OUT_Z_MSB         = $37
    M_OUT_Z_LSB         = $38
    CMP_X_MSB           = $39
    CMP_X_LSB           = $3A
    CMP_Y_MSB           = $3B
    CMP_Y_LSB           = $3C
    CMP_Z_MSB           = $3D
    CMP_Z_LSB           = $3E
    M_OFF_X_MSB         = $3F
    M_OFF_X_LSB         = $40
    M_OFF_Y_MSB         = $41
    M_OFF_Y_LSB         = $42
    M_OFF_Z_MSB         = $43
    M_OFF_Z_LSB         = $44
    MAX_X_MSB           = $45
    MAX_X_LSB           = $46
    MAX_Y_MSB           = $47
    MAX_Y_LSB           = $48
    MAX_Z_MSB           = $49
    MAX_Z_LSB           = $4A
    MIN_X_MSB           = $4B
    MIN_X_LSB           = $4C
    MIN_Y_MSB           = $4D
    MIN_Y_LSB           = $4E
    MIN_Z_MSB           = $4F
    MIN_Z_LSB           = $50
    TEMP                = $51

    M_THS_CFG           = $52
    M_THS_CFG_MASK      = $FF
        THS_ELE         = 7
        THS_OAE         = 6
        THS_ZEFE        = 5
        THS_YEFE        = 4
        THS_XEFE        = 3
        THS_EFE         = 3
        THS_WAKE_EN     = 2
        THS_INT_EN      = 1
        THS_INT_CFG     = 0
        THS_EFE_BITS    = %111
        THS_ELE_MASK    = (1 << THS_ELE) ^ M_THS_CFG_MASK
        THS_OAE_MASK    = (1 << THS_OAE) ^ M_THS_CFG_MASK
        THS_ZEFE_MASK   = (1 << THS_ZEFE) ^ M_THS_CFG_MASK
        THS_YEFE_MASK   = (1 << THS_YEFE) ^ M_THS_CFG_MASK
        THS_XEFE_MASK   = (1 << THS_XEFE) ^ M_THS_CFG_MASK
        THS_EFE_MASK    = (THS_EFE_BITS << THS_EFE) ^ M_THS_CFG_MASK
        THS_WAKE_EN_MASK= (1 << THS_WAKE_EN) ^ M_THS_CFG_MASK
        THS_INT_EN_MASK = (1 << THS_INT_EN) ^ M_THS_CFG_MASK
        THS_INT_CFG_MASK= (1 << THS_INT_CFG) ^ M_THS_CFG_MASK

    M_THS_SRC           = $53
    M_THS_X_MSB         = $54
    M_THS_X_LSB         = $55
    M_THS_Y_MSB         = $56
    M_THS_Y_LSB         = $57
    M_THS_Z_MSB         = $58
    M_THS_Z_LSB         = $59
    M_THS_CNT           = $5A

    M_CTRL_REG1         = $5B
    M_CTRL_REG1_MASK    = $FF
        M_ACAL          = 7
        M_RST           = 6
        M_OST           = 5
        M_OS            = 2
        M_HMS           = 0
        M_OS_BITS       = %111
        M_HMS_BITS      = %11
        M_ACAL_MASK     = (1 << M_ACAL) ^ M_CTRL_REG1_MASK
        M_RST_MASK      = (1 << M_RST) ^ M_CTRL_REG1_MASK
        M_OST_MASK      = (1 << M_OST) ^ M_CTRL_REG1_MASK
        M_OS_MASK       = (M_OS_BITS << M_OS) ^ M_CTRL_REG1_MASK
        M_HMS_MASK      = M_HMS_BITS ^ M_CTRL_REG1_MASK

    M_CTRL_REG2         = $5C
    M_CTRL_REG3         = $5D
    M_INT_SRC           = $5E
    A_VECM_CFG          = $5F
    A_VECM_THS_MSB      = $60
    A_VECM_THS_LSB      = $61
    A_VECM_CNT          = $62
    A_VECM_INITX_MSB    = $63
    A_VECM_INITX_LSB    = $64
    A_VECM_INITY_MSB    = $65
    A_VECM_INITY_LSB    = $66
    A_VECM_INITZ_MSB    = $67
    A_VECM_INITZ_LSB    = $68
    M_VECM_CFG          = $69
    M_VECM_THS_MSB      = $6A
    M_VECM_THS_LSB      = $6B
    M_VECM_CNT          = $6C
    M_VECM_INITX_MSB    = $6D
    M_VECM_INITX_LSB    = $6E
    M_VECM_INITY_MSB    = $6F
    M_VECM_INITY_LSB    = $70
    M_VECM_INITZ_MSB    = $71
    M_VECM_INITZ_LSB    = $72
    A_FFMT_THS_X_MSB    = $73
    A_FFMT_THS_X_LSB    = $74
    A_FFMT_THS_Y_MSB    = $75
    A_FFMT_THS_Y_LSB    = $76
    A_FFMT_THS_Z_MSB    = $77
    A_FFMT_THS_Z_LSB    = $78

' $79 RESERVED

PUB Null{}
' This is not a top-level object

