import os, osproc, strutils, sysinfo, wm

for arg in commandLineParams():
    case arg
        of "-v", "--version":
            echo "Version: 1.0"
            quit(0)
        else:
            echo "Unknown arguments: ", arg
            quit(0)

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
