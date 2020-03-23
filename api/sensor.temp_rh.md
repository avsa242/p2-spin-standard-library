# sensor.temp_rh
----------------

API for temperature and/or humidity device drivers

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
