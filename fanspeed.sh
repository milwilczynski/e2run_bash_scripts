#!/bin/bash
file="/sys/class/hwmon/hwmon0/pwm1"
echo FanSpeed before change: & sudo bash -c 'cat /sys/class/hwmon/hwmon3/pwm1'
echo Set FanSpeed to:
read fanspeed
sudo bash -c 'chmod 755 /sys/class/hwmon/hwmon3/pwm1'
sudo bash -c 'echo '$fanspeed' > /sys/class/hwmon/hwmon3/pwm1'