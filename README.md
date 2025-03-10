# qlab-scripts
Scripts created and collected by Jacob Montgomery (jacobmontgomerysound@gmail.com) for improved workflows in QLab 4 and 5

Not all of these scripts are mine, attribution is given at the top of the script file if not

Feel free to use for your projects, and let me know if you have any suggestions or find any bugs

NOTE: support for QLab 4 is mostly deprecated. Most of it should still work but not many new scripts will be ported backwards.

## (de)script(ion)s

### add gotos.applescript
-default hotkey ⇧⌃⌥G

-adds goto cues to every group selected that will advance to next group

-useful for a show where cues are triggered by midi/osc and the playhead doesn't follow

### add LX trigger.applescript
-default hotkey ^L

-ask user for LX cue number and sets q name and number to match. sets color to the color of this script cue

-default format: (###) [cue name]

-scans for first ")" to strip out in case this has already been used. Beware if parenthesis are part of your naming convention

### add MIDI values to name.applescript
-default hotkey ^N

-will take the midi trigger values currently set and add them to the name of the cue

-default format: (#note.#velocity) [cue name]

-scans for first ")" to strip out in case this has already been used. Beware if parenthesis are part of your naming convention

### add timecode trigger.applescript
-default hotkey ^T

-ask user for timecode hours, minutes, seconds, and frames set it as timecode trigger point. sets color to the color of this script cue

-default format: (hh:mm:ss:ff) [cue name]

-scans for first ")" to strip out in case this has already been used. Beware if parenthesis are part of your naming convention

### append number.applescript
-default hotkey ⇧A

-will add a string to the start of every selected cue

-useful for ex. putting an "x" in front of every cue that was cut, or "v" in front of every cue triggered by video

### cleanup disarms.applescript
-default hotkey ^⇧C

-will move all cues in selection that are currently disarmed to a user-specified "cut cues" list and remove all cue numbers and triggers

-default cue list: "cut cues"

### color picker.applescript
-default hotkey ⇧C

-will bring up a menu with all color options and apply it to the selected cue

### create fade down.applescript
-default hotkey ^D

-will create a fade in for the currently selected cue

-default name format (#cue_name rf/d)

-default duration 5

-default level adjustment -10dB on main fader

### create fade in.applescript
-default hotkey ^F

-will create a fade in for the currently selected cue, copying the current level and setting the initial level to -inf

-default name format (#cue_name f/i)

-default duration 5

### create fade out.applescript
-default hotkey ^G

-will create a fade and stop for the currently selected cue

-default name format (#cue_name f/o)

-default duration 5

### create fade up.applescript
-default hotkey ^H

-will create a fade up for the currently selected cue

-default name format (#cue_name rf/u)

-default duration 5

-default level adjustment +10dB on main fader

### level bump.applescript
-default hotkey ⇧2

-will change the main fader of the current cue by +2dB

### level cut.applescript
-default hotkey ⇧1

-will change the main fader of the current cue by -1dB

### make galaxy test.applescript
-no default hotkey

-will create a series of network cues that target certain network patches, intended to easily create a pre-show check-out sequence

-can set the first patch number, last patch number, and amount of time to wait before the next output goes

-default first patch 1

-default last patch 2

-default wait time 5

### make galileo test.applescript
-no default hotkey

-will create a series of network cues that target certain network patches, intended to easily create a pre-show check-out sequence

-can set the first patch number, last patch number, and amount of time to wait before the next output goes

-default first patch 3

-default last patch 3

-default wait time 5

### make Yamaha cue.applescript
-default hotkey ^Y

-makes a MIDI cue to recall a scene on Yamaha consoles

-can set a prefix to the cue number and name, as well as a color for each cue

-long number style forces all cue numbers to be 3 digits (not including prefix)

-default cue number prefix *

-default cue name prefix "Yamaha Scene "

-default user color purple

-default long numbers style on

### move to cut list.applescript
-default hotkey ^C

-moves the selected cue to a specified cue list, disabling all triggers and disarming the cue

-also removes cue numbers and places them in the cue name if applicable
-default cue list name "Cut Cues"

### override disable.applescript
-default hotkey ⇧⌃O

-disables all show control inputs AND outputs (MIDI, Network, Timecode)

### override enable.applescript
-default hotkey ⇧⌃⌥O

-enables all show control inputs AND outputs (MIDI, Network, Timecode)

### override toggle.applescript
-default hotkey ⇧O

-toggles all show control inputs AND outputs (MIDI, Network, Timecode)

### set mono crosspoints.applescript
-default hotkey ⌥M

-sets the crosspoints of the selected cues to 0 for all outputs for the first row (in case the template has different crosspoints for stereo files)

-default max outputs: 24 

### set MIDI values.applescript
-default hotkey ^M

-related to "add midi values to name"

-prompts user for MIDI note and velocity

-sets trigger for the cue to the given values

-adds MIDI information to name

-default format: (#note.#velocity) [cue name]

### toggle disarm.applescript
-default hotkey ⌃⌥D

-toggles the "armed" status of the selected cue

### whoami chooser
-no default hotkey

-looks for a text file on the desktop named "whoami.txt" and scans contens for either "main" or "backup"

-sets overrides accordingly. looks for a cue with # "status" to change the name of reflecting current status (main/backup, muted/unmuted)

-credit to the QLab Cookbook - more details available here https://qlab.app/cookbook/main-or-backup/

### whoami switcher
-no default hotkey

-used in confunction with the above script to switch the overrides of the main and backup workspace

-sets overrides accordingly. looks for a cue with # "status" to change the name of reflecting current status (main/backup, muted/unmuted)

-credit to the QLab Cookbook - more details available here https://qlab.app/cookbook/main-or-backup/


