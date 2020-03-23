# sensor.temp_rh
----------------

API for temperature and/or humidity device drivers


Object filename description:

sensor.type.model.int

_type_ is one of: temp_rh, temperature, humidity, thermal-array

_model_ indicates the manufacturer's model number of the display controller

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)


## Methods

| Method                                        | Description                                   |
| ----------------------------------------------|---------------------------------------------- |
|`ADCRes(bits)`                                 | Set device ADC resolution, in bits            |
|`Heater(enabled)`                              | Enable the on-chip heater                     |
|`Humidity`                                     | Return current relative humidity measurement  |
|`Scale(temp_scale)`                            | Set temperature scale (C, F, K)               |
|`SN(buff_addr)`                                | Copy device serial number to buff_addr        |
|`Temperature`                                  | Return current relative humidity measurement  |
|`OpMode(mode)`                                 | Set device operating mode                     |
