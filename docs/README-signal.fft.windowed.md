# Prop2_FFT
FFT library for Propeller2 microcontroller

See the description in each version of the library, currently
  libraries/fft_and_window.spin2   <<<<<< the FFT library itself.

The software is currently under testing and development, not stable or released.

My test harnesses for spectral analysis is included to enable more interesting testing:

VGA 1280x768 support:
  libraries/font.spin2
  libraries/sa_vga_1280x768x2.spin2

oscilloscope output (via a DAC pin)
  libraries/sa_scope_output.spin2

DAC test signal generation, very much a hacked around mess, generates some test tones.
  libraries/sig_gen.spin2

Acquisition:  (these share a common interface)
  libraries/sa_acquire.spin2       - use Smartpin ADC to acquire samples
  libraries/sa_acquire_calib.spin2 - generate 5 test tones using cordic to full fixpoint precision, 30.1 dB steps
  libraries/sa_acquire_ads8885.spin2 - SPI cog talking to an 18bit ADS8885 at upto about 300kSPS

spectrum_analyzer.spin2  - top level driver for all of this and the FFT library to display live and
  averaged power spectra

peak_finder.spin2 - top level driver outputing peak table to serial, just uses smartpin ADC acquisition
  and the sig_gen utility, stripped down from spectrum_analyzer.spin2, only needs couple of smartpins
  and serial out.
