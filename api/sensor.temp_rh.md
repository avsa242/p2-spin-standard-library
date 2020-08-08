# sensor.temp_rh
----------------

API for temperature and/or humidity device drivers


Object filename description:

sensor.type.model.int

_type_ is one of: temp_rh, temperature, humidity, thermal-array

_model_ indicates the manufacturer's model number of the sensor

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)


## Methods

| Method                                        | Description                                   |
| ----------------------------------------------|---------------------------------------------- |
|`ADCRes(bits)`                                 | Set device ADC resolution, in bits            |
|`HeaterEnabled(enabled)`                       | Enable the on-chip heater                     |
|`Humidity`                                     | Return current relative humidity measurement  |
|`TempScale(temp_scale)`                        | Set temperature scale (C, F, K)               |
|`SerialNum(ptr_var)`                           | Copy device serial number to ptr_var          |
|`Temperature`                                  | Return current relative humidity measurement  |
|`OpMode(mode)`                                 | Set device operating mode                     |
