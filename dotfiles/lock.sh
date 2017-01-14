#!/bin/bash
ICON=$HOME/.xlock/icon.png
TMPBG=/tmp/screen.png
scrot $TMPBG
<<<<<<< HEAD
convert $TMPBG  -scale 10% -background black -vignette 100x900 -radial-blur 0x8 -scale 1000% -blur 4x4 $TMPBG
=======
convert $TMPBG -scale 10% -scale 1000% $TMPBG
>>>>>>> c6743560978822319639ea85b58d293ca0e0eebd
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -u -i $TMPBG
rm $TMPBG
