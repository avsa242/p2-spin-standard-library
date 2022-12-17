# graphics.common
-----------------

API for generic bitmap graphics library

## Methods

| Method                       | Description                                                                                     |
| -----------------------------|-------------------------------------------------------------------------------------------------|
|`bgcolor()`                   | Set background color for subsequent drawing                                                     |
|`bitmap()`                    | Copy a bitmap to the display buffer                                                             |
|`box()`                       | Draw a box                                                                                      |
|`char_attrs()`                | Set attributes for text rendering                                                               |
|`circle()`                    | Draw a circle                                                                                   |
|`clear()`                     | Clear the display buffer                                                                        |
|`copy()`                      | Copy from one screen location to another                                                        |
|`cut()`                       | Copy from one screen location to another and clear the origin to the background color           |
|`fgcolor()`                   | Set foreground color of subsequent drawing operations                                           |
|`font_addr()`                 | Set address of font definition                                                                  |
|`font_height()`               | Return the set font height                                                                      |
|`font_sz()`                   | Set expected dimension of font, in pixels                                                       |
|`font_width()`                | Return the set font width                                                                       |
|`line()`                      | Draw line                                                                                       |
|`plot()`                      | Plot pixel                                                                                      |
|`point()`                     | Get color of pixel                                                                              |
|`pos_xy()`                    | Set text draw position, in character-cell col and row                                           |
|`putchar()`                   | Write a character to the display                                                                |
|`rgbw8888_rgb32()`            | Return 32-bit long from discrete Red, Green, Blue, White color components                       |
|`rgbw8888_rgb32_brightness()` | Return 32-bit long from discrete Red, Green, Blue, White color components, and clamp brightness |
|`rgb565_r5()`                 | Return 5-bit red component of 16-bit RGB color                                                  |
|`rgb565_g6()`                 | Return 6-bit green component of 16-bit RGB color                                                |
|`rgb565_b5()`                 | Return 5-bit blue component of 16-bit RGB color                                                 |
|`scale()`                     | Scale a region of the display up by size                                                        |
|`scroll_down()`               | Scroll a region of the display down by one pixel                                                |
|`scroll_left()`               | Scroll a region of the display left by one pixel                                                |
|`scroll_right()`              | Scroll a region of the display right by one pixel                                               |
|`scroll_up()`                 | Scroll a region of the display up by one pixel                                                  |
|`text_cols()`                 | Get number of displayable text columns, based on set display width and set font width           |
|`text_rows()`                 | Get number of displayable text rows, based on set display height and set font height            |

__NOTE__: In addition to the above, all terminal output-type methods are available for text
rendering, through the use of `terminal.common.spinh`

`bgcolor(c)`
------------
__Set background color for subsequent drawing__
* Parameters:
	* `c`: background color
* Returns: none
* Affects: `clear()`, `cut()`, `putchar()`


`bitmap(ptr_bmap, xs, ys, bm_wid, bm_lns)`
------------------------------------------
__Copy a bitmap to the display buffer__
* Parameters:
	* `ptr_bmap`: address of/pointer to buffer containing bitmap data
	* `(xs, ys)`: screen location to copy bitmap to, in pixels
	* `bm_wid`: width of bitmap, in pixels
	* `bm_lns`: total number of lines it bitmap
* Returns: none
* __NOTE__: If the preprocessor symbol `GFX_DIRECT` is defined at build-time, a
driver-specific implementation will be used, instead.


`box(sx, sy, ex, ey, c, f)`
---------------------------
__Draw a box__
* Parameters:
	* `(sx, sy)`: starting (upper-left) screen location of box
	* `(ex, ey)`: ending (lower-right) screen location of box
	* `c`: color of box
	* `f`: flag to set if box should be filled (boolean)
* Returns: none
* __NOTE__: If the preprocessor symbol `GFX_DIRECT` is defined at build-time, a
driver-specific implementation will be used, instead.


