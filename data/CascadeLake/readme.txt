1) Default baseline system at rest, no cmdline args, no tuned profile.  intel_pstate status should be 'active', but it is not.  Its 'passive'.

2) intel_pstate=no_hwp
[root@perf8 CascadeLake]# tuned-adm active
Current active profile: bills-intel-pstate-hwp-only

3) intel_pstate=disable
[root@perf8 FreqAndScaling]# tuned-adm active
Current active profile: bills-intel-pstate-disable

