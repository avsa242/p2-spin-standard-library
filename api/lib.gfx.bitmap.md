# lib.gfx.bitmap
----------------

API for generic bitmap graphics library

## Methods

| Method                                        | Description                                                                                                   |
| ----------------------------------------------|-------------------------------------------------------------------------------------------------------------- |
|`BGColor (col)`                                | Set background color for subsequent drawing                                                                   |
|`Bitmap (bitmap_addr, size, offset)`           | Copy a bitmap to the display buffer                                                                           |
|`Box (x0, y0, x1, y1, color, filled)`          | Draw a box                                                                                                    |
|`Char (ch)`                                    | Write a character to the display                                                                              |
|`Circle (x0, y0, radius, color)`               | Draw a circle                                                                                                 |
|`Clear`                                        | Clear the display buffer                                                                                      |
|`ClearAll`                                     | Clear the display buffer, and execute the display's native/acclerated clear function                          |
|`Copy (sx, sy, ex, ey, dx, dy)`                | Copy rectangular region at (sx, sy, ex, ey) to (dx, dy)                                                       |
|`Cut (sx, sy, ex, ey, dx, dy)`                 | Copy rectangular region at (sx, sy, ex, ey) to (dx, dy) and clear the source region to the background color   |
|`FGColor (col)`                                | Set foreground color of subsequent drawing operations                                                         |
|`FontAddress (addr)`                           | Set address of font definition                                                                                |
|`FontHeight`                                   | Return the set font height                                                                                    |
|`FontSize (width, height)`                     | Set expected dimension of font, in pixels                                                                     |
|`FontWidth`                                    | Return the set font width                                                                                     |
|`Line(x1, y1, x2, y2, c)`                      | Draw line from x1, y1 to x2, y2, in color c                                                                   |
|`Plot (x, y, color)`                           | Plot pixel at x, y, color c                                                                                   |
|`Point (x, y)`                                 | Get color of pixel at x, y                                                                                    |
|`Position (col, row)`                          | Set text draw position, in character-cell col and row                                                         |
|`RGBW8888_RGB32 (r, g, b, w)`                  | Return 32-bit long from discrete Red, Green, Blue, White color components                                     |
|`RGBW8888_RGB32_Brightness (r, g, b, w, level)`| As above, but clamp R, G, B, W brightness to 'level'                                                          |
|`RGB565_R5 (rgb565)`                           | Return 5-bit red component of 16-bit RGB color                                                                |
|`RGB565_G6 (rgb565)`                           | Return 6-bit green component of 16-bit RGB color                                                              |
|`RGB565_B5 (rgb565)`                           | Return 5-bit blue component of 16-bit RGB color                                                               |
|`Scale (sx, sy, ex, ey, offsx, offsy, size)`   | Scale a region of the display up by size                                                                      |
|`Str (string_addr)`                            | Write string at string_addr to the display @ row and column                                                   |
|`TextCols`                                     | Returns number of displayable text columns, based on set display width and set font width                     |
|`TextRows`                                     | Returns number of displayable text rows, based on set display height and set font height                      |
