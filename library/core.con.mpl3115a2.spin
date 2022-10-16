{
    --------------------------------------------
    Filename: core.con.mpl3115a2.spin
    Author: Jesse Burt
    Description: MPL3115A2-specific constants
    Copyright (c) 2021
    Started Feb 01, 2021
    Updated Feb 01, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $60 << 1                  ' 7-bit format slave address


    T_POR           = 1_000_000                 ' startup time (usecs)
    ' NOTE: 1sec startup time (high-res mode), 60ms (high-speed mode)
    DEVID_RESP      = $C4                       ' device ID expected response

' Register definitions

    STATUS          = $00

    OUT_P_MSB       = $01                       ' u20 (press), Q18.2
    OUT_P_CSB       = $02                       ' s20 (alt), Q16.4
    OUT_P_LSB       = $03                       ' <- fractional
    OUT_P_MASK      = $FFFF0

    OUT_T_MSB       = $04                       ' s12, Q8.4
    OUT_T_LSB       = $05                       ' <- fractional
    OUT_T_MASK      = $FF0

    DR_STATUS       = $06
    DR_STATUS_MASK  = $EE
        PTOW        = 7
        POW         = 6
        TOW         = 5
        PTDR        = 3
        PDR         = 2
        TDR         = 1

    OUT_P_DELTA_MSB = $07
    OUT_P_DELTA_CSB = $08
    OUT_P_DELTA_LSB = $09

    OUT_T_DELTA_MSB = $0A
    OUT_T_DELTA_LSB = $0B

    WHO_AM_I        = $0C

    F_STATUS        = $0D
    F_STATUS_MASK   = $FF
        F_OVF       = 7
        F_WMRK_FLAG = 6
        F_CNT       = 0
        F_CNT_BITS  = %111111

    F_DATA          = $0E                       ' 32 samples max (5 * 32bytes)
    F_SETUP         = $0F
        F_MODE      = 6
        F_WMRK      = 0
        F_MODE_BITS = %11
        F_WMRK_BITS = %111111
        F_MODE_MASK = (F_MODE_BITS << F_MODE) ^ F_SETUP
        F_WMRK_MASK = F_WMRK_BITS ^ F_SETUP

    TIME_DLY        = $10
        TD          = 0

    SYSMOD          = $11
    SYSMOD_MASK     = $01
        SYS_MOD     = 0

    INT_SOURCE      = $12
        SRC_DRDY    = 7
        SRC_FIFO    = 6
        SRC_PW      = 5
        SRC_TW      = 4
        SRC_PTH     = 3
        SRC_TTH     = 2
        SRC_PCHG    = 1
        SRC_TCHG    = 0

    PT_DATA_CFG     = $13
    PT_DATA_CFG_MASK= $07
        DREM        = 2
        PDEFE       = 1
        TDEFE       = 0
        DREM_MASK   = (1 << DREM) ^ PT_DATA_CFG_MASK
        PDEFE_MASK  = (1 << PDEFE) ^ PT_DATA_CFG_MASK
        TDEFE_MASK  = (1 << TDEFE) ^ PT_DATA_CFG_MASK

    BAR_IN_MSB      = $14                       ' u16
    BAR_IN_LSB      = $15

    P_TGT_MSB       = $16                       ' s16
    P_TGT_LSB       = $17

    T_TGT           = $17                       ' s8

    P_WND_MSB       = $19                       ' u16
    P_WND_LSB       = $1A

    T_WND           = $1B                       ' u8

    P_MIN_MSB       = $1C                       ' s20 (alt), u20 (press)
    P_MIN_CSB       = $1D
    P_MIN_LSB       = $1E

    T_MIN_MSB       = $1F                       ' s12
    T_MIN_LSB       = $20

    P_MAX_MSB       = $21                       ' s20 (alt), u20 (press)
    P_MAX_CSB       = $22
    P_MAX_LSB       = $23

    T_MAX_MSB       = $24                       ' s12
    T_MAX_LSB       = $25

    CTRL_REG1       = $26
    CTRL_REG1_MASK  = $BF
        ALT         = 7
        OS          = 3
        RST         = 2                         ' R: 0
        OST         = 1
        SBYB        = 0
        OS_BITS     = %111
        ALT_MASK    = (1 << ALT) ^ CTRL_REG1_MASK
        OS_MASK     = (OS_BITS << OS) ^ CTRL_REG1_MASK
        OST_MASK    = (1 << OST) ^ CTRL_REG1_MASK
        SBYB_MASK   = 1 ^ CTRL_REG1_MASK

    CTRL_REG2       = $27
    CTRL_REG2_MASK  = $3F
        LD_OUT      = 5
        ALM_SEL     = 4
        ST          = 0
        ST_BITS     = %1111
        LD_OUT_MASK = (1 << LD_OUT) ^ CTRL_REG2_MASK
        ALM_SEL_MASK= (1 << ALM_SEL) ^ CTRL_REG2_MASK
        ST_MASK     = ST_BITS ^ CTRL_REG2_MASK

    CTRL_REG3       = $28
    CTRL_REG3_MASK  = $33
        IPOL1       = 5
        PP_OD1      = 4
        IPOL2       = 1
        PP_OD2      = 0
        IPOL1_MASK  = (1 << IPOL1) ^ CTRL_REG3_MASK
        PP_OD1_MASK = (1 << PP_OD1) ^ CTRL_REG3_MASK
        IPOL2_MASK  = (1 << IPOL2) ^ CTRL_REG3_MASK
        PP_OD2_MASK = (1 << PP_OD2) ^ CTRL_REG3_MASK

    CTRL_REG4       = $29
    CTRL_REG4_MASK  = $FF
        IE_DRDY     = 7
        IE_FIFO     = 6
        IE_PW       = 5
        IE_TW       = 4
        IE_PTH      = 3
        IE_TTH      = 2
        IE_PCHG     = 1
        IE_TCHG     = 0

    CTRL_REG5       = $2A
    CTRL_REG5_MASK  = $FF
        IC_DRDY     = 7
        IC_FIFO     = 6
        IC_PW       = 5
        IC_TW       = 4
        IC_PTH      = 3
        IC_TTH      = 2
        IC_PCHG     = 1
        IC_TCHG     = 0

    OFF_P           = $2B                       ' s8, 2s/c, 4Pa/LSB

    OFF_T           = $2C                       ' s8, 2s/c, 0.0625C/LSB

    OFF_H           = $2D                       ' s8, 2s/c, 1m/LSB

    FM0_DR_STATUS   = $00
    FM_CFS_F_STATUS = $00
    FM_CFS_F_DATA   = $01

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

