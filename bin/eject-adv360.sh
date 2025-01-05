#!/bin/zsh
diskutil umount /Volumes/ADV360
if [[ $? == 0 ]]; then
    osascript -e 'display notification "Disk ADV360 umounted" with title "Eject Succeeded"'
else
    osascript -e 'display notification "umount failed for ADV360" with title "Eject Failed"'
fi
