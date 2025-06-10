
tell application id "com.figure53.QLab.5" to tell front workspace
	set userNote to 0
	set userVel to 127
	set userInc to 5
	
	repeat with eachCue in (selected as list)
		
		set s to q name of eachCue
		if s contains ")" then
			set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
			set q name of eachCue to newName
		end if
		
		set q name of eachCue to "(cc" & userNote & "." & userVel & ") " & (q name of eachCue)
		set midi command of eachCue to control_change
		set midi byte one of eachCue to userNote
		set midi byte two of eachCue to userVel
		set midi trigger of eachCue to enabled
		
		
		set userVel to userVel + userInc
		if userVel is greater than 127 then
			set userVel to userVel - 128
			set userNote to userNote + 1
		end if
		
		if userNote is greater than 127 then
			set userNote to 0
		end if
		
	end repeat
end tell