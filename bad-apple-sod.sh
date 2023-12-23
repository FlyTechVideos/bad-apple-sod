#!/bin/bash

call_bsod() {
	sudo journalctl --user --flush --rotate --vacuum-time=1s
	sudo systemd-cat -p emerg echo "$(printf %b '\e[H\e[J')$1"
	sudo /usr/lib/systemd/systemd-bsod &
}

sudo echo "Starting in 3..."
sleep 1
echo "2..."
sleep 1
echo "1..."
sleep 1
echo "Initializing sequence."

IFS='=' read -ra frames <<< $(cat frames.txt)
for frame in "${frames[@]}"; do
	call_bsod "$frame"
	sleep 0.05
done