`char_attrs(attrs)`
-------------------------
__Set attributes for text rendering__
* Parameters:
	* `attrs`: bitmask of attributes
* Returns: none
* Available symbols:
	* `DRAW_BG`: draw the background when drawing text (warning: slower)
* Aliases: `charattrs()`


`circle(cx, cy, r, c, f)`
-------------------------
__Draw a circle__
* Parameters:
	* `(cx, cy)`: screen location to draw circle (center)
	* `r`: radius of circle
	* `c`: color of circle
	* `f`: flag to set if circle should be filled (boolean)
* Returns: none


`clear()`
---------
__Clear the display__
* Parameters: none
* Returns: none
* __NOTE__: The display will be cleared to the color currently set by `bgcolor()`.


`copy(sx, sy, ex, ey, dx, dy)`
------------------------------
__Copy rectangular region from one screen location to another__
* Parameters:
	* `(sx, sy)`: starting (upper-left) screen location to copy
	* `(ex, ey)`: ending (lower-right) screen location to copy
	* `(dx, dy)`: destination screen location to copy to
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.


`cut(sx, sy, ex, ey, dx, dy)`
-----------------------------
__Copy rectangular region from one screen location to another and clear the origin to the
background color__
* Parameters:
	* `(sx, sy)`: starting (upper-left) screen location to copy
	* `(ex, ey)`: ending (lower-right) screen location to copy
	* `(dx, dy)`: destination screen location to copy to
* Returns: none
* __NOTE__: The region copied from will be cleared to the color set by `bgcolor()`
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.


`fgcolor(c)`
------------
__Set foreground color of subsequent drawing operations__

* Parameters:
	* `c`: background color
* Returns: none
* Affects: `putchar()`


`font_addr(ptr_fnt)`
--------------------
__Set address of font definition__

* Parameters:
	* `ptr_fnt`: address of/pointer to start of font table
* Returns: none
* Aliases: `fontaddress()`


`font_height()`
---------------
__Get the currently set font height__

* Parameters: none
* Returns: current font height, in pixels
* Aliases: `fontheight()`


`font_scl(s)`
-------------
__Set font rendering scale__

* Parameters:
	* `s`: factor to scale up font width and height rendering by
* Returns: none
* Aliases: `fontscale()`


`font_sz(w, h)`
---------------
__Set expected dimension of font__

* Parameters:
	* `w`: width of font glyphs, in pixels
	* `h`: height of font glyphs, in pixels
* Returns: none
* Aliases: `fontsize()`


`font_spacing(h, v)`
--------------------
__Set spacing between character cells__

* Parameters:
	* `h`: horizontal space, in pixels
	* `v`: vertical space, in pixels
* Returns: none
* Aliases: `fontspacing()`


`font_width()`
--------------
__Get the currently set font width__

* Parameters: none
* Returns: current font width, in pixels
* Aliases: `fontwidth()`


`line(sx, sy, ex, ey, c)`
-------------------------
__Draw line__

* Parameters:
	* `(sx, sy)`: starting screen location of line
	* `(ex, ey)`: ending screen location of line
	* `c`: color of line
* Returns: none
* __NOTE__: If the preprocessor symbol `GFX_DIRECT` is defined at build time, a driver-specific
implementation will be used, instead.


`plot(x, y, c)`
---------------
__Plot pixel__

* Parameters:
	* `(x, y)`: screen location to draw pixel
	* `c`: color of pixel
* Returns: none
* __NOTE__: This method appears in the display driver, since it is implementation-specific.


`point(x, y)`
-------------
__Get color of pixel__

* Parameters:
	* `(x, y)`: screen location of pixel
* Returns: color of the pixel at the given screen location
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.


`pos_xy(x, y)`
--------------
__Set text draw position, in character-cell col and row__

* Parameters:
	* `(x, y)`: screen location to position next text display, in character cell columns and rows
* Returns: none


