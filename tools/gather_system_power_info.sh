#!/bin/bash

echo "
***************************************************************************************************
* System Frequency & Scaling Profile
*
* Description:  $1
***************************************************************************************************"

echo ""
echo "RHEL Release:"
echo "-------------"
cat /etc/redhat-release 

echo ""
echo "Kernel version:"
echo "---------------"
uname -a

echo ""
echo "tuned profile:"
echo "--------------"
tuned-adm active

echo ""
echo "Boot command line:"
echo "------------------"
cat /proc/cmdline 

echo ""
echo "CPU information:"
echo "----------------"
lscpu
echo ""
echo ""

echo ""
echo "x86_energy_perf_policy:"
echo ""
echo "where:"
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


echo ""
echo "CPUFreq Policy Settings:"
echo "========================"

for i in 3 51 5 53 7 55 9 57;
do
	tree /sys/devices/system/cpu/cpufreq/policy$i

	for file in /sys/devices/system/cpu/cpufreq/policy$i/*; do
		echo "$file .... `cat $file`"
	done
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
echo "intel_pstate driver information:"
echo "================================"
echo ""


for i in 3 51 5 53 7 55 9 57;
do
	tree /sys/devices/system/cpu/cpufreq/policy$i

	for file in /sys/devices/system/cpu/cpufreq/policy$i/*; do
		echo "$file .... `cat $file`"
	done
	echo ""
done


if [ -d "/sys/devices/system/cpu/intel_pstate" ]; then

	tree /sys/devices/system/cpu/intel_pstate

	for file in /sys/devices/system/cpu/intel_pstate/*; do
		echo "$file .... `cat $file`"
	done
else
	echo "Directory /sys/devices/system/cpu/intel_pstate does not exist"
fi

echo ""
echo ""

echo "Idle states:"
echo "============"

tree /sys/module/intel_idle/parameters

for file in /sys/module/intel_idle/parameters/*; do
	echo "$file .... `cat $file`"
done

echo ""
echo "Gathering turbostat data for 60 seconds..."

timeout 60s turbostat -c 3,51,5,53,7,55,9,57 -i 3 --out turbostat.txt

echo ""
echo ""




