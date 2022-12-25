# sensor.temp_rh
----------------

API for temperature and/or humidity device drivers

Object filename description:

`sensor.type.model.spin`

_type_ is one of: `temperature`, `humidity`, `temp_rh`, `thermal-array`, `thermocouple`

_model_ indicates the manufacturer's model number of the sensor

## Base Methods

These are methods that are common to _all_ of the above types of drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:
1. For SPI-connected sensors:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN): status`
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* For some devices, a `MODEL_SPI_BC` variant exists, which directs the driver to use a
bytecode-based engine that while much slower, doesn't use another cog.
	* Replace `MODEL` with the sensor model #. Example: `SHT3X_SPI`
	* For SPI-connected sensors: 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `startx()` method will check for this and set the device's 3-wire SPI mode register.

2. For I2C-connected sensors:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* For some devices, a `MODEL_I2C_BC` variant exists, which directs the driver to use a
bytecode-based engine that while much slower, doesn't use another cog.
	* Not all devices support alternate I2C addresses.

3. For OneWire-connected sensors: `startx(OW_PIN): status`

4. For all variants: `startx()` returns the launched cog number+1 of com engine used on success.

5. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `reset()` method, and is ignored if set
outside the allowable range.

6. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

7. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

8. Most (but not all) drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `dev_id()`      | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

9. Drivers may have one or more `Preset_()` methods, that establish a set of pre-set settings.

10. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Temperature sensor drivers

| Method           | Description                                      |
| ---------------- | ------------------------------------------------ |
| `last_temp()`    | Previous temperature sensor reading (scaled)     |
| `temp_data()`    | Current temperature (ADC word)                   |
| `temperature()`  | Current temperature (scaled temp)                |
| `temp_scale()`   | Set scale of temperature data returned	      |
| `temp_word2deg()`| Convert temperature ADC word to degrees          |

`last_temp()`
-------------
__Previous temperature sensor reading__
* Parameters: none
* Returns: temperature in hundredths of a degree in chosen scale (see note 1)


`temp_data()`
-------------
__Current temperature sensor reading ADC word__
* Parameters: none
* Returns: ADC word representing current temperature sensor reading (see note 2)


`temperature()`
---------------
__Current temperature sensor reading__
* Parameters: none
* Returns: temperature in hundredths of a degree in chosen scale (see note 1)


`temp_scale(scale)`
-------------------
__Set scale of temperature data returned__
* Parameters: `scale`: new temperature scale (`C` (0), `F` (1), `K` (2))
* Returns: current scale, if `scale` is outside of the range `C`, `F`, `K`


`temp_word2deg(temp_wd)`
------------------------
__Convert temperature ADC word to degrees__
* Parameters:
	* `temp_wd`: ADC word representing temperature (see note 2)
* Returns: temperature in hundredths of a degree in chosen scale (see note 1)


Notes:
1. _Temperature measurements are scaled to hundredths of a degree, in the chosen scale
(e.g. 2105 = 21.05 degrees)._
_The scale is chosen using_ `temp_scale()` _with the parameter C (0), F (1), or K (2)._
_If not specified, the default is Celsius (0)._

2. _ADC word size varies from device to device._


## Relative humidity sensor drivers

| Method          | Description                                      |
| --------------- | ------------------------------------------------ |
| `last_rh()`     | Previous Relative Humidity (scaled RH)           |
| `rh()`          | Current relative humidity (scaled RH)            |
| `rh_data()`     | Current relative humidity (ADC word)             |
| `rh_word2pct()` | Convert RH ADC word to percent                   |

`last_rh()`
-----------
__Previous relative humidity__
* Parameters: none
* Returns: previous relative humidity measurement, in hundredths of a percent


`rh()`
------
__Current relative humidity__
* Parameters: none
* Returns: current relative humidity measurement, in hundredths of a percent


`rh_data()`
-----------
__Current relative humidity__
* Parameters: none
* Returns: ADC word representing current relative humidity measurement


`rh_word2pct(rh_wd)`
--------------------
__Convert RH ADC word to percent__
* Parameters:
	* `rh_wd`: ADC word representing relative humidity
* Returns:
	* relative humidity, in hundredths of a percent


Notes:
1. _Relative humidity measurements are scaled to hundredths of a percent._


## Thermal-array sensor drivers

| Method        | Description                                      |
| --------------| ------------------------------------------------ |
| `get_frame()` | Read frame from sensor                           |


`get_frame(ptr_img)`
-------------
__Read frame from sensor__
* Parameters:
	* `ptr_img`: pointer to buffer to copy frame/image to
* Returns: none

__NOTE__: `get_frame()` _needs to be pointed to a buffer that is large enough to copy the thermal
image to (varies from device to device)._


## Thermocouple amplifier drivers

| Method          | Description                                      |
| --------------- | ------------------------------------------------ |
| `cj_temp()`     | Cold junction temperature (scaled)               |
| `cj_data()`     | Cold junction temperature (ADC word)             |
| `tc_data()`     | Thermocouple data (ADC word)                     |
| `tc_type()`     | Set type of thermocouple                         |
| `tc_word2temp()`| Convert thermocouple ADC word to degrees         |

`cj_temp()`
-----------
__Cold junction temperature__
* Parameters: none
* Returns: temperature in hundredths of a degree in chosen scale


`cj_data()`
-----------
__Cold junction temperature ADC word__
* Parameters: none
* Returns: ADC word representing cold junction temperature measurement


`tc_data()`
-----------
__Thermocouple data ADC word__
* Parameters: none
* Returns: ADC word representing thermocouple temperature measurement


`tc_type(t)`
------------
__Set type of thermocouple__
* Parameters: `t`: thermocouple type (symbol such as `TYPE_K`, etc; availability depends on driver)
* Returns: currently set thermocouple type


`tc_word2deg(tc_word)`
----------------------
__Convert thermocouple ADC word to degrees__
* Parameters:
	* `tc_word`: ADC word representing thermocouple temperature
* Returns: temperature in hundredths of a degree in chosen scale _(see note 1)_


Notes:
1. _Temperature measurements are scaled to hundredths of a degree, in the chosen scale
(e.g. 2105 = 21.05 degrees)._
_The scale is chosen using_ `temp_scale()` _with the parameter C (0), F (1), or K (2).
If not specified, the default is Celsius (0)._

2. _ADC word size varies from device to device._


## Build examples

Build the SHT3X demo for P2, native code output, using the I2C engine:

`flexspin -2 -L$HOME/p2-spin-standard-library/library -DSHT3X_I2C SHT3x-Demo.spin2`

or `flexspin -2 -L$HOME/p2-spin-standard-library/library SHT3x-Demo.spin2`

