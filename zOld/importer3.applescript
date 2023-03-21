-- import files
set scriptFiles to choose file with prompt "Please select the scripts to import" of type {"public.text"} with multiple selections allowed

-- loop for each file
repeat with eachScript in scriptFiles
	set eachScriptContents to paragraphs of (read eachScript)
	set scriptContents to ""
	
	repeat with eachLine in eachScriptContents
		-- look for tags
		if eachLine contains "@qname" then
			set eachScriptDescription to trimLine(eachLine, "-- @qname ", 0)
			log "Description: " & eachScriptDescription
		else if eachLine contains "@hotkey" then
			set eachScriptHotkey to trimLine(eachLine, "-- @hotkey ", 0)
			log "Hotkey: " & eachScriptHotkey
		end if
		
		-- import text
		if eachLine does not contain "-- @" then
			set scriptContents to scriptContents & "
			" & eachLine
		end if
		set scriptContents to my trimLine(scriptContents, "
", 0)
	end repeat
	
	tell application id "com.figure53.qlab.4" to tell front workspace
		make type "Script"
		set thisScript to last item of (selected as list)
		
		-- set name of cue
		try
			set q name of thisScript to eachScriptDescription
		on error
			tell application "System Events"
				set cueName to name of eachScript
				set cueName to my trimLine(cueName, ".applescript", 1)
			end tell
			set q name of thisScript to cueName
		end try
		
		-- set number of cue to future hotkey
		try
			set q number of thisScript to eachScriptHotkey
		end try
		
		try
			set hotkey of thisScript to enabled
		end try
		
		-- set script commands
		repeat with eachLine in scriptContents
			set script source of thisScript to scriptContents
		end repeat
		
	end tell
end repeat


on trimLine(theText, trimChars, trimIndicator)
	-- trimIndicator options:
	-- 0 = beginning
	-- 1 = end
	-- 2 = both
	
	set x to the length of the trimChars
	
	
	---- Trim beginning
	
	if the trimIndicator is in {0, 2} then
		repeat while theText begins with the trimChars
			try
				set theText to characters (x + 1) thru -1 of theText as string
			on error
				-- if the text contains nothing but the trim characters
				return ""
			end try
		end repeat
	end if
	
	
	---- Trim ending
	
	if the trimIndicator is in {1, 2} then
		repeat while theText ends with the trimChars
			try
				set theText to characters 1 thru -(x + 1) of theText as string
			on error
				-- if the text contains nothing but the trim characters
				return ""
			end try
		end repeat
	end if
	
	return theText
end trimLine