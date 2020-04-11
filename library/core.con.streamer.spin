{
    --------------------------------------------
    Filename: core.con.streamer.spin
    Author: Jesse Burt
    Description: Constants for use in setting up the streamer
    Copyright (c) 2020
    Started Apr 11, 2020
    Updated Apr 11, 2020
    See end of file for terms of use.
    --------------------------------------------
}

' Streamer mode:
'   D-field, bits 31..16 of streamer instruction (XINIT, XZERO, XCONT)
'       Mode DACs Pins Base
'       |||| |||| |||| ||||
'      %mmmm_dddd_eppp_bbbb
'
'       Mode - Streamer mode
'       DACs - Configuration of the 4 streamer DACs
'       Pins - Output to pins (digital output)
'       Base - Base address (bbbb00000) within LUT RAM to use in LUT modes

' Streamer duration:
'   D-field, bits 0..15 of streamer instruction
'      %xxxx_xxxx_xxxx_xxxx - Number of NCO rollovers the command will be active for

' Streamer submodes:
'   S-field of streamer instruction

CON

' Streamer commands
    MODE                    = 28                            ' mmmm
        DDS_GOERTZEL        = %0000 << MODE
        RFBYTE              = %0001 << MODE
        RFWORD              = %0010 << MODE
        RFLONG              = %0011 << MODE
        RFLONG_LUT_1BIT     = %0100 << MODE
        RFLONG_LUT_2BIT     = %0101 << MODE
        RFLONG_LUT_4BIT     = %0110 << MODE
        RFLONG_LUT_8BIT     = %0111 << MODE
        IMM_LUT_1BIT        = %1000 << MODE
        IMM_LUT_2BIT        = %1001 << MODE
        IMM_LUT_4BIT        = %1010 << MODE
        IMM_LUT_8BIT        = %1011 << MODE
        IMM_32BIT           = %1100 << MODE
        WFBYTE_XPIN         = %1101 << MODE
        WFWORD_XPIN         = %1110 << MODE
        WFLONG_XPIN         = %1111 << MODE

    DACS                    = 24                            ' dddd
        NO_OUTPUT           = %0000 << DACS
        X0_ALL              = %0001 << DACS
        X0_DAC1_0           = %0010 << DACS
        X0_DAC3_2           = %0011 << DACS
        X0_DAC0             = %0100 << DACS
        X0_DAC1             = %0101 << DACS
        X0_DAC2             = %0110 << DACS
        X0_DAC3             = %0111 << DACS
        X0_DIFFPAIRS        = %1000 << DACS
        X0_DIFFPAIR_1_0     = %1001 << DACS
        X0_DIFFPAIR_3_2     = %1010 << DACS
        X1_X0_PAIR_3210     = %1011 << DACS
        X1_X0_PAIR_10       = %1100 << DACS
        X1_X0_PAIR_32       = %1101 << DACS
        X1_X0_DIFFPAIRS     = %1110 << DACS
        X3X2X1X0            = %1111 << DACS

    OUTPUTENA               = 20                            ' eppp
        OUT_DISABLE         = %0000 << OUTPUTENA
        OUT_31_0            = %1000 << OUTPUTENA
        OUT_39_8            = %1001 << OUTPUTENA
        OUT_47_16           = %1010 << OUTPUTENA
        OUT_55_24           = %1011 << OUTPUTENA
        OUT_63_32           = %1100 << OUTPUTENA
        OUT_7_0__63_40      = %1101 << OUTPUTENA
        OUT_15_0__63_48     = %1110 << OUTPUTENA
        OUT_23_0__63_56     = %1111 << OUTPUTENA

    LUTBASE                 = 16                            ' bbbb

' Submodes (S-field)
    RFBYTE_1BIT             = %00000
    RFBYTE_2BIT             = %00001
    RFBYTE_4BIT             = %00010
    RFBYTE_8BIT             = %00011
    RFBYTE_LUMA8            = %01000
    RFBYTE_RGBI8            = %10000
    RFBYTE_RGB8             = %11000

    RFWORD_16BIT            = %0
    RFWORD_RGB16            = %1

    RFLONG_32BIT            = %0
    RFLONG_RGB24            = %1

    WFBYTE_1PIN             = %000
    WFBYTE_2PIN             = %001
    WFBYTE_4PIN             = %010
    WFBYTE_8PIN             = %11

PUB Null
' This is not a top-level object
