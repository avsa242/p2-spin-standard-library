# memory
--------

API for memory device drivers

Object filename description:

memory.type.series.spin2

_type_ is one of: `eeprom`, `flash`, `fram`, `sram`, `mram`

_series_ indicates the manufacturer's series number of the memory (e.g., `23xxxx`)


## Base Methods

These are methods that are common to _all_ memory drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |

Notes:

1. For SPI-connected memories:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SCK_FREQ): status`

2. For I2C-connected memories:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses.

3. `startx()` returns the launched cog number+1 of com engine used on success.

4. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

5. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method           | Description                                     |
| -----------------| ----------------------------------------------- |
|`rd_byte()`       | Read one byte from the memory                   |
|`rd_block_lsbf()` | Read multiple bytes from memory (lsb-f)         |
|`rd_block_msbf()` | Read multiple bytes from memory (msb-f)         |
|`rd_long_lsbf()`  | Read a long from the memory (lsb-f)             |
|`rd_long_msbf()`  | Read a long from the memory (msb-f)             |
|`rd_word_lsbf()`  | Read a word from the memory (lsb-f)             |
|`rd_word_msbf()`  | Read a word from the memory (msb-f)             |
|`wr_byte()`       | Write one byte to the memory                    |
|`wr_block_lsbf()` | Write multiple bytes to the memory (lsb-f)      |
|`wr_block_msbf()` | Write multiple bytes to the memory (msb-f)      |
|`page_size()`     | Get memory's size of one page, in bytes         |


`rd_byte(addr)`
---------------
__Read one byte from the memory__
* Parameters:
	* `addr`: the address to read from
* Returns:
	* byte read from the memory


`rd_block_lsbf(ptr_buff, addr, nr_bytes)`
-----------------------------------------
__Read multiple bytes from memory (lsbyte-first)__
* Parameters:
	* `ptr_buff`: pointer to buffer to read memory data to
	* `addr`: the address to read from
	* `nr_bytes`: number of bytes to read
* Returns: none
__NOTE__: Data is read into the destination buffer `ptr_buff` starting at the beginning of the
buffer working upwards. The byte order of individual words or longs is unaffected.


`rd_block_msbf(ptr_buff, addr, nr_bytes)`
-----------------------------------------
__Read multiple bytes from memory (msbyte-first)__
* Parameters:
	* `ptr_buff`: pointer to buffer to read memory data to
	* `addr`: the address to read from
	* `nr_bytes`: number of bytes to read
* Returns: none
__NOTE__: Data is read into the destination buffer `ptr_buff` starting at the end of the
buffer working downwards. The byte order of individual words or longs is unaffected.


`rd_long_lsbf(addr)`
--------------------
__Read a long from the memory (lsbyte-first)__
* Parameters:
	* `addr`: the address to read from
* Returns:
	* longword of data, least-significant byte first


`rd_long_msbf(addr)`
--------------------
__Read a long from the memory (msbyte-first)__
* Parameters:
	* `addr`: the address to read from
* Returns:
	* longword of data, most-significant byte first


`rd_word_lsbf(addr)`
--------------------
__Read a word from the memory (lsbyte-first)__
* Parameters:
	* `addr`: the address to read from
* Returns:
	* word of data, least-significant byte first


`rd_word_msbf(addr)`
--------------------
__Read a word from the memory (msbyte-first)__
* Parameters:
	* `addr`: the address to read from
* Returns:
	* word of data, most-significant byte first


`wr_byte(addr, val)`
--------------------
__Write one byte to the memory__
* Parameters:
	* `addr`: the address to write to
	* `val`: the data byte to write
* Returns: none


`wr_block_lsbf(addr, ptr_buff, nr_bytes)`
-----------------------------------------
__Write multiple bytes to the memory (lsbyte-first)__
* Parameters:
	* `addr`: the starting address to write to
	* `ptr_buff`: pointer to a buffer containing data to write to the memory
	* `nr_bytes`: number of bytes to write
* Returns: none
__NOTE__: Reading of the data to write to memory will start at the beginning of the buffer at
`ptr_buff` and advance upwards. The byte order of the individual words or longs written will
not be affected.


`wr_block_msbf(addr, ptr_buff, nr_bytes)`
-----------------------------------------
__Write multiple bytes to the memory (msbyte-first)__
* Parameters:
	* `addr`: the starting address to write to
	* `ptr_buff`: pointer to a buffer containing data to write to the memory
	* `nr_bytes`: number of bytes to write
* Returns: none
__NOTE__: Reading of the data to write to memory will start at the end of the buffer at
`ptr_buff` and advance downwards. The byte order of the individual words or longs written will
not be affected.


`page_size()`
-------------
__Get memory's size of one page__
* Parameters: none
* Returns:
	* size of the memory's page


Notes:

1. `page_size()`: this returns the largest read/write operation that can be be performed without additional side-effects, which can include:
	* an extra delay until the next page is accessed
	* address roll-over (doesn't proceed to next page, instead returns to the beginning of the current page)

2. `page_size()`: some memory technologies (e.g., FRAM) don't have pages, so this simply returns the total size of the chip

3. Because not all memory devices support reading the chip density/size, read/write addresses are not validated. Behavior when accessing beyond the end of the device may vary from one memory technology to the next, or one manufacturer to the next. Some may wrap around to the beginning of the memory, or the page.


