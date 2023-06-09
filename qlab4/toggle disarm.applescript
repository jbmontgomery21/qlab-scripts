-- @hotkey ⌃⌥D
tell application id "com.figure53.QLab.4" to tell front workspace
	set selectedCues to (selected as list)
	if (count selectedCues) is 0 then -- If no cues are selected arm/disarm the current cue list
		set armed of current cue list to not armed of current cue list
	else
		repeat with eachCue in reverse of selectedCues -- Reversed so as to do a Group Cue's children before it
			set armed of eachCue to not armed of eachCue
		end repeat
	end if
end tell