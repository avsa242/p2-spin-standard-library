# sensor.temp_rh
----------------

API for temperature and/or humidity device drivers

Object filename description:

`sensor.type.model.spin2`

_type_ is one of: temperature, humidity, temp_rh, thermal-array, thermocouple

_model_ indicates the manufacturer's model number of the sensor

## Base Methods

These are methods that are common to _all_ of the above types of drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `Startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `Stop()`        | Stop the driver                                  | n/a       | n/a            |
| `Defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:
1. For SPI-connected sensors:
	* `Startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN): status`
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* Replace `MODEL` with the sensor model #. Example: `SHT3X_SPI`
	* For SPI-connected sensors: 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `Startx()` method will check for this and set the device's 3-wire SPI mode register.

2. For I2C-connected sensors:
	* `Startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* Not all devices support alternate I2C addresses.

3. For OneWire-connected sensors: `Startx(OW_PIN): status`

4. For all variants: `Startx()` returns the launched cog number+1 of com engine used on success.

5. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `Reset()` method, and is ignored if set
outside the allowable range.

6. `Startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `DeviceID()` didn't return the expected value

7. `Defaults()` may simply call `Reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

8. Most (but not all) drivers also provide the following methods:
| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `DeviceID()`    | Read model-unique identification register        | n/a      | model/dev ID    |
| `Reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

9. Drivers may have one or more `Preset_()` methods, that establish a set of pre-set settings.

10. `Stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Temperature sensor drivers

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `LastTemp()`    | Previous temperature sensor reading (scaled)     | n/a      | scaled temp     |
| `TempData()`    | Current temperature (ADC word)                   | n/a      | ADC word        |
| `Temperature()` | Current temperature (scaled temp)                | n/a      | scaled temp     |
| `TempScale()`   | Set scale of temperature data returned	     | scale    | current scale   |
| `TempWord2Deg()`| Convert temperature ADC word to degrees          | ADC word | scaled temp     |

Notes:
1. Temperature measurements are scaled to hundredths of a degree, in the chosen scale
(e.g. 2105 = 21.05 degrees).
The scale is chosen using `TempScale()` with the parameter C (0), F (1), or K (2).
If not specified, the default is Celsius (0).

2. ADC word size varies from device to device.


## Relative humidity sensor drivers

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `LastRH()`      | Previous Relative Humidity (scaled RH)           | n/a      | scaled RH       |
| `RH()`          | Current relative humidity (scaled RH)            | n/a      | scaled RH       |
| `RHData()`      | Current relative humidity (ADC word)             | n/a      | ADC word        |
| `RHWord2Pct()`  | Convert RH ADC word to percent                   | ADC word | scaled RH       |

Notes:
1. Relative humidity measurements are scaled to hundredths of a percent.


## Thermal-array sensor drivers

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `GetFrame()`    | Read frame from sensor                           | pointer  | n/a             |

Notes:
1. `GetFrame()` needs to be pointed to a buffer that is large enough to copy the thermal image to
(varies from device to device).

## Thermocouple amplifier drivers

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `CJ_Temp()`     | Cold junction temperature (scaled)               | n/a      | scaled temp     |
| `CJ_Data()`     | Cold junction temperature (ADC word)             | n/a      | ADC word        |
| `TC_Data()`     | Thermocouple data (ADC word)                     | n/a      | ADC word        |
| `TC_Type()`     | Set type of thermocouple                         | type     | current type    |
| `TC_Word2Temp()`| Convert thermocouple ADC word to degrees         | ADC word | scaled temp     |

Notes:
1. Temperature measurements are scaled to hundredths of a degree, in the chosen scale
(e.g. 2105 = 21.05 degrees).
The scale is chosen using `TempScale()` with the parameter C (0), F (1), or K (2).
If not specified, the default is Celsius (0).

2. ADC word size varies from device to device.

## Build examples

Build the SHT3X demo for P2, native code output, using the I2C engine:

`flexspin -2 -L$HOME/p2-spin-standard-library/library -DSHT3X_I2C SHT3x-Demo.spin2`

or `flexspin -2 -L$HOME/p2-spin-standard-library/library SHT3x-Demo.spin2`

