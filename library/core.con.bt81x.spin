{
    --------------------------------------------
    Filename: core.con.bt81x.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2022
    Started Sep 25, 2019
    Updated Jul 17, 2022
    See end of file for terms of use.
    --------------------------------------------
}

CON

' SPI Configuration
    SCK_MAX_FREQ                = 30_000_000
    SPI_MODE                    = 0

    TPOR                        = 300           ' mSec
    T_PDN_RES                   = 5_000         ' uSec

    READ                        = %00_000000
    WRITE                       = %10_000000
    CMD                         = %01_000000

' Register definitions
    RAM_G_START                 = $00_0000
    RAM_G_END                   = $0F_FFFF
    CHIPID                      = $0C_0000
        CHIPID_VALID            = $7C

    ROM_FNT_START               = $1E_0000
    ROM_FNT_END                 = $2F_FFFB
    ROM_FNTROOT_START           = $2F_FFFC
    ROM_FNTROOT_END             = $2F_FFFF
    ROM_START                   = $20_0000
    ROM_END                     = $2F_FFFF
    RAM_DISPLIST_START          = $30_0000
    RAM_DISPLIST_END            = $30_1FFF
    RAM_REG                     = $30_2000
    RAM_REG_END                 = RAM_REG + $FFF
    RAM_CMD_START               = $30_8000
    RAM_CMD_END                 = $30_8FFF
    FLASH_START                 = $80_0000
    FLASH_END                   = $107F_FFFF

    ID                          = RAM_REG + $000
        BT815                   = $08150100
        BT816                   = $08160100

    FRAMES                      = RAM_REG + $004
    CLK                         = RAM_REG + $008
    FREQ                        = RAM_REG + $00C
    RENDERMODE                  = RAM_REG + $010
    SNAPY                       = RAM_REG + $014
    SNAPSHOT                    = RAM_REG + $018
    SNAPFORMAT                  = RAM_REG + $01C

    CPURESET                    = RAM_REG + $020
    CPURESET_MASK               = $07
        AUDIO_ENG               = 2
        TOUCH_ENG               = 1
        COPRO_ENG               = 0
        AUDIO_ENG_MASK          = (1 << AUDIO_ENG) ^ CPURESET_MASK
        TOUCH_ENG_MASK          = (1 << TOUCH_ENG) ^ CPURESET_MASK
        COPROP_ENG_MASK         = 1 ^ CPURESET_MASK

    TAP_CRC                     = RAM_REG + $024
    TAP_MASK                    = RAM_REG + $028
    HCYCLE                      = RAM_REG + $02C
    HOFFSET                     = RAM_REG + $030
    HSIZE                       = RAM_REG + $034
    HSYNC0                      = RAM_REG + $038
    HSYNC1                      = RAM_REG + $03C
    VCYCLE                      = RAM_REG + $040
    VOFFSET                     = RAM_REG + $044
    VSIZE                       = RAM_REG + $048
    VSYNC0                      = RAM_REG + $04C
    VSYNC1                      = RAM_REG + $050
    DLSWAP                      = RAM_REG + $054
    ROTATE                      = RAM_REG + $058
    OUTBITS                     = RAM_REG + $05C
    DITHER                      = RAM_REG + $060
    SWIZZLE                     = RAM_REG + $064
    CSPREAD                     = RAM_REG + $068
    PCLK_POL                    = RAM_REG + $06C
    PCLK                        = RAM_REG + $070
    TAG_X                       = RAM_REG + $074
    TAG_Y                       = RAM_REG + $078
    TAG                         = RAM_REG + $07C
    VOL_PB                      = RAM_REG + $080
    VOL_SOUND                   = RAM_REG + $084
    SOUND                       = RAM_REG + $088
    PLAY                        = RAM_REG + $08C
    GPIO_DIR                    = RAM_REG + $090
    GPIO                        = RAM_REG + $094
    GPIOX_DIR                   = RAM_REG + $098
    GPIOX                       = RAM_REG + $09C
'3020A0..3020A4 RESERVED
    INT_FLAGS                   = RAM_REG + $0A8
    INT_EN                      = RAM_REG + $0AC
    INT_MASK                    = RAM_REG + $0B0
    PLAYBACK_START              = RAM_REG + $0B4
    PLAYBACK_LENGTH             = RAM_REG + $0B8
    PLAYBACK_READPTR            = RAM_REG + $0BC
    PLAYBACK_FREQ               = RAM_REG + $0C0
    PLAYBACK_FORMAT             = RAM_REG + $0C4
    PLAYBACK_LOOP               = RAM_REG + $0C8
    PLAYBACK_PLAY               = RAM_REG + $0CC
    PWM_HZ                      = RAM_REG + $0D0
    PWM_DUTY                    = RAM_REG + $0D4
    MACRO_0                     = RAM_REG + $0D8
    MACRO_1                     = RAM_REG + $0DC
