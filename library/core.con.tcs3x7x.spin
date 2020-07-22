{
    --------------------------------------------
    Filename: core.con.tcs347x.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started: Jun 24, 2018
    Updated: Jul 22, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ      = 400_000
    SLAVE_ADDR        = $29 << 1

' COMMAND REGISTER:
' MSB
' 7     6     5     4     3     2     1     0
' C.....T.....T.....A.....A.....A.....A.....A
' |     |_____|     |_______________________|
' CMD   TYPE        ADDR (REG)/SF

    CMD                 = $80
        FLD_TYPE        = 5
        TYPE_BYTE       = %00 << FLD_TYPE  'Don't auto-increment address pointer - use for reading single register
        TYPE_BLOCK      = %01 << FLD_TYPE  'Auto-increment address pointer - use for reading multiple sequential registers
        TYPE_SPECIAL    = %11 << FLD_TYPE  'Special Function
        SF_CLR_INT_CLR  = %00110

    ENABLE              = $00
    ENABLE_MASK         = $1B
        FLD_AIEN        = 4
        FLD_WEN         = 3
        FLD_AEN         = 1
        FLD_PON         = 0
        MASK_AIEN       = ENABLE_MASK ^ (1 << FLD_AIEN)
        MASK_WEN        = ENABLE_MASK ^ (1 << FLD_WEN)
        MASK_AEN        = ENABLE_MASK ^ (1 << FLD_AEN)
        MASK_PON        = ENABLE_MASK ^ (1 << FLD_PON)

    ATIME               = $01
    WTIME               = $03

    AILTL               = $04
    AILTH               = $05
    AIHTL               = $06
    AIHTH               = $07

    PERS                = $0C
    PERS_MASK           = $0F
        FLD_APERS       = 0
        BITS_APERS      = %1111

    CONFIG              = $0D
    CONFIG_MASK         = $02
        FLD_WLONG       = 1

    CONTROL             = $0F
    CONTROL_MASK        = $03
        FLD_AGAIN       = 0
        BITS_AGAIN      = %11

    DEVID               = $12
    DEVID_3472_1_5      = $44
    DEVID_3472_3_7      = $4D

    STATUS              = $13
    STATUS_MASK         = $11
        FLD_AINT        = 4
        FLD_AVALID      = 0

    CDATAL              = $14       'CLEAR DATA
    CDATAH              = $15
    RDATAL              = $16       'RED DATA
    RDATAH              = $17
    GDATAL              = $18       'GREEN DATA
    GDATAH              = $19
    BDATAL              = $1A       'BLUE DATA
    BDATAH              = $1B

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
