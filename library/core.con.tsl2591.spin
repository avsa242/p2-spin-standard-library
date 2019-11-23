{
    --------------------------------------------
    Filename: core.con.tsl2591.spin
    Description: TSL2591 low-level constants
    Author: Jesse Burt
    Copyright (c) 2018
    Started Feb 17, 2018
    Updated Feb 24, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ                    = 400_000   ' Max I2C Clock, per TSL2591 datasheet
    SLAVE_ADDR                      = $29 << 1  ' Hardcoded - no address option for this device
    DEV_ID_RESP                     = $50

' Registers (fields within registers are indented)
    ENABLE                          = $00
    ENABLE_MASK                     = $D3
        FLD_NPIEN                   = 7         ' No-Persist Interrupts Enabled
        FLD_SAI                     = 6         ' Sleep After Interrupt
        FLD_AIEN                    = 4         ' Persist Interrupts Enabled
        FLD_AEN                     = 1         ' ALS Enable
        FLD_PON                     = 0         ' Power On
        MASK_NPIEN                  = ENABLE_MASK ^ (1 << FLD_NPIEN)
        MASK_SAI                    = ENABLE_MASK ^ (1 << FLD_SAI)
        MASK_AIEN                   = ENABLE_MASK ^ (1 << FLD_AIEN)
        MASK_AEN                    = ENABLE_MASK ^ (1 << FLD_AEN)
        MASK_PON                    = ENABLE_MASK ^ (1 << FLD_PON)

    CONTROL                         = $01
    CONTROL_MASK                    = $B7
        FLD_SRESET                  = 7         ' System Reset
        FLD_AGAIN                   = 4         ' ALS Gain
        FLD_ATIME                   = 0         ' ALS time
        BITS_AGAIN                  = %11
        BITS_ATIME                  = %111
        MASK_AGAIN                  = CONTROL_MASK ^ (BITS_AGAIN << FLD_AGAIN)
        MASK_ATIME                  = CONTROL_MASK ^ (BITS_ATIME << FLD_ATIME)

    AILTL                           = $04
    AILTH                           = $05
    AIHTL                           = $06
    AIHTH                           = $07

    NPAILTL                         = $08
    NPAILTH                         = $09
    NPAIHTL                         = $0A
    NPAIHTH                         = $0B

    PERSIST                         = $0C
    PERSIST_MASK                    = $0F
        APERS                       = 0
        BITS_APERS                  = %1111     ' ALS Interrupt Persistence filter

    PID                             = $11       ' Package Identification
    PID_MASK                        = $30
        FLD_PID                     = 4
        BITS_PID                    = %11

    ID                              = $12       ' Device Identification

    STATUS                          = $13       ' Internal Status
    STATUS_MASK                     = $31
        FLD_NPINTR                  = 5
        FLD_AINT                    = 4
        FLD_AVALID                  = 0
        MASK_NPINTR                 = STATUS_MASK ^ (1 << FLD_NPINTR)
        MASK_AINT                   = STATUS_MASK ^ (1 << FLD_AINT)
        MASK_AVALID                 = STATUS_MASK ^ (1 << FLD_AVALID)

    C0DATAL                         = $14       ' ALS Light Data (Ch0 Low byte)
    C0DATAH                         = $15       ' ALS Light Data (Ch0 Hi byte)
    C1DATAL                         = $16       ' ALS Light Data (Ch1 Low byte)
    C1DATAH                         = $17       ' ALS Light Data (Ch1 Hi byte)

    TSL2591_CMD                     = %1000_0000' Select Command Register

    TRANS_NORMAL                    = %0010_0000' Select type of transaction to follow in subsequent data transfers
    TRANS_SPECIAL                   = %0110_0000' ( | or together with TSL2591_CMD)

    SF_FORCEINT                     =     %00100' Special
    SF_CLEARALSINT                  =     %00110' function
    SF_CLEARALS_NOPERSIST_INT       =     %00111' fields
    SF_CLEAR_NOPERSIST_INT          =     %01010'  - use if TRANS_TYPE_SPECIAL bits above are set

PUB Null
' This is not a top-level object

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
