# wireless.transceiver
----------------------

API for packet radio and other RF transceiver device drivers

Object filename description:

`wireless.mode.model.spin2`

_mode_ is one of: transceiver, transmitter, receiver, bluetooth, bluetooth-le

_model_ indicates the manufacturer's model number of the device

## Base Methods

These are methods that are common to _all_ wireless drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For SPI-connected devices:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_FREQ): status`
	* 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `startx()` method will check for this and set the device's 3-wire SPI mode register.

2. Some drivers may have a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `reset()` method, and is ignored if set
outside the allowable range.

3. `startx()` returns the launched cog number+1 of com engine used on success.

4. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `deviceid()` didn't return the expected value

5. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

6. Most (but not all) drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `deviceid()`    | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

7. Drivers may have one or more `preset_()` methods, that establish a pre-set combination of
bitrates, modulation, TX/RX role, etc.

8. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Transceivers

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `carrierfreq()` | Set carrier frequency                            | Hz       | current freq    |
| `datarate()`    | Set RF data rate                                 | bps      | current rate    |
| `payloadlen()`  | Set length of static payload/max dyn. payload    | bytes    | current len     |
| `payloadready()`| Flag indicating received payload is ready        | n/a      | boolean         |
| `payloadsent()` | Flag indicating payload sent                     | n/a      | boolean         |
| `rxpayload()`   | Receive payload stored in FIFO                   | note 1   | n/a             |
| `txpayload()`   | Queue payload to be transmitted                  | note 2   | n/a             |
| `txpower()`     | Set transmit RF power                            | dBm      | current dBm     |

Notes:

1. `rxpayload(nr_bytes, ptr_buff)`: specify number of bytes to receive and a pointer to the buffer
to store the incoming data.

2. `txpayload(nr_bytes, ptr_buff)`: specify number of bytes to transmit and a pointer to the buffer
containing the data to transmit.

3. Methods return the current setting when they're given a parameter that is out of range
(see [driver-basic-structure.md](driver-basic-structure.md).

4. Other methods availability are device-dependent.



## BLE

| Method           | Description                                 | Param    | Returns         |
| ---------------- | ------------------------------------------- | -------- | --------------- |
| `advinterval()`  | Set advertising interval                    | msec     | current val     |
| `advtype()`      | Set advertising type                        | type     | current type    |
| `authmode()`     | Set authentication mode                     | mode     | current mode    |
| `char()`         | Send a single character                     | char     | n/a             |
| `connnotify()`   | Enable (dis)connection notifications        | bool     | current val     |
| `count()`        | Number of characters in receive buffer      | n/a      | # chars         |
| `datarate()`     | Set serial/on-air data rate                 | bps      | current val     |
| `lastconnected()`| Last connected device's address             | n/a      | pointer to str  |
| `nodeaddress()`  | Read device's node address                  | n/a      | pointer to str  |
| `nodename()`     | Set BLE module name                         | ptr_str  | pointer to str  |
| `pincode()`      | Set PIN code                                | pin      | current val     |
| `reset()`        | Soft-reset device                           | n/a      | n/a             |
| `resolvenames()` | Resolve MAC addresses to names              | bool     | current val     |
| `role()`         | Set device role                             | role     | current val     |
| `rxcheck()`      | Check for received character (non-blocking) | n/a      | ASCII char      |
| `scantime()`     | Set length of scan                          | secs     | current val     |
| `rdstr_max()`    | Read received string, up to max len         | note 1   | n/a             |
| `sysledmode()`   | Set output mode of module's LED             | mode     | current val     |
| `txpower()`      | Set transmit RF power                       | dBm      | current dBm     |
| `unpair()`       | Remove pairing/bonding information          | n/a      | n/a             |
| `version()`      | Get firmware version                        | n/a      | ver (int)       |
| `workmode()`     | Set device working mode                     | mode     | current val     |

Notes:

1. `rdstr_max(ptr_str, max_len)`: pointer to a buffer to read string into, up to max_len bytes

2. This section preliminary (currently only one driver exists)

