#!/bin/bash
last_update=$(stat -c %Y /var/log/pacman.log 2>/dev/null)
now=$(date +%s)
days=$(((now - last_update) / 86400))

if [ "$days" -ge 7 ]; then
  echo "{\"text\": \"⟳ ${days}d\", \"class\": \"warning\", \"tooltip\": \"System not updated in $days days\"}"
else
  echo "{\"text\": \"⟳ ${days}d\", \"class\": \"ok\", \"tooltip\": \"Last updated $days days ago\"}"
fi
