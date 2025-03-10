tell application id "com.figure53.QLab.5" to tell front workspace
	display dialog "Are you sure you want to add GoTos to the selection?" buttons {"Cancel", "Continue"} default button "Continue" cancel button "Cancel"
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is "Group" and q type of (parent of eachCue) is "Cue List" and (q number of eachCue is not "") then
			set selected to eachCue
			make type "GoTo"
			set theGoTo to last item of (selected as list)
			moveSelectionDown
			set theTarget to last item of (selected as list)
			if theTarget is theGoTo then
				delete cue id (uniqueID of theGoTo) of parent of theGoTo
			else
				set cue target of theGoTo to theTarget
				move cue id (uniqueID of theGoTo) of parent of theGoTo to beginning of eachCue
			end if
		end if
		set selected to eachCue
	end repeat
end tell