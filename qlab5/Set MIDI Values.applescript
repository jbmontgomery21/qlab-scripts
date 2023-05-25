-- @hotkey ^M
tell application id "com.figure53.QLab.5" to tell front workspace
	
	set userMIDINote to display dialog "MIDI Note?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theNote to text returned of userMIDINote
	set userMIDIVel to display dialog "MIDI Velocity?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theVel to text returned of userMIDIVel
	
	set thisCue to last item of (selected as list)
	
	set s to q name of thisCue
	if s contains ")" then
		set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
		set q name of thisCue to newName
	end if
	
	set q name of thisCue to "(" & theNote & "." & theVel & ") " & (q name of thisCue)
	set midi byte one of thisCue to theNote
	set midi byte two of thisCue to theVel
	set midi trigger of thisCue to enabled
	
end tell