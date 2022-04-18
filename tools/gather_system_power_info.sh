#!/bin/bash

echo "
***************************************************************************************************
* System Frequency & Scaling Profile
*
* Description:  $1
***************************************************************************************************"

exit
echo ""
cat /etc/redhat-release 
echo ""

uname -a
echo ""
tuned-adm active
echo ""
cat /proc/cmdline 
echo ""
lscpu
echo ""
echo ""

echo ""
echo "x86_energy_perf_policy:"
echo ""
echo "VALUE STRING        EPB  EPP"
echo "performance         0    0"
echo "balance-performance 4    128"
echo "normal, default     6    128"
echo "balance-power       8    192"
echo "power               15   255"
echo "============================"
echo ""

x86_energy_perf_policy --cpu 3,51,5,53,7,55,9,57

echo ""


echo "CPUFreq Policy Settings:"
echo "========================"

for i in 3 51 5 53 7 55 9 57;
do
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_min_freq ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_min_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_max_freq ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_max_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_setspeed ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_setspeed`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_min_freq ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_min_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_governor ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_governor`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_driver ................. `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_driver`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_cur_freq ............... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_cur_freq`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/scaling_available_governors .... `cat /sys/devices/system/cpu/cpufreq/policy$i/scaling_available_governors`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/related_cpus ................... `cat /sys/devices/system/cpu/cpufreq/policy$i/related_cpus`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_transition_latency ..... `cat /sys/devices/system/cpu/cpufreq/policy$i/cpuinfo_transition_latency`" 
	echo "cpu" $i "/sys/devices/system/cpu/cpufreq/policy$i/affected_cpus .................. `cat /sys/devices/system/cpu/cpufreq/policy$i/affected_cpus`" 
	echo ""
done

echo ""
echo "cpupower --cpu [cpu] frequency-info:"
echo "===================================="

for i in 3 51 5 53 7 55 9 57;
do
	cpupower --cpu $i frequency-info
	echo ""
done

echo ""


echo "cpupower --cpu [cpu] idle-info:"
echo "==============================="

for i in 3 51 5 53 7 55 9 57;
do
	echo ""
	cpupower --cpu $i idle-info
	echo ""
done

echo ""

