# signal.adc
------------

API for analog to digital converter device drivers

## Methods

| Method                                        | Description                                   |
| ----------------------------------------------|---------------------------------------------- |
|`ADCRes(bits)`                                 | Set device ADC resolution, in bits            |
|`ReadADC(ch)`                                  | Read raw ADC value from channel ch            |
|`Voltage(ch)`                                  | Return ADC reading, in milli-volts            |
