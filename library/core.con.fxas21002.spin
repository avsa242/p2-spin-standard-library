{
    --------------------------------------------
    Filename: core.con.fxas21002.spin
    Author: Jesse Burt
    Description: FXAS21002-specific low-level constants
    Copyright (c) 2021
    Started Jun 07, 2021
    Updated Jun 15, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C Configuration
    I2C_MAX_FREQ    = 400_000                   ' device max I2C bus freq
    SLAVE_ADDR      = $20 << 1                  ' 7-bit format slave address
    T_POR           = 1_000                     ' startup time (usecs)

    DEVID_RESP      = $D7                       ' device ID expected response

' Register definitions
    STATUS          = $00
    OUT_X_MSB       = $01
    OUT_X_LSB       = $02
    OUT_Y_MSB       = $03
    OUT_Y_LSB       = $04
    OUT_Z_MSB       = $05
    OUT_Z_LSB       = $06

    DR_STATUS       = $07
    DR_STATUS_MASK  = $FF
        ZYXOW       = 7
        ZOW         = 6
        YOW         = 5
        XOW         = 4
        ZYXDR       = 3
        ZDR         = 2
        YDR         = 1
        XDR         = 0
        ORUN        = 1 << ZYXOW
        DRDY        = 1 << ZYXDR

    F_STATUS        = $08
    F_STATUS_MASK   = $FF
        F_OVF       = 7
        F_WMKF      = 6
        F_CNT       = 0
        F_CNT_BITS  = %111111

    F_SETUP         = $09
    F_SETUP_MASK    = $FF
        F_MODE      = 6
        F_WMRK      = 0
        F_MODE_BITS = %11
        F_WMRK_BITS = %111111
        F_MODE_MASK = (F_MODE_BITS << F_MODE) ^ F_SETUP_MASK
        F_WMRK_MASK = F_WMRK_BITS ^ F_SETUP_MASK

    F_EVENT         = $0A
    INT_SRC_FLAG    = $0B
    WHO_AM_I        = $0C

    CTRL_REG0       = $0D
    CTRL_REG0_MASK  = $FF
        BW          = 6
        SPIW        = 5
        SEL         = 3
        HPF_EN      = 2
        FS          = 0
        BW_BITS     = %11
        SEL_BITS    = %11
        FS_BITS     = %11
        BW_MASK     = (BW_BITS << BW) ^ CTRL_REG0_MASK
        SPIW_MASK   = (1 << SPIW) ^ CTRL_REG0_MASK
        SEL_MASK    = (SEL_BITS << SEL) ^ CTRL_REG0_MASK
        HPF_EN_MASK = (1 << HPF_EN) ^ CTRL_REG0_MASK
        FS_MASK     = FS_BITS ^ CTRL_REG0_MASK

    RT_CFG          = $0E
    RT_CFG_MASK     = $0F
        ELE         = 3
        ZTEFE       = 2
        YTEFE       = 1
        XTEFE       = 0
        ELE_MASK    = (1 << ELE) ^ RT_CFG_MASK
        ELE_EFE_MASK= %1111 ^ RT_CFG_MASK

    RT_SRC          = $0F

    RT_THS          = $10
    RT_THS_MASK     = $FF
        DBCNTM      = 7
        THS         = 0
        THS_BITS    = %1111111
        DBCNTM_MASK = (1 << DBCNTM) ^ RT_THS_MASK
        THS_MASK    = THS_BITS ^ RT_THS_MASK

    RT_COUNT        = $11
    TEMP            = $12

    CTRL_REG1       = $13
    CTRL_REG1_MASK  = $7F
        RST         = 6
        ST          = 5
        DR          = 2
        ACTIVE      = 1
        READY       = 0
        STATE       = 0                         ' pseudo-field: READY, ACTIVE
        DR_BITS     = %111
        STATE_BITS  = %11
        RST_MASK    = (1 << RST) ^ CTRL_REG1_MASK
        ST_MASK     = (1 << ST) ^ CTRL_REG1_MASK
        DR_MASK     = (DR_BITS << DR) ^ CTRL_REG1_MASK
        ACTIVE_MASK = (1 << ACTIVE) ^ CTRL_REG1_MASK
        READY_MASK  = 1 ^ CTRL_REG1_MASK
        STATE_MASK  = STATE_BITS ^ CTRL_REG1_MASK
        RESET       = 1 < RST

    CTRL_REG2       = $14
    CTRL_REG2_MASK  = $FF
        INT_CFG_FIFO= 7
        INT_EN_FIFO = 6
        INT_CFG_RT  = 5
        INT_EN_RT   = 4
        INT_CFG_DRDY= 3
        IN_EN_DRDY  = 2
        IPOL        = 1
        PP_OD       = 0
        INT_EN_BITS = %01010100
        INT_CFG_BITS= %10101000
        INT_EN_MASK = (INT_EN_BITS ^ CTRL_REG2_MASK)
        INT_CFG_MASK= (INT_CFG_BITS ^ CTRL_REG2_MASK)
        IPOL_MASK   = (1 << IPOL) ^ CTRL_REG2_MASK
        PP_OD_MASK  = 1 ^ CTRL_REG2_MASK

    CTRL_REG3       = $15

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

