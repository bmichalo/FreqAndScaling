#!/bin/bash


for i in 3 51 5 53 7 55 9 57;
do
	echo "cpu" $i "/sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq = `cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq = `cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq`" 
done






