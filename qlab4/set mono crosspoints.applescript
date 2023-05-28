-- @hotkey ⌥M
set maxOutputs to 24

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set i to 0
		repeat while i < maxOutputs
			try
				eachCue setLevel row 1 column i db 0
			end try
			set i to i + 1
		end repeat
	end repeat
end tell