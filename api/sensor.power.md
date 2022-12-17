# sensor.power
--------------

API for power consumption/metering device drivers

Object filename description:

sensor.type.model.spin2

_type_ is one of: power, current

_model_ indicates the manufacturer's model number of the device

## Base Methods

These are methods that are common to _all_ power sensor drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For I2C-connected sensors:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses.

2. `startx()` returns the launched cog number+1 of com engine used on success.

3. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

4. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

5. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

6. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method           | Description                                   |
| ---------------- | --------------------------------------------- |
|`adc2amps()`      | Convert current ADC word to amperage          |
|`adc2volts()`     | Convert bus voltage ADC word to voltage       |
|`adc2watts()`     | Convert power ADC word to wattage             |
|`current()`       | Current measurement                           |
|`current_data()`  | Current ADC word                              |
|`dev_id()`        | Model-specific identification                 |
|`opmode()`        | Set operating mode                            |
|`power()`         | Power measurement                             |
|`power_data()`    | Power ADC word                                |
|`reset()`         | Reset device                                  |
|`voltage()`       | Bus voltage measurement                       |
|`voltage_data()`  | Bus voltage ADC word                          |

`adc2amps(adc_wd)`
------------------
__Convert current ADC word to amperage__
* Parameters:
	* `adc_wd`: adc word
* Returns:
	* current in microamperes


`adc2volts()`
-------------
__Convert bus voltage ADC word to voltage__
* Parameters:
	* `adc_wd`: adc word
* Returns:
	* voltage in microvolts


`adc2watts(adc_wd)`
-------------------
__Convert power ADC word to wattage__
* Parameters:
	* `adc_wd`: adc word
* Returns:
	* power in microwatts


`current()`
-----------
__Current measurement__
* Parameters: none
* Returns: current in microamperes


`current_data()`
----------------
__Current ADC word__
* Parameters: none
* Returns: ADC word representing current


`dev_id()`
-------------
__Device identification__
* Parameters: n/a
* Returns: model-specific identification


`opmode(mode)`
--------------
__Set operating mode__
* Parameters:
	* `mode`: new operating mode
* Returns:
	* current operating mode


`power()`
---------
__Power measurement__
* Parameters: none
* Returns:
	* power measurement in microwatts


`power_data()`
--------------
__Power ADC word__
* Parameters: none
* Returns: ADC word representing power measurement


`reset()`
---------
__Reset device__
* Parameters: none
* Returns: none
__NOTE__: Some devices may require an additional I/O pin to perform a reset.


`voltage()`
-----------
__Bus voltage measurement__
* Parameters: none
* Returns: voltage in microvolts


`voltage_data()`
----------------
__Bus voltage ADC word__
* Parameters: none
* Returns: ADC word representing voltage


Notes:

1. uA = microamperes, uV = microvolts, uW = microwatts
2. Some devices may include additional methods (e.g., for interrupt support)


## File Structure

```spin
sensor.power.model.spin2 - driver object
|-- #include: sensor.power.common.spin2h - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)

```

