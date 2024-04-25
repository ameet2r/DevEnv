#!/usr/bin/env bash

languages=$(echo "python react c cpp typescript javascript rust golang java scala html css" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "QUERY: " query

if echo "$languages" | grep -qs $selected; then
	action="curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
	action="curl cht.sh/$selected~$query | less"
fi

bash -c "$action"
