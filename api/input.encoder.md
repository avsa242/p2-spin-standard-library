# input.encoder (DRAFT)
-----------------------

API for encoder drivers 

Object filename description:

`input.encoder.model.spin`


## Base Methods

These are methods that are common to _all_ IMU drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For SPI-connected sensors:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN): status`
	* Some devices contain more than one slave device internally, and so may break the above
convention, because of the need for additional CS and/or MOSI/MISO pins.
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* For some devices, a `MODEL_SPI_BC` variant exists, which directs the driver to use a
bytecode-based engine that while much slower, doesn't use another cog.
	* Replace `MODEL` with the sensor model #. Example: `LSM9DS1_SPI`
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

3. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `Reset()` method, and is ignored if set
outside the allowable range.

4. `startx()` returns the launched cog number+1 of com engine used on success.

5. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

6. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

7. Most (but not all) drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `dev_id()`      | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

9. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0


## Rotary encoders

| Method                   | Description                                              |
| -------------------------|----------------------------------------------------------|
| `degrees_abs()`          | Encoder position (absolute)                              |
| `encoder_data()`         | Encoder position ADC word                                |
| `encoder_word2deg_abs()` | Convert encoder ADC word to degrees                      |
| `encoder_word2percent()` | Convert encoder ADC word to percent of absolute position |


`degrees_abs()`
---------------------
__Encoder position (absolute)__
* Parameters: none
* Returns: absolute position in thousandths (0.001) of a degree
* __NOTE__: actual resolution is device-dependent, and may be more coarse than 0.001 degrees


`encoder_data()`
---------------------
__Encoder position ADC word__
* Parameters: none
* Returns: absolute position as ADC word
* __NOTE__: range/scale is device-dependent


`encoder_word2deg_abs()`
---------------------
__Convert encoder ADC word to degrees__
* Parameters:
	* `w`: ADC word
* Returns: absolute position in thousandths (0.001) of a degree


`encoder_word2percent()`
---------------------
__Convert encoder ADC word to percent of absolute position__
* Parameters:
	* `w`: ADC word
* Returns: absolute position in hundredths (0.01) of a percent



Availability of other methods vary by specific sensor type and model.


## Built-in symbols

```spin
TBD
```

_Note: 'x' indicates device driver-specific values_



## Global variables

```spin
TBD
```



## File Structure

```spin
input.encoder.model.spin - driver object
|-- #include "input.encoder.common.spinh" - provides standard API and code shared by all encoder drivers
|-- OBJ core: "core.con.model.spin" - HW-specific constants
|-- OBJ com: "com.xxx.spin" - Low-level communications engine (I2C, SPI, OneWire, etc)

```

## Build examples

__Build the AS504X demo for P1, native code output, using the PASM SPI engine:__

`flexspin -L$HOME/spin-standard-library/library AS504X-Demo.spin`

__The same, but building to bytecode output:__

`flexspin --interp=rom -L$HOME/spin-standard-library/library AS504X-Demo.spin`

__The same, but using the bytecode-based SPI engine:__

`flexspin --interp=rom -L$HOME/spin-standard-library/library -DAS504X_SPI_BC AS504X-Demo.spin`

