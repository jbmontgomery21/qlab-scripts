tell application id "com.figure53.QLab.4"
	#musical midi output
	if midi output enabled of overrides is true then
		set midi output enabled of overrides to false
	else if midi output enabled of overrides is false then
		set midi output enabled of overrides to true
	end if
	
	#msc output
	if msc output enabled of overrides is true then
		set msc output enabled of overrides to false
	else if msc output enabled of overrides is false then
		set msc output enabled of overrides to true
	end if
	
	#sysex output
	if sysex output enabled of overrides is true then
		set sysex output enabled of overrides to false
	else if sysex output enabled of overrides is false then
		set sysex output enabled of overrides to true
	end if
	
	#osc output
	if osc output enabled of overrides is true then
		set osc output enabled of overrides to false
	else if osc output enabled of overrides is false then
		set osc output enabled of overrides to true
	end if
	
	#timecode output
	if timecode output enabled of overrides is true then
		set timecode output enabled of overrides to false
	else if timecode output enabled of overrides is false then
		set timecode output enabled of overrides to true
	end if
	
	
end tell