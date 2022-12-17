# l3g4200d-spin Makefile - requires GNU Make, or compatible
# Variables below can be overridden on the command line
#	e.g. make IFACE=L3G4200D_SPI L3G4200D-Demo.binary

# P1, P2 device nodes and baudrates
#P1DEV=
P1BAUD=115200
#P2DEV=
P2BAUD=2000000

# P1, P2 compilers
#P1BUILD=flexspin
P1BUILD=flexspin --interp=rom
P2BUILD=flexspin -2

# L3G4200D interface: I2C (SPIN or PASM engine), SPI
IFACE=L3G4200D_I2C_BC
#IFACE=L3G4200D_I2C
#IFACE=L3G4200D_SPI

# Paths to spin-standard-library, and p2-spin-standard-library,
#  if not specified externally
SPIN1_LIB_PATH=-L ../spin-standard-library/library
SPIN2_LIB_PATH=-L ../p2-spin-standard-library/library


# -- Internal --
SPIN1_DRIVER_FN=sensor.gyroscope.3dof.l3g4200d.spin
SPIN2_DRIVER_FN=sensor.gyroscope.3dof.l3g4200d.spin2
CORE_FN=core.con.l3g4200d.spin
# --

# Build all targets (build only)
all: L3G4200D-Demo.binary L3G4200D-Demo.bin2

# Load P1 or P2 target (will build first, if necessary)
p1demo: loadp1demo
p2demo: loadp2demo

# Build binaries
L3G4200D-Demo.binary: L3G4200D-Demo.spin $(SPIN1_DRIVER_FN) $(CORE_FN)
	$(P1BUILD) $(SPIN1_LIB_PATH) -b -D $(IFACE) L3G4200D-Demo.spin

L3G4200D-Demo.bin2: L3G4200D-Demo.spin2 $(SPIN2_DRIVER_FN) $(CORE_FN)
	$(P2BUILD) $(SPIN2_LIB_PATH) -b -2 -D $(IFACE) -o L3G4200D-Demo.bin2 L3G4200D-Demo.spin2

# Load binaries to RAM (will build first, if necessary)
loadp1demo: L3G4200D-Demo.binary
	proploader -t -p $(P1DEV) -Dbaudrate=$(P1BAUD) L3G4200D-Demo.binary

loadp2demo: L3G4200D-Demo.bin2
	loadp2 -SINGLE -p $(P2DEV) -v -b$(P2BAUD) -l$(P2BAUD) L3G4200D-Demo.bin2 -t

# Remove built binaries and assembler outputs
clean:
	rm -fv *.binary *.bin2 *.pasm *.p2asm

