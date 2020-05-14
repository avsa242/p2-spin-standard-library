{
    --------------------------------------------
    Filename: core.con.us2066.spin
    Author: Jesse Burt
    Description: US2066 OLED Display driver registers/command set
    Created Dec 30, 2017
    Updated Mar 3, 2020
    Copyright (c) 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    SLAVE_ADDR          = $3C << 1 '$3C - Default slave address of US2066
    I2C_MAX_FREQ        = 400_000  '400kHz - Max operating freq
    TRES                = 2        ' Reset low width (microseconds)
    DEVID_RESP          = $21

    DATABIT             = $40
    CMDBIT              = $00
    CONTBIT             = $80
    CTRLBYTE_CMD        = CONTBIT | CMDBIT
    CTRLBYTE_DATA       = DATABIT

'Command set: (POR) indicates Power On Reset, or default value.
'-FUNDAMENTAL COMMAND SET-------
'SD bit set 0
    CLEAR_DISPLAY       = $01      '$01 Clear Display
'RE bit set 0, SD bit set 0
    HOME_DISPLAY        = $02      '$02 Return Home

'RE bit set 0, SD bit set 0
    ENTRY_MODE_SET      = $04      '$04 Entry Mode Set
    LTR                 = %1 << 1
    RTL                 = %0 << 1
    SHIFT               = %1
    NOSHIFT             = %0       '(POR)

'RE bit set 1, SD bit set 0
    COM31_0             = %0 << 1
    COM0_31             = %1 << 1
    SEG99_0             = %0
    SEG0_99             = %1

'RE bit set 0, SD bit set 0
    DISPLAY_ONOFF       = $08      '$08 Display ON/OFF, Cursor ON/OFF, Cursor Blink ON/OFF control
        DISP_ON         = %1 << 2
        DISP_OFF        = %0 << 2  '(POR)
        CURSOR_ON       = %1 << 1
        CURSOR_OFF      = %0 << 1  '(POR)
        BLINK_ON        = %1
        BLINK_OFF       = %0       '(POR)

'RE bit set 1, SD bit set 0
    EXTENDED_FUNCSET    = $08      '$08 Assign font width, black/white inverting of cursor, and 4-line display mode control bit
        FONTWIDTH_6     = %1 << 2
        FONTWIDTH_5     = %0 << 2  '(POR)
        CURSOR_INVERT   = %1 << 1
        CURSOR_NORMAL   = %0 << 1  '(POR)
        NW_3_4_LINE     = %1
        NW_1_2_LINE     = %0

'IS bit set 0, RE bit set 0, SD bit set 0
    CURS_DISP_SHIFT     = $10      '$10 Set cursor moving and display shift control and direction (doesn't change DDRAM data)
        CURS_LEFT       = %00 << 2
        CURS_RIGHT      = %01 << 2
        DISP_LEFT       = %10 << 2
        DISP_RIGHT      = %11 << 2

'IS bit set 0, RE bit set 1, SD bit set 0
    DBLHEIGHT           = $10      '$10 Double-height font setting (POR=%xxxx_11xx)
        DBLHEIGHT_BOTTOM= %00 << 2
        DBLHEIGHT_MIDDLE= %01 << 2
        DBLHEIGHT_BOTH  = %10 << 2
        DBLHEIGHT_TOP   = %11 << 2
        DISP_SHIFT_EN   = %1
        DOT_SCROLL_EN   = %0       '(POR)

'IS bit set 1, RE bit set 1, SD bit set 0
    SHIFT_SCROLL_ENA    = $10      '$10 Set line(s) with display shift enabled (%1111 (POR). Shift when DH = 1, Scroll when DH = 0 (DISP_SHIFT_EN, DOT_SCROLL_EN)
        SHFT_SCRL_LINE1 = %1
        SHFT_SCRL_LINE2 = %1 << 1
        SHFT_SCRL_LINE3 = %1 << 2
        SHFT_SCRL_LINE4 = %1 << 3

