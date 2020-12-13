#!/bin/bash

echo "OTHER_OPTS='-a pulseaudio -m alsa_seq -r 48000'" | sudo tee -a /etc/conf.d/fluidsynth > /dev/null

killall pulseaudio; sudo -u voyen pulseaudio --start
