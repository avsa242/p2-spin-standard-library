# sensor.imu
------------

API for IMU, accelerometer, gyroscope, and magnetometer device drivers

Object filename description:

`sensor.type.ndof.model.spin`

_type_ is one of: imu, accel, gyroscope, magnetometer (_imu_ indicates a chip that incorporates two or more of the others)

_ndof_ indicates the number of axes, or Degrees-of-Freedom the sensor supports (e.g., 3dof == 3-axis)

_model_ indicates the manufacturer's model/part number of the sensor (e.g., lsm9ds1)

## Base Methods

These are methods that are common to _all_ IMU drivers

| Method                                                | Description                                                                                        |
| ----------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| `Startx(CS_PIN, SCK_PIN, MOSI_PIN, MISO_PIN, SPI_HZ)` | Start driver (SPI) using explicitly defined settings (_see note 1_)                                |
| `Startx(I2C_SCL, I2C_SDA, I2C_HZ, ADDR_BITS)`         | Start driver (I2C) using explicitly defined settings (_see note 1_)                                |
| `Preset_Active()`                                     | Configure the sensor using the minimum amount of settings needed to enable sensor data acquisition |
| `Defaults()`                                          | Start the driver using factory default settings                                                    |
| `DeviceID()`                                          | Returns part identification read from the device                                                   |
| `Stop()`                                              | Stop the driver                                                                                    |


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
    long _abiasraw[ACCEL_DOF], _gbiasraw[GYRO_DOF], _mbiasraw[MAG_DOF]

```



## File Structure

```spin
sensor.type.model.spin2 - driver object
|-- #include: sensor.imu.common.spin2h - provides standard API
|-- OBJ: HW-specific constants (core.con.model.spin)
|-- OBJ: Low-level communications engine (I2C, SPI, OneWire, etc)

```
