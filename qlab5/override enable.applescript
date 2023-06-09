-- @hotkey ⇧⌃⌥O
tell application id "com.figure53.QLab.5"
	#musical midi output
	set midi output enabled of overrides to true
	
	#msc output
	set msc output enabled of overrides to true
	
	#sysex output
	set sysex output enabled of overrides to true
	
	#osc output
	set osc output enabled of overrides to true
	
	#local network output
	set network local output enabled of overrides to true
	
	#timecode output
	set timecode output enabled of overrides to true
	
	#musical midi input
	set midi input enabled of overrides to true
	
	#msc input
	set msc input enabled of overrides to true
	
	#sysex input
	set sysex input enabled of overrides to true
	
	#osc input
	set osc input enabled of overrides to true
	
	#local network input
	set network local input enabled of overrides to true
	
	#timecode input
	set timecode input enabled of overrides to true
	
end tell