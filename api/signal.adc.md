# signal.adc
------------

API for analog to digital converter device drivers

Object filename description:

signal.adc.model.spin2

_model_ indicates the manufacturer's model number of the display controller


## Base Methods

These are methods that are common to _all_ power sensor drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For SPI-connected sensors:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_FREQ): status`
	* `SPI_FREQ` defaults to 1MHz, if unspecified.
	* For SPI-connected sensors: 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `startx()` method will check for this and set the device's 3-wire SPI mode register.

2. For I2C-connected sensors:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses.

3. `startx()` returns the launched cog number+1 of com engine used on success.

4. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

5. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

6. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

7. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0


## Methods

| Method             | Description                                   |
| ------------------ | --------------------------------------------- |
|`adc_channel()`     | Get currently set ADC channel                 |
|`adc_data()`        | Bus voltage ADC word                          |
|`adc2volts()`       | Convert bus voltage ADC word to voltage       |
|`set_adc_channel()` | Set ADC channel for subsequent reads          |
|`voltage()`         | Bus voltage measurement                       |

`adc_channel()`
---------------
__Get currently set ADC channel__
* Parameters: none
* Returns: currently set ADC channel


`adc_data()`
------------
__Bus voltage ADC word__
* Parameters: none
* Returns: ADC word representing voltage


`adc2volts(adc_wd)`
-------------------
__Convert bus voltage ADC word to voltage__
* Parameters: `adc_wd`: ADC word representing voltage
* Returns: voltage in microvolts


`set_adc_channel(ch)`
---------------------
__Set ADC channel for subsequent reads__
* Parameters: `ch`: new channel number
* Returns: none


`voltage()`
-----------
__Bus voltage measurement__
* Parameters: none
* Returns: voltage in microvolts


Notes:

1. uV = microvolts
2. Some devices may include additional methods (e.g., for interrupt support)


## File Structure

```spin
signal.adc.model.spin2 - driver object
|-- #include: signal.adc.common.spin2h - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)

```

