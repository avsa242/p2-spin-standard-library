# sensor.imu
------------

API for IMU, accelerometer, gyroscope, and magnetometer device drivers

## Methods

| Method                                                | Description                                         |
| ------------------------------------------------------|---------------------------------------------------- |
|`AccelADCRes(bits)`                                    | Set accelerometer ADC resolution                    |
|`AccelAxisEnabled(x, y, z)`                            | Enable accelerometer axis per bit mask              |
|`AccelData(ptr_x, ptr_y, ptr_z)`                       | Read accelerometer raw data                         |
|`AccelDataOverrun`                                     | Flag indicating accelerometer data overrun          |
|`AccelDataRate(Hz)`                                    | Set Accelerometer output data rate, in Hz           |
|`AccelDataReady`                                       | Flag indicating new accelerometer data available    |
|`AccelG(ptr_x, ptr_y, ptr_z)`                          | Read accelerometer calibrated data (g's)            |
|`AccelInt`                                             | Flag indicating accelerometer interrupt asserted    |
|`AccelScale(g)`                                        | Set full-scale range of accelerometer               |
|`DeviceID`                                             | Returns part identification read from device        |
|`FIFOEnabled(enabled)`                                 | Enable sensor data FIFO                             |
|`FIFOUnreadSamples`                                    | Number of unread samples stored in FIFO             |
|`GyroAxisEnabled(x, y, z)`                             | Enable gyro axis per bit mask                       |
|`GyroData(ptr_x, ptr_y, ptr_z)`                        | Read gyroscope raw data                             |
|`GyroDataOverrun`                                      | Flag indicating gyroscope data overrun              |
|`GyroDataRate(Hz)`                                     | Set Gyroscope output data rate, in Hz               |
|`GyroDataReady`                                        | Flag indicating new gyro data available             |
|`GyroDPS(ptr_x, ptr_y, ptr_z)`                         | Read gyroscope calibrated data (deg. per second)    |
|`GyroInt`                                              | Flag indicating gyroscope interrupt asserted        |
|`GyroOpMode(mode)`                                     | Set gyroscope operating mode                        |
|`GyroScale(dps)`                                       | Set gyroscope full-scale                            |
|`MagADCRes(bits)`                                      | Set magnetometer ADC resolution                     |
|`MagAxisEnabled(xyz)`                                  | Enable magnetomer axis per bitmask                  |
|`MagData(ptr_x, ptr_y, ptr_z)`                         | Read magnetometer raw data                          |
|`MagDataOverrun`                                       | Flag indicating magnetometer data overrun           |
|`MagDataRate(Hz)`                                      | Set magnetometer output data rate, in Hz            |
|`MagDataReady`                                         | Flag indicating new magnetometer data available     |
|`MagGauss(ptr_x, ptr_y, ptr_z)`                        | Read magnetometer calibrated data (Gauss)           |
|`MagInt`                                               | Flag indicating magnetometer interrupt asserted     |
|`MagIntLevel(active_state)`                            | Set magnetometer interrupt active state/level       |
|`MagOpMode(mode)`                                      | Set magnetometer operation mode                     |
|`MagScale(Gs)`                                         | Set magnetometer full-scale                         |
|`MeasureMag`                                           | Trigger a single magnetometer measurement           |
|`TempDataReady`                                        | Flag indicating new temperature data available      |
|`Temperature`                                          | Read the on-chip temperature sensor                 |
|`Start(CS_PIN, SCK_PIN, MISO_PIN, MOSI_PIN, SCK_FREQ)`	| Start driver (SPI, spin2)                           |
|`Start(CS_PIN, SCK_PIN, MISO_PIN, MOSI_PIN)`           | Start driver (SPI, spin1)                           |
|`Start(I2C_SCL, I2C_SDA, I2C_HZ, slave_bit)`           | Start driver (I2C)                                  |
|`TempDataReady`                                        | Flag indicating new temperature data available      |
|`Temperature`                                          | Read the on-chip temperature sensor                 |
|`XLGDataReady`	                                        | Flag indicating new accel/gyro data available       | 
|`XLGIntLevel(active_state)`                            | Set interrupt active state/level used by accel/gyro |

