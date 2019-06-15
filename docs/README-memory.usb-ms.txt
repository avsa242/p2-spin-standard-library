Full speed USBHost with Bulk-Only Mass Storage (BOMS) driver v0.03.
garryj 01/2019
-----------------------
Propeller 2 ES Evaluation Board (64000-ES).
IMPORTANT: you must use PNut_v32j.exe or the latest P2asm compilers. Earlier
version had symbol limits that USBMS.spin2 breaks.

Serial terminal default is 2MBaud. The serial_init subroutine is the place to
go if you want to set a different baud rate.

The dterm_type register may be set to one of: TERM_DUMB (default), TERM_PST or
TERM_VT100.

Default USB smart pins: D- = 26, D+ = 27, but may be set to any free even/odd
adjacent pin pair. Termination resistors (typically 22-30 ohm) may be required
on the D-/D+ lines. The P2-ES smartpins will provide the appropriate pull-up or
pull-down resistors depending on the USB mode desired (host or device).

USB power connections require 5V, 100mA (minimnum). It is recommended that the
P2-ES board be powered using the auxiliary P2-USB connection with a 5V DC 2A
power supply. If it is powered only from the PC-USB connection, it is possible
that a USB device may draw enough initial current when connected to trip the
P2-ES brown-out protection circuit if the BOD switch on the Mode Selection
Switch Bank is in the (recommended) ON position.

When the program is loaded, it will search for a free even/odd cog pair. The
even cogID is a minimal USB low/full speed host/root hub implementation, capable
of basic device enumeration, address assignment and configuration.

The odd cogID is a Bulk-Only Mass Storage class driver which should recognize
and configure "thumb drive" type storage devices that comply with the SCSI SBC-2
or higher command set. If the device enumerates successfully, the MBR will be
searched for a FAT16 or FAT32 formatted partition. At this time, only the first
active FAT16/32 volume found will be mounted and assigned an ID of "A".

If a storage device is not yet mounted, you will be presented with the "#:\>"
prompt and the following commands are available:
  CLS - clears the screen if your terminal supports VT100/ANSI or PST via the
    TERM_VT00 or TERM_PST register setting mentioned above.
  TGLDBG - toggles verbose debug output to the terminal on/off.
  MONITOR - invoke the P2 monitor-in-ROM. Type "Q" to exit.

The "A:\>" prompt includes the above commands, plus:
  CAT or TYPE - output file content to the console. The * and ? wildcards are
    supported, but only one filename parameter is supported at this time.
  CD - change the working directory. Currently, path parsing is very simplistic.
    You can only open directories that are listed in the current directory, and
    you must back-track using "CD ..". To change from any directory to the root
    directory, you can use "CD \" or "CD A:\".
  DIR - output a "full" listing of the current directory. At this time only one
    filename/wildcard parameter is supported.
  DIRW - output a "wide" listing of the current directory. At this time a
    console width of at least 80 characters is assumed. Name filter restrictions
    are the same as DIR.
  SCANFAT - Scans the first FAT region and computes the count of free sectors.
    It behaves the same as the FAT32 FSInfo check that is described in the NOTES
    section below.
  GETSEC start_secnum [sec_count] - read one or more media sectors with output to
    the terminal. Currently it uses the P2 monitor routine to format the output.
  TEST - Any kind of code snippet you want. Currently it simply issues a SCSI
    "REQUEST SENSE" command that queries the current media state.

NOTES:
 - The "\" or "/" characters may be used as the path separator, and all commands
   and parameters are case-insensitive.
 - At this time, all media access operations, with one exception, are read-only.
   If a FAT32 file system is recognized in the mount phase and the FSInfo
   structure member that stores the count of free clusters is either set to
   "unknown" ($FFFFFFFF), or is greater than the volume's total data cluster
   count, the first FAT region will be scanned to get an accurate count of free
   clusters and the FSInfo sector will be updated with the newly computed value.

Notepad++ stuff
------------------
P2Dark.xml:
If you're a fan of the Visual Studio "Dark" theme, this is a similar color theme
designed to work with the P2v12PasmDark.xml user-defined language file described
below. Copy the P2Dark.xml file to your "%APPDATA%\Roaming\Notepad++\themes"
directory before importing the language file. When Notepad++ is restarted, the
"P2Dark" theme should appear in the "Settings->Style Configurator..." dialog
"Select theme:" drop-down list.

P2v32jPasmDark.xml:
My attempt at a Notepad++ user-defined language file to add syntax highlighting
for P2 assembly mnemonics and other keywords. It also uses the Notepad++
"comment folding" feature in the language definition to allow code folding and
region folding.

To install the language, select the "Language->Define your language..." dialog
and import the P2v32PasmDark.xml file. You will need to restart Notepad++
and select the "P2ASM" language for syntax highlighting of .spin and .spin2
files.

npes_saved.txt:
If you have the Notepad++ "NppExec" plugin installed and use Dave Hein's "p2asm"
assembler and/or "p2load" utility, there are several NppExec scripts for
compiling P2 source code and loading .bin files. Any scripts that may interest
you can be copied and pasted to your npes_saved.txt file in the
%appdata%\Notepad++\plugins\config folder.
