# lps25-spin Makefile - requires GNU Make, or compatible
# Variables below can be overridden on the command line
#	e.g. IFACE=LPS25_SPI make

# P1, P2 device nodes and baudrates
#P1DEV=
P1BAUD=115200
#P2DEV=
P2BAUD=2000000

# P1, P2 compilers
#P1BUILD=flexspin
P1BUILD=flexspin --interp=rom
P2BUILD=flexspin -2

# LPS25 interface: I2C, SPI
IFACE=LPS25_I2C
#IFACE=LPS25_SPI

# Paths to spin-standard-library, and p2-spin-standard-library,
#  if not specified externally
SPIN1_LIB_PATH=$(HOME)/spin-standard-library/library
SPIN2_LIB_PATH=$(HOME)/p2-spin-standard-library/library


# -- Internal --
SPIN1_DRIVER_FN=sensor.pressure.lps25.spin
SPIN2_DRIVER_FN=sensor.pressure.lps25.spin2
CORE_FN=core.con.lps25.spin
# --

# Build all targets (build only)
all: LPS25-Demo.binary LPS25-Demo.bin2

# Load P1 or P2 target (will build first, if necessary)
p1demo: loadp1demo
p2demo: loadp2demo

# Build binaries
LPS25-Demo.binary: LPS25-Demo.spin $(SPIN1_DRIVER_FN) $(CORE_FN)
	$(P1BUILD) -L $(SPIN1_LIB_PATH) -b -D $(IFACE) LPS25-Demo.spin

LPS25-Demo.bin2: LPS25-Demo.spin2 $(SPIN2_DRIVER_FN) $(CORE_FN)
	$(P2BUILD) -L $(SPIN2_LIB_PATH) -b -2 -D $(IFACE) -o LPS25-Demo.bin2 LPS25-Demo.spin2

# Load binaries to RAM (will build first, if necessary)
loadp1demo: LPS25-Demo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) LPS25-Demo.binary

loadp2demo: LPS25-Demo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) LPS25-Demo.bin2 -t

# Remove built binaries and assembler outputs
clean:
	rm -fv *.binary *.bin2 *.pasm *.p2asm

