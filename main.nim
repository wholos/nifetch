import os, osproc, strutils, sysinfo

for arg in commandLineParams():
    case arg
        of "-v", "--version":
            echo "Version: 1.0"
            quit(0)
        else:
            echo "Unknown arguments: ", arg
            quit(0)


const knownWMs = [
  "i3", "sway", "bspwm", "openbox", "fluxbox", "xmonad", "awesome", "icewm",
  "dwm", "herbstluftwm", "spectrwm", "pekwm", "compiz", "metacity", "kwin",
  "mutter", "xfwm4", "enlightenment", "river", "cwm", "twm"
]

proc detectWM(): string =
  let (psOut, _) = execCmdEx("ps -e")
  for wm in knownWMs:
    if psOut.toLowerAscii.contains(wm):
      return wm
  return "Unable to determine wm"

proc echowm() =
   echo "WM: ", detectWM()
            
proc echode() =
   if execProcess("echo $XDG_CURRENT_DESKTOP").strip().len > 0:
       echo "DE: ", execProcess("echo $XDG_CURRENT_DESKTOP").strip()
   else:
       echo "DE: Unknown DE"

proc echoterminal() =
   if execProcess("echo $TERM").strip().len > 0:
       echo "Term: ", execProcess("echo $TERM").strip()
   else:
       echo "Term: Unknown terminal"

echo execProcess("whoami").strip(), "@", execProcess("hostname")
echo "OS: ", getOSName()
echo "Kernel: ", execProcess("uname").strip(), " ", execProcess("uname -r").strip()
echo "Shell: ", execProcess("echo $SHELL").strip()
echode()
echowm()
echoterminal()
