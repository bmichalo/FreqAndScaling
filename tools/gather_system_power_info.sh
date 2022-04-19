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
echo "intel_pstate driver information:"
echo "================================"
echo ""

if [ -d "/sys/devices/system/cpu/intel_pstate" ]; then

	echo "/sys/devices/system/cpu/intel_pstate/turbo_pct ....... `cat /sys/devices/system/cpu/intel_pstate/turbo_pct`"
	echo "/sys/devices/system/cpu/intel_pstate/status .......... `cat /sys/devices/system/cpu/intel_pstate/status`"
	echo "/sys/devices/system/cpu/intel_pstate/num_pstates ..... `cat /sys/devices/system/cpu/intel_pstate/num_pstates`"
	echo "/sys/devices/system/cpu/intel_pstate/min_perf_pct .... `cat /sys/devices/system/cpu/intel_pstate/min_perf_pct`"
	echo "/sys/devices/system/cpu/intel_pstate/max_perf_pct .... `cat /sys/devices/system/cpu/intel_pstate/max_perf_pct`"
	echo "/sys/devices/system/cpu/intel_pstate/no_turbo ........ `cat /sys/devices/system/cpu/intel_pstate/no_turbo`"

else
	echo "Directory /sys/devices/system/cpu/intel_pstate does not exist"
fi

echo ""
echo ""

echo "Idle states:"
echo "============"

echo "/sys/module/intel_idle/parameters/use_acpi ...... `cat /sys/module/intel_idle/parameters/use_acpi`"
echo "/sys/module/intel_idle/parameters/states_off .... `cat /sys/module/intel_idle/parameters/states_off`"
echo "/sys/module/intel_idle/parameters/no_acpi ....... `cat /sys/module/intel_idle/parameters/no_acpi`"
echo "/sys/module/intel_idle/parameters/max_cstate .... `cat /sys/module/intel_idle/parameters/max_cstate`"





echo ""
echo ""
