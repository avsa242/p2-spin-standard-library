# display
---------

API for display device drivers

Object filename description:

display.type.model.int

_type_ is one of: lcd, ledmatrix, oled, vga, lcd-alpha, oled-alpha

_model_ indicates the manufacturer's model number of the display controller


## Base Methods

These are methods that are common to _all_ display drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `Startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `Stop()`        | Stop the driver                                  | n/a       | n/a            |
| `Defaults()`    | Set display factory default settings             | n/a       | n/a            |

Notes:

1. For SPI-connected displays:
	* `Startx(CS_PIN, SCK_PIN, MOSI_PIN, DC_PIN, RES_PIN, SCK_FREQ, WIDTH, HEIGHT, PTR_DISP):
status`
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* Replace `MODEL` with the display model #. Example: `SSD130X_SPI`

2. For I2C-connected displays:
	* `Startx(SCL_PIN, SDA_PIN, RES_PIN, I2C_FREQ, ADDR_BITS, WIDTH, HEIGHT, PTR_DISP): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* Not all devices support alternate I2C addresses.

3. For VGA-connected displays:
	* `Startx(PINGRP, WIDTH, HEIGHT, PTR_DISP): status`

4. `Startx()` returns the launched cog number+1 of com engine used on success.

5. `Startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `DeviceID()` didn't return the expected value

6. `Defaults()` may simply call `Reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

7. Some drivers also provide the following methods:
| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `Reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `Preset_()` methods, that establish a set of pre-set settings.

9. `Stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Dot-matrix/graphical displays

Most display drivers are extended with the generic bitmap graphics library [API](lib.gfx.bitmap.md)
which is included in each supported driver using the preprocessor. This library provides methods
for drawing primitives, such as pixels, lines, boxes, circles, text. The use of this requires a
display buffer to be allocated at the application level. The size will of course depend on the
resolution of the display and color depth. The address of the display buffer is then passed to the
graphics library via the display driver's Start() method.

This library also provides methods common to terminal devices (such as `Str()`, `PrintF()`, etc)

To bypass the use of a buffer, define the preprocessor symbol `GFX_DIRECT` when building.
The driver's internal equivalents to the drawing primitives in the bitmap graphics library
will be used instead (some drivers implementations may have limitations in this case).

Notes:
1. Common parameters in `Startx()`
	* WIDTH: width of the display, in pixels
	* HEIGHT: height of the display, in pixels
	* PTR_DISP: pointer to the display buffer, where rendering occurs

## Small-format dot-matrix displays

LED matrices, Smart-LED (e.g., NeoPixel)
See Dot-matrix/graphical displays


## Electrophoretic/E-Ink/E-Paper displays

See Dot-matrix/graphical displays


## Alphanumeric displays

Alphanumeric-only LCD's, OLEDs (e.g., HD44780, US2066)

These drivers are extended with common terminal output methods (such as `Str()`, `PrintF()`, etc)

