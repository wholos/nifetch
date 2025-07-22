import osproc, strutils

const knownWMs = [
  "i3", "sway", "bspwm", "openbox", "fluxbox", "xmonad", "awesome", "icewm",
  "dwm", "herbstluftwm", "spectrwm", "pekwm", "compiz", "metacity", "kwin",
  "mutter", "xfwm4", "enlightenment", "river", "cwm", "twm", "hyprland", "niri"
]

proc detectWM(): string =
  let (psOut, _) = execCmdEx("ps -e")
  for wm in knownWMs:
    if psOut.toLowerAscii.contains(wm):
      return wm
  return "Unable to determine wm"

proc echowm*() =
   echo "WM: ", detectWM()
