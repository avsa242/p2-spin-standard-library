VGA TILE DRIVER
- Revision 0.4: Fixed a bug with vsync polarity
- Revision 0.3: Added 1028x768 support and polarity
- Revision 0.2: Started work on ANSI escape codes

This is a simple VGA tile driver. It's still a work in progress.

vga640x480.spin2 is the 640x480 version, supporting 80x30 characters
vga800x600.spin2 is the 800x600 version, supporting 100x40 characters

Tiles must always be 8 pixels wide. Theoretically they can be any
height, but the demos use 16 pixels (15 for the 800x600, which is
achieved by just ignoring the first row of an 8x16 font). There are
some 8x8 fonts provided too.

The character data is ROWS*COLS*8 bytes long; each character takes 8
bytes in memory. This consists of 24 bits foreground color, 8 bits
of the actual character index, 24 bits of background color, and 8
unused bits (write 0's for these -- it matters!).

HOW IT WORKS
------------
The actual driver is vga_tile_driver.spin2, which runs in its own COG.
It reads parameters from a mailbox, which has the following longs in
order:
    character data address
    number of columns (e.g. 80 or 100)
    number of rows (e.g. 30 or 40)
    font data address
    width of font (must be 8)
    height of font
    clock scaling factor (see below)
    horizontal front porch, pixels
    horizontal sync time, pixels
    horizontal back porch, pixels
    vertical front porch, lines
    vertical sync time, lines
    vertical back porch, lines

The clock scaling factor is the pixel clock divided by the system
clock, and multiplied by $8000_0000. In practice the driver
won't work if this ratio is any bigger than 1/3, so for a
for a 180 MHz P2 system clock the maximum pixel clock is 60 MHz.

The driver works by reading a whole line of the font during blanking,
then reading the individual character colors (and index). The colors
are stuffed into the LUT, and the index is used to look up the font
information in COG RAM, which is then output with an immediate LUT
streamer command. We ping-pong between two sets of LUT entries so we
can change the color every pixel.


FONT
----
The font is an 8xN bitmap, but it's laid out a bit differently from most
fonts:

(1) The characters are all placed in one row in the bitmap; that is,
byte 0 is the first row of character 0, byte 1 is the first row of
character 1, and so on, until we get to byte 256 which is the second row
of character 0. This is because we have to keep the data we need for all
characters in COG memory, but we'll only ever need the data for one font
row at a time. This data is read during the horizontal sync and blanking
period.

(2) The rows are output bit 0 first, then bit 1, and so on, so the
individual characters are "reversed" from how most fonts store them.
This is due to the way the streamer works in immediate mode.

There's a C program given here (makebitmap.c) to convert an X window
system.bdf font to a suitable font.bin file. I've only tried it on the
unscii font, so caveat emptor. To use it do:

   gcc -o makebitmap makebitmap.c
   makebitmap unscii-16.bdf vga.map

it'll create a file called font.bin. The "vga.map" file gives the
mapping between glyphs and Unicode characters. That is, for each of
the 256 possible character positions in the final bitmap, you specify
which Unicode character is desired for the font. If the character you
specify is not actually in the font the corresponding glyph will come
out blank. If no .map file is provided (if you just run "makebitmap
file.bdf") then it'll just use a default mapping where glyphs 0-255
represent Unicode characters 0-255.

The font provided is unscii, a public domain Unicode font, in several
variants.

CREDITS
-------
The unscii font is from http://pelulamu.net/unscii/

The ANSI art is Ansi Love by Rad Man, from
http://sixteencolors.net/pack/blocktronics_blockalypse/rad-LOVE.ANS.