'3020E0..3020F4 RESERVED
    CMD_READ                    = RAM_REG + $0F8
    CMD_WRITE                   = RAM_REG + $0FC
    CMD_DL                      = RAM_REG + $100
    CTOUCH_MODE                 = RAM_REG + $104
    TOUCH_ADC_MODE              = RAM_REG + $108
    CTOUCH_EXTENDED             = RAM_REG + $108
    TOUCH_CHARGE                = RAM_REG + $10C
    EHOST_TOUCH_X               = RAM_REG + $10C
    TOUCH_SETTLE                = RAM_REG + $110
    TOUCH_OVERSMP               = RAM_REG + $114
    EHOST_TOUCH_ID              = RAM_REG + $114
    TOUCH_RZTHRESH              = RAM_REG + $118
    EHOST_TOUCH_Y               = RAM_REG + $118
    TOUCH_RAW_XY                = RAM_REG + $11C
    CTOUCH_TOUCH1_XY            = RAM_REG + $11C
    TOUCH_RZ                    = RAM_REG + $120
    CTOUCH_TOUCH4_Y             = RAM_REG + $120
    TOUCH_SCREEN_XY             = RAM_REG + $124
    CTOUCH_TOUCH0_XY            = RAM_REG + $124
    TOUCH_TAG_XY                = RAM_REG + $128
    TOUCH_TAG                   = RAM_REG + $12C
    TOUCH_TAG1_XY               = RAM_REG + $130
    TOUCH_TAG1                  = RAM_REG + $134
    TOUCH_TAG2_XY               = RAM_REG + $138
    TOUCH_TAG2                  = RAM_REG + $13C
    TOUCH_TAG3_XY               = RAM_REG + $140
    TOUCH_TAG3                  = RAM_REG + $144
    TOUCH_TAG4_XY               = RAM_REG + $148
    TOUCH_TAG4                  = RAM_REG + $14C
    TOUCH_TRANSFORM_A           = RAM_REG + $150
    TOUCH_TRANSFORM_B           = RAM_REG + $154
    TOUCH_TRANSFORM_C           = RAM_REG + $158
    TOUCH_TRANSFORM_D           = RAM_REG + $15C
    TOUCH_TRANSFORM_E           = RAM_REG + $160
    TOUCH_TRANSFORM_F           = RAM_REG + $164

    TOUCH_CFG                   = RAM_REG + $168
    TOUCH_CFG_MASK              = $0000DFFF
        WORKMODE                = 15
        HOSTMODE                = 14
        IGN_SHORT               = 12
        LOWPWR                  = 11
        TOUCH_ADDR              = 4
        CAPTOUCH_VEND           = 3
        SUPPRESS_300MS          = 2
        SAMPLER_CLKS            = 0
        TOUCH_ADDR_BITS         = %1111111
        SAMPLER_CLKS_BITS       = %11
        WORKMODE_MASK           = (1 << WORKMODE) ^ TOUCH_CFG_MASK
        HOSTMODE_MASK           = (1 << HOSTMODE) ^ TOUCH_CFG_MASK
        IGN_SHORT_MASK          = (1 << IGN_SHORT) ^ TOUCH_CFG_MASK
        LOWPWR_MASK             = (1 << LOWPWR) ^ TOUCH_CFG_MASK
        TOUCH_ADDR_MASK         = (TOUCH_ADDR_BITS << TOUCH_ADDR) ^ TOUCH_CFG_MASK
        CAPTOUCH_VEND_MASK      = (1 << CAPTOUCH_VEND) ^ TOUCH_CFG_MASK
        SUPPRESS_300MS_MASK     = (TOUCH_ADDR_BITS << TOUCH_ADDR) ^ TOUCH_CFG_MASK
        SAMPLER_CLKS_MASK       = SAMPLER_CLKS_BITS ^ TOUCH_CFG_MASK

    CTOUCH_TOUCH4_X             = RAM_REG + $16C
    EHOST_TOUCH_ACK             = RAM_REG + $170
    BIST_EN                     = RAM_REG + $174
