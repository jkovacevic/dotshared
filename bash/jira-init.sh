find_latest_name() {
    dir_name=$1
    file_name=$2
    n="1"
    FILE_NAME="${dir_name}/${file_name}${n}"
    while [ -f $FILE_NAME ]
    do
        n=$((n + 1))
        FILE_NAME=${dir_name}/${file_name}${n}
    done
}

if [ ! "$#" -eq 1 ]; then echo "Expecting Jira ticket number as CLI argument"; exit 1; fi;
ticket_num=$1
ticket_num=${ticket_num:l}

jira_home="$HOME/Jira"
file_name="record"
dir_name="$jira_home/$ticket_num"

if [ ! -d $dir_name ]; then
    echo "Creating directory $dir_name"
    mkdir -p $dir_name
fi;

find_latest_name $dir_name $file_name

if [ ! -f $FILE_NAME ]; then
    echo "Creating file: $FILE_NAME"
    echo "<Insert ticket title>:" > $FILE_NAME
    echo "https://jira.smaato.net/browse/${ticket_num}" >> $FILE_NAME
    subl $FILE_NAME
fi;