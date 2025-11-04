#!/bin/bash

echo "System Information:"

echo "___________________"

echo "Hostname: $(hostname)"

echo "Uptime: $(uptime -p)"

echo "Logged in users:"

who

echo "Disk usage:"

df -h | grep '^/dev'
