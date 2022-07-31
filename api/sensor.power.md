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
	* If supported by the device, `device_id()` didn't return the expected value

4. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

5. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

6. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method           | Description                                   | Param    | Returns           |
| ---------------- | --------------------------------------------- | -------- | ----------------- |
|`adc2amps()`      | Convert current ADC word to amperage          | adc word | uA                |
|`adc2volts()`     | Convert bus voltage ADC word to voltage       | adc word | uV                |
|`adc2watts()`     | Convert power ADC word to wattage             | adc word | uW                |
|`current()`       | Current measurement                           | n/a      | uA                |
|`current_data()`  | Current ADC word                              | n/a      | adc word          |
|`device_id()`     | Model-specific identification                 | n/a      | dev id            |
|`opmode()`        | Set operating mode                            | mode     | current mode      |
|`power()`         | Power measurement                             | n/a      | uW                |
|`power_data()`    | Power ADC word                                | n/a      | adc word          |
|`reset()`         | Reset device                                  | n/a      | n/a               |
|`voltage()`       | Bus voltage measurement                       | n/a      | uV                |
|`voltage_data()`  | Bus voltage ADC word                          | n/a      | adc word          |


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

