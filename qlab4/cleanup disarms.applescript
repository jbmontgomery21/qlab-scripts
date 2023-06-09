-- @hotkey ⇧⌃C

set cutListName to "Cut Cues"
set mainListName to "Main Cue List"

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	try
		set cutList to first cue list whose q display name is cutListName
	on error
		return
	end try
	repeat with eachCue in theSelection
		if armed of eachCue is false then
			set q name of eachCue to ("(" & q number of eachCue & ") " & q list name of eachCue)
			set q number of eachCue to ""
			set cueID to uniqueID of eachCue
			set midi trigger of eachCue to disabled
			set hotkey trigger of eachCue to disabled
			set timecode trigger of eachCue to disabled
			set wall clock trigger of eachCue to disabled
			if parent list of eachCue is not cutList then
				move cue id cueID of parent of eachCue to end of cutList
			end if
			
			
		end if
	end repeat
end tell