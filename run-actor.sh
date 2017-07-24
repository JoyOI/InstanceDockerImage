#!/usr/bin/env bash

# limit runner memory, leave 50MB for runner and actor
freeMemory=$(free -w | grep "Mem:" | python3 -c "print(input().split()[-1])")
limitMemory=$(cat /sys/fs/cgroup/memory/memory.stat | grep hierarchical_memory_limit | python3 -c "print(int(input().split()[1]) // 1024)")
runnerMemory=$(python3 -c "print(min($freeMemory, $limitMemory) - 51200)")
echo "runner hard as $runnerMemory" >> /etc/security/limits.conf

# run actor
dotnet /actor/bin/Debug/netcoreapp2.0/actor.dll
