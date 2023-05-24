set userNumPrefix to "*"
set userNamePrefix to "Yamaha Scene"
set userColor to "Purple"
set longNumbers to true

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Scene?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theScene to text returned of userInput as number
		if button returned of userInput is "Continue" and theScene is not "" then
			make type "MIDI"
			set MIDICue to last item of (selected as list)
			set channel of MIDICue to (theScene - 1) div 128 + 1
			set byte one of MIDICue to (theScene - 1) mod 128
			set q color of MIDICue to userColor
			set qNumber to theScene as string
			if longNumbers then
				repeat while the length of qNumber < 3
					set qNumber to "0" & qNumber
				end repeat
			end if
			set q number of MIDICue to userNumPrefix & qNumber
			set q name of MIDICue to userNamePrefix & " " & qNumber
		end if
	on error
		return
	end try
end tell