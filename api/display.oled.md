# display.oled
--------------

API for OLED and LCD display device drivers

Object filename description:

display.type.model.int

_type_ is one of: oled, lcd

_model_ indicates the manufacturer's model number of the display controller

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

NOTE: Most display drivers are extended with the generic bitmap graphics library [API](lib.gfx.bitmap.md), which is included in each driver using the preprocessor. This library provides methods for drawing primitives, such as pixels, lines, boxes, circles, text. The use of this requires a display buffer to be allocated at the application level. The size will of course depend on the resolution of the display and color depth. The address of the display buffer is then passed to the graphics library via the display driver's Start()  method.

## Methods

| Method                                        | Description                                                                           |
| ----------------------------------------------|-------------------------------------------------------------------------------------- |
|`Address (addr)`                               | Set framebuffer/display buffer address                                                |
|`AddrMode (mode)`                              | Set display internal addressing mode                                                  |
|`ChargePumpReg`                                | Enable charge pump regulator when disp power enabled                                  |
|`ClearAccel`                                   | Use the display's accelerated Clear Display function                                  |
|`ClockDiv (divider)`                           | Set clock frequency divider used by the display controller                            |
|`ClockFreq (freq)`                             | Set display internal oscillator frequency                                             |
|`ColorDepth (format)`                          | Set expected color format of pixel data                                               |
|`ColumnStartEnd`                               | Set display start and end columns                                                     |
|`COMHighLogicLevel (level)`                    | Set logic high level threshold of COM pins rel. to Vcc                                |
|`COMPinCfg`                                    | Configure COMmon pins and L/R remap                                                   |
|`Contrast`                                     | Set display contrast/brightness                                                       |
|`ContrastABC (a, b, c)`                        | Set contrast/brightness level of subpixels a, b, c                                    |
|`CopyAccel (sx, sy, ex, ey, dx, dy)`           | Use the display's accelerated Copy Region function                                    |
|`Defaults`                                     | Apply power-on-reset default settings                                                 |
|`DefaultsCommon`                               | Apply settings that may be more commonly used but differ from factory settings        |
|`DisplayInverted (enabled)`                    | Invert display colors                                                                 |
|`DisplayLines (lines)`                         | Set total number of display lines                                                     |
|`DisplayOffset (lines)`                        | Set display offset/vertical shift                                                     |
|`DisplayStartLine (line)`                      | Set display start line                                                                |
|`DisplayVisibility (mode)`                     | Set display visibility                                                                |
|`Interlaced (enabled)`                         | Alternate every other display line                                                    |
|`MirrorH (enabled)`                            | Mirror display, horizontally                                                          |
|`MirrorV (enabled)`                            | Mirror display, vertically                                                            |
|`PageRange (pgstart, pgend)`                   | Set start and end page range                                                          |
|`Phase1Period (clks)`                          | Set discharge/phase 1 period, in display clocks                                       |
|`Phase2Period (clks)`                          | Set charge/phase 2 period, in display clocks                                          |
|`Phase3Period (clks)`                          | Set second charge/phase 3 period, in display clocks                                   |
|`PlotAccel (x, y, c)`                          | Use the display's accelerated Plot/Pixel function                                     |
|`Powered (enabled)`                            | Enable display power                                                                  |
|`PrechargePeriod (phs1_clks, phs2_clks)`       | Set display refresh precharge periods                                                 |
|`PrechargeLevel (mV)`                          | Set first pre-charge voltage level (phase 2) of segment pins, in millivolts           |
|`Reset`                                        | Reset the display controller                                                          |
|`SubpixelOrder (order)`                        | Set subpixel color order                                                              |
|`Update`                                       | Write the current display buffer to the display                                       |
|`WriteBuffer (buff_addr, buff_sz)`             | Write alternate buffer to display                                                     |
