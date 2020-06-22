#!/usr/bin/zsh
jira_home="$HOME/Jira"
file_name="item1.md"
dir_name="$jira_home/$ticket_num"

for f in $(ls $jira_home); do
    fpath="$jira_home/$f/$file_name";
    if [[ -f $fpath ]]; then
        echo "$f - $(head -n 1 $fpath)";
    fi;
done;