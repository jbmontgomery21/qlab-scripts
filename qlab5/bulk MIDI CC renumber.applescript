
tell application id "com.figure53.QLab.5" to tell front workspace
	set userNote to 0
	set userVel to 0
	set userInc to 0
	set startNote to 0
	set startVel to 0
	set startInc to 0
	
	--set userNote loop
	repeat
		set userNote to (display dialog "Enter the starting note:" default answer "")
		try
			set startNote to (text returned of userNote) as integer
			-- This test should be unnecessary, just exiting the loop should be fine.
			if class of startNote is integer then Â
				exit repeat
		on error m number n from o partial result r to t
			set unableToConvertToInteger to n is -1700 and o is text returned of userNote and t is integer -- e.g. "asdf"
			set numericResultTooLarge to n is -2702 and t is integer -- e.g. anything larger than 2^29-1
			if not (unableToConvertToInteger or numericResultTooLarge) then error m number n from o partial result r to t -- return {m, n, o, r, t} -- to see the error values, use the return instead
		end try
		display dialog "The starting number needs to be a valid integer!" buttons {"Enter again", "Cancel"} default button 1
	end repeat
	
	--set userVel loop
	repeat
		set userVel to (display dialog "Enter the starting velocity:" default answer "")
		try
			set startVel to (text returned of userVel) as integer
			-- This test should be unnecessary, just exiting the loop should be fine.
			if class of startVel is integer then Â
				exit repeat
		on error m number n from o partial result r to t
			set unableToConvertToInteger to n is -1700 and o is text returned of userVel and t is integer -- e.g. "asdf"
			set numericResultTooLarge to n is -2702 and t is integer -- e.g. anything larger than 2^29-1
			if not (unableToConvertToInteger or numericResultTooLarge) then error m number n from o partial result r to t -- return {m, n, o, r, t} -- to see the error values, use the return instead
		end try
		display dialog "The starting number needs to be a valid integer!" buttons {"Enter again", "Cancel"} default button 1
	end repeat
	
	--set userInc loop
	repeat
		set userInc to (display dialog "Enter the increment amount:" default answer "")
		try
			set startInc to (text returned of userInc) as integer
			-- This test should be unnecessary, just exiting the loop should be fine.
			if class of startInc is integer then Â
				exit repeat
		on error m number n from o partial result r to t
			set unableToConvertToInteger to n is -1700 and o is text returned of userInc and t is integer -- e.g. "asdf"
			set numericResultTooLarge to n is -2702 and t is integer -- e.g. anything larger than 2^29-1
			if not (unableToConvertToInteger or numericResultTooLarge) then error m number n from o partial result r to t -- return {m, n, o, r, t} -- to see the error values, use the return instead
		end try
		display dialog "The starting number needs to be a valid integer!" buttons {"Enter again", "Cancel"} default button 1
	end repeat
	
	repeat with eachCue in (selected as list)
		
		set s to q name of eachCue
		if s contains ")" then
			set newName to characters ((offset of ")" in s) + 2) thru (count s) of s as string
			set q name of eachCue to newName
		end if
		
		set q name of eachCue to "(cc" & startNote & "." & startVel & ") " & (q name of eachCue)
		set midi command of eachCue to control_change
		set midi byte one of eachCue to startNote
		set midi byte two of eachCue to startVel
		set midi trigger of eachCue to enabled
		
		
		set startVel to startVel + startInc
		if startVel is greater than 127 then
			set startVel to startVel - 128
			set startNote to startNote + 1
		end if
		
		if startNote is greater than 127 then
			set startNote to 0
		end if
		
	end repeat
end tell