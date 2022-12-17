# time
------

API for realtime clock device drivers (hardware and emulated)

Object filename description:

`time.rtc.model.spin2`

_model_ indicates the manufacturer's model/part number of the RTC (e.g., ds1302), or `soft`,
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
	* If supported by the device, `dev_id()` didn't return the expected value
(or presence of the device's address wasn't detected on the I2C bus)

4. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method          | Description                   |
| --------------- | ----------------------------- |
| `date()`        | Get current date/day of month |
| `hours()`       | Get current hour (24hr)       |
| `minutes()`     | Get current minute            |
| `month()`       | Get current month             |
| `seconds()`     | Get current second            |
| `weekday()`     | Get current week day          |
| `year()`        | Get current year              |
| `set_date()`    | Set current date/day of month |
| `set_hours()`   | Set current hour              |
| `set_minutes()` | Set current minute            |
| `set_month()`   | Set current month             |
| `set_seconds()` | Set current second            |
| `set_weekday()` | Set current week day          |
| `set_year()`    | Set current year              |

`date()`
--------
__Get the current date/day of month__
* Parameters: none
* Returns: date/day of month (1..31)


`hours()`
---------
__Get the current hour (24hr)__
* Parameters: none
* Returns: hour (0..23)


`minutes()`
-----------
__Get the current minute__
* Parameters: none
* Returns: minute (0..59)


`month()`
---------
__Get current month__
* Parameters: none
* Returns: month (1..12)


`seconds()`
-----------
__Get current second__
* Parameters: none
* Returns: second (0..59)


`weekday()`
-----------
__Get the current week day__
* Parameters: none
* Returns: weekday (1..7)


`year()`
--------
__Get the current year__
* Parameters: none
* Returns: year (0..99)


`set_date(d)`
-------------
__Set the current date/day of month__
* Parameters:
	* `d`: date/day of month (1..31)
* Returns: none


`set_hours(h)`
--------------
__Set the current hour__
* Parameters:
	* `h`: hour (0..23)
* Returns: none

`set_minutes(m)`
----------------
__Set current minute__
* Parameters:
	* `m`: minute (0..59)
* Returns: none


`set_month(m)`
-------------
__Set current month__
* Parameters:
	* `m`: month (1..12)
* Returns: none


`set_seconds(s)`
----------------
__Set current second__
* Parameters:
	* `s`: second (0..59)
* Returns: none


`set_weekday(w)`
----------------
__Set current week day__
* Parameters:
	* `w`: weekday (1..7)
* Returns: none


`set_year(y)`
-------------
__Set current year__
* Parameters:
	* `y`: year (0..99)
* Returns: none


Notes:

1. Though not part of the `time` category, GPS device drivers shall utilize the read-only portion
of the above API for equivalent time-related methods.


## File Structure

```spin
time.rtc.model.spin - driver object
|-- #include: time.rtc.common.spinh - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)
```

