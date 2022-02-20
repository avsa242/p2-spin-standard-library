{
    --------------------------------------------
    Filename: SSD1331-Demo.spin
    Description: SSD1331-specific setup for graphics demo
    Author: Jesse Burt
    Copyright (c) 2022
    Started: Feb 17, 2022
    Updated: Feb 17, 2022
    See end of file for terms of use.
    --------------------------------------------
}
CON

    _clkmode    = cfg#_clkmode
    _xinfreq    = cfg#_xinfreq

' -- User-modifiable constants
    LED         = cfg#LED1
    SER_BAUD    = 115_200

    WIDTH       = 96
    HEIGHT      = 64

{ SPI configuration }
    CS_PIN      = 0
    SCK_PIN     = 1
    MOSI_PIN    = 2
    DC_PIN      = 3

    RES_PIN     = -1                             ' optional; -1 to disable
' --

    BPP         = disp#BYTESPERPX
    BYTESPERLN  = WIDTH * BPP
    BUFFSZ      = (WIDTH * HEIGHT)

OBJ

    cfg     : "core.con.boardcfg.flip"
    disp    : "display.oled.ssd1331"

VAR

#ifndef GFX_DIRECT
    word _framebuff[BUFFSZ]                     ' display buffer
#else
    byte _framebuff                             ' dummy VAR for GFX_DIRECT
#endif

PUB Main{}

    ser.start(SER_BAUD)
    time.msleep(30)
    ser.clear{}
    ser.strln(string("Serial terminal started"))

    if disp.startx(CS_PIN, SCK_PIN, MOSI_PIN, DC_PIN, RES_PIN, WIDTH, HEIGHT, @_framebuff)
        ser.printf1(string("%s driver started"), @_drv_name)
        disp.fontspacing(1, 0)
        disp.fontscale(1)
        disp.fontsize(fnt#WIDTH, fnt#HEIGHT)
        disp.fontaddress(fnt.baseaddr{})
    else
        ser.printf1(string("%s driver failed to start - halting"), @_drv_name)
        repeat


    disp.preset_96x64_hiperf{}
    _time := 5_000                              ' time each demo runs (ms)

    demo{}                                      ' start demo

{ demo routines (common to all display types) included here }
#include "GFXDemo-common.spinh"

DAT
    _drv_name   byte    "SSD1331 (SPI)", 0

{
TERMS OF USE: MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}
