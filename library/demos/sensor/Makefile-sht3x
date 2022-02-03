# sht3x-spin Makefile - requires GNU Make, or compatible
# Variables below can be overridden on the command line
#	e.g. make TARGET=SHT3X_SPIN SHT3x-Demo.binary

# P1, P2 device nodes and baudrates
#P1DEV=
P1BAUD=115200
#P2DEV=
P2BAUD=2000000

# P1, P2 compilers
P1BUILD=flexspin --interp=rom
#P1BUILD=flexspin
P2BUILD=flexspin -2

# For P1 only: build using the bytecode or PASM-based I2C engine
# (independent of overall bytecode or PASM build)
#TARGET=SHT3X_SPIN
TARGET=SHT3X_PASM

# Paths to spin-standard-library, and p2-spin-standard-library,
#  if not specified externally
SPIN1_LIB_PATH=~/spin-standard-library/library
SPIN2_LIB_PATH=~/p2-spin-standard-library/library


# -- Internal --
SPIN1_DRIVER_FN=$(SPIN1_LIB_PATH)/sensor.temp_rh.sht3x.spin
SPIN2_DRIVER_FN=$(SPIN2_LIB_PATH)/sensor.temp_rh.sht3x.spin2
SPIN1_CORE_FN=$(SPIN1_LIB_PATH)/core.con.sht3x.spin
SPIN2_CORE_FN=$(SPIN2_LIB_PATH)/core.con.sht3x.spin
# --

# Build all targets (build only)
all: SHT3x-Demo.binary SHT3x-Demo.bin2 SHT3x-ThreshIntDemo.binary SHT3x-ThreshIntDemo.bin2

# Load P1 or P2 target (will build first, if necessary)
p1demo: loadp1demo
p2demo: loadp2demo
p1intdemo: loadp1intdemo
p2intdemo: loadp2intdemo

# Build binaries
SHT3x-Demo.binary: SHT3x-Demo.spin $(SPIN1_DRIVER_FN) $(SPIN1_CORE_FN)
	$(P1BUILD) -L $(SPIN1_LIB_PATH) -b -D $(TARGET) SHT3x-Demo.spin

SHT3x-ThreshIntDemo.binary: SHT3x-ThreshIntDemo.spin $(SPIN1_DRIVER_FN) $(SPIN1_CORE_FN)
	$(P1BUILD) -L $(SPIN1_LIB_PATH) -b -D $(TARGET) SHT3x-ThreshIntDemo.spin

SHT3x-Demo.bin2: SHT3x-Demo.spin2 $(SPIN2_DRIVER_FN) $(SPIN2_CORE_FN)
	$(P2BUILD) -L $(SPIN2_LIB_PATH) -b -2 -D $(TARGET) -o SHT3x-Demo.bin2 SHT3x-Demo.spin2

SHT3x-ThreshIntDemo.bin2: SHT3x-ThreshIntDemo.spin2 $(SPIN2_DRIVER_FN) $(SPIN2_CORE_FN)
	$(P2BUILD) -L $(SPIN2_LIB_PATH) -b -2 -D $(TARGET) -o SHT3x-ThreshIntDemo.bin2 SHT3x-ThreshIntDemo.spin2

# Load binaries to RAM (will build first, if necessary)
loadp1demo: SHT3x-Demo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) SHT3x-Demo.binary

loadp1intdemo: SHT3x-ThreshIntDemo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) SHT3x-ThreshIntDemo.binary

loadp2demo: SHT3x-Demo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) SHT3x-Demo.bin2 -t

loadp2intdemo: SHT3x-ThreshIntDemo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) SHT3x-ThreshIntDemo.bin2 -t

# Remove built binaries and assembler outputs
clean:
	rm -fv *.binary *.bin2 *.pasm *.p2asm

