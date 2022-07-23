# sensor.imu
------------

API for IMU, accelerometer, gyroscope, and magnetometer device drivers

Object filename description:

`sensor.type.ndof.model.spin`

_type_ is one of: imu, accel, gyroscope, magnetometer
(_imu_ indicates a chip that incorporates two or more of the others)

_ndof_ indicates the number of axes, or Degrees-of-Freedom the sensor supports
(e.g., 3dof == 3-axis)

_model_ indicates the manufacturer's model/part number of the sensor (e.g., lsm9ds1)

## Base Methods

These are methods that are common to _all_ IMU drivers

| Method          | Description                                      | Param     | Returns        |
| --------------- | ------------------------------------------------ | --------- | -------------- |
| `Startx()`      | Start driver using explicitly defined settings   | Notes 1-3 | cog id+1       |
| `Stop()`        | Stop the driver                                  | n/a       | n/a            |
| `Defaults()`    | Set sensor factory default settings              | n/a       | n/a            |

Notes:

1. For SPI-connected sensors:
	* `Startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_FREQ): status`
	* Some devices contain more than one slave device internally, and so may break the above
convention, because of the need for additional CS and/or MOSI/MISO pins.
	* SPI_FREQ defaults to 1MHz, if unspecified.
	* The preprocessor symbol `MODEL_SPI` __must__ be defined when building, to use.
	* Replace `MODEL` with the sensor model #. Example: `LSM9DS1_SPI`
	* For SPI-connected sensors: 4-wire SPI is used by default. If supported by the device,
3-wire SPI can be chosen by setting `MOSI_PIN` and `MISO_PIN` to the same I/O pin.
The `Startx()` method will check for this and set the device's 3-wire SPI mode register.

2. For I2C-connected sensors:
	* `Startx(SCL_PIN, SDA_PIN, I2C_FREQ, ADDR_BITS): status`
	* If no particular interface preprocessor symbol is defined when building, the driver will
default to the PASM-based I2C engine.
	* Not all devices support alternate I2C addresses.

3. For all variants: There may be a `RST_PIN` parameter, for specifying an optional reset pin
(device-dependent). The pin is only validated in the `Reset()` method, and is ignored if set
outside the allowable range.

4. `Startx()` returns the launched cog number+1 of com engine used on success.

5. `Startx()` returns `FALSE` (0) if the driver fails to start, for these possible reasons:
	* No more cogs available
	* One or more specified I/O pins are outside allowed range
	* Bus frequency is outside allowed range
	* If supported by the device, `DeviceID()` didn't return the expected value

6. `Defaults()` may simply call `Reset()`, if sensible, as opposed to calling several other driver
methods, in order to reduce memory usage.

7. Most (but not all) drivers also provide the following methods:
| Method          | Description                                      | Param    | Returns         |
| --------------- | ------------------------------------------------ | -------- | --------------- |
| `DeviceID()`    | Read model-unique identification register        | n/a      | model/dev ID    |
| `Reset()`       | Perform a hard or soft-reset of the device       | n/a      | n/a             |

8. Drivers may have one or more `Preset_()` methods, that establish a set of pre-set settings.

9. `Stop()` performs the following tasks:
	* Stop any extra cogs that were started (if applicable)
	* Clear all global variable space used to 0


## Accelerometers

| Method                                  | Description                                                        |
| --------------------------------------- | ------------------------------------------------------------------ |
| `AccelBias(bias_x, bias_y, bias_z, rw)` | Read or write/manually set accelerometer calibration offset values |
| `AccelData(ptr_x, ptr_y, ptr_z)`        | Read accelerometer raw data                                        |
| `AccelDataRate(rate)`                   | Set Accelerometer output data rate, in Hz                          |
| `AccelG(ptr_x, ptr_y, ptr_z)`           | Read accelerometer calibrated data (g's)                           |
| `AccelScale(scale)`                     | Set accelerometer full-scale, in g's                               |
| `AccelWord2G(accel_word)`               | Convert given accel ADC word to g's                                |
| `CalibrateAccel()`                      | Calibrate the accelerometer                                        |
| `Pitch()`                               | Read pitch angle of accelerometer, in degrees                      |
| `Roll()`                                | Read roll angle of accelerometer, in degrees                       |


## Gyroscopes

| Method                                 | Description                                                    |
| -------------------------------------- | -------------------------------------------------------------- |
| `CalibrateGyro()`                      | Calibrate the gyroscope                                        |
| `GyroBias(bias_x, bias_y, bias_z, rw)` | Read or write/manually set gyroscope calibration offset values |
| `GyroData(ptr_x, ptr_y, ptr_z)`        | Read gyroscope raw data                                        |
| `GyroDataRate(rate)`                   | Set Gyroscope output data rate, in Hz                          |
| `GyroDPS(ptr_x, ptr_y, ptr_z)`         | Read gyroscope calibrated data (deg. per second)               |
| `GyroScale(scale)`                     | Set gyroscope full-scale, in degrees per second                |
| `GyroWord2DPS(gyro_word)`              | Convert given gyro ADC word to degrees per second              |


## Magnetometers

| Method                                | Description                                                       |
| ------------------------------------- | ----------------------------------------------------------------- |
| `CalibrateMag()`                      | Calibrate the magnetometer                                        |
| `MagBias(bias_x, bias_y, bias_z, rw)` | Read or write/manually set magnetometer calibration offset values |
| `MagData(ptr_x, ptr_y, ptr_z)`        | Read magnetometer raw data                                        |
| `MagDataRate(rate)`                   | Set magnetometer output data rate, in Hz                          |
| `MagGauss(ptr_x, ptr_y, ptr_z)`       | Read magnetometer calibrated data (Gauss)                         |
| `MagScale(scale)`                     | Set magnetometer full-scale, in Gauss                             |
| `MagTesla(ptr_x, ptr_y, ptr_z)`       | Read magnetometer calibrated data (Teslas)                        |
| `MagXWord2Gauss(mag_word)`            | Convert given mag ADC word to Gauss (X-axis)                      |
| `MagYWord2Gauss(mag_word)`            | Convert given mag ADC word to Gauss (Y-axis)                      |
| `MagZWord2Gauss(mag_word)`            | Convert given mag ADC word to Gauss (Z-axis)                      |
| `MagXWord2Tesla(mag_word)`            | Convert given mag ADC word to Teslas (X-axis)                     |
| `MagYWord2Tesla(mag_word)`            | Convert given mag ADC word to Teslas (Y-axis)                     |
| `MagZWord2Tesla(mag_word)`            | Convert given mag ADC word to Teslas (Z-axis)                     |



Other methods vary by specific sensor type and model.


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

    { Bias adjustment methods: read or write }
    R           = 0
    W           = 1

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

Build the LSM9DS1 demo for P2, native code output, using the I2C engine:
`flexspin -2 -L$HOME/p2-spin-standard-library/library -DLSM9DS1_I2C LSM9DS1-Demo.spin2`

or `flexspin -2 -L$HOME/p2-spin-standard-library/library LSM9DS1-Demo.spin2`

The same, but using the SPI engine:
`flexspin -2 -L$HOME/p2-spin-standard-library/library -DLSM9DS1_SPI LSM9DS1-Demo.spin2`

