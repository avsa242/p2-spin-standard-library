{
    --------------------------------------------
    Filename: core.con.paj7620u2.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2021
    Started May 21, 2020
    Updated May 19, 2021
    See end of file for terms of use.
    --------------------------------------------
}

CON

    I2C_MAX_FREQ                    = 400_000
    SLAVE_ADDR                      = $73 << 1

    SCK_MIN_FREQ                    = 22_000_000' Frame subtraction mode
    SCK_MIN_FREQ_RAW                = 44_000_000' Raw data mode
    SCK_MAX_FREQ                    = 48_000_000

    T_POR                           = 10_000    ' usec
    DEVID_RESP                      = $7620

' Register definitions

' Register bank select
    REGBANKSEL                      = $0EF
    REGBANKSEL_1                    = $17F

' Image size setting
    R_IMAGEHEIGHT                   = $0AA
    R_IMAGEWIDTH                    = $0AB
    CMD_HSIZE                       = $100
    CMD_VSIZE                       = $101
    CMD_HSTART                      = $102
    CMD_VSTART                      = $103
    CMD_ASKIP_DAVG_FLIP             = $104
        ASKIP_V                     = 5
        ASKIP_H                     = 4
        DAVG_V                      = 3
        VFLIP                       = 1
        HFLIP                       = 0

' AE/AG Controls
    R_AELEDOFF_UB                   = $046
    R_AELEDOFF_LB                   = $047
    R_AE_EXPOSURE_UB0               = $048
    R_AE_EXPOSURE_UB1               = $049
    R_AE_EXPOSURE_LB0               = $04A
    R_AE_EXPOSURE_LB1               = $04B
    R_AE_GAIN_UB                    = $04C
    R_AE_GAIN_LB                    = $04D
    R_AE_GAIN_STEP                  = $04E
        SLEEP_AUTODIS               = 4
    R_AE_GAIN_DEFAULT               = $04F
    R_EXP_SEL                       = $050
    R_MANUAL_GG                     = $051
        AE_ENH                      = 4
        MAN_EX_DEF                  = 2
        MANUAL_EXP                  = 1
    AG_STAGE_GG                     = $054
    REG_EXPOSURENUM_LSB             = $055
    REG_EXPOSURENUM_MSB             = $056
    REG_GGH_GLOBAL                  = $057
'        GLOBAL                     = 0    ' XXX NEEDS CLARIFICATION - FIELDS BOTH START AT POS 0??
'        GGH                        = 0
    AE_LED_OFF_YAVG                 = $058
    AE_DECINC                       = $059
        INC                         = 1
        DEC                         = 0
    AE_NORMAL_FACTOR                = $05A
    R_GLOBAL                        = $142
    R_GGH                           = $144

' GPIO Setting
    IM_GPIO0                        = $080  ' XXX NEEDS CLARIFICATION - FIELDS NOT CALLED OUT IN DATASHEET
    TM_GPIO0_OEL                    = $080
    TM_GPIO0_IEB                    = $080
    R_GPIO0                         = $080
    IM_GPIO1                        = $080
    TM_GPIO1_OEL                    = $080
    TM_GPIO1_IEB                    = $080
    R_GPIO1                         = $080
    IM_GPIO2                        = $080
    TM_GPIO2_OEL                    = $081
    TM_GPIO2_IEB                    = $081
    R_GPIO2                         = $081
    IM_GPIO3                        = $080
    TM_GPIO3_OEL                    = $081
    TM_GPIO3_IEB                    = $081
    R_GPIO3                         = $081
    IM_INT                          = $082
    TM_INT_OEL                      = $082
    TM_INT_IEB                      = $082
    TM_INT                          = $082

' Interrupt controls
    R_MCU_INTFLAG                   = $040
        GCLR                        = 1     ' XXX NEEDS CLARIFICATION
        INV                         = 0

    R_INT_1_EN                      = $041
    R_INT_2_EN                      = $042
    INTFLAG_1                       = $043
        FLAG_RIGHT                  = 1 << 0
        FLAG_LEFT                   = 1 << 1
        FLAG_UP                     = 1 << 2
        FLAG_DOWN                   = 1 << 3
        FLAG_FORWARD                = 1 << 4
        FLAG_BACKWARD               = 1 << 5
        FLAG_CLOCKWISE              = 1 << 6
        FLAG_CCLOCKWISE             = 1 << 7
        FLAG_WAVE                   = 1 << 8

    INTFLAG_2                       = $044
'        FLAG_WAVE                   = 1 << 0   ' Combined with above for simplicity, instead

