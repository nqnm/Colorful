#!/usr/bin/bash

# Kill unnecessary processes
scripts=`ps -ef | grep -v "grep" | grep ".config/polybar/.*/scripts/.*" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $scripts
do
    kill -9 $d
    wait
done

colorblocks=`ps -efww | grep -v "grep" | grep "\--colorblocks" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $colorblocks
do
    echo "[-] The colorblocks theme $d is still running, killing it"
    kill -9 $d
    wait
done
docky=`ps -efww | grep -v "grep" | grep "\--docky" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $docky
do
    echo "[-] The docky theme $d is still running, killing it"
    kill -9 $d
    wait
done
grayblocks=`ps -efww | grep -v "grep" | grep "\--grayblocks" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $grayblocks
do
    echo "[-] The grayblocks theme $d is still running, killing it"
    kill -9 $d
    wait
done
hack=`ps -efww | grep -v "grep" | grep "\--hack" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $hack
do
    echo "[-] The hack theme $d is still running, killing it"
    kill -9 $d
    wait
done
material=`ps -efww | grep -v "grep" | grep "\--material" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $material
do
    echo "[-] The material theme $d is still running, killing it"
    kill -9 $d
    wait
done
shapes=`ps -efww | grep -v "grep" | grep "\--shapes" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $shapes
do
    echo "[-] The shapes theme $d is still running, killing it"
    kill -9 $d
    wait
done
trans=`ps -efww | grep -v "grep" | grep "\--trans" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $trans
do
    echo "[-] The trans theme $d is still running, killing it"
    kill -9 $d
    wait
done

if [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "colorblocks" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then 
    rofi -theme .config/polybar/colorblocks/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "docky" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then 
    rofi -theme .config/polybar/docky/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "forest" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/forest/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "grayblocks" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/grayblocks/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "hack" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/hack/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "material" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/material/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "shapes" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/shapes/scripts/rofi/launcher.rasi -show drun
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "trans" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    rofi -theme .config/polybar/trans/scripts/rofi/launcher.rasi -show drun
else
    echo "[-] A polybar theme is not running!"
fi