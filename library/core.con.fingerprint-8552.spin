{
    --------------------------------------------
    Filename: core.con.fingerprint-8552.spin
    Author: Jesse Burt
    Description: Low-level constants
    Copyright (c) 2020
    Started May 18, 2020
    Updated May 20, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

' UART configuration
    UART_MODE           = %0000
    UART_MAX_BPS        = 19_200

    SOM                 = $F5
    EOM                 = $F5

' Structure of 8 byte command
    IDX_SOM             = 0
    IDX_CMD             = 1
    IDX_P1              = 2
    IDX_P2              = 3
    IDX_P3              = 4
    IDX_0               = 5
    IDX_CHK             = 6
    IDX_EOM             = 7

' Structure of 8 byte response (as above, but with these differences)
    IDX_Q1              = 2
    IDX_Q2              = 3
    IDX_Q3              = 4

' Structure of >8 byte command (as above, but with these differences)
    IDX_LENMSB          = 2
    IDX_LENLSB          = 3
    IDX_0M              = 4
    IDX_0L              = 5

' Checksum start and end
    CKSUM_START         = 1
    CKSUM_END           = 5

' Status bytes
    ACK_SUCCESS         = $00
    ACK_FAIL            = $01
    ACK_FULL            = $04
    ACK_NOUSER          = $05
    ACK_USER_EXIST      = $06
    ACK_FIN_EXIST       = $07
    ACK_TIMEOUT         = $08

' Register definitions/instruction set
    ADD_FNGPRT_01       = $01
    ADD_FNGPRT_02       = $02
    ADD_FNGPRT_03       = $03
        FLD_UIDMSB      = 0     '
        FLD_UIDLSB      = 1     ' $01-$FFF
        FLD_PRIVILEGE   = 2     ' 1, 2, 3
'       FLD_0           = 3

    DEL_USER            = $04
'       FLD_UIDMSB      = 0
'       FLD_UIDLSB      = 1
'       FLD_0           = 2
'       FLD_0           = 3

    DEL_ALL_USERS       = $05
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    RD_NR_USERS         = $09
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    RD_USER_PRIV        = $0A
'       FLD_UIDMSB      = 0
'       FLD_UIDLSB      = 1
'       FLD_0           = 2
'       FLD_0           = 3

    COMPARE1TO1         = $0B
'       FLD_UIDMSB      = 0
'       FLD_UIDLSB      = 1
'       FLD_0           = 2
'       FLD_0           = 3

    COMPARE1TON         = $0C
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    RD_IMAGES           = $23
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    RD_DSP_VER          = $26
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    CMP_LEVEL           = $28
    CMP_LEVEL_R         = $01
'       FLD_0           = 0
        FLD_NEWLEVEL    = 1
        FLD_RW_CMPLEV   = 2
'       FLD_0           = 3

    RD_UID_PRIVS        = $2B
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    DORMANT             = $2C
'       FLD_0           = 0
'       FLD_0           = 1
'       FLD_0           = 2
'       FLD_0           = 3

    FNGPRT_ADDMODE      = $2D
        FLD_0           = 0
        FLD_RPT         = 1
        FLD_RW_ADD      = 2
        ADDMODE_W       = 0
        ADDMODE_R       = 1

    CAPTURE_TIMEOUT     = $2E
'       FLD_0           = 0
        FLD_TIMEOUT     = 1
        FLD_RW_TIMEOUT  = 2
'       FLD_0           = 3

PUB Null
' This is not a top-level object
