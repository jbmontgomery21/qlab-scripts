-- @hotkey ⇧C
set colorList to {"grey", "red", "orange", "green", "blue", "purple", "edgecombGray", "mauve", "chartreuse", "bastardAmber", "lilac", "maize", "glaucous", "fuchsia", "ecru", "coral", "cerulean", "celadon", "bizque", "avocado", "ochre", "olive", "puce", "rufous", "sage", "scarlet", "seaFoamGreen", "skyBlue", "taupe", "verdigris", "vermillion", "viridian", "fulvous", "wenge", "zaffre", "indigo"}
set colorChoice to (choose from list colorList with title "Color Selector" with prompt "Choose your color") as string

tell application id "com.figure53.QLab.4" to tell front workspace
	set q color of last item of (selected as list) to colorChoice
end tell