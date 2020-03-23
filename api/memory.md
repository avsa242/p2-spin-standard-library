# memory
--------

API for memory device drivers

## Methods

| Method                                        | Description                                         |
| ----------------------------------------------|---------------------------------------------------- |
|`ReadByte(addr)`                               | Read one byte from the memory device
|`ReadBytes(addr, nr_bytes, buff_addr)`         | Read multiple bytes from memory device
|`WriteByte(addr, val)`                         | Write one byte to the memory device
|`WriteBytes(addr, nr_bytes, buff_addr)`        | Write multiple bytes to the memory device
