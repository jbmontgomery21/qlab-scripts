set userBump to 2
tell application id "com.figure53.QLab.5" to tell front workspace
	
	repeat with eachCue in (selected of front workspace as list)
		try
			set currentLevel to eachCue getLevel row 0 column 0
			eachCue setLevel row 0 column 0 db (currentLevel + userBump)
		end try
	end repeat
end tell
