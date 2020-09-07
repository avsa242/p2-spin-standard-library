# time  - XXX DRAFT XXX
------

API for timekeeping device drivers (hardware and emulated)

Object filename description:

time.type.model.int

_type_ is one of: rtc, emulated

_model_ indicates the manufacturer's model/part number of the memory (e.g., ds1302)

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

_NOTE: Though not part of the time class, GPS device drivers will have, as a
subset of their API, read-only equivalents of the below methods_

## Methods

| Method                                  | R/W | Description                                           | Returns                                   |
|-----------------------------------------|-----|-------------------------------------------------------|--------------------------------------------
|`Date(ptr_date)`                         | RW  | Set current date                                      | Pointer to string containing current date |
|`Days(day)`                              | RW  | Set current day                                       | byte                                      |
|`DeviceID()`                             | R   | Read device identification                            | byte(s)                                   |
|`Hours(hr)`                              | RW  | Set current hour (24hr)                               | byte                                      |
|`Minutes(min)`                           | RW  | Set current minute                                    | byte                                      |
|`Months(month)`                          | RW  | Set current month                                     | byte                                      |
|`Seconds(second)`                        | RW  | Set current second                                    | byte                                      |
|`Weekday(wkday)`                         | RW  | Set current minute                                    | byte                                      |
|`Year(yr)`                               | RW  | Set current year                                      | word                                      |

