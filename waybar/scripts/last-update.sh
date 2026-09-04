#!/bin/bash

# Find the timestamp of the last system upgrade from the log
last_log_entry=$(grep -i "starting full system upgrade" /var/log/pacman.log 2>/dev/null | tail -n 1)

if [ -z "$last_log_entry" ]; then
  # Fallback to file mtime if log entry isn't found
  last_update=$(stat -c %Y /var/log/pacman.log 2>/dev/null)
else
  # Extract date string "[YYYY-MM-DDTHH:MM:SS+TZ]" or similar standard pacman log format
  log_date=$(echo "$last_log_entry" | awk -F'[][]' '{print $2}')
  last_update=$(date -d "$log_date" +%s 2>/dev/null)
fi

if [ -z "$last_update" ]; then
  echo '{"text": "⟳ ?", "class": "warning", "tooltip": "Cannot read update history"}'
  exit 0
fi

now=$(date +%s)
days=$(((now - last_update) / 86400))

if [ "$days" -ge 7 ]; then
  echo "{\"text\": \"⟳ ${days}d\", \"class\": \"warning\", \"tooltip\": \"System not updated in $days days\"}"
else
  echo "{\"text\": \"⟳ ${days}d\", \"class\": \"ok\", \"tooltip\": \"Last updated $days days ago\"}"
fi
