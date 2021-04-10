{
    --------------------------------------------
    Filename: core.con.ssd1309.spin
    Description: SSD1309 OLED/PLED Display driver registers/command set
    Author: Jesse Burt
    Copyright (c) 2021
    Created: Apr 26, 2019
    Updated: Apr 6, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

' I2C parameters
    I2C_MAX_FREQ    = 1_000_000
    SLAVE_ADDR      = $3C << 1

' SPI parameters
    SCK_MAX_FREQ    = 10_000_000
    SPI_MODE        = 0

    CTRLBYTE_CMD    = $00
    CTRLBYTE_DATA   = $40

    FOSC_MIN        = 360
    FOSC_MAX        = 540

'FUNDAMENTAL COMMAND SET
    CMD_CONTRAST    = $81 'Double byte command - send 8-bit contrast value after this command
    CMD_RAMDISP_ON  = $A4
    CMD_ENTDISP_ON  = $A5
    CMD_DISP_NORM   = $A6
    CMD_DISP_INVERT = $A7
    CMD_DISP_OFF    = $AE
    CMD_DISP_ON     = $AF

'SCROLLING COMMAND TABLE
    CMD_HSCROLL_R   = $26 '\
    CMD_HSCROLL_L   = $27 '- 7 byte command - send $00 dummy byte, Page start, Time interval, Page end, $00, $FF dummy bytes after this command
    CMD_SCROLL_VHR  = $29 '\
    CMD_SCROLL_VHL  = $2A '- 6 byte command - send $00 dummy byte, Page start, Time interval, Page end, Vert. scroll offset
    CMD_STOPSCROLL  = $2E ' Stop any of the above
    CMD_STARTSCROLL = $2F ' Stop any of the above
    CMD_VSCROLL_AREA= $A3 '- 3 byte command - send no. of rows in top fixed area (bits 5..0), no. of rows in scroll area after this command (bits 6..0)

'ADDRESSING SETTING COMMAND TABLE
    CMD_MEM_ADDRMODE= $20 '- 2 byte command - send addressing mode after this byte
    CMD_SET_COLADDR = $21 '- 3 byte command - send column start address, column end address after this byte
    CMD_SET_PAGEADDR= $22 '- 3 byte command - send page start address, page end address after this byte

'HARDWARE CONFIGURATION
    CMD_SEG_MAP0    = $A0 ' Column address 0 is mapped to SEG0
    CMD_SEG_MAP127  = $A1 ' Column address 127 is mapped to SEG0
    CMD_SETMUXRATIO = $A8
    CMD_COMDIR_NORM = $C0
    CMD_COMDIR_RMAP = $C8
    CMD_SETCOM_CFG  = $DA

    CMD_SETDISPOFFS = $D3
    CMD_SETOSCFREQ  = $D5
        OSCFREQ     = 4
        CLKDIV      = 0
        OSCFREQ_BITS= %1111
        CLKDIV_BITS = %1111

    CMD_CHARGEPUMP  = $8D

'TIMING & DRIVING SCHEME
    CMD_SETPRECHARGE= $D9 '- 2 byte command - send phase 1 period and phase 2 period after this byte
    CMD_SETVCOMDESEL= $DB '- 2 byte command - send Vcomh deselect level after this byte

    CMD_NOOP        = $E3

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
