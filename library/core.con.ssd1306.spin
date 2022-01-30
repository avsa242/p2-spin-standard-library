{
    --------------------------------------------
    Filename: core.con.ssd1306.spin
    Author: Jesse Burt
    Description: SSD1306-specific constants
    Copyright (c) 2021
    Created: Apr 26, 2018
    Updated: Jan 1, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ    = 400_000                   ' max according to datasheet
    SLAVE_ADDR      = $3C << 1
    SPI_MAX_FREQ    = 10_000_000                ' max according to datasheet
    SPI_MODE        = 0

    TPOR            = 20_000                    ' usec

    CTRLBYTE_CMD    = $00
    CTRLBYTE_DATA   = $40

    FOSC_MIN        = 333
    FOSC_MAX        = 407

'FUNDAMENTAL COMMAND SET
    CONTRAST        = $81 'Double byte command - send 8-bit contrast value after this command
    RAMDISP_ON      = $A4
    ENTDISP_ON      = $A5
    DISP_NORM       = $A6
    DISP_INVERT     = $A7
    DISP_OFF        = $AE
    DISP_ON         = $AF

'SCROLLING COMMAND TABLE
    HSCROLL_R       = $26 '\
    HSCROLL_L       = $27 '- 7 byte command - send $00 dummy byte, Page start, Time interval, Page end, $00, $FF dummy bytes after this command
    SCROLL_VHR      = $29 '\
    SCROLL_VHL      = $2A '- 6 byte command - send $00 dummy byte, Page start, Time interval, Page end, Vert. scroll offset
    STOPSCROLL      = $2E ' Stop any of the above
    STARTSCROLL     = $2F ' Stop any of the above
    VSCROLL_AREA    = $A3 '- 3 byte command - send no. of rows in top fixed area (bits 5..0), no. of rows in scroll area after this command (bits 6..0)

'ADDRESSING SETTING COMMAND TABLE
    MEM_ADDRMODE    = $20 '- 2 byte command - send addressing mode after this byte
    SET_COLADDR     = $21 '- 3 byte command - send column start address, column end address after this byte
    SET_PAGEADDR    = $22 '- 3 byte command - send page start address, page end address after this byte

'HARDWARE CONFIGURATION
    DISP_STLINE     = $40   ' | [5:0]
    SEG_MAP0        = $A0 ' Column address 0 is mapped to SEG0
    SEG_MAP127      = $A1 ' Column address 127 is mapped to SEG0
    SETMUXRATIO     = $A8
    COMDIR_NORM     = $C0
    COMDIR_RMAP     = $C8
    SETCOM_CFG      = $DA

    SETDISPOFFS     = $D3
    SETOSCFREQ      = $D5
        OSCFREQ     = 4
        CLKDIV      = 0
        OSCFREQ_BITS= %1111
        CLKDIV_BITS = %1111

    CHGPUMP         = $8D
        CHGP_OFF    = %0000_0000
        CHGP_7500   = %0000_0100
        CHGP_6000   = %0000_0101
        CHGP_8500   = %1000_0100
        CHGP_9000   = %1000_0101

'TIMING & DRIVING SCHEME
    SETPRECHARGE    = $D9 '- 2 byte command - send phase 1 period and phase 2 period after this byte
    SETVCOMDESEL    = $DB '- 2 byte command - send Vcomh deselect level after this byte

    NOOP            = $E3

PUB Null{}
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
