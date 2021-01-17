{
    --------------------------------------------
    Filename: core.con.tcs347x.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started: Jun 24, 2018
    Updated: Dec 24, 2020
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
    CMD_BYTE            = CMD | %00_00000
    CMD_BLOCK           = CMD | %01_00000
    CMD_SPECIAL         = CMD | %11_00000
    CMD_CLR_INT         = CMD_SPECIAL | %00110

    ENABLE              = $00
    ENABLE_MASK         = $1B
        AIEN            = 4
        WEN             = 3
        AEN             = 1
        PON             = 0
        AIEN_MASK       = (1 << AIEN) ^ ENABLE_MASK
        WEN_MASK        = (1 << WEN) ^ ENABLE_MASK
        AEN_MASK        = (1 << AEN) ^ ENABLE_MASK
        PON_MASK        = 1 ^ ENABLE_MASK

    ATIME               = $01
    WTIME               = $03

    AILTL               = $04
    AILTH               = $05
    AIHTL               = $06
    AIHTH               = $07

    PERS                = $0C
    PERS_MASK           = $0F
        APERS           = 0
        APERS_BITS      = %1111

    CONFIG              = $0D
    CONFIG_MASK         = $02
        WLONG           = 1

    CONTROL             = $0F
    CONTROL_MASK        = $03
        AGAIN           = 0
        AGAIN_BITS      = %11

    DEVID               = $12
    DEVID_3472_1_5      = $44
    DEVID_3472_3_7      = $4D

    STATUS              = $13
    STATUS_MASK         = $11
        AINT            = 4
        AVALID          = 0

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
