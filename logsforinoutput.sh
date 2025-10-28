#!/bin/bash
# system_data_gather.sh

LOG="/var/log/system_monitor.log"
TS=$(date "+%Y-%m-%d %H:%M:%S")

{
  echo "===== $TS ====="
  echo "CPU: $(top -bn1 | awk '/Cpu/ {print $2+$4"%"}')"
  echo "Memory: $(free -h | awk '/Mem:/ {print $3 "/" $2}')"
  echo "Disk: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
  echo "Top 5 CPU Processes:"
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
  echo ""
} >> "$LOG"

