#!/usr/bin/bash

#count=`ps -ef | grep -vE "grep|vim" | grep -c "sxiv"`
#if [[ $count > 3 ]]; then
#    echo "[-] This script is running multiple times, killing it"
#    killall sxiv
#    exit
#fi

tcount=`ps -ef | grep -v grep | grep -c 'polybar -q top -c /home/.*/.config/polybar/.*/config.ini'`
bcount=`ps -ef | grep -v grep | grep -c 'polybar -q bottom -c /home/.*/.config/polybar/.*/config.ini'`
mcount=`ps -ef | grep -v grep | grep -c 'polybar -q main -c /home/.*/.config/polybar/.*/config.ini'`
if [[ $mcount > 1 || $bcount > 1 || $tcount > 1 ]]; then
    echo "[-] Multiple polybars are running, killing them"
    killall polybar
    bspc wm -r
    exit
fi

wcount=`ps -efww | grep -v "grep" | grep -c "pywal.sh"`
if [[ $wcount > 2 ]]; then
    echo "[-] Multiple pywal scripts are running, killing it"
    pid=`ps -efww | grep -v "grep" | grep "pywal.sh" | awk -vpid=$$ '$2 != pid { print $2 }'`
    for p in $pid
    do
        kill -9 $p
    done
    exit
fi

# Kill unnecessary processes
scripts=`ps -ef | grep -v "grep" | grep ".config/polybar/.*/scripts/.*" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $scripts
do
    kill -9 $d
done

colorblocks=`ps -efww | grep -v "grep" | grep "\--colorblocks" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $colorblocks
do
    echo "[-] The colorblocks theme $d is still running, killing it"
    kill -9 $d
done
docky=`ps -efww | grep -v "grep" | grep "\--docky" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $docky
do
    echo "[-] The docky theme $d is still running, killing it"
    kill -9 $d
done
grayblocks=`ps -efww | grep -v "grep" | grep "\--grayblocks" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $grayblocks
do
    echo "[-] The grayblocks theme $d is still running, killing it"
    kill -9 $d
done
hack=`ps -efww | grep -v "grep" | grep "\--hack" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $hack
do
    echo "[-] The hack theme $d is still running, killing it"
    kill -9 $d
done
material=`ps -efww | grep -v "grep" | grep "\--material" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $material
do
    echo "[-] The material theme $d is still running, killing it"
    kill -9 $d
done
shapes=`ps -efww | grep -v "grep" | grep "\--shapes" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $shapes
do
    echo "[-] The shapes theme $d is still running, killing it"
    kill -9 $d
done
trans=`ps -efww | grep -v "grep" | grep "\--trans" | awk -vpid=$$ '$2 != pid { print $2 }'`
for d in $trans
do
    echo "[-] The trans theme $d is still running, killing it"
    kill -9 $d
    wait
done

if [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "colorblocks" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/colorblocks/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --colorblocks 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "docky" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then 
    bash ~/.config/polybar/docky/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --docky 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "grayblocks" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/grayblocks/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --grayblocks 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "hack" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/hack/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --hack 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "material" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/material/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --material 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "shapes" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/shapes/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --shapes 2>/dev/null
    exit
elif [[ ! -z $(ps -efww | grep -vE "grep|launch.sh|scripts" | grep "trans" | awk -vpid=$$ '$2 != pid { print $2 }') ]]; then
    bash ~/.config/polybar/trans/scripts/pywal.sh $1
    #/usr/bin/bash ~/.config/polybar/launch.sh --trans 2>/dev/null
    exit
else
    echo "[-] A polybar theme is not running"
    exit
fi