# sensor.power
--------------

API for power consumption/metering device drivers

Object filename description:

sensor.type.model.int

_type_ is one of: power, current

_model_ indicates the manufacturer's model number of the device

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

## Methods

| Method                                        | Description                                   |
| ----------------------------------------------|---------------------------------------------- |
|`BusVoltage`                                   | Return bus voltage measurement                |
|`Current`                                      | Return current measurement                    |
|`DeviceID`                                     | Return device ID                              |
|`MeasureSamples(samples)`                      | Set number of samples averaged when measuring |
|`Power`                                        | Return power measurement                      |
|`Reset`                                        | Reset device                                  |
|`ShuntVoltage`                                 | Return shunt voltage measurement              |

