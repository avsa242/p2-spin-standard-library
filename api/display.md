# display
---------

API for display device drivers

Object filename description:

display.type.model.spin2

_type_ is one of: lcd, ledmatrix, oled, vga, lcd-alpha, oled-alpha

_model_ indicates the manufacturer's model number of the display controller


## Base Methods

These are methods that are common to _all_ display drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set display factory default settings             | n/a       | n/a            |

Notes:

1. For SPI-connected displays:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, DC_PIN, RES_PIN, SCK_FREQ, WIDTH, HEIGHT, PTR_DISP):
status`
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* Replace `MODEL` with the display model number. Example: `SSD130X_SPI`

2. For I2C-connected displays:
	* `startx(SCL_PIN, SDA_PIN, RES_PIN, I2C_FREQ, ADDR_BITS, WIDTH, HEIGHT, PTR_DISP): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* Not all devices support alternate I2C addresses.

3. For VGA-connected displays:
	* `startx(PINGRP, WIDTH, HEIGHT, PTR_DISP): status`

4. `startx()` returns the launched cog number+1 of com engine used on success.

5. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

6. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

7. Some drivers also provide the following methods:

| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

9. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Dot-matrix/graphical displays

Most display drivers are extended with the generic bitmap graphics library [API](graphics.common.md)
which is included in each supported driver using the preprocessor. This library provides methods
for drawing primitives, such as pixels, lines, boxes, circles, text. The use of this requires a
display buffer to be allocated at the application level. The size will of course depend on the
resolution of the display and color depth. The address of the display buffer is then passed to the
graphics library via the display driver's start() method.

This library also provides methods common to terminal devices (such as `str()`, `printf()`, etc)

To bypass the use of a buffer, define the preprocessor symbol `GFX_DIRECT` when building.
The driver's internal equivalents to the drawing primitives in the bitmap graphics library
will be used instead (some drivers implementations may have limitations in this case).

Notes:
1. Common parameters in `startx()`
	* `WIDTH`: width of the display, in pixels
	* `HEIGHT`: height of the display, in pixels
	* `PTR_DISP`: pointer to the display buffer, where rendering occurs (ignored if `GFX_DIRECT`
		is defined at build-time)

## Small-format dot-matrix displays

LED matrices, Smart-LED (e.g., NeoPixel)
See Dot-matrix/graphical displays


## Electrophoretic/E-Ink/E-Paper displays

See Dot-matrix/graphical displays


## Alphanumeric displays

Alphanumeric-only LCD's, OLEDs (e.g., HD44780, US2066)

These drivers are extended with common terminal output methods (such as `str()`, `printf()`, etc)

