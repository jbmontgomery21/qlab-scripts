-- @hotkey ^D
set userDuration to 5
set customName to true

tell application id "com.figure53.QLab.5" to tell front workspace
	set originalCue to last item of (selected as list)
	set originalCueType to q type of originalCue
	if originalCueType is in {"Group", "Audio", "Video"} then
		make type "Fade"
		set newCue to last item of (selected as list)
		set duration of newCue to userDuration
		set fade mode of newCue to relative
		newCue setLevel row 0 column 0 db -10
		set cue target of newCue to originalCue
		if customName then
			set q name of newCue to "(" & q name of originalCue & " rf/d)"
		end if
	else if originalCueType is "Fade" then
		set originalCueTarget to cue target of originalCue
		make type "Fade"
		set newCue to last item of (selected as list)
		set duration of newCue to userDuration
		newCue setLevel row 0 column 0 db -10
		set fade mode of newCue to relative
		set cue target of newCue to originalCueTarget
		if customName then
			set q name of newCue to "(" & q name of originalCueTarget & " rf/d)"
		end if
	end if
end tell