`putchar(ch)`
-------------
__Write a character to the display__
* Parameters:
	* `ch`: character to display
* Returns: none
* Aliases: `tx()`, `char()`
* __NOTE__: If the preprocessor symbol `GFX_DIRECT` is defined at build-time, a
driver-specific implementation will be used, instead (some implementations may have limitations)


`rgbw8888_rgb32(r, g, b, w)`
----------------------------
__Return 32-bit long from discrete Red, Green, Blue, White color components__

* Parameters:
	* `r`: 8-bit red color component
	* `g`: 8-bit green color component
	* `b`: 8-bit blue color component
	* `w`: 8-bit white color component
* Returns: 32-bit packed long comprised of the given color components


`rgbw8888_rgb32_brightness(r, g, b, w, level)`
----------------------------------------------
__Return 32-bit long from discrete Red, Green, Blue, White color components, and clamp brightness__

* Parameters:
	* `r`: 8-bit red color component
	* `g`: 8-bit green color component
	* `b`: 8-bit blue color component
	* `w`: 8-bit white color component
	* `level`: brightness level, in percent
* Returns: 32-bit packed long comprised of the given color components


`rgb565_r5(rgb565)`
-------------------
__Get 5-bit red component of 16-bit RGB color__

* Parameters:
	* `rgb565`: 16-bit color word
* Returns: 5-bit red color component of word


`rgb565_g6(rgb565)`
-------------------
__Get 6-bit green component of 16-bit RGB color__

* Parameters:
	* `rgb565`: 16-bit color word
* Returns: 6-bit green color component of word


`rgb565_b5(rgb565)`
-------------------
__Get 5-bit blue component of 16-bit RGB color__

* Parameters:
	* `rgb565`: 16-bit color word
* Returns: 5-bit blue color component of word


`scale(sx, sy, ex, ey, dx, dy, scl)`
------------------------------------
__Copy a region of the display to another location, and scale it up__

* Parameters:
	* `(sx, sy)`: starting screen location to copy
	* `(ex, ey)`: ending screen location to copy
	* `(dx, dy)`: destination screen location to copy to
	* `scl`: factor to scale up copied region by
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.


`scroll_down(sx, sy, ex, ey`
----------------------------
__Scroll a region of the display down by 1 pixel__

* Parameters:
	* `(sx, sy)`: starting screen location to scroll
	* `(ex, ey)`: ending screen location to srcoll
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.
* Aliases: `scrolldown()`


`scroll_left(sx, sy, ex, ey`
----------------------------
__Scroll a region of the display left by 1 pixel__

* Parameters:
	* `(sx, sy)`: starting screen location to scroll
	* `(ex, ey)`: ending screen location to srcoll
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.
* Aliases: `scrollleft()`


`scroll_right(sx, sy, ex, ey`
----------------------------
__Scroll a region of the display right by 1 pixel__

* Parameters:
	* `(sx, sy)`: starting screen location to scroll
	* `(ex, ey)`: ending screen location to srcoll
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.
* Aliases: `scrollright()`


`scroll_up(sx, sy, ex, ey`
----------------------------
__Scroll a region of the display up by 1 pixel__

* Parameters:
	* `(sx, sy)`: starting screen location to scroll
	* `(ex, ey)`: ending screen location to srcoll
* Returns: none
* __NOTE__: This functionality depends on being able to read the current display contents, so is only
usable when a buffered display is being used. If `GFX_DIRECT` is defined at build time, this method
won't be available.
* Aliases: `scrollup()`


`text_cols()`
-------------
__Get number of displayable text columns__

* Parameters: none
* Returns: number of columns
* __NOTE__: This value depends on the display dimensions and currently set font width.
* Aliases: `textcols()`


`text_rows()`
-------------
__Get number of displayable text rows__

* Parameters: none
* Returns: number of rows
* __NOTE__: This value depends on the display dimensions and currently set font height.
* Aliases: `textrows()`

