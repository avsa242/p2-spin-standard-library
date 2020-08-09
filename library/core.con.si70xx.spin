{
    --------------------------------------------
    Filename: core.con.si70xx.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2019
    Started Jul 20, 2019
    Updated Jul 21, 2019
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $40 << 1
    TPU                 = 80    'Powerup time

' Register definitions

    MEAS_RH_HOLD        = $E5
    MEAS_RH_NOHOLD      = $F5
    MEAS_TEMP_HOLD      = $E3
    MEAS_TEMP_NOHOLD    = $F3
    READ_PREV_TEMP      = $E0
    RESET               = $FE

    WR_RH_T_USER1       = $E6
    WR_RH_T_USER1_MASK  = $FF

    RD_RH_T_USER1       = $E7
    RD_RH_T_USER1_MASK  = $FF
        FLD_RES_LSB     = 0
        FLD_HTRE        = 2
        FLD_RES_MSB     = 7
        BITS_RES        = %1000_0001
        MASK_RES_LSB    = RD_RH_T_USER1_MASK ^ (1 << FLD_RES_LSB)
        MASK_HTRE       = RD_RH_T_USER1_MASK ^ (1 << FLD_HTRE)
        MASK_RES_MSB    = RD_RH_T_USER1_MASK ^ (1 << FLD_RES_MSB)
        MASK_RES        = MASK_RES_LSB | MASK_RES_MSB

    WR_HEATER           = $51
    RD_HEATER           = $11
        FLD_HEATER      = 0
        BITS_HEATER     = %1111

    RD_SERIALNUM_1      = $FA0F
    RD_SERIALNUM_2      = $FCC9
    RD_FIRMWARE_REV     = $84B8



PUB Null
'' This is not a top-level object

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
