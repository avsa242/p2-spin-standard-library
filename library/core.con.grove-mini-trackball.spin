{
    --------------------------------------------
    Filename: core.con.grove-mini-trackball.spin
    Author: Jesse Burt
    Description: Grove mini trackball-specific constants
    Copyright (c) 2024
    Started Jan 1, 2024
    Updated Jan 2, 2024
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR          = $4a << 1
    I2C_MAX_FREQ        = 400_000

    T_POR               = 100

    READ_MODE           = 0
    WRITE_MODE          = 1

    CONFIG_VALID        = $3a6fb67c

    { registers }
    UP                  = $00                   'u8
    DOWN                = $01                   'u8
    LEFT                = $02                   'u8
    RIGHT               = $03                   'u8
    CONFIRM             = $04                   'u8
    VALID               = $05                   'u32
    I2C_ADDR            = $09                   'u8
    I2C_SPEED           = $0a                   'u16
    LED_MODE            = $0c                   'u8
    LED_FLASH_TIME      = $0d                   'u16
    DATA_CLEAR_TIME     = $0f                   'u16
    DATA_READ_TIME      = $11                   'u16

    { LED modes }
    LED_FLASH_1         = $00
    LED_FLASH_2         = $01
    LED_FLASH_TOG       = $02
    LED_FLASH_ALL       = $03
    LED_ALWAYS_ON1      = $04
    LED_ALWAYS_ON2      = $05
    LED_ALWAYS_ON_ALL   = $06
    LED_ALWAYS_OFF      = $07
    LED_BREATHING_1     = $08
    LED_BREATHING_2     = $09
    LED_BREATHING_ALL   = $0a
    LED_MOVE_FLASH      = $0b

PUB null()
' This is not a top-level object


DAT
{
Copyright 2024 Jesse Burt

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

