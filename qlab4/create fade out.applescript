set userDuration to 5
set customName to false
tell application id "com.figure53.QLab.4" to tell front workspace
	set originalCue to last item of (selected as list)
	-- display dialog q display name of originalCue as text
	set originalCueType to q type of originalCue
	if originalCueType is in {"Group", "Audio", "Video"} then
		make type "Fade"
		set newCue to last item of (selected as list)
		set cue target of newCue to originalCue
		set duration of newCue to userDuration
		newCue setLevel row 0 column 0 db -120
		if originalCueType is not "Video" then
			set stop target when done of newCue to true
		end if
		if customName then
			set q name of newCue to "(" & q display name of originalCue & " f/o)"
		end if
	else if originalCueType is "Fade" then
		set originalCueTarget to cue target of originalCue
		make type "Fade"
		set newCue to last item of (selected as list)
		set cue target of newCue to originalCueTarget
		set duration of newCue to userDuration
		newCue setLevel row 0 column 0 db -120
		if q type of originalCueTarget is not "Video" then
			set stop target when done of newCue to true
		end if
		if customName then
			set q name of newCue to "(" & q name of originalCueTarget & " f/o)"
		end if
	end if
end tell