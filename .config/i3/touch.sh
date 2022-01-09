#!/bin/bash
xinput map-to-output $(xinput list | grep 04F3:29B9 | cut -d "=" -f2 | awk -F "\t" '{print $1}' | head -n1) eDP1
