# memory
--------

API for memory device drivers

Object filename description:

memory.type.series.int

_type_ is one of: eeprom, flash, fram, sram

_series_ indicates the manufacturer's series number of the memory (e.g., 23lcxxxx)

_int_ indicates the type of interface supported by the driver (e.g., spi, i2c, uart)

## Methods

| Method                                        | Description                                         |
| ----------------------------------------------|---------------------------------------------------- |
|`ReadByte(addr)`                               | Read one byte from the memory device
|`ReadBytes(addr, nr_bytes, buff_addr)`         | Read multiple bytes from memory device
|`WriteByte(addr, val)`                         | Write one byte to the memory device
|`WriteBytes(addr, nr_bytes, buff_addr)`        | Write multiple bytes to the memory device
