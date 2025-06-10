
tell application id "com.figure53.QLab.5" to tell front workspace
	set userNote to 0
	set userVel to 127
	set userInc to 5
	set MIDItype to "control_change"
	--or "note_on, note_off, or program_change"
	
	repeat with eachCue in (selected as list)
		
		set s to q name of eachCue
		if s contains ")" then
			set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
			set q name of eachCue to newName
		end if
		if MIDIchoice is "Control Change" then
			set q name of eachCue to "(cc" & startNote & "." & startVel & ") " & (q name of eachCue)
			set midi command of eachCue to control_change
			set midi byte one of eachCue to startNote
			set midi byte two of eachCue to startVel
			set midi trigger of eachCue to enabled
		else if MIDIchoice is "Note-On" then
			set q name of eachCue to "(" & startNote & "." & startVel & ") " & (q name of eachCue)
			set midi command of eachCue to note_on
			set midi byte one of eachCue to startNote
			set midi byte two of eachCue to startVel
			set midi trigger of eachCue to enabled
		else if MIDIchoice is "Note-Off" then
			set q name of eachCue to "(" & startNote & "." & startVel & ") " & (q name of eachCue)
			set midi command of eachCue to note_off
			set midi byte one of eachCue to startNote
			set midi byte two of eachCue to startVel
			set midi trigger of eachCue to enabled
		else if MIDIchoice is "Program Change" then
			set q name of eachCue to "(PC" & startNote & ") " & (q name of eachCue)
			set midi command of eachCue to program_change
			set midi byte one of eachCue to startNote
			set midi trigger of eachCue to enabled
		end if
		
		if MIDIchoice is not "Program Change" then
			set startVel to startVel + startInc
			if startVel is greater than 127 then
				set startVel to startVel - 128
				set startNote to startNote + 1
			end if
			
			if startNote is greater than 127 then
				set startNote to 0
			end if
		else
			set startNote to startNote + startInc
			if startNote is greater than 127 then
				set startNote to startNote - 128
			end if
		end if
		
	end repeat
end tell