' 302178..30217C RESERVED
    TRIM                        = RAM_REG + $180
    ANA_COMP                    = RAM_REG + $184
    SPI_WIDTH                   = RAM_REG + $188
    TOUCH_DIRECT_XY             = RAM_REG + $18C
    CTOUCH_TOUCH2_XY            = RAM_REG + $18C
    TOUCH_DIRECT_Z1Z2           = RAM_REG + $190
    CTOUCH_TOUCH3_XY            = RAM_REG + $190
' 302194..302560 RESERVED
    DATESTAMP                   = RAM_REG + $564
    CMDB_SPACE                  = RAM_REG + $574
    CMDB_WRITE                  = RAM_REG + $578
    ADAPTIVE_FRAMERT            = RAM_REG + $57C
    PLAYBACK_PAUSE              = RAM_REG + $5EC
    FLASH_STATUS                = RAM_REG + $5F0
    COPRO_PATCH_PTR             = $30_9162
    EVE_ERR                     = $30_9800

' Commands
    ACTIVE                      = $00
    STANDBY                     = $41
    SLEEP                       = $42
    PWRDOWN1                    = $43
    PWRDOWN2                    = $50
    CLKEXT                      = $44
    CLKINT                      = $48

    CLKSEL1                     = $61   'Set clock freq, PLL range
    CLKSEL2                     = $62
        PLL                     = 6
        EVECLKFREQ              = 0

    RST_PULSE                   = $68
    PINDRIVE                    = $70
    PIN_PD_STATE                = $71

' Coprocessor commands
    CMD_DLSTART                 = $FFFFFF00
    CMD_SWAP                    = $FFFFFF01
    CMD_BGCOLOR                 = $FFFFFF09
    CMD_FGCOLOR                 = $FFFFFF0A
    CMD_GRADIENT                = $FFFFFF0B
    CMD_TEXT                    = $FFFFFF0C
    CMD_BUTTON                  = $FFFFFF0D
    CMD_KEYS                    = $FFFFFF0E
    CMD_PROGRESS                = $FFFFFF0F
    CMD_SLIDER                  = $FFFFFF10
    CMD_SCROLLBAR               = $FFFFFF11
    CMD_TOGGLE                  = $FFFFFF12
    CMD_GAUGE                   = $FFFFFF13
    CMD_CLK                     = $FFFFFF14
    CMD_CALIBRATE               = $FFFFFF15
    CMD_SPINNER                 = $FFFFFF16
    CMD_STOP                    = $FFFFFF17
    CMD_MEMZERO                 = $FFFFFF1C
    CMD_LOADIMAGE               = $FFFFFF24
    CMD_LOADIDENTITY            = $FFFFFF26
    CMD_TRANSLATE               = $FFFFFF27
    CMD_SCALE                   = $FFFFFF28
    CMD_ROTATE                  = $FFFFFF29
    CMD_SETMATRIX               = $FFFFFF2A
    CMD_TRACK                   = $FFFFFF2C
    CMD_DIAL                    = $FFFFFF2D
    CMD_NUMBER                  = $FFFFFF2E
    CMD_SETROTATE               = $FFFFFF36
    CMD_SETBASE                 = $FFFFFF38
    CMD_ROMFNT                  = $FFFFFF3F
    CMD_PLAYVID                 = $FFFFFF3A
    CMD_MEDIAFIFO               = $FFFFFF39
    CMD_GRADIENTA               = $FFFFFF57
    CMD_FILLWIDTH               = $FFFFFF58

' Display List Commands
    DISPLAY                     = $00_00_00_00
    CLR_COLOR_RGB               = $02_00_00_00
    ATTACH_TAG                  = $03_00_00_00

    COLOR_RGB                   = $04_00_00_00
        RED                     = 16
        GREEN                   = 8
        BLUE                    = 0

    POINT_SIZE                  = $0D_00_00_00
    LINE_WIDTH                  = $0E_00_00_00

    TAG_MASK                    = $14_00_00_00
        MASK                    = 0

    SCISSOR_XY                  = $1B_00_00_00
        SCISSOR_X               = 11
        SCISSOR_Y               = 0

    SCISSOR_SIZE                = $1C_00_00_00
        WIDTH                   = 12
        HEIGHT                  = 0

    BEGIN                       = $1F_00_00_00
        LINES                   = $03

    VERTEX2F                    = $40_00_00_00
        V2F_X                   = 15
        V2F_Y                   = 0

    VERTEX2II                   = $80_00_00_00
        X                       = 21
        Y                       = 12
        HANDLE                  = 7
        CELL                    = 0

    END                         = $21_00_00_00

    CLR                         = $26_00_00_00
        COLOR                   = 2
        STENCIL                 = 1
        TAGBUFF                 = 0

PUB Null
' This is not a top-level object

DAT
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

