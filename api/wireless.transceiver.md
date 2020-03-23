# wireless.transceiver
----------------------

API for packet radio and other RF transceiver device drivers

Object filename description:

wireless.transceiver.model.int

_transceiver_ is one of: transceiver, transmitter, receiver

_model_ indicates the manufacturer's model number of the device

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

## Methods

| Method                                | Description                                                   |
| --------------------------------------|-------------------------------------------------------------- |
|`AbortListen`                          | Aborts listen mode                                            |
|`AddressCheck(mode)`                   | Validate address on incoming packets                          |
|`AddressWidth(bytes)`                  | Set width of RX/TX address field                              |
|`AFCAuto(enabled)`                     | Enable automatic frequency control                            |
|`AFCComplete`                          | Flag indicating AFC completed                                 |
|`AFCMethod(method)`                    | Set AFC method                                                |
|`AFCOffset`                            | Read AFC offset                                               |
|`AFCStart`                             | Trigger a manual AFC                                          |
|`AfterRX(next_state)`                  | Define state to transition to after packet rcvd               |
|`AfterTX(next_state)`                  | Define state to transition to after packet xmit               |
|`AGC(mode)`                            | Automatic Gain Control                                        |
|`AGCFilterLength(samples)`             | AGC filter sample averaging                                   |
|`AppendStatus(bool)`                   | Automatically append status bytes to payload                  |
|`AutoAckEnabledPipes(pipe_mask)`       | Enable auto acknowledgement                                   |
|`AutoRetransmitCount(tries)`           | Set number of re-transmit attempts                            |
|`AutoRetransmitDelay(delay_us)`        | Set automatic retransmission delay                            |
|`BattLow`                              | Flag indicating battery low                                   |
|`CarrierFreq(freq)`                    | Set carrier/center/base frequency                             |
|`Channel(number)`                      | Set frequency by index/channel number                         |
|`CRCCheckEnabled(enabled)`             | Enable CRC generation (TX) and checking (RX)                  |
|`CRCLength(bytes)`                     | Set CRC encoding scheme length                                |
|`CrystalOff`                           | Turn off crystal oscillator                                   |
|`DataRate(bps)`                        | Set OTA data rate                                             |
|`DataWhitening(enabled)`               | Enable data whitening                                         |
|`DeviceID`                             | Get device part number/ID                                     |
|`DynamicACK(enabled)`                  | Enable selective auto-ack                                     |
|`DynamicPayload(mask)`                 | Select data pipes that have dynamic payload length enabled    |
|`DynPayloadEnabled(enabled)`           | Enable Dynamic Payload Length                                 |
|`EnableACK(enabled)`                   | Enable payload with CK                                        |
|`FEC(enabled)`                         | Enable forward error correction                               |
|`FIFORXBytes`                          | Returns num bytes in RX FIFO                                  |
|`FIFOTXBytes`                          | Returns num bytes in TX FIFO                                  |
|`FlushRX`                              | Flush receive FIFO                                            |
|`FlushTX`                              | Flush transmit FIFO                                           |
|`FreqDeviation(Hz)`                    | Set carrier freq deviation                                    |
|`GPIOx(config)`                        | Configure signal output on GPIOx                              |
|`Idle`                                 | Change transceiver to idle state                              |
|`IntMask(mask)`                        | Select Control which events will trigger an interrupt         |
|`LNAGain(dB)`                          | Set LNA gain                                                  |
|`LostPackets`                          | Count lost packets                                            |
|`MaxRetransReached(clear_intr)`        | Query or clear Maximum number of TX retransmits interrupt     |
|`Modulation(type)`                     | Set OTA modulation                                            |
|`NodeAddress(addr)`                    | Set node address                                              |
|`PacketsRetransmitted`                 | Count retransmitted packets                                   |
|`PayloadLen(length)`                   | Set packet length                                             |
|`PayloadLenCfg(mode)`                  | Set packet length mode                                        |
|`PayloadReady(read_clear)`             | Query or clear Data Ready RX FIFO interrupt                   |
|`PayloadSent(read_clear)`              | Query or clear Data Sent TX FIFO interrupt                    |
|`PipesEnabled(mask)`                   | Enable data pipes by mask                                     |
|`PLL_Lock(enabled)`                    | Force PLL lock signal                                         |
|`PowerUp(enabled)`                     | Power on or off                                               |
|`PreambleLen(bytes)`                   | Set number of preamble bytes                                  |
|`RSSI`                                 | Received Signal Strength Indicator                            |
|`RXAddr(buff_addr, pipe, rw)`          | Set receive address of pipe number                            |
|`RXBandwidth(Hz)`                      | Set receiver channel filter bandwidth                         |
|`RXFIFOEmpty`                          | Flag indicating RX FIFO is empty                              |
|`RXFIFOFull`                           | Flag indicating RX FIFO is full                               |
|`RXMode`                               | Change chip state to receive                                  |
|`RXPayload(nr_bytes, ptr)`             | Receive data from FIFO                                        |
|`RXPipePending`                        | Returns pipe number with pending data                         |
|`Sleep`                                | Power down chip                                               |
|`State`                                | Read chip state machine                                       |
|`SyncWord(sync_word)`                  | Set syncword                                                  |
|`SyncWordLen(length)`                  | Set syncword length                                           |
|`SyncWordTolerance(bits)`              | Set syncword qualifier mode                                   |
|`TESTCW`                               | Enable CW carrier transmit                                    |
|`TXAddr(ptr)`                          | Set node address to transmit to                               |
|`TXFIFOEmpty`                          | Flag indicating TX FIFO is empty                              |
|`TXFIFOFull`                           | Flag indicating TX FIFO is full                               |
|`TXMode`                               | Change chip state to transmit                                 |
|`TXPayload(nr_bytes, ptr)`             | Transmit data queued in FIFO                                  |
|`TXPower(dBm)`                         | Set transmit power                                            |
|`TXReuse`                              | Flag indicating last payload transmitted is to be re-used     |
|`WOR`                                  | Set chip to Wake On Radio                                     |

