# The Spin2 Standard Library (spin2)

The Spin2 Standard Library is designed to be a definitive starting point for Spin programming on the Parallax Propeller 2 (P2X8C4M64P). It contains a
curated collection of Spin objects that have been organized and formatted for consistency, covering a wide array of functionality.

## API

In order to reduce the burden of having to learn a new programming interface with each individual object, an ongoing effort is being made to standardize the API for the various device drivers and other objects contained in the library. For example - there may be many different manufacturers of packet radio transceiver chips. They all have their own way of doing things internally, but when it comes down to it, they all send and receive data wirelessly. Why should using each driver be so uniquely different?

Decriptions of the programming interface for the various classes of library can be found in the [API](api) subdirectory.
At the time of this writing, they are:
* [display](api/display.md): Displays, e.g., OLED, LCD, VGA, HDMI
* [memory](api/memory.md): Various memory technologies, e.g.: EEPROM, FRAM, SRAM, Flash
* [signal.adc](api/signal.adc.md): Analog to Digital Converters
* [sensor.imu](api/sensor.imu.md): IMUs and other motion-related sensors, e.g., accelerometers, gyroscopes, magnetometers
* [sensor.power](api/sensor.power.md): Sensors for measuring the flow of electricity, power usage
* [sensor.temp_rh](api/sensor.temp_rh.md): Temperature and humidity sensors
* [wireless.transceiver](api/wireless.transceiver.md): RF Packet radios for sending and receiving data wirelessly

Note that since this is preliminary there may be many methods listed that are specific to a certain driver that aren't present in others. Some devices have additional capability that others don't. These lists will be culled to remove any that aren't common to all or can't be emulated with reasonable effort.

## Intended audience

Who this library is aimed at:
* The programmer with _some_ prior experience: knowledge of basic programming concepts (though not necessarily the SPIN programming language) who doesn't want to spend the bulk of their time searching for and cobbling together possibly incompatible objects and libraries

Who this library is _not_ aimed at:
* Someone who has little or no programming experience - you may find yourself with as many questions as answers
* Veteran/advanced (especially SPIN) programmers - you're looking to squeeze every cycle or byte out of the MCU. Some of the objects herein may be relatively efficient, but it isn't the primary scope. You will probably find something faster or smaller elsewhere. You're probably already writing your own libraries!

As with anything though, your mileage may vary!

## Compiler compatibility

- FastSpin 4.1.10-beta or newer (Supported: for most up-to-date language definitions)
- ~~FastSpin 4.1.9 or older~~ (Not supported: some showstopper bugs in older versions)
- ~~PNut~~                    (Not supported: available only on Windows platform, compiler feature incomplete)

I strongly urge the use of FastSpin over PNut, at least for now. Many objects in the library make use of the preprocessor for better code reusability, which PNut simply doesn't support (yet?). FastSpin is also available in source form, so it can be built natively for nearly any operating system - PNut is currently Windows-only.

Nearly every project in this library is also duplicated as OpenSpin-compatible source in the spin-standard-library for the Propeller 1, which doubles the effort put forth, so please give FastSpin a try before asking for support translating to PNut-compatible source. Thanks for understanding!

## Contributing

Please read the [guidelines](CONTRIBUTING.md) before submitting a pull request.

## Testing

You can compile every file in the project with the following script.

    ./test.sh

## License

This project is licensed under the [MIT license](LICENSE).

*Please note this library isn't officialy sanctioned by Parallax, Inc - it is a fork of the original spin-standard-library and has been ported to the P2X8C4M64P/Propeller 2.*
