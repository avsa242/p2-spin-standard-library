# time
------

API for realtime clock device drivers (hardware and emulated)

Object filename description:

`time.rtc.model.spin2`

_model_ indicates the manufacturer's model/part number of the RTC (e.g., ds1302), or 'soft',
if emulated.

## Base Methods

These are methods that are common to _all_ RTC drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |

1. For I2C-connected devices:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses.

2. `startx()` returns the launched cog number+1 of com engine used on success.

3. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `device_id()` didn't return the expected value
(or presence of the device's address wasn't detected on the I2C bus)

4. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method          | Description                   | Param  | Returns |
| --------------- | ----------------------------- | ------ | ------- |
| `date()`        | Get current date/day of month | n/a    | 1..31   |
| `hours()`       | Get current hour (24hr)       | n/a    | 0..23   |
| `minutes()`     | Get current minute            | n/a    | 0..59   |
| `month()`       | Get current month             | n/a    | 1..12   |
| `seconds()`     | Get current second            | n/a    | 0..59   |
| `weekday()`     | Get current week day          | n/a    | 1..7    |
| `year()`        | Get current year              | n/a    | 0..99   |
| `set_date()`    | Set current date/day of month | 1..31  | n/a     |
| `set_hours()`   | Set current hour              | 0..23  | n/a     |
| `set_minutes()` | Set current minute            | 0..59  | n/a     |
| `set_month()`   | Set current month             | 1..12  | n/a     |
| `set_seconds()` | Set current second            | 0..59  | n/a     |
| `set_weekday()` | Set current week day          | 1..7   | n/a     |
| `set_year()`    | Set current year              | 0..99  | n/a     |

Notes:

1. Though not part of the `time` category, GPS device drivers shall utilize the read-only portion
of the above API for equivalent time-related methods.


## File Structure

```spin
time.rtc.model.spin - driver object
|-- #include: time.rtc.common.spinh - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)
|-- OBJ: Misc. numerical processing methods (BCD <-> integer)
```

