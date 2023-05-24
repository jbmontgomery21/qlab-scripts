tell application id "com.figure53.QLab.4" to tell front workspace
	set thisCue to last item of (selected as list)
	set theNote to midi byte one of thisCue
	set theVel to midi byte two of thisCue
	
	set s to q name of thisCue
	if s contains ")" then
		set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
		set q name of thisCue to newName
	end if
	
	set q name of thisCue to "(" & theNote & "." & theVel & ") " & (q name of thisCue)
	set midi trigger of thisCue to enabled
	
end tell