# adxl345-spin Makefile - requires GNU Make, or compatible
# Variables below can be overridden on the command line
#      e.g. IFACE=ADXL345_SPI make

# P1, P2 device nodes and baudrates
#P1DEV=
P1BAUD=115200
#P2DEV=
P2BAUD=2000000

# P1, P2 compilers
P1BUILD=flexspin --interp=rom
#P1BUILD=flexspin
P2BUILD=flexspin

# ADXL345 interface: I2C, SPI
IFACE=ADXL345_I2C
#IFACE=ADXL345_SPI

# Paths to spin-standard-library, and p2-spin-standard-library,
#  if not specified externally
SPIN1_LIB_PATH=-L ../spin-standard-library/library
SPIN2_LIB_PATH=-L ../p2-spin-standard-library/library


# -- Internal --
SPIN1_DRIVER_FN=sensor.accel.3dof.adxl345.spin
SPIN2_DRIVER_FN=sensor.accel.3dof.adxl345.spin2
CORE_FN=core.con.adxl345.spin
# --

# Build all targets (build only)
all: ADXL345-Demo.binary ADXL345-Demo.bin2 ADXL345-ClickDemo.binary ADXL345-ClickDemo.bin2 ADXL345-InactivityDemo.binary ADXL345-InactivityDemo.bin2

# Load P1 or P2 target (will build first, if necessary)
p1demo: loadp1demo
p1click: loadp1click
p1inact: loadp1inact
p2demo: loadp2demo
p2click: loadp2click
p2inact: loadp2inact

# Build binaries
ADXL345-Demo.binary: ADXL345-Demo.spin $(SPIN1_DRIVER_FN) $(CORE_FN)
	$(P1BUILD) $(SPIN1_LIB_PATH) -b -D $(IFACE) ADXL345-Demo.spin

ADXL345-Demo.bin2: ADXL345-Demo.spin2 $(SPIN2_DRIVER_FN) $(CORE_FN)
	$(P2BUILD) $(SPIN2_LIB_PATH) -b -2 -D $(IFACE) -o ADXL345-Demo.bin2 ADXL345-Demo.spin2

ADXL345-ClickDemo.binary: ADXL345-ClickDemo.spin $(SPIN1_DRIVER_FN) $(CORE_FN)
	$(P1BUILD) $(SPIN1_LIB_PATH) -b -D $(IFACE) ADXL345-ClickDemo.spin

ADXL345-ClickDemo.bin2: ADXL345-ClickDemo.spin2 $(SPIN2_DRIVER_FN) $(CORE_FN)
	$(P2BUILD) $(SPIN2_LIB_PATH) -b -2 -D $(IFACE) -o ADXL345-ClickDemo.bin2 ADXL345-ClickDemo.spin2

ADXL345-InactivityDemo.binary: ADXL345-InactivityDemo.spin $(SPIN1_DRIVER_FN) $(CORE_FN)
	$(P1BUILD) $(SPIN1_LIB_PATH) -b -D $(IFACE) ADXL345-InactivityDemo.spin

ADXL345-InactivityDemo.bin2: ADXL345-InactivityDemo.spin2 $(SPIN2_DRIVER_FN) $(CORE_FN)
	$(P2BUILD) $(SPIN2_LIB_PATH) -b -2 -D $(IFACE) -o ADXL345-InactivityDemo.bin2 ADXL345-InactivityDemo.spin2

# Load binaries to RAM (will build first, if necessary)
loadp1demo: ADXL345-Demo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) ADXL345-Demo.binary

loadp1click: ADXL345-ClickDemo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) ADXL345-ClickDemo.binary

loadp1inact: ADXL345-InactivityDemo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) ADXL345-InactivityDemo.binary

loadp2demo: ADXL345-Demo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) ADXL345-Demo.bin2 -t

loadp2click: ADXL345-ClickDemo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) ADXL345-ClickDemo.bin2 -t

loadp2inact: ADXL345-InactivityDemo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) ADXL345-InactivityDemo.bin2 -t

# Remove built binaries and assembler outputs
clean:
	rm -fv *.binary *.bin2 *.pasm *.p2asm

