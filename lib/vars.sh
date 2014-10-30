#! /bin/bash
#This script gets the variables from ttools-config.yml


DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source $DIR/inc.sh;


#Finding the script's dir
#from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
#echo provided config file: $1;

#Reading configuration
#from http://stackoverflow.com/questions/5983558/reading-a-config-file-from-a-shell-script
CONFIGFILE="$BASEDIR/ttools-config.yml"
#
#echo $CONFIGFILE;
#
#sed '/^ *#/d;s/:/ /;' < "$CONFIGFILE" | while read key val
#do
#  str="$key='$val'"
#  #remove '"' on both sides (from http://askubuntu.com/questions/89995/bash-remove-first-and-last-characters-from-a-string)
#  echo "${str//\"/}"
#done


parse_yaml $CONFIGFILE



