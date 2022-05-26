# Driver structure

`CON`
* Constants used both internally by the driver, as well as symbols that can be used by applications, so that intuitive names can be used in place of mysterious looking numbers.

`VAR`
* Variables global to the object, where wider scope is required (e.g., display dimensions in an LCD driver)

`OBJ`
* Child objects used by the object (e.g., the low-level engine used to interface with the device.


### Basic formatting and conventions

* Methods that are part of the API are sorted alphabetically. Exceptions to this are utility methods, which appear first.
* Constants (defined in CON blocks) defined as symbols are capitalized (e.g., `CONST_NAME`).
* Variables global to the object (defined in VAR blocks) are preceded by an underscore, for at-a-glance identification (e.g., `long _disp_width`). This includes symbols defined in `DAT` blocks, __if__ they're used throughout the object (doesn't pertain to labels in assembler listings)
* Parameters used for I/O pins are capitalized (e.g., `SCL_PIN`)
* Parameterless methods are suffixed with {}, to make it easier for automated tools to convert to SPIN2 parameterless method definitions or calls (e.g., `SpinMethod{}` becomes `SpinMethod()` when converted). Note that this isn't required by the language; it's only a convention.
* Variables have standard prefixes and suffixes, where possible. Some examples are:
	* `ptr_` : variable holds a pointer to a variable or buffer
 	* `curr_`: variable holds a current value


### Utility methods

These are the first methods defined in the driver object. They're used when a driver object is first instantiated, or when it is to be stopped.

```spin
PUB Start(): status
' Start the driver, using default parameters (calls `Startx()` with default parameters)
' Not all drivers include this - based on practicality, sensibility
' Parameters: minimal, if any
' Returns:
'       cog ID+1 (e.g., if driver started in cog 1, '2' is returned)
'       FALSE if driver didn't start (no cogs available, device not found, etc)

PUB Startx(): status
' Start the driver, using explicitly defined parameters
' Parameters: I/O pins, working memory buffer, etc as required by the driver
' Returns:
'	cog ID+1 (e.g., if driver started in cog 1, '2' is returned)
'	FALSE if driver didn't start (no cogs available, device not found, etc)

PUB Stop()
' Stop the driver
'	Stop cog(s) in use
'	Reclaim (zero out) hub variables
'	Tri-state/float I/O pins that were used

PUB Defaults()
' Call method(s) with parameters that set the device to its factory-default state
' If the device supports a software or hardware reset, that is called instead of several
'	discrete method calls, in order to save memory

PUB Preset_A()
' Preset is the common root name; everything after the '_' may be different
' Call method(s) with parameters to set the device to a certain pre-defined
'  state
'	(e.g., set a wireless transceiver to receive mode at 9.6kbps, or
'	an accelerometer to +/- 2g scale, active measurement mode)
```


### Driver methods (API)

The methods used by the application.
There are generally four different types:
1) __Methods without parameters__: these methods behave like a simple command; they effect a state change of some sort in the device (e.g., sending a rendered display buffer to the display). Unless explicitly noted, these methods don't return anything.
2) __Methods with variable parameters__: these methods have multiple possible values for parameters; accepted parameter values vary by device and method.
3) __Methods with boolean type parameters__: these methods enable/turn on or disable/turn off functionality. Accepted parameter values are `TRUE` (-1 or 1) or `FALSE` (0)
4) __Functions__: these parameterless methods query the device for the current state or setting of some functionality.

For 2) and 3), if the device supports reading register states, or if a shadow register is implemented in RAM for devices that don't, the current setting can be queried by calling the method with a value that is outside of the accepted range (e.g., -2, if the accepted values are 1..10). This is in opposition to having a separate 'get' method for the setting.

```spin
PUB MethodWithoutParam{}
' Send command to device
	writereg(core#CMDNAME, 0, 0)

PUB MethodWithParam(new_setting): curr_setting
' 1) Read register current setting into return var
' 2) Validate updated/new_setting per the acceptable range
' 3a) If it's valid:
'	a) calculate, shift, etc as required to turn the human-readable
'	 parameter into a register value
'	b) in the reg that was just read into the return var, clear the bits
'	 that pertain to only this setting
'	c) bitwise OR in the updated/new setting from a)
'	d) write the updated register value to the device
' 3b) If it's not valid:
'	a) isolate that setting within the register (one register may contain
'	 several different settings) - calculate, shift, etc, as required
'	b) return the current setting

	curr_setting := 0
	readreg(core#REGNAME, 1, @curr_setting)		' read current setting
	case new_setting
		0, 1, 2, 3:				' <-- accepted range
			{ calculate, shift, etc as needed to turn the
			  human-readable parameter into a register value }
			new_setting <<= core#FIELD_NAME
		other:					' <-- outside accepted range
			{ isolate just this setting from the rest of the
			  register }
			curr_setting >>= core#FIELD_NAME
			{ calculate, shift, etc as needed to turn the register
			  value into a human-readable value }
			return curr_setting & core#FIELD_BITS

	{ clear all bits pertaining to only this setting, in case any of them
	  need to be 0's, then OR in the new/updated setting }
	new_setting := ((curr_setting & core#CLR_SETTING_BITS) | new_setting)
	writereg(core#REGNAME, 1, @new_setting)
```

```spin
PUB MethodWithBooleanParam(new_setting): current_setting
' These operate like the MethodWithParam(), except the only accepted
'  parameters are:
'	TRUE (-1 or 1), or FALSE (0)
```

```spin
PUB Function{}: current_value
' These only return a value, based on some value read back from the device
	readreg(core#REGNAME, 1, @current_value)
```


### Driver methods (internal)

These are low-level methods used internally by the driver, and are not part of the API, so are defined as PRIvate.
They are responsible for interfacing with the device, or performing internal calculations, etc.

```spin
PRI readReg(reg_nr, nr_bytes, ptr_buff) | cmd_pkt, tmp
' Read register(s) starting at reg_nr, into buffer pointed to by ptr_buff
	case reg_nr
		$00..$FF:
			' OK to go
		other:
			' invalid; return
```

```spin
PRI writeReg(reg_nr, nr_bytes, ptr_buff) | cmd_pkt, tmp
' Write register(s) starting at reg_nr, from buffer pointed to by ptr_buff
    { validate register number before doing anything. This is important
     during development, as some devices can be damaged by writing to
     undocumented registers or registers explicitly indicated by the
     manufacturer as 'do-not-write' }
    case reg_nr
		$00..$FF:
			' OK TO GO
		other:
			' invalid; return
```