' Gesture mode controls
    R_LIGHTTHD                      = $083
    GESTURESTARTTH_LSB              = $084
    GESTURESTARTTH_MSB              = $085
    GESTUREENDTH_LSB                = $086
    GESTUREENDTH_MSB                = $087
    OBJECTMINZ                      = $088
    OBJECTMAXZ                      = $089
    PROCESSRESOLUTION               = $08C
    TIMEDELAYNUM                    = $08D
    DISABLE45DEGREE                 = $08E
        DEG45RATIO                  = 0
    XTOYGAIN                        = $08F
        XYGAINRATIO                 = 0
    NOMOTIONCOUNTTHD                = $090
    NOOBJECTCOUNTTHD                = $091
    NORMALIZEDIMAGEWIDTH            = $092
    XDIRECTIONTHD                   = $093
    YDIRECTIONTHD                   = $094
    ZDIRECTIONTHD                   = $095
    ZDIRECTIONXYTHD                 = $096
    ZDIRECTIONANGLETHD              = $097
    ROTATEANGLETHD                  = $098
    ROTATECONTIENH                  = $099
        ROTATECONTITHD              = 0
    ROTATEXYTHD                     = $09A
    ROTATEZTHD                      = $09B
    FILTERWEIGHT                    = $09C
        FILTERDISTTHD               = 0 ' XXX NEEDS CLARIFICATION
    STARTDISTTHD                    = $09D
        ENDDISTTHD                  = 0
    ROTATEENH                       = $09F
        ZDIRECTIONENH               = 0
        YDIRECTIONENH               = 0
        XDIRECTIONENH               = 0
    FILTERIMAGE                     = $0A5
        FILTERAVG_MODE              = 0
        USELIGHTWEIGHT              = 0
    DIFFANGLETHD                    = $0A9
    OBJECTCENTERX_LSB               = $0AC
    OBJECTCENTERX_MSB               = $0AD
    OBJECTCENTERY_LSB               = $0AE
    OBJECTCENTERY_MSB               = $0AF
    OBJECTAVGY                      = $0B0  ' object brightness
    OBJECTSIZE_LSB                  = $0B1
    OBJECTSIZE_MSB                  = $0B2
    GX                              = $0B3
    GY                              = $0B4
    GZ                              = $0B5
    GESTURERESULT                   = $0B6
        GR_STATE                    = 0     ' XXX
    WAVECOUNT                       = $0B7
        ABORTCOUNT                  = 0     ' XXX
    NOOBJECTCOUNT                   = $0B8
    NOMOTIONCOUNT                   = $0B9
    LIGHTCOUNT                      = $0BA
    LIGHTACC_LSB                    = $0BB
    LIGHTACC_MSB                    = $0BC
    TIMEACC_LSB                     = $0BD
    TIMEACC_MSB                     = $0BE
    GXACC_LSB                       = $0BF
    BXACC_MSB                       = $0C0
    GYACC_LSB                       = $0C1
    GYACC_MSB                       = $0C2
    VELX_LSB                        = $0C3
    VELX_MSB                        = $0C4
    VELY_LSB                        = $0C5
    VELY_MSB                        = $0C6
    ANGLEACC_LSB                    = $0C7
    ANGLEACC_MSB                    = $0C8
    CURANGLE                        = $0C9
    XGAINVALUE                      = $0CA
    YGAINVALUE                      = $0CB
    YTOZSUM                         = $0CC
    YTOZFACTOR                      = $0CD
    POSITIONFILTERLENGTH            = $0CE
        PROCFILTERLENGTH            = 0 ' XXX
    WAVECOUNTTHD                    = $0CF
        WAVEANGLETHD                = 0 ' XXX
    ABORTCOUNTTHD                   = $0D0
        ABORTXYRATIO                = 0 ' XXX
    ABORTLENGTH                     = $0D1
    ABORTINTERVALCOUNTTHD           = $0D2
        CONFIRMMODE                 = 0 ' XXX
        WAVEENH                     = 0 ' XXX
    POSITIONFILTERCENTERX_LSB       = $0D3
    POSITIONFILTERCENTERX_MSB       = $0D4
    POSITIONFILTERCENTERY_MSB       = $0D4
    POSITIONFILTERCENTERY_LSB       = $0D5
    POSITIONFILTERCENTERY           = $0D5
    POSITIONFILTERAVGY_LSB          = $0D6
    POSITIONFILTERAVGY_MSB          = $0D7
    POSITIONFILTERSIZE_MSB          = $0D7
    POSITIONFILTERSIZE_LSB          = $0D8
    PROCESSFILTERSIZE_MSB           = $0D9
    PROCESSFILTERAVGY_MSB           = $0D9
    ABORTINTERVALCOUNT_MSB          = $0D9
    PROCESSFILTERCENTERX_LSB        = $0DA
    PROCESSFILTERCENTERX_MSB        = $0DB
    PROCESSFILTERCENTERY_MSB        = $0DB
    PROCESSFILTERCENTERY_LSB        = $0DC
    PROCESSFILTERSIZE_LSB           = $0DD
    PROCESSFILTERAVGY_LSB           = $0DE
    ABORTINTERVALCOUNT_LSB          = $0DF

