-- @hotkey ^T
tell application id "com.figure53.QLab.5" to tell front workspace
	
	set userHour to display dialog "Timecode hour?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theHour to text returned of userHour
	
	set userMinute to display dialog "Timecode minute?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theMinute to text returned of userMinute
	
	set userSecond to display dialog "Timecode minute?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theSecond to text returned of userSecond
	
	set userFrame to display dialog "Timecode minute?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theFrame to text returned of userFrame
	
	
	set thisCue to last item of (selected as list)
	
	set timecode hours of thisCue to theHour
	set timecode minutes of thisCue to theMinute
	set timecode seconds of thisCue to theSecond
	set timecode frames of thisCue to theFrame
	
	set s to q name of thisCue
	if s contains ")" then
		set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
		set q name of thisCue to newName
	end if
	
	set modHour to timecode hours of thisCue
	set modMinute to timecode minutes of thisCue
	set modSecond to timecode seconds of thisCue
	set modFrame to timecode frames of thisCue
	
	set modName to "(" & modHour & ":" & modMinute & ":" & modSecond & ":" & modFrame & ") "
	
	set q name of thisCue to modName & (q name of thisCue)
	set q number of thisCue to modName
	set q color of thisCue to "red"
	
	set timecode trigger of thisCue to enabled
	
end tell