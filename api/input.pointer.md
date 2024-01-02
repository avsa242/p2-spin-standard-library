# input.pointer (DRAFT)
-----------------------

API for pointing device drivers:
* mouse
* trackball
* trackpad

Object filename description:

`input.pointer.model.spin2`


## Nomenclature:

* X-axis: horizontal, or left/right axis
* Y-axis: vertical, or up/down axis
* Absolute position: position expressed as a specific coordinate or location within a grid.
* Relative position (delta): position expressed as the difference from the previous position.


## Base Methods

These are methods that are common to _all_ pointer drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `start()`       | Start driver using default settings              | n/a       | cog id+1       |
| `startx()`      | Start driver using explicitly defined settings   | Notes 2-4 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set device factory default settings              | n/a       | n/a            |

Notes:

1. When starting the driver with `start()`, the driver can be configured using constant overrides in the parent object.

2. For SPI-connected devices:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_FREQ): status`
	* For SPI-connected devices: 4-wire SPI is used by default. If supported by the device, 3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `startx()` method will check for this and set the device's 3-wire SPI mode register.

3. For I2C-connected devices:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses. The `ADDR_BITS` parameter exists in all drivers to make it easier to drop-in support for another driver in the application.

4. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin (device-dependent). The pin is only validated in the `reset()` method, and is ignored if set outside the allowable range.

5. `startx()` returns the launched cog number+1 of com engine used on success.

6. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

7. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

8. Most (but not all) drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `dev_id()`      | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

9. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0


## Pointing devices

| Method                   | Description                                              |
| -------------------------|----------------------------------------------------------|
| `abs_x()`                | Pointer absolute position, X-axis                        |
| `abs_y()`                | Pointer absolute position, Y-axis                        |
| `set_abs_x()`            | Manually set pointer absolute position, X-axis           |
| `set_abs_y()`            | Manually set pointer absolute position, Y-axis           |
| `set_abs_x_max()`        | Set pointer absolute position X-axis maximum             |
| `set_abs_y_max()`        | Set pointer absolute position Y-axis maximum             |
| `set_abs_x_min()`        | Set pointer absolute position X-axis minimum             |
| `set_abs_y_min()`        | Set pointer absolute position Y-axis minimum             |
| `set_sensitivity_x()`    | Set pointer sensitivity, X-axis                          |
| `set_sensitivity_y()`    | Set pointer sensitivity, Y-axis                          |
| `pointer_rel_x()`        | Pointer relative position (delta), X-axis                |
| `pointer_rel_y()`        | Pointer relative position (delta), Y-axis                |


`abs_x()`
---------
__Pointer absolute position, X-axis__
* Parameters: none
* Returns: absolute position coordinate
* __NOTE__: coordinate return is confined to the X-axis limits set by `set_abs_x_min()` and `set_abs_x_max()`


`abs_y()`
---------
__Pointer absolute position, Y-axis__
* Parameters: none
* Returns: absolute position coordinate
* __NOTE__: coordinate return is confined to the Y-axis limits set by `set_abs_y()` and `set_abs_y()`


`set_abs_x()`
-------------
__Manually set pointer absolute position, X-axis__
* Parameters:
	* `x`: X-axis position
* Returns: none
* __NOTE__: this could be used e.g., to set the initial value returned by `abs_x()`


`set_abs_y()`
-------------
__Manually set pointer absolute position, Y-axis__
* Parameters:
	* `y`: Y-axis position
* Returns: none
* __NOTE__: this could be used e.g., to set the initial value returned by `abs_y()`


`set_abs_x_max()`
-----------------
__Set pointer absolute position X-axis maximum__
* Parameters:
	* `x`: X-axis maximum value
* Returns: none
* __NOTE__: this could be used e.g., to constrain the position reported to the dimensions of a screen


`set_abs_y_max()`
-----------------
__Set pointer absolute position Y-axis maximum__
* Parameters:
	* `y`: Y-axis maximum value
* Returns: none
* __NOTE__: this could be used e.g., to constrain the position reported to the dimensions of a screen


`set_abs_x_min()`
-----------------
__Set pointer absolute position X-axis minimum__
* Parameters:
	* `x`: X-axis minimum value
* Returns: none
* __NOTE__: this could be used e.g., to constrain the position reported to the dimensions of a screen


`set_abs_y_min()`
-----------------
__Set pointer absolute position Y-axis minimum__
* Parameters:
	* `y`: Y-axis minimum value
* Returns: none
* __NOTE__: this could be used e.g., to constrain the position reported to the dimensions of a screen


`set_sensitivity_x()`
---------------------
__Set pointer sensitivity, X-axis__
* Parameters:
	* `x`: X-axis movement sensitivity
* Returns: none
* __NOTE__: this affects the step size of delta position reports read by `pointer_rel_x()` which in turn supplies data returned by `abs_x()`


`set_sensitivity_y()`
---------------------
__Set pointer sensitivity, Y-axis__
* Parameters:
	* `y`: Y-axis movement sensitivity
* Returns: none
* __NOTE__: this affects the step size of delta position reports read by `pointer_rel_y()` which in turn supplies data returned by `abs_y()`


`pointer_rel_x()`
-----------------
__Pointer relative position (delta), X-axis__
* Parameters: none
* Returns: position delta/relative position
* Aliases: `read_x()`
* __NOTE__: this is usually the function that returns data directly from the device, so in order to read _any_ position data, it must be called first. The data returned may be ignored, if only absolute position is desired.


`pointer_rel_x()`
-----------------
__Pointer relative position (delta), X-axis__
* Parameters: none
* Returns: position delta/relative position
* Aliases: `read_y()`
* __NOTE__: this is usually the function that returns data directly from the device, so in order to read _any_ position data, it must be called first. The data returned may be ignored, if only absolute position is desired.


Availability of other methods vary by specific device type and model.


## Built-in symbols

```spin
TBD
```

_Note: 'x' indicates device driver-specific values_



## Global variables

```spin
VAR

    { absolute position (signed 32-bit) }
    long _pointer_x, _pointer_y

    { absolute position constraints (signed 32-bit) }
    long _pointer_x_max, _pointer_y_max, _pointer_x_min, _pointer_y_min

    { pointer sensitivity (signed 32-bit) }
    long _pointer_x_sens, _pointer_y_sens
```


## File Structure

```spin
input.pointer.model.spin2 - driver object
|-- #include "input.pointer.common.spin2h" - provides standard API and code shared by all pointer drivers
|-- OBJ core: "core.con.model.spin" - HW-specific constants
|-- OBJ com: "com.xxx.spin2" - Low-level communications engine (I2C, SPI, OneWire, etc)
```

## Build examples

__1. Build the Grove mini-trackball serial demo for P2, using FlexSpin's PASM backend:__

`flexspin -2 -L$HOME/p2-spin-standard-library/library Grove-mini-trackball-demo-serial.spin2`

__2. The same, but build using FlexSpin's NuCode (bytecode) backend:__

`flexspin -2nu -L$HOME/spin-standard-library/library Grove-mini-trackball-demo-serial.spin2`

