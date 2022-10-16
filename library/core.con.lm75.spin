{
    --------------------------------------------
    Filename: core.con.lm75.spin
    Author: Jesse Burt
    Description: LM75-specific constants
    Copyright (c) 2020
    Started May 19, 2019
    Updated Nov 19, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ        = 400_000
    SLAVE_ADDR          = $48 << 1

' Register definitions
    TEMP                = $00
    TEMP_MASK           = $FF80

    CONFIG              = $01
    CONFIG_MASK         = $1F
        FAULTQ          = 3
        OS_POL          = 2
        COMP_INT        = 1
        SHUTDOWN        = 0
        FAULTQ_BITS     = %11
        OS_POL_MASK     = (1 << OS_POL) ^ CONFIG
        COMP_INT_MASK   = (1 << COMP_INT) ^ CONFIG
        FAULTQ_MASK     = (FAULTQ_BITS << FAULTQ) ^ CONFIG
        SHUTDOWN_MASK   = 1 ^ CONFIG

    T_HYST              = $02
    T_HYST_MASK         = $FF80

    T_OS                = $03
    T_OS_MASK           = $FF80

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

