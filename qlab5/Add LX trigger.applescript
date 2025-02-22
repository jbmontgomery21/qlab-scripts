-- @hotkey ^L
tell application id "com.figure53.QLab.5" to tell front workspace
	
	set userNum to display dialog "LX Trigger?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theNum to text returned of userNum
	
	set thisCue to last item of (selected as list)
	
	set s to q name of thisCue
	if s contains ")" then
		set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
		set q name of thisCue to newName
	end if
	
	set modName to "(" & "LX " & theNum & ") "
	
	set q name of thisCue to modName & (q name of thisCue)
	set q number of thisCue to theNum
	set q color of thisCue to "cyan"
	
end tell