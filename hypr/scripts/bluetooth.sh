#!/bin/bash

# Check the status of the Bluetooth service
status=$(bluetooth | awk '{print $3}')

if [ "$status" == "off" ]; then
  bluetooth on
else
  bluetooth off
fi