'RE bit set 0, SD bit set 0
    FUNCTION_SET_0      = $20      ' $20 Function set 0
        DISP_LINES_2_4  = %1 << 3
        DISP_LINES_1_3  = %0 << 3
        DBLHT_FONT_EN   = %1 << 2
        DBLHT_FONT_DIS  = %0 << 2  ' (POR)
        EXT_REG_RE      = %1 << 1  ' Extension register RE (POR 0)
        EXT_REG_IS      = %1       ' Extension register IS

    CMDSET_EXTENDED     = FUNCTION_SET_0 | EXT_REG_RE
    CMDSET_FUNDAMENTAL  = FUNCTION_SET_0

'RE bit set 1, SD bit set 0
    FUNCTION_SET_1      = $22      ' $22 Function set 1 (RE register 1)
        CGRAM_BLINK_EN  = %1 << 2
        CGRAM_BLINK_DIS = %0 << 2  ' (POR)
        REVERSE_DISPLAY = %1
        NORMAL_DISPLAY  = %0       ' (POR)

    SET_CGRAM_ADDR      = $40      ' $40 Set CGRAM address in address counter (POR=%00_0000)
    SET_DDRAM_ADDR      = $80      ' $80 Set DDRAM address in address counter (POR=%000_0000)
    SET_SCROLL_QTY      = $80      ' $80 (with RE bit set) Set the quantity of horizontal dot scroll (POR=%00_0000 - Maximum: %11_0000)

'-EXTENDED COMMAND SET---
''To use, first set RE to 1

    FUNCTION_SEL_A      = $71      ' $71 Enable/Disable internal 5V regulator
        INT_REG_DISABLE = $00
        INT_REG_ENABLE  = $5C

    FUNCTION_SEL_B      = $72      ' $72 %xxxx_ROM1_ROM0_OPR1_OPR0
        CHAR_ROM_A      = %00 << 2
        CHAR_ROM_B      = %01 << 2
        CHAR_ROM_C      = %10 << 2
        CG_ROM_RAM_240_8= %00
        CG_ROM_RAM_248_8= %01
        CG_ROM_RAM_250_6= %10
        CG_ROM_RAM_256_0= %11

'-OLED COMMAND SET-----
    OLED_CHARACTERIZE   = $78      ' OLED Characterization
        OLED_CMDSET_ENA = OLED_CHARACTERIZE|%1       ' $79 %0111_100_1   SD = %1: OLED Command set enabled
        OLED_CMDSET_DIS = OLED_CHARACTERIZE|%0       ' $78 %0111_100_0   SD = %0: (POR) OLED Command set disabled

    SET_CONTRAST        = $81      ' $81 Select contrast. %0000_0000 .. %1111_1111 (POR %0111_1111)
    DISP_CLKDIV_OSC     = $D5      ' $D5 Oscillator freq (4 MSBs, POR=%0111). Display clock divisor (4 LSBs, POR=%0000, divisor=value+1). Range for both is %0000-%1111
    SET_PHASE_LEN       = $D9      ' $D9 Segment waveform length (unit=DCLKs). Phase 2 (MSBs, POR=%0111) range %0001..%1111, Phase 1 (LSBs, POR=%1000) range %0010..%1111

    SET_SEG_PINS        = $DA      ' $DA Set SEG pins hardware configuration
        SEG_LR_REMAP_EN = %1 <<5
        SEG_LR_REMAP_DIS= %0 <<5
        SEQ_SEGPINCFG   = %1 <<4
        ALT_SEGPINCFG   = %0 <<4

    SET_VCOMH_DESEL     = $DB      ' $DB Adjust Vcomh regulator output

    FUNCTION_SEL_C      = $DC      ' $DC Set VSL/GPIO
        VSL_INTERNAL    = %0 << 7
        VSL_EXTERNAL    = %1 << 7
        GPIO_HIZ_INP_DIS= %00
        GPIO_HIZ_INP_ENA= %01
        GPIO_OUT_LOW    = %10
        GPIO_OUT_HIGH   = %11

    FADEOUT_BLINK       = $23      '$23 Set fade out and blinking.
        FADE_BLINK_DIS  = %00 << 4
        FADE_OUT_ENA    = %10 << 4
        BLINK_ENA       = %11 << 4

PUB Null
''This is not a top-level object

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
