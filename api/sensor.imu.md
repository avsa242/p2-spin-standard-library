# sensor.imu
------------

API for IMU, accelerometer, gyroscope, and magnetometer device drivers

Object filename description:

`sensor.type.ndof.model.spin`

_type_ is one of: `imu`, `accel`, `gyroscope`, `magnetometer`
(`imu` indicates a chip that incorporates two or more of the others)

_ndof_ indicates the number of axes, or Degrees-of-Freedom the sensor supports
(e.g., `3dof` == 3-axis)

_model_ indicates the manufacturer's model/part number of the sensor (e.g., `lsm9ds1`)

## Base Methods

These are methods that are common to _all_ IMU drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `stop()`        | Stop the driver                                  | n/a       | n/a            |
| `defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For SPI-connected sensors:
	* `startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_FREQ): status`
	* Some devices contain more than one slave device internally, and so may break the above
convention, because of the need for additional CS and/or MOSI/MISO pins.
	* SPI_FREQ defaults to 1MHz, if unspecified.
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* Replace `MODEL` with the sensor model #. Example: `LSM9DS1_SPI`
	* For SPI-connected sensors: 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `startx()` method will check for this and set the device's 3-wire SPI mode register.

2. For I2C-connected sensors:
	* `startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* Not all devices support alternate I2C addresses.

3. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `Reset()` method, and is ignored if set
outside the allowable range.

4. `startx()` returns the launched cog number+1 of com engine used on success.

5. `startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `dev_id()` didn't return the expected value

6. `defaults()` may simply call `reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

7. Most (but not all) drivers also provide the following methods:
| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `dev_id()`      | Read model-unique identification register        | n/a      | model/dev ID    |
| `reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `preset_()` methods, that establish a set of pre-set settings.

9. `stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0


## Accelerometers

