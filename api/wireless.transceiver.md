# wireless.transceiver
----------------------

API for packet radio and other RF transceiver device drivers

Object filename description:

`wireless.mode.model.spin`

_mode_ is one of: `transceiver`, `transmitter`, `receiver`, `bluetooth`, `bluetooth-le`

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
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN): status`
	* For some devices, a `MODEL_SPI_BC` variant exists, which directs the driver to use a
bytecode-based engine that while much slower, doesn't use another cog.
	* Replace `MODEL` with the sensor model #. Example: `CC1101_SPI_BC`
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
	* If supported by the device, `dev_id()` didn't return the expected value

5. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

6. Most (but not all) drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `dev_id()`      | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

7. Drivers may have one or more `preset_()` methods, that establish a pre-set combination of
bitrates, modulation, TX/RX role, etc.

8. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Transceivers

| Method          | Description                                      |
| --------------- | ------------------------------------------------ |
| `carrier_freq()`| Set carrier frequency                            |
| `data_rate()`   | Set RF data rate                                 |
| `payld_len()`   | Set length of static payload/max dyn. payload    |
| `payld_rdy()`   | Flag indicating received payload is ready        |
| `payld_sent()`  | Flag indicating payload sent                     |
| `rx_payld()`    | Receive payload stored in FIFO                   |
| `tx_payld()`    | Queue payload to be transmitted                  |
| `tx_pwr()`      | Set transmit RF power                            |


`carrier_freq(f)`
----------------
__Set carrier frequency__
* Parameters:
	* `f`: new carrier/center frequency in Hertz
* Returns:
	* current frequency in Hertz if `f` is outside the accepted range

__NOTE__: Due to variable size limitations, transceivers that operate in higher frequency
ranges may use a kilohertz parameter (e.g., `2_400_000kHz` instead of `2_400_000_000Hz`)


`data_rate(r)`
-------------
__Set RF data rate__
* Parameters:
	* `r`: new on-air data rate in bits per second
* Returns:
	* current data rate if `r` is outside the accepted range


`payld_len(l)`
-------------
__Set length of static payload, or set max dynamic payload__
* Parameters:
	* `l`: new length of payload
* Returns:
	* currently set payload length if `l` is outside the accepted range


`payld_rdy()`
-------------
__Flag indicating received payload is ready__
* Parameters: none
* Returns:
	* boolean flag indicating a payload was received


`payld_sent()`
--------------
__Flag indicating payload sent__
* Parameters: none
* Returns:
	* boolean flag indicating a payload was sent


`rx_payld(nr_bytes, ptr_buff)`
------------------------------
__Receive payload stored in FIFO__
* Parameters:
	* `nr_bytes`: number of bytes to read
	* `ptr_buff`: pointer to buffer to copy payload data to
* Returns:
	* none


`tx_payld(nr_bytes, ptr_buff)`
------------------------------
__Queue payload to be transmitted__
* Parameters:
	* `nr_bytes`: number of bytes to transmit
	* `ptr_buff`: pointer to buffer to copy payload data from
* Returns:
	* none


`tx_pwr(p)`
----------
__Set transmit RF power__
* Parameters:
	* `p`: new transmit power level in dBm
* Returns:
	* currently set transmit power if `p` is outside the accepted range


Notes:

1. Methods return the current setting when they're given a parameter that is out of range
(see [driver-basic-structure.md](driver-basic-structure.md).

2. Other methods availability are device-dependent.



## BLE

| Method                | Description                                 |
| --------------------- | ------------------------------------------- |
| `advert_interval()`   | Set advertising interval                    |
| `advert_type()`       | Set advertising type                        |
| `auth_mode()`         | Set authentication mode                     |
| `putchar()`           | Send a single character                     |
| `conn_notify_ena()`   | Enable (dis)connection notifications        |
| `fifo_rx_bytes()`     | Number of characters in receive buffer      |
| `data_rate()`         | Set serial/on-air data rate                 |
| `last_connected_dev()`| Last connected device's address             |
| `node_addr()`         | Read device's node address                  |
| `node_name()`         | Set BLE module name                         |
| `pin_code()`          | Set PIN code                                |
| `reset()`             | Soft-reset device                           |
| `resolve_names()`     | Resolve MAC addresses to names              |
| `role()`              | Set device role                             |
| `rx_check()`          | Check for received character (non-blocking) |
| `scan_time()`         | Set length of scan                          |
| `gets_max()`          | Read received string, up to max len         |
| `sys_led_mode()`      | Set output mode of module's LED             |
| `tx_pwr()`            | Set transmit RF power                       |
| `unpair()`            | Remove pairing/bonding information          |
| `version()`           | Get firmware version                        |
| `work_mode()`         | Set device working mode                     |


`advert_interval()`
-------------------
__Get advertising interval__
* Parameters: none
* Returns: time in milliseconds


`set_advert_interval(i)`
-----------------------
__Set advertising interval__
* Parameters:
	* `i`: time in milliseconds
* Returns: none


`advert_type()`
---------------
__Get advertising type__
* Parameters: none
* Returns: type


`set_advert_type(t)`
--------------------
__Set advertising type__
* Parameters:
	* `t`: advertising type
* Returns: none


`auth_mode()`
-------------
__Get authentication mode__
* Parameters: none
* Returns: currently set authentication mode


`set_auth_mode(m)`
------------------
__Set authentication mode__
* Parameters:
	* `m`: mode
* Returns: none


`putchar(ch)`
-------------
__Send a single character__
* Parameters:
	* `ch`: ASCII character to send
* Returns: none
* Aliases: `char()`


`getchar()`
-----------
__Receive a single character__
* Parameters: none
* Returns:
	* ASCII character received
* Aliases: `charin()`


`conn_notify_ena(state)`
------------------------
__Enable (dis)connection notifications__
* Parameters:
	* `state`: boolean state
* Returns: none


`is_conn_notify_ena()`
----------------------
__Get current state of (dis)connection notifications__
* Parameters: none
* Returns:
	* current state of setting


`fifo_rx_bytes()`
-----------------
__Number of characters in receive buffer__
* Parameters: none
* Returns:
	* number of bytes available in buffer


`data_rate()`
-------------
__Get current serial/on-air data rate__
* Parameters: none
* Returns:
	* current data rate in bits per second


`set_data_rate(rate)`
---------------------
__Set serial/on-air data rate__
* Parameters:
	* `rate`: new data rate in bits per second
* Returns: none


`last_connected_dev()`
----------------------
__Last connected device's address__
* Parameters: none
* Returns:
	* pointer to string containing MAC address of remote device


`node_addr()`
-------------
__Read device's node address__
* Parameters: none
* Returns:
	* pointer to string containing MAC address of local device


`node_name()`
-------------
__Get BLE module current name__
* Parameters: none
* Returns:
	* pointer to string containing name of module


`set_node_name(ptr_name)`
-------------------------
__Set BLE module name__
* Parameters:
	* `ptr_name`: pointer to string containing new name of module
* Returns: none


`pin_code()`
------------
__Get current PIN code__
* Parameters: none
* Returns:
	* current PIN code


`set_pin_code(pin)`
-------------------
__Set PIN code__
* Parameters:
	* `pin`: new PIN code
* Returns: none


`reset()`
---------
__Soft-reset device__
* Parameters: none
* Returns: none


`resolve_names(state)`
----------------------
__Resolve MAC addresses to names__
* Parameters:
	* `state`: boolean value to enable resolving MAC addresses to names during scans
* Returns: none


`is_resolve_names_ena()`
------------------------
__Resolve MAC addresses to names__
* Parameters: none
* Returns:
	* flag indicating MAC to name resolution is enabled


`role()`
--------
__Get device current role__
* Parameters: none
* Returns:
	* device's currently set role


`set_role(r)`
-------------
__Set device role__
* Parameters:
	* `r`: new device role
* Returns: none


`rx_check()`
------------
__Check for received character (non-blocking)__
* Parameters: none
* Returns:
	* ASCII value of character, or -1 if none received


`scan_time()`
-------------
__Get length of scan__
* Parameters: none
* Returns:
	* currently set length of scan in seconds


`set_scan_time(s)`
------------------
__Set length of scan__
* Parameters:
	* `s`: length of scan in seconds
* Returns: none


`gets_max(ptr_str, max_len)`
----------------------------
__Read received string, up to max len__
* Parameters:
	* `ptr_str`: pointer to buffer to copy received string to
	* `max_len`: maximum number of bytes to receive
* Returns: none


`sys_led_mode()`
----------------
__Get current mode of module's LED__
* Parameters: none
* Returns:
	* currently set LED mode


`set_sys_led_mode(m)`
---------------------
__Set output mode of module's LED__
* Parameters:
	* `m`: new LED output mode
* Returns: none


`tx_pwr()`
----------
__Get transmit RF power__
* Parameters: none
* Returns:
	* currently set transmit power in dBm


`set_tx_pwr(p)`
---------------
__Set transmit RF power__
* Parameters:
	* `p`: transmit power in dBm
* Returns: none


`unpair()`
----------
__Remove pairing/bonding information__
* Parameters: none
* Returns: none


`version()`
-----------
__Get firmware version__
* Parameters: none
* Returns:
	* integer representation of module firmware version


`work_mode()`
-------------
__Get device current working mode__
* Parameters: none
* Returns:
	* module's current working mode


`set_work_mode(m)`
------------------
__Set device working mode__
* Parameters:
	* `m`: new working mode
* Returns: none


Notes:

1. This section preliminary (currently only one driver exists)

