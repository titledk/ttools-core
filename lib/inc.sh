#! /bin/bash



#from http://stackoverflow.com/questions/5014632/how-can-i-parse-a-yaml-file-from-a-linux-shell-script
function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}


function env_check {
	if [ -z "${1}" ]; then
		echo "ENV is unset. Please add ENV to the url."
		exit;
	fi
}


#TODO: add the following functions
#* current branch



# Colors, for both OSX and Linux
#https://stackoverflow.com/questions/16843382/colored-shell-script-output-library/24991296#24991296
#https://gist.github.com/ian128K/39a490e5aa8d3bb77a8b

## Colours and font styles
## Syntax: echo -e "${FOREGROUND_COLOUR}${BACKGROUND_COLOUR}${STYLE}Hello world!${RESET_ALL}"
 
# Escape sequence and resets
ESC_SEQ="\x1b["
RESET_ALL="${ESC_SEQ}0m"
RESET_BOLD="${ESC_SEQ}21m"
RESET_UL="${ESC_SEQ}24m"
 
# Foreground colours
FG_BLACK="${ESC_SEQ}30;"
FG_RED="${ESC_SEQ}31;"
FG_GREEN="${ESC_SEQ}32;"
FG_YELLOW="${ESC_SEQ}33;"
FG_BLUE="${ESC_SEQ}34;"
FG_MAGENTA="${ESC_SEQ}35;"
FG_CYAN="${ESC_SEQ}36;"
FG_WHITE="${ESC_SEQ}37;"
FG_BR_BLACK="${ESC_SEQ}90;"
FG_BR_RED="${ESC_SEQ}91;"
FG_BR_GREEN="${ESC_SEQ}92;"
FG_BR_YELLOW="${ESC_SEQ}93;"
FG_BR_BLUE="${ESC_SEQ}94;"
FG_BR_MAGENTA="${ESC_SEQ}95;"
FG_BR_CYAN="${ESC_SEQ}96;"
FG_BR_WHITE="${ESC_SEQ}97;"
 
# Background colours (optional)
BG_BLACK="40;"
BG_RED="41;"
BG_GREEN="42;"
BG_YELLOW="43;"
BG_BLUE="44;"
BG_MAGENTA="45;"
BG_CYAN="46;"
BG_WHITE="47;"
 
# Font styles
FS_REG="0m"
FS_BOLD="1m"
FS_UL="4m"

#echo -e "${FG_RED}Hello world!${RESET_ALL}"