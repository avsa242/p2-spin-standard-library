{
    --------------------------------------------
    Filename: com.spi.spin2
    Description: SPI engine (smart-pin driven) for the Propeller 2
    Author: Jesse Burt
    Copyright (c) 2022
    Created: Apr 15, 2020
    Updated: Oct 12, 2022
    See end of file for terms of use.
    --------------------------------------------

    NOTE: This is based on XPT2046.spin2,
        by Cheezus Slice
}

CON

    CLKS        = NUMBITS * 2                   ' XXX hardcoded as original, for now
    NUMBITS     = 8                             '

VAR

    long _SCK, _MOSI, _MISO

OBJ

    sp      : "core.con.smartpins"

PUB null()
' This is not a top-level object

PUB init(SCK, MOSI, MISO, SPI_MODE=0, SCK_FREQ=1_000_000): status | MISO_rel, MOSI_rel
' SCK: SPI Clock
' MOSI: Master Out Slave In
' MISO: Master In Slave Out
' SPI_MODE: 0..3 (* not functional, yet)
' SCK_FREQ: SPI bus clock frequency
'   NOTE: MOSI and MISO must be within +/- 3 pins of SCK
'   Example:
'       If SCK is pin 10,
'       MOSI and MISO can (uniquely) be 7, 8, 9, 11, 12, or 13
'   NOTE: This engine isn't suitable for 3-wire SPI, since the
'   pin inputs/outputs are set once, when initializing the engine
    longmove(@_SCK, @SCK, 3)

    pinstart(SCK, sp.TRANSITION_OUT | sp.SMART_OUT_DRIVE | sp.OUTPUT_ENABLED,{
    } spi_clk_period(SCK_FREQ), 0)              ' Setup SCK in transition mode

    if (lookdown(MISO: 0..63))                  ' MISO optional
        case SCK-MISO                           ' Check: within 3 of SCK?
            1, 2, 3:                            ' MISO pin is lower than SCK
                MISO_rel := lookup(SCK-MISO:{
                } sp.BINP_RELPLS1_READ,{        ' SCK is relative (MISO) + ...
                } sp.BINP_RELPLS2_READ,{
                } sp.BINP_RELPLS3_READ)
            -1, -2, -3:                         ' MISO pin is higher than SCK
                MISO_rel := lookup((SCK-MISO)+4:{
                } sp.BINP_RELMIN3_READ,{        ' SCK is relative (MISO) - ...
                } sp.BINP_RELMIN2_READ,{
                } sp.BINP_RELMIN1_READ)
            other:
                return                          ' invalid choice for MISO

        pinstart(MISO, sp.SYNCSERIAL_RX | sp.SMART_OUT_DRIVE |{
        } sp.OUTPUT_DISABLED | MISO_rel | sp.BINP_TRUE,{
        } sp.SAMPLE_A_BEFORE_B + (NUMBITS - 1), 0)

    case SCK-MOSI
        1, 2, 3:
            MOSI_rel := lookup(SCK-MOSI:{
            } sp.BINP_RELPLS1_READ,{
            } sp.BINP_RELPLS2_READ,{
            } sp.BINP_RELPLS3_READ)
        -1, -2, -3:
            MOSI_rel := lookup((SCK-MOSI)+4:{
            } sp.BINP_RELMIN3_READ,{
            } sp.BINP_RELMIN2_READ,{
            } sp.BINP_RELMIN1_READ)
        other:
            return                              ' invalid choice for MOSI

    pinstart(MOSI, sp.SYNCSERIAL_TX | sp.SMART_OUT_DRIVE | sp.OUTPUT_ENABLED |{
    } MOSI_rel | sp.BINP_INVERTED, sp.START_STOP + (NUMBITS - 1), $FF)
'    wypin(MOSI, $FF)                           ' XXX Copy from original code - verify function

    rdpin(MISO)
    return cogid()+1                            ' Parent cogid; return nonzero

PUB deinit()
' Reset smart pins - restore I/O pin control to "classic" digital DIR/IN/OUT mode
    pinclear(_SCK)
    pinclear(_MISO)
    pinclear(_MOSI)

