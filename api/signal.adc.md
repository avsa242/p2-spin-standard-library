# signal.adc
------------

API for analog to digital converter device drivers

Object filename description:

signal.adc.model.int

_model_ indicates the manufacturer's model number of the display controller

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

## Methods

| Method                                        | Description                                   |
| ----------------------------------------------|---------------------------------------------- |
|`ADCRes(bits)`                                 | Set device ADC resolution, in bits            |
|`ReadADC(ch)`                                  | Read raw ADC value from channel ch            |
|`Voltage(ch)`                                  | Return ADC reading, in milli-volts            |