' Cursor mode controls
    CURSORUSETOP                    = $032
    CURSORUSEBGMODEL                = $032
    CURSORINVERTY                   = $032
    CURSORINVERTX                   = $032
    CURSORTOPRATIO                  = $032
    POSITIONFILTERSTARTSIZETH_LSB   = $033
    POSITIONFILTERSTARTSIZETH_MSB   = $034
    PROCESSFILTERSTARTSIZETH_LSB    = $035
    PROCESSFILTERSTARTSIZETH_MSB    = $036
    CURSORCLAMPLEFT                 = $037
    CURSORCLAMPRIGHT                = $038
    CURSORCLAMPUP                   = $039
    CURSORCLAMPDOWN                 = $03A
    CURSORCLAMPCENTERX_LSB          = $03B
    CURSORCLAMPCENTERX_MSB          = $03C
    CURSORCLAMPCENTERY_LSB          = $03D
    CURSORCLAMPCENTERY_MSB          = $03E
    CURSOR_OBJECTSIZETH             = $08B
    POSITIONRESOLUTION              = $08C

' Proximity mode controls
    POX_UB                          = $069
    POX_LB                          = $06A
    STATE                           = $06B
    AVGY                            = $06C

' Background controls
    USEBGMODEL                      = $09F
    BGUSEDIFFWEIGHT                 = $09F
    BGUPDATEATPROCESS               = $09F
    BGUPDATEMAXINTENSITY_EN         = $09F
    BGUPDATEMAXINTENSITY            = $0A0
    BGFILTERLENGTHUP                = $0A1
    BGFILTERLENGTHDOWN              = $0A1
    BGDIFFTHD                       = $0A2
    BGUPDATEFREQ_LSB                = $0A3
    BGUPDATEFREQ_MSB                = $0A4
    BGRESOLUTION                    = $0A4

' Lens shading compensation
    LS_COMP_AVG_V                   = $104
    LENSSHADINGCOMP_ENH             = $125
    OFFSETX                         = $126
    OFFSETY                         = $127
    LSC                             = $128
    LSFT                            = $129

' LED controls
    LED_SOFTSTART_TIME              = $130
    LED2_DAC_ENL                    = $131
    LED1_DAC_ENL                    = $131
    LED2_DAC_MANUAL                 = $131
    LED1_DAC_MANUAL                 = $131
    LED1_DAC_UB                     = $132
    LED2_DAC_UB                     = $133
    LEDC_STEP_UP                    = $134
    LEDC_STEP_DOWN                  = $135

' Sleep mode
    SLEEPMODE_STATUS                = $045
    SLEEPAE1                        = $052
    SLEEPAE2                        = $052
    SLEEPAG1                        = $052
    SLEEPAG2                        = $052
    IDLE_TIME_LSB                   = $165
    IDLE_TIME_MSB                   = $166
    IDLE_TIME_SLEEP_1_LSB           = $167
    IDLE_TIME_SLEEP_1_MSB           = $168
    IDLE_TIME_SLEEP_2_LSB           = $169
    IDLE_TIME_SLEEP_2_MSB           = $16A
    OBJ_TIME_1_LSB                  = $16B
    OBJ_TIME_1_MSB                  = $16C
    OBJ_TIME_2_LSB                  = $16D
    OBJ_TIME_2_MSB                  = $16E
    TG_INIT_TIME                    = $16F
    TG_POWERON_WAKEUP_TIME          = $171
    TG_ENH                          = $172
    AUTO_SLEEP_MODE1                = $173
    AUTO_SLEEP_MODE2                = $173
    AUTO_WAKEUP_MODE                = $173
    WAKEUPSIG_SEL                   = $174

' Clock controls
    OSCRCPD                         = $03F
    SENCLKPRD                       = $05C
    SENCLK_CONTROL                  = $05D
    OTHER_CLK_MANUAL                = $05E
    CLK_MANUAL                      = $05F
    TS_OSC_CODE                     = $060
    OSC_CODE                        = $061
    REF_CLK_CNT_UB_MSB              = $063
    REF_CLK_CNT_UB_LSB              = $064
    REF_CLK_CNT_LB_MSB              = $065
    REF_CLK_CNT_MB_LSB              = $066
    OSC_WAIT                        = $067
    OSC_RANGE                       = $068

' Chip/version ID
    PARTID_LSB                      = $000
    PARTID_MSB                      = $001
        PARTID_RESP                 = $7620

    VERSION                         = $002
        VERSION_RESP                = $01

' Suspend/reset
    SW_SUSPEND_ENL                  = $003  'I2C suspend
'       0 - no suspend
'       1 - suspend (def)
    R_REGBANK_RESET                 = $0EE
    TGREGBANK_SWRSTN                = $0EE
    DMSREGBANK_SWRSTN               = $0EE

' Test mode
    DSP_TESTOBJ_SIZE                = $0E0
    DSP_TEST_MODE                   = $0E0
    DSP_TESTOBJ_HI                  = $0E1
    DSP_TESTOBJ_LO                  = $0E2
    DSP_TESTOBJ_DIST                = $0E3
    DSP_TESTOBJ_SPEED               = $0E3
    DSP_TESTOBJ_POSL                = $0E4
    DSP_TESTOBJ_POSR                = $0E5
    DSP_TESTOBJ_POSU                = $0E6
    DSP_TESTOBJ_POSD                = $0E7
    DSP_TESTOBJ_FRAMECNT            = $0E8
    DSP_TESTOBJ_NUM                 = $0E8
    DSP_TEST_NOISE_ENH              = $0E9

#ifndef __propeller2__
PUB Null
'' This is not a top-level object
#endif

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
