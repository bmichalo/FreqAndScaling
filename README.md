# FreqAndScaling
Tools and notes about Linux frequency and scaling

Basic directory structure:

- notes:  Detailed notes about the workings of the CPU performance scaling subsystem of the Linux kernel, 
        including intel_cpufreq and intel_pstate scaling drivers.

- tools:  Tools to query and set a systems' frequency settings via sysfs.  Also produces a turbostat output 
        file over a period of 60 seconds.

- data:   Using the tool gather_system_power_info.sh, CPU performance scaling subsystem attributes 
        across Cascade Lake, Cascade Lake N, and Ice Lake processors.  Note most experiments involved 
        Cascade Lake - see data/CascadeLake/readme.txt
 
<pre>
# git clone https://github.com/bmichalo/FreqAndScaling

# cd FreqAndScaling

# tree
.
├── data
│   ├── CascadeLake
│   │   ├── 1
│   │   │   ├── CascadeLake1.txt
│   │   │   └── turbostat.txt
│   │   ├── 2
│   │   │   ├── CascadeLake2.txt
│   │   │   └── turbostat.txt
│   │   ├── 3
│   │   │   ├── CascadeLake3.txt
│   │   │   └── turbostat.txt
│   │   ├── 4
│   │   │   ├── CascadeLake4.txt
│   │   │   └── turbostat.txt
│   │   ├── 5
│   │   │   ├── CascadeLake5.txt
│   │   │   └── turbostat.txt
│   │   ├── 6
│   │   │   ├── CascadeLake6.txt
│   │   │   └── turbostat.txt
│   │   └── readme.txt
│   ├── CascadeLakeN
│   │   ├── CascadeLakeN.txt
│   │   └── turbostat.txt
│   └── IceLake
│       ├── IceLake.txt
│       └── turbostat.txt
├── notes
│   └── power_study_notes.txt
├── README.md
└── tools
    ├── gather_system_power_info.sh
    ├── set_dpdk_core_mscale_pin_freq.sh
    └── show_dpdk_core_mscale_pin_freq.sh



