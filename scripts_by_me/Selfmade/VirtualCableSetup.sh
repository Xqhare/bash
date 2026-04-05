#!/usr/bin/env bash
# Create a virtual sink to monitor in OBS
pactl load-module module-null-sink sink_name=VirtualSpeaker sink_properties=device.description=VirtualSpeaker
# Linking with a virtual source visible in pulseaudio for Ts
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=VirtualMic channel_map=front-left,front-right
pw-link VirtualSpeaker:monitor_FL VirtualMic:input_FL
pw-link VirtualSpeaker:monitor_FR VirtualMic:input_FR
Exit 0
