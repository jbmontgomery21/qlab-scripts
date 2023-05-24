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
	
	#musical midi input
	if midi input enabled of overrides is true then
		set midi input enabled of overrides to false
	else if midi input enabled of overrides is false then
		set midi input enabled of overrides to true
	end if
	
	#msc input
	if msc input enabled of overrides is true then
		set msc input enabled of overrides to false
	else if msc input enabled of overrides is false then
		set msc input enabled of overrides to true
	end if
	
	#sysex input
	if sysex input enabled of overrides is true then
		set sysex input enabled of overrides to false
	else if sysex input enabled of overrides is false then
		set sysex input enabled of overrides to true
	end if
	
	#osc input
	if osc input enabled of overrides is true then
		set osc input enabled of overrides to false
	else if osc input enabled of overrides is false then
		set osc input enabled of overrides to true
	end if
	
	#timecode input
	if timecode input enabled of overrides is true then
		set timecode input enabled of overrides to false
	else if timecode input enabled of overrides is false then
		set timecode input enabled of overrides to true
	end if
	
	
	
end tell