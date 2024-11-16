#!/bin/bash

websites=(
  "https://github.com"
  "https://www.freecodecamp.org"
  "https://www.codewars.com"
  "https://copilot.microsoft.com"
  "https://chatgpt.com"
)

log_file="exercise1_results.txt"

: > "$log_file"
available=0

for website in "${websites[@]}"; do
  # Отримання статусу доступності через curl
  if curl -o /dev/null -s -w "%{http_code}" -L "$website" | grep -q "^200$"; then
    available=$((available+1))
    echo "$website доступний" >> "$log_file"
  else
    echo "$website не доступний" >> "$log_file"
  fi
done

now=$(date)
echo "вебсайти кількістю $available із загальної кількості, яка дорівнює ${#websites[@]} на момент часу ${now} є доступними. "
echo "Результати перевірки збережено у файл: $log_file"