PUB rdblock_lsbf(ptr_buff, nr_bytes) | SCK, MOSI, MISO, b_num, tmp  'XXX UNTESTED
' Read block of data from SPI bus, least-significant byte first
' Read a byte from SPI slave
    longmove(@SCK, @_SCK, 3)
    tmp := 0

    repeat b_num from 0 to nr_bytes-1
        tmp := rdpin(MISO)                          ' Clear RX buffer (XXX verify)
        tmp := rdpin(SCK)                           ' XXX Copy from original code - verify function
        wypin (SCK, CLKS)                           ' Clock in data

        repeat until pinr(SCK)                      ' Wait until SCK isn't busy
        tmp := rdpin(MISO)                          ' Read the clocked in data
        tmp := (tmp rev 31) & $FF                   ' Reverse bit order and discard
        byte[ptr_buff][b_num] := tmp

PUB rdblock_msbf(ptr_buff, nr_bytes) | SCK, MOSI, MISO, b_num, tmp  'XXX UNTESTED
' Read block of data from SPI bus, most-significant byte first
   longmove(@SCK, @_SCK, 3)
    tmp := 0

    repeat b_num from nr_bytes-1 to 0
        tmp := rdpin(MISO)                          ' Clear RX buffer (XXX verify)
        tmp := rdpin(SCK)                           ' XXX Copy from original code - verify function
        wypin (SCK, CLKS)                           ' Clock in data

        repeat until pinr(SCK)                      ' Wait until SCK isn't busy
        tmp := rdpin(MISO)                          ' Read the clocked in data
        tmp := (tmp rev 31) & $FF                   ' Reverse bit order and discard
        byte[ptr_buff][b_num] := tmp

PUB wrblock_lsbf(ptr_buff, nr_bytes) | SCK, MOSI, MISO, b_num
' Write block of data to SPI bus from ptr_buff, least-significant byte first
    longmove(@SCK, @_SCK, 3)

    repeat b_num from 0 to nr_bytes-1
        wypin(MOSI, (byte[ptr_buff][b_num] << 24) rev 31)
        rdpin(SCK)
        wypin(SCK, CLKS)
        repeat until pinr(SCK)
        wypin(MOSI, 0)

PUB wrblock_msbf(ptr_buff, nr_bytes) | SCK, MOSI, MISO, clk_delay, b_num, tmp
' Write block of data to SPI bus from ptr_buff, most-significant byte first
    longmove(@SCK, @_SCK, 3)

    repeat b_num from nr_bytes-1 to 0
        wypin(MOSI, (byte[ptr_buff][b_num] << 24) rev 31)
        rdpin(SCK)
        wypin(SCK, CLKS)
        repeat until pinr(SCK)

#define HAS_WR_BYTEX
PUB wr_bytex(byte2spi, nr_bytes) | SCK, MOSI, MISO
' Repeatedly write byte2spi to SPI bus, nr_bytes times
    longmove(@SCK, @_SCK, 3)                    ' copy hub vars to locals

    repeat nr_bytes
        wypin(MOSI, (byte2spi << 24) rev 31)    ' move LSB into position
        rdpin(SCK)                              '   and write it
        wypin(SCK, CLKS)
        repeat until pinr(SCK)
        wypin(MOSI, 0)

#define HAS_WRWORDX_MSBF
PUB wrwordx_msbf(word2spi, nr_words) | SCK, MOSI, MISO
' Repeatedly write word2spi to SPI bus, nr_words times
    longmove(@SCK, @_SCK, 3)                    ' copy hub vars to locals

    repeat nr_words
        wypin(MOSI, (word2spi << 16) rev 31)    ' move MSB into position
        rdpin(SCK)                              '   and write it
        wypin(SCK, CLKS)
        repeat until pinr(SCK)
        wypin(MOSI, 0)

        wypin(MOSI, (word2spi << 24) rev 31)    ' move LSB into position
        rdpin(SCK)                              '   and write it
        wypin(SCK, CLKS)
        repeat until pinr(SCK)
        wypin(MOSI, 0)

PRI spi_clk_period(SCK_FREQ): bt
' Calculate SPI clock period
    bt := ((clkfreq / SCK_FREQ) / 2)            ' SPI bit time
    bt := bt #> 2                               ' Clamp to min of syclock/2

#include "com.spi.common.spin2h"                ' R/W methods common to all SPI engines

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