Example output of tools/gather_system_power_info.sh (does not include the additional 
turbostat.txt file that's also generated):


***************************************************************************************************
* System Frequency & Scaling Profile
*
* Description:  Cascade Lake
***************************************************************************************************

RHEL Release:
-------------
Red Hat Enterprise Linux release 8.5 (Ootpa)

Kernel version:
---------------
Linux perf8.perf.lab.eng.bos.redhat.com 4.18.0-348.el8.x86_64 #1 SMP Mon Oct 4 12:17:22 EDT 2021 x86_64 x86_64 x86_64 GNU/Linux

tuned profile:
--------------
No current active profile.

Boot command line:
------------------
BOOT_IMAGE=(hd0,msdos1)/vmlinuz-4.18.0-348.el8.x86_64 root=/dev/mapper/rhel_perf8-root ro crashkernel=auto resume=/dev/mapper/rhel_perf8-swap rd.lvm.lv=rhel_perf8/root rd.lvm.lv=rhel_perf8/swap isolcpus=3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,51,53,55,57,59,61,63,65,67,69,71,73,75,77,79,81,83,85,87,89,91,93,95 default_hugepagesz=1GB hugepagesz=1G hugepages=64 intel_iommu=on iommu=pt tsc=nowatchdog

CPU information:
----------------
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  2
Core(s) per socket:  24
Socket(s):           2
NUMA node(s):        2
Vendor ID:           GenuineIntel
BIOS Vendor ID:      Intel
CPU family:          6
Model:               85
Model name:          Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
BIOS Model name:     Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GHz
Stepping:            7
CPU MHz:             4000.000
CPU max MHz:         4000.0000
CPU min MHz:         1200.0000
BogoMIPS:            6000.00
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            36608K
NUMA node0 CPU(s):   0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94
NUMA node1 CPU(s):   1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63,65,67,69,71,73,75,77,79,81,83,85,87,89,91,93,95
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l3 cdp_l3 invpcid_single intel_ppin ssbd mba ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid cqm mpx rdt_a avx512f avx512dq rdseed adx smap clflushopt clwb intel_pt avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local dtherm ida arat pln pts pku ospke avx512_vnni md_clear flush_l1d arch_capabilities



x86_energy_perf_policy:

where:

VALUE STRING        EPB  EPP
performance         0    0
balance-performance 4    128
normal, default     6    128
balance-power       8    192
power               15   255
============================

cpu3: EPB 6
cpu5: EPB 6
cpu7: EPB 6
cpu9: EPB 6
cpu51: EPB 6
cpu53: EPB 6
cpu55: EPB 6
cpu57: EPB 6


CPUFreq Policy Settings:
========================
/sys/devices/system/cpu/cpufreq/policy3
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy3/affected_cpus .... 3
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy3/related_cpus .... 3
/sys/devices/system/cpu/cpufreq/policy3/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy3/scaling_cur_freq .... 1200364
/sys/devices/system/cpu/cpufreq/policy3/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy3/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy3/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy3/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy3/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy51
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy51/affected_cpus .... 51
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy51/related_cpus .... 51
/sys/devices/system/cpu/cpufreq/policy51/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy51/scaling_cur_freq .... 1200291
/sys/devices/system/cpu/cpufreq/policy51/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy51/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy51/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy51/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy51/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy5
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy5/affected_cpus .... 5
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy5/related_cpus .... 5
/sys/devices/system/cpu/cpufreq/policy5/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy5/scaling_cur_freq .... 1199476
/sys/devices/system/cpu/cpufreq/policy5/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy5/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy5/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy5/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy5/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy53
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy53/affected_cpus .... 53
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy53/related_cpus .... 53
/sys/devices/system/cpu/cpufreq/policy53/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy53/scaling_cur_freq .... 1200374
/sys/devices/system/cpu/cpufreq/policy53/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy53/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy53/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy53/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy53/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy7
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy7/affected_cpus .... 7
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy7/related_cpus .... 7
/sys/devices/system/cpu/cpufreq/policy7/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy7/scaling_cur_freq .... 1200972
/sys/devices/system/cpu/cpufreq/policy7/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy7/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy7/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy7/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy55
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy55/affected_cpus .... 55
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy55/related_cpus .... 55
/sys/devices/system/cpu/cpufreq/policy55/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy55/scaling_cur_freq .... 1200447
/sys/devices/system/cpu/cpufreq/policy55/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy55/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy55/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy55/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy55/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy9
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy9/affected_cpus .... 9
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy9/related_cpus .... 9
/sys/devices/system/cpu/cpufreq/policy9/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy9/scaling_cur_freq .... 1200226
/sys/devices/system/cpu/cpufreq/policy9/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy9/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy9/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy9/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy9/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy57
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy57/affected_cpus .... 57
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy57/related_cpus .... 57
/sys/devices/system/cpu/cpufreq/policy57/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy57/scaling_cur_freq .... 1199924
/sys/devices/system/cpu/cpufreq/policy57/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy57/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy57/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy57/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy57/scaling_setspeed .... <unsupported>


cpupower --cpu [cpu] frequency-info:
====================================
analyzing CPU 3:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.20 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 51:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 51
  CPUs which need to have their frequency coordinated by software: 51
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.64 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 5:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.56 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 53:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 53
  CPUs which need to have their frequency coordinated by software: 53
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.22 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 7:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 7
  CPUs which need to have their frequency coordinated by software: 7
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.20 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 55:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 55
  CPUs which need to have their frequency coordinated by software: 55
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.20 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 9:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 9
  CPUs which need to have their frequency coordinated by software: 9
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.20 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes

analyzing CPU 57:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 57
  CPUs which need to have their frequency coordinated by software: 57
  maximum transition latency: 20.0 us
  hardware limits: 1.20 GHz - 4.00 GHz
  available cpufreq governors: conservative ondemand userspace powersave performance schedutil
  current policy: frequency should be within 1.20 GHz and 4.00 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 1.20 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes


cpupower --cpu [cpu] idle-info:
===============================

CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 3:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 9
Duration: 168
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 232
Duration: 203206
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 64
Duration: 28773
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42966
Duration: 89488978266



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 51:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 9
Duration: 168
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 225
Duration: 197391
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 96
Duration: 33712
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42988
Duration: 89488979851



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 5:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 7
Duration: 146
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 229
Duration: 200625
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 69
Duration: 34660
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42908
Duration: 89488982146



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 53:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 17
Duration: 230
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 220
Duration: 194347
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 91
Duration: 42847
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42959
Duration: 89488979790



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 7:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 10
Duration: 122
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 228
Duration: 199758
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 60
Duration: 27956
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 43001
Duration: 89488991094



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 55:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 14
Duration: 220
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 222
Duration: 195642
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 82
Duration: 37935
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42984
Duration: 89488987240



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 9:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 28
Duration: 270
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 227
Duration: 200230
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 74
Duration: 34601
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42966
Duration: 89489002614



CPUidle driver: intel_idle
CPUidle governor: menu
analyzing CPU 57:

Number of idle states: 4
Available idle states: POLL C1 C1E C6
POLL:
Flags/Description: CPUIDLE CORE POLL IDLE
Latency: 0
Usage: 16
Duration: 249
C1:
Flags/Description: MWAIT 0x00
Latency: 2
Usage: 218
Duration: 192114
C1E:
Flags/Description: MWAIT 0x01
Latency: 10
Usage: 95
Duration: 44482
C6:
Flags/Description: MWAIT 0x20
Latency: 133
Usage: 42977
Duration: 89489000462



intel_pstate driver information:
================================

/sys/devices/system/cpu/cpufreq/policy3
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy3/affected_cpus .... 3
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy3/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy3/related_cpus .... 3
/sys/devices/system/cpu/cpufreq/policy3/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy3/scaling_cur_freq .... 1517475
/sys/devices/system/cpu/cpufreq/policy3/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy3/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy3/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy3/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy3/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy51
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy51/affected_cpus .... 51
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy51/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy51/related_cpus .... 51
/sys/devices/system/cpu/cpufreq/policy51/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy51/scaling_cur_freq .... 1992519
/sys/devices/system/cpu/cpufreq/policy51/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy51/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy51/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy51/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy51/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy5
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy5/affected_cpus .... 5
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy5/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy5/related_cpus .... 5
/sys/devices/system/cpu/cpufreq/policy5/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy5/scaling_cur_freq .... 1791106
/sys/devices/system/cpu/cpufreq/policy5/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy5/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy5/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy5/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy5/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy53
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy53/affected_cpus .... 53
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy53/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy53/related_cpus .... 53
/sys/devices/system/cpu/cpufreq/policy53/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy53/scaling_cur_freq .... 1200760
/sys/devices/system/cpu/cpufreq/policy53/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy53/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy53/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy53/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy53/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy7
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy7/affected_cpus .... 7
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy7/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy7/related_cpus .... 7
/sys/devices/system/cpu/cpufreq/policy7/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy7/scaling_cur_freq .... 1199859
/sys/devices/system/cpu/cpufreq/policy7/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy7/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy7/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy7/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy55
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy55/affected_cpus .... 55
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy55/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy55/related_cpus .... 55
/sys/devices/system/cpu/cpufreq/policy55/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy55/scaling_cur_freq .... 1201740
/sys/devices/system/cpu/cpufreq/policy55/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy55/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy55/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy55/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy55/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy9
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy9/affected_cpus .... 9
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy9/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy9/related_cpus .... 9
/sys/devices/system/cpu/cpufreq/policy9/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy9/scaling_cur_freq .... 1201496
/sys/devices/system/cpu/cpufreq/policy9/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy9/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy9/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy9/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy9/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/cpufreq/policy57
├── affected_cpus
├── cpuinfo_max_freq
├── cpuinfo_min_freq
├── cpuinfo_transition_latency
├── related_cpus
├── scaling_available_governors
├── scaling_cur_freq
├── scaling_driver
├── scaling_governor
├── scaling_max_freq
├── scaling_min_freq
└── scaling_setspeed

0 directories, 12 files
/sys/devices/system/cpu/cpufreq/policy57/affected_cpus .... 57
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy57/cpuinfo_transition_latency .... 20000
/sys/devices/system/cpu/cpufreq/policy57/related_cpus .... 57
/sys/devices/system/cpu/cpufreq/policy57/scaling_available_governors .... conservative ondemand userspace powersave performance schedutil 
/sys/devices/system/cpu/cpufreq/policy57/scaling_cur_freq .... 1201246
/sys/devices/system/cpu/cpufreq/policy57/scaling_driver .... intel_cpufreq
/sys/devices/system/cpu/cpufreq/policy57/scaling_governor .... performance
/sys/devices/system/cpu/cpufreq/policy57/scaling_max_freq .... 4000000
/sys/devices/system/cpu/cpufreq/policy57/scaling_min_freq .... 1200000
/sys/devices/system/cpu/cpufreq/policy57/scaling_setspeed .... <unsupported>

/sys/devices/system/cpu/intel_pstate
├── max_perf_pct
├── min_perf_pct
├── no_turbo
├── num_pstates
├── status
└── turbo_pct

0 directories, 6 files
/sys/devices/system/cpu/intel_pstate/max_perf_pct .... 100
/sys/devices/system/cpu/intel_pstate/min_perf_pct .... 30
/sys/devices/system/cpu/intel_pstate/no_turbo .... 0
/sys/devices/system/cpu/intel_pstate/num_pstates .... 29
/sys/devices/system/cpu/intel_pstate/status .... passive
/sys/devices/system/cpu/intel_pstate/turbo_pct .... 35


Idle states:
============
/sys/module/intel_idle/parameters
├── max_cstate
├── no_acpi
├── states_off
└── use_acpi

0 directories, 4 files
/sys/module/intel_idle/parameters/max_cstate .... 9
/sys/module/intel_idle/parameters/no_acpi .... N
/sys/module/intel_idle/parameters/states_off .... 0
/sys/module/intel_idle/parameters/use_acpi .... N

Gathering turbostat data for 60 seconds...

</pre>


