-- tell the script where to look for your text file
-- this example uses the Desktop for the current user
set newFile to ((POSIX path of (path to home folder)) & "Desktop/whoami.txt")
set theFileContents to paragraphs of (read newFile)

-- define a variable, computerType, that will be filled in by the next block of code
set computerType to ""

-- check the text file for the word 'Main' or the word 'Backup', and fill in the appropriate value for computerType
repeat with p in theFileContents
	if p contains "Backup" then
		set computerType to "Backup"
	else if p contains "Main" then
		set computerType to "Main"
	end if
end repeat

-- set up the mac as main or backup depending on the contents of computerType
tell application id "com.figure53.QLab.5" to tell front workspace
	
	if computerType is "Main" then --set this mac as the main computer
		
		-- set the overrides
		tell application id "com.figure53.QLab.5"
			set midi output enabled of overrides to true
			set msc output enabled of overrides to true
			set sysex output enabled of overrides to true
			set network external output enabled of overrides to true
			set network local output enabled of overrides to true
			set timecode output enabled of overrides to true
			set dmx output enabled of overrides to true
		end tell
		
		-- set up the "switch" cue appropriately
		set script source of cue "switch" to "tell application id \"com.figure53.QLab.5\"
			set midi output enabled of overrides to false
			set msc output enabled of overrides to false
			set sysex output enabled of overrides to false
			set network external output enabled of overrides to false
			set network local output enabled of overrides to false
			set timecode output enabled of overrides to false
			set dmx output enabled of overrides to false
			set q name of cue \"status\" of front workspace to \"Main Ð MUTED\"
			set q color of cue \"status\" of front workspace to \"red\"
		end tell"
		
		-- report back to the user
		set q name of cue "status" to "Main Ð Active"
		set q color of cue "status" to "green"
		display dialog "I'm the Main" buttons {"OK"} default button 1
		
	else if computerType is "Backup" then
		
		-- set the overrides
		tell application id "com.figure53.QLab.5"
			set midi output enabled of overrides to false
			set msc output enabled of overrides to false
			set sysex output enabled of overrides to false
			set network external output enabled of overrides to false
			set network local output enabled of overrides to false
			set timecode output enabled of overrides to false
			set dmx output enabled of overrides to false
		end tell
		
		-- set up the "switch" cue appropriately
		set script source of cue "switch" to "tell application id \"com.figure53.QLab.5\"
				set midi output enabled of overrides to true
				set msc output enabled of overrides to true
				set sysex output enabled of overrides to true
				set network external output enabled of overrides to true
				set network local output enabled of overrides to true
				set timecode output enabled of overrides to true
				set dmx output enabled of overrides to true
			set q name of cue \"status\" of front workspace to \"Backup Ð ACTIVE\"
			set q color of cue \"status\" of front workspace to \"blue\"
		end tell"
		
		-- report back to the user
		set q name of cue "status" to "Backup Ð Muted"
		set q color of cue "status" to "orange"
		display dialog "I'm the Backup" buttons {"OK"} default button 1
		
	end if
end tell