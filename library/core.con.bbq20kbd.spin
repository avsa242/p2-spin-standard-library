{
    --------------------------------------------
    Filename: core.con.bbq20kbd.spin
    Author: Jesse Burt
    Description: BB Q20-specific constants
    Copyright (c) 2022
    Started Dec 30, 2022
    Updated Dec 31, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR              = $1f << 1
    I2C_MAX_FREQ            = 400_000
    T_POR                   = 1_000

    WR_MASK                 = $80               ' apply to REG # to write to the register

    { registers }
    REG_VER                 = $01

    REG_CFG                 = $02
    REG_CFG_MASK            = $df
        CFG_USE_MODS        = 7
        CFG_USE_MODS_MASK   = (1 << CFG_USE_MODS) ^ REG_CFG_MASK
        CFG_REPORT_MODS     = 6
        CFG_PANIC_INT       = 5 'XXX N/A
        CFG_KEY_INT         = 4
        CFG_NUMLOCK_INT     = 3
        CFG_CAPSLOCK_INT    = 2
        CFG_OVERFLOW_INT    = 1
        CFG_INT             = 1
        CFG_INT_BITS        = %1111
        CFG_INT_BITS_SH     = CFG_INT_BITS << CFG_INT
        CFG_INT_MASK        = CFG_INT_BITS_SH ^ REG_CFG_MASK
        CFG_OVERFLOW_ON     = 0

    REG_INT                 = $03
    REG_INT_MASK            = $7f
        INT_TOUCH           = 6
        INT_GPIO            = 5
        INT_PANIC           = 4 'XXX N/A
        INT_KEY             = 3
        INT_NUMLOCK         = 2
        INT_CAPSLOCK        = 1
        INT_OVERFLOW        = 0

    REG_KEY                 = $04
    REG_KEY_MASK            = $7f
        KEY_NUMLOCK         = 6
        KEY_CAPSLOCK        = 5
        KEY_COUNT           = 0
        KEY_COUNT_BITS      = %11111

    REG_BKL                 = $05
    REG_DEB                 = $06
    REG_FRQ                 = $07
    REG_RST                 = $08

    REG_FIF                 = $09
        PRESSED             = 1
        PRESSED_HELD        = 2
        RELEASED            = 3

    REG_BK2                 = $0a
    REG_DIR                 = $0b
    REG_PUE                 = $0c
    REG_PUD                 = $0d
    REG_GIO                 = $0e
    REG_GIC                 = $0f
    REG_GIN                 = $10
    REG_HLD                 = $11
    REG_ADR                 = $12
    REG_IND                 = $13
    REG_CF2                 = $14

    REG_CF2_MASK            = $07
        CF2_USB_MOUSE_ON    = 2
        CF2_USB_KEYB_ON     = 1
        CF2_TOUCH_INT       = 0

    REG_TOX                 = $15
    REG_TOY                 = $16

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

