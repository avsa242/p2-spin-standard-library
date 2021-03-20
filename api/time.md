# time  - XXX DRAFT XXX

------

API for timekeeping device drivers (hardware and emulated)

Object filename description:

`time.type.model.int`

_type_ is one of: rtc (hardware), emulated (software)

_model_ indicates the manufacturer's model/part number of the RTC (e.g., ds1302)

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

_NOTE: Though not part of the time class, GPS device drivers will have, as a
subset of their API, read-only equivalents of the below methods_

## Methods

| Method          | R/W | Description                   | Returns |
| --------------- | --- | ----------------------------- | ------- |
| `Date()`        | R   | Get current date/day of month | byte    |
| `DeviceID()`    | R   | Read device identification    | byte(s) |
| `Hours()`       | R   | Get current hour (24hr)       | byte    |
| `Minutes()`     | R   | Get current minute            | byte    |
| `Month()`       | R   | Get current month             | byte    |
| `Seconds()`     | R   | Get current second            | byte    |
| `Weekday()`     | R   | Get current week day          | byte    |
| `Year()`        | R   | Get current year              | word    |
| `SetDate(d)`    | W   | Set current date/day of month | -       |
| `SetHours(h)`   | W   | Set current hour              | -       |
| `SetMinutes(m)` | W   | Set current minute            | -       |
| `SetMonth(m)`   | W   | Set current month             | -       |
| `SetSeconds(s)` | W   | Set current second            | -       |
| `SetWeekday(w)` | W   | Set current week day          | -       |
| `SetYear(y)`    | W   | Set current year              | -       |
