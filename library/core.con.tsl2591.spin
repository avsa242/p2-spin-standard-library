{
    --------------------------------------------
    Filename: core.con.tsl2591.spin
    Description: TSL2591 low-level constants
    Author: Jesse Burt
    Copyright (c) 2020
    Started Feb 17, 2018
    Updated Dec 20, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ    = 400_000
    SLAVE_ADDR      = $29 << 1
    DEV_ID_RESP     = $50

' Registers (fields within registers are indented)
    ENABLE          = $00
    ENABLE_MASK     = $D3
        NPIEN       = 7
        SAI         = 6
        AIEN        = 4
        AEN         = 1
        PON         = 0
        NPIEN_MASK  = (1 << NPIEN) ^ ENABLE_MASK
        SAI_MASK    = (1 << SAI) ^ ENABLE_MASK
        AIEN_MASK   = (1 << AIEN) ^ ENABLE_MASK
        AEN_MASK    = (1 << AEN) ^ ENABLE_MASK
        PON_MASK    = (1 << PON) ^ ENABLE_MASK

    CONTROL         = $01
    CONTROL_MASK    = $B7
        SRESET      = 7
        AGAIN       = 4
        ATIME       = 0
        AGAIN_BITS  = %11
        ATIME_BITS  = %111
        AGAIN_MASK  = (AGAIN_BITS << AGAIN) ^ CONTROL_MASK
        ATIME_MASK  = (ATIME_BITS << ATIME) ^ CONTROL_MASK

    AILTL           = $04
    AILTH           = $05
    AIHTL           = $06
    AIHTH           = $07

    NPAILTL         = $08
    NPAILTH         = $09
    NPAIHTL         = $0A
    NPAIHTH         = $0B

    PERSIST         = $0C
    PERSIST_MASK    = $0F
        APERS       = 0
        APERS_BITS  = %1111

    PID             = $11
    PID_MASK        = $30
        P_ID        = 4
        P_ID_BITS   = %11

    ID              = $12

    STATUS          = $13
    STATUS_MASK     = $31
        NPINTR      = 5
        AINT        = 4
        AVALID      = 0
        NPINTR_MASK = (1 << NPINTR) ^ STATUS_MASK
        AINT_MASK   = (1 << AINT) ^ STATUS_MASK
        AVALID_MASK = (1 << AVALID) ^ STATUS_MASK

    C0DATAL         = $14
    C0DATAH         = $15
    C1DATAL         = $16
    C1DATAH         = $17

    CMD_NORMAL      = %1_01_00000
    CMD_SPECIAL     = %1_11_00000

' Special functions (used with TRANS_SPECIAL)
    SF_FORCEINT     = CMD_SPECIAL | %00100
    SF_CLRALSINT    = CMD_SPECIAL | %00110
    SF_CLRALS_NP_INT= CMD_SPECIAL | %00111
    SF_CLR_NP_INT   = CMD_SPECIAL | %01010

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

DAT
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