| Method              | Description                                   |
| --------------------| ----------------------------------------------|
| `accel_bias()`      | Read accelerometer calibration offset values  |
| `accel_data()`      | Read accelerometer raw data                   |
| `accel_data_rate()` | Set accelerometer output data rate, in Hz     |
| `accel_g()`         | Read accelerometer calibrated data (g's)      |
| `accel_scale()`     | Set accelerometer full-scale, in g's          |
| `accel_set_bias()`  | Write accelerometer calibration offset values |
| `accel_word2g()`    | Convert given accel ADC word to g's           |
| `calibrate_accel()` | Calibrate the accelerometer                   |
| `pitch()`           | Read pitch angle of accelerometer, in degrees |
| `roll()`            | Read roll angle of accelerometer, in degrees  |

`accel_bias(x, y, z)`
---------------------
__Read accelerometer calibration offset values__
* Parameters:
	* `x, y, z`: pointers to variables to read offsets to
* Returns: none


`accel_data(ptr_x, ptr_y, ptr_z)`
---------------------------------
__Read accelerometer raw data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to
* Returns: none


`accel_data_cache()`
---------------------------------
__Cache an accelerometer data sample__
* Parameters: none
* Returns: none
* __NOTE__: Call this to store a measurement in RAM for use by `pitch()` and/or `roll()`


`accel_data_rate(rate)`
-----------------------
__Set accelerometer output data update rate__
* Parameters:
	* `rate`: rate, in Hz
* Returns: currently set rate, if `rate` is outside the acceptable range


`accel_g(ptr_x, ptr_y, ptr_z)`
------------------------------
__Read accelerometer scaled data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to (micro-g's)
* Returns: none


`accel_scale(scale)`
--------------------
__Set accelerometer full-scale__
* Parameters:
	* `scale`: full-scale in g's
* Returns: currently set scale, if `scale` is outside the acceptable range


`accel_set_bias(x, y, z)`
-------------------------
__Write accelerometer calibration offset values__
* Parameters:
	* `x, y, z`: values to offset output data by, per axis
* Returns: none
* __NOTE__: The scale may differ among drivers.
* __NOTE__: Some devices supply registers for storing offsets. For others, the offsets are stored
in the MCU's RAM.


`accel_word2g(accel_word)`
--------------------------
__Convert given accel ADC word to g's__
* Parameters:
	* `accel_word`: accelerometer ADC word
* Returns: rate of acceleration in g's (units of Earth's gravity)


`calibrate_accel()`
-------------------
__Automatically find bias offsets for all sensor axes__
* Parameters: none
* Returns: none
* __NOTE__: Approximately one second of data is gathered, in order to average the samples.


`pitch()`
---------
__Read pitch angle of accelerometer__
* Parameters: none
* Returns: angle in degrees
* __NOTE__: `accel_data_cache()` must be called prior to calling this method, in order to store
a sample in RAM.


`roll()`
--------
__Read roll angle of accelerometer__
* Parameters: none
* Returns: angle in degrees
* __NOTE__: `accel_data_cache()` must be called prior to calling this method, in order to store
a sample in RAM.


## Gyroscopes

| Method             | Description                                       |
| -------------------| --------------------------------------------------|
| `calibrate_gyro()` | Calibrate the gyroscope                           |
| `gyro_bias()`      | Read gyroscope calibration offset values          |
| `gyro_data()`      | Read gyroscope raw data                           |
| `gyro_data_rate()` | Set gyroscope output data rate, in Hz             |
| `gyro_dps()`       | Read gyroscope calibrated data (deg. per second)  |
| `gyro_scale()`     | Set gyroscope full-scale, in degrees per second   |
| `gyro_word2dps()`  | Convert given gyro ADC word to degrees per second |
| `gyro_set_bias()`  | Write gyroscope calibration offset values         |

`calibrate_gyro()`
------------------
__Automatically find bias offsets for all sensor axes__
* Parameters: none
* Returns: none
* __NOTE__: Approximately one second of data is gathered, in order to average the samples.


`gyro_bias(x, y, z)`
--------------------
__Read gyroscope calibration offset values__
* Parameters:
	* `x, y, z`: pointers to variables to read offsets to
* Returns: none


`gyro_data(ptr_x, ptr_y, ptr_z)`
--------------------------------
__Read gyroscope raw data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to
* Returns: none


`gyro_data_rate(rate)`
----------------------
__Set gyroscope output data rate__
* Parameters:
	* `rate`: rate, in Hz
* Returns: currently set rate, if `rate` is outside the acceptable range


`gyro_dps(ptr_x, ptr_y, ptr_z)`
-------------------------------
__Read gyroscope scaled data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to (micro-degrees per second)
* Returns: none


`gyro_scale(scale)`
-------------------
__Set gyroscope full-scale__
* Parameters:
	* `scale`: full-scale in degrees per second
* Returns: currently set scale, if `scale` is outside the acceptable range


`gyro_word2dps(gyro_word)`
--------------------------
__Convert given gyro ADC word to degrees per second__
* Parameters:
	* `gyro_word`: gyroscope ADC word
* Returns: angular rate in degrees per second


`gyro_set_bias(x, y, z)`
------------------------
__Write gyroscope calibration offset values__
* Parameters:
	* `x, y, z`: values to offset output data by, per axis
* Returns: none
* __NOTE__: The scale may differ among drivers.
* __NOTE__: Some devices supply registers for storing offsets. For others, the offsets are stored
in the MCU's RAM.


## Magnetometers

| Method              | Description                                   |
| --------------------| ----------------------------------------------|
| `calibrate_mag()`   | Calibrate the magnetometer                    |
| `mag_bias()`        | Read magnetometer calibration offset values   |
| `mag_data()`        | Read magnetometer raw data                    |
| `mag_data_rate()`   | Set magnetometer output data rate, in Hz      |
| `mag_gauss()`       | Read magnetometer calibrated data (Gauss)     |
| `mag_scale()`       | Set magnetometer full-scale, in Gauss         |
| `mag_tesla()`       | Read magnetometer calibrated data (Teslas)    |
| `magx_word2gauss()` | Convert given mag ADC word to Gauss (X-axis)  |
| `magy_word2gauss()` | Convert given mag ADC word to Gauss (Y-axis)  |
| `magz_word2gauss()` | Convert given mag ADC word to Gauss (Z-axis)  |
| `magx_word2tesla()` | Convert given mag ADC word to Teslas (X-axis) |
| `magy_word2tesla()` | Convert given mag ADC word to Teslas (Y-axis) |
| `magz_word2tesla()` | Convert given mag ADC word to Teslas (Z-axis) |

`calibrate_mag()`
-----------------
__Automatically find bias offsets for all sensor axes (hard iron calibration)__
* Parameters: none
* Returns: none
* __NOTE__: Approximately one second of data is gathered, in order to average the samples.


`mag_bias(x, y, z)`
-------------------
__Read magnetometer calibration offset values__
* Parameters:
	* `x, y, z`: pointers to variables to read offsets to
* Returns: none


`mag_data(ptr_x, ptr_y, ptr_z)`
-------------------------------
__Read magnetometer raw data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to
* Returns: none


`mag_data_rate(rate)`
---------------------
__Set magnetometer output data rate__
* Parameters:
	* `rate`: rate, in Hz
* Returns: currently set rate, if `rate` is outside the acceptable range


`mag_gauss(ptr_x, ptr_y, ptr_z)`
--------------------------------
__Read magnetometer scaled data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to (micro-gauss)
* Returns: none


`mag_scale(scale)`
------------------
__Set magnetometer full-scale__
* Parameters:
	* `scale`: full-scale in Gauss
* Returns: currently set scale, if `scale` is outside the acceptable range


`mag_tesla(ptr_x, ptr_y, ptr_z)`
--------------------------------
__Read magnetometer scaled data__
* Parameters:
	* `ptr_x, ptr_y, ptr_z`: pointers to variables to read data to (teslas)
* Returns: none


`magx_word2gauss(mag_word)`
---------------------------
__Convert given mag ADC word to Gauss (X-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in micro-Gauss


`magy_word2gauss(mag_word)`
---------------------------
__Convert given mag ADC word to Gauss (Y-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in micro-Gauss


`magz_word2gauss(mag_word)`
---------------------------
__Convert given mag ADC word to Gauss (Z-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in micro-Gauss


`magx_word2tesla(mag_word)`
---------------------------
__Convert given mag ADC word to Teslas (X-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in Teslas


`magy_word2tesla(mag_word)`
---------------------------
__Convert given mag ADC word to Teslas (Y-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in Teslas


`magz_word2tesla(mag_word)`
---------------------------
__Convert given mag ADC word to Teslas (Z-axis)__
* Parameters:
	* `mag_word`: magnetometer ADC word
* Returns: magnetic field strength in Teslas



Availability of other methods vary by specific sensor type and model.


## Built-in symbols

```spin
CON

    { I2C-specific }
    SLAVE_WR    = core.SLAVE_ADDR
    SLAVE_RD    = core.SLAVE_ADDR|1
    DEF_ADDR	= 0
    DEF_HZ      = 100_000

    { Capabilities: DoF per sensor }
    ACCEL_DOF   = x
    GYRO_DOF    = x
    MAG_DOF     = x
    BARO_DOF    = x
    DOF         = ACCEL_DOF + GYRO_DOF + MAG_DOF + BARO_DOF

    { Scales and data rates used during calibration process }
    CAL_XL_SCL  = x
    CAL_G_SCL   = x
    CAL_M_SCL   = x
    CAL_XL_DR   = x
    CAL_G_DR    = x
    CAL_M_DR    = x

    { Axis-specific }
    X_AXIS      = 0
    Y_AXIS      = 1
    Z_AXIS      = 2

```

_Note: 'x' indicates device driver-specific values_



## Global variables

```spin
VAR

    { variables to store sensor scaling factors}
    long _ares, _gres, _mres[MAG_DOF]

    { variables to store bias offsets }
    long _abias[ACCEL_DOF], _gbias[GYRO_DOF], _mbias[MAG_DOF]

```



## File Structure

```spin
sensor.type.model.spin2 - driver object
|-- #include: sensor.imu.common.spin2h - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)

```

## Build examples

__Build the LSM9DS1 demo for P2, native code output, using the I2C engine:__
`flexspin -2 -L$HOME/p2-spin-standard-library/library -DLSM9DS1_I2C LSM9DS1-Demo.spin2`

or `flexspin -2 -L$HOME/p2-spin-standard-library/library LSM9DS1-Demo.spin2`

__The same, but using the SPI engine:__
`flexspin -2 -L$HOME/p2-spin-standard-library/library -DLSM9DS1_SPI LSM9DS1-Demo.spin2`

