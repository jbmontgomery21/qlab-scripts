tell application id "com.figure53.QLab.4" to tell front workspace
	set runner to 1 #unmute tracker
	set trailer to 0 #mute tracker
	set delayTime to 5 #can change to desired delay between mutes/unmutes. make 0 
	set firstPatch to 1 #first galaxy patch number
	set lastPatch to 2 #last galaxy patch number
	set patchNum to firstPatch
	
	make type "network"
	set newCue to last item of (selected as list)
	set custom message of newCue to "/processing/output/*/mute true"
	set patch of newCue to patchNum
	set q name of newCue to "GALAXY " & (patchNum - firstPatch + 1) & " MUTE ALL"
	set continue mode of newCue to auto_continue
	
	repeat while patchNum < lastPatch #can set to number of devices
		# make mute for previous output if it's not the first output
		if trailer > 0 then
			make type "network"
			set newCue to last item of (selected as list)
			set custom message of newCue to "/processing/output/" & trailer & "/mute true"
			set patch of newCue to patchNum
			set q name of newCue to "GALAXY " & (patchNum - firstPatch + 1) & " - OUT " & trailer & ": MUTE"
			set continue mode of newCue to auto_continue
		end if
		
		#unmute the next output
		make type "network"
		set newCue to last item of (selected as list)
		set custom message of newCue to "/processing/output/" & runner & "/mute false"
		set patch of newCue to patchNum
		set q name of newCue to "GALAXY " & (patchNum - firstPatch + 1) & " - OUT " & runner & ": UNMUTE"
		set continue mode of newCue to auto_continue
		set post wait of newCue to delayTime
		
		#if it's the last output, need to make a mute before we go to the next device
		if runner = 16 then
			make type "network"
			set newCue to last item of (selected as list)
			set custom message of newCue to "/processing/output" & runner & "/mute true"
			set patch of newCue to patchNum
			set q name of newCue to "GALAXY " & patchNum & " - OUT " & runner & ": MUTE"
			set continue mode of newCue to auto_continue
		end if
		
		#increment trackers
		set runner to runner + 1
		set trailer to trailer + 1
		
		#increase patch number if current is maxed
		if runner > 16 then
			set runner to 1
			set trailer to 0
			set patchNum to patchNum + 1
		end if
	end repeat
end tell