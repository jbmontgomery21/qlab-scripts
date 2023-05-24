tell application id "com.figure53.QLab.4" to tell front workspace
	set theResponse to display dialog "Prepend cue #s with?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	repeat with eachCue in (selected as list)
		set theNum to q number of eachCue
		set q number of eachCue to theNum & text returned of theResponse
	end repeat
end tell