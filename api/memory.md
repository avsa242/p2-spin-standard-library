# memory
--------

API for memory device drivers

Object filename description:

memory.type.series.spin2

_type_ is one of: eeprom, flash, fram, sram

_series_ indicates the manufacturer's series number of the memory (e.g., 23xxxx)


## Base Methods

These are methods that are common to _all_ memory drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `Startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `Stop()`        | Stop the driver                                  | n/a       | n/a            |

Notes:

1. For SPI-connected memories:
	* `Startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SCK_FREQ): status`

2. For I2C-connected memories:
	* `Startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* Not all devices support alternate I2C addresses.

3. `Startx()` returns the launched cog number+1 of com engine used on success.

4. `Startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `DeviceID()` didn't return the expected value

5. `Stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0

## Methods

| Method                                        | Description                                     |
| --------------------------------------------- | ----------------------------------------------- |
|`rd_byte(addr)`                                | Read one byte from the memory                   |
|`rd_block_lsbf(ptr_buff, addr, nr_bytes)`      | Read multiple bytes from memory (lsb-f)         |
|`rd_block_msbf(ptr_buff, addr, nr_bytes)`      | Read multiple bytes from memory (msb-f)         |
|`rd_long_lsbf(addr)`                           | Read a long from the memory (lsb-f)             |
|`rd_long_msbf(addr)`                           | Read a long from the memory (msb-f)             |
|`rd_word_lsbf(addr)`                           | Read a word from the memory (lsb-f)             |
|`rd_word_msbf(addr)`                           | Read a word from the memory (msb-f)             |
|`wr_byte(addr, val)`                           | Write one byte to the memory                    |
|`wr_block_lsbf(addr, ptr_buff, nr_bytes)`      | Write multiple bytes to the memory (lsb-f)      |
|`wr_block_msbf(addr, ptr_buff, nr_bytes)`      | Write multiple bytes to the memory (msb-f)      |
|`page_size()`                                  | Get memory's size of one page, in bytes         |

Notes:

1. `Page_Size()`: this returns the largest read/write operation that can be be performed without additional side-effects, which can include:
	* an extra delay until the next page is accessed
	* address roll-over (doesn't proceed to next page, instead returns to the beginning of the current page)

2. `Page_Size()`: some memory technologies (e.g., FRAM) don't have pages, so this simply returns the total size of the chip

3. Because not all memory devices support reading the chip density/size, read/write addresses are not validated. Behavior when accessing beyond the end of the device may vary from one memory technology to the next, or one manufacturer to the next.

