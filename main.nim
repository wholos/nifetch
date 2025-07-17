import os, osproc, strutils, sysinfo

for arg in commandLineParams():
    case arg
        of "-v", "--version":
            echo "Version: 1.0"
            quit(0)
        else:
            echo "Unknown arguments: ", arg
            quit(0)

echo execProcess("whoami").strip(), "@", execProcess("hostname")
echo "OS: ", getOSName()
echo "Kernel: ", execProcess("uname").strip(), " ", execProcess("uname -r").strip()
echo "Shell: ", execProcess("echo $SHELL").strip()
echo "DE: ", execProcess("echo $XDG_CURRENT_DESKTOP").strip()
