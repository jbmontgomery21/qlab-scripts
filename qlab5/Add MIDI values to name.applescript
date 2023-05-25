-- @hotkey ^N
tell application id "com.figure53.QLab.5" to tell front workspace
	set thisCue to last item of (selected as list)
	set theNote to midi byte one of thisCue
	set theVel to midi byte two of thisCue
	
	set s to q name of thisCue
	if s contains ")" then
		set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
		set q name of thisCue to newName
	end if
	
	if theNote is 0 and theVel is 0 and midi trigger of thisCue is disabled then
		set q name of thisCue to "(NO MIDI)" & (q name of thisCue)
	else
		set q name of thisCue to "(" & theNote & "." & theVel & ") " & (q name of thisCue)
		set midi trigger of thisCue to enabled
	end if
	
end tell