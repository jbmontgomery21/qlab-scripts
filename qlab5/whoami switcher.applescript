tell application id "com.figure53.QLab.5"
	set midi output enabled of overrides to false
	set msc output enabled of overrides to false
	set sysex output enabled of overrides to false
	set network external output enabled of overrides to false
	set network local output enabled of overrides to false
	set timecode output enabled of overrides to false
	set dmx output enabled of overrides to false
	set q name of cue "status" of front workspace to "Main Ð MUTED"
	set q color of cue "status" of front workspace to "red"
end tell