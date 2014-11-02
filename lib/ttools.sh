#!/bin/sh
# The Terminal Tools Core File
# Acts as menu, and as shortcut handler


#getting all arguments
ALL_ARGS="$@";

#defining the module directory
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";
MODULEDIR="$BASEDIR/ttools-core";

#including libraries
source $MODULEDIR/lib/inc.sh;

#getting configuration variables
VARS="$MODULEDIR/lib/vars.sh"

#show variables:
#$VARS;

#evaluate variables:
eval `$VARS`

#print out all vars
#$VARS;




#Environments - define the ENV_ARRAY array
IFS=', ' read -a ENV_ARRAY <<< "$AvailableEnvironments"


#Script command
SCRIPT_COMMAND="./ttools";


#colors
NORMAL=`echo "\033[m"`
MENU=`echo "\033[36m"` #Blue
NUMBER=`echo "\033[33m"` #yellow
FGRED=`echo "\033[41m"`
RED_TEXT=`echo "\033[31m"`
ENTER_LINE=`echo "\033[33m"`


logo() {

	echo "Title Web Solution's${ENTER_LINE}"
	echo '  ______                    _             __   ______            __    '
	echo ' /_  __/__  _________ ___  (_)___  ____ _/ /  /_  __/___  ____  / /____'
	echo '  / / / _ \/ ___/ __ `__ \/ / __ \/ __ `/ /    / / / __ \/ __ \/ / ___/'
	echo ' / / /  __/ /  / / / / / / / / / / /_/ / /    / / / /_/ / /_/ / (__  ) '
	echo '/_/  \___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_/    /_/  \____/\____/_/____/  '
	echo '                                                                       '


}


show_mainmenu(){
	
	logo;
	
	echo "for ${NORMAL}$Projectname${NORMAL}"
	echo ''
	echo "${ENTER_LINE}Please choose a menu number and press ENTER.${NORMAL}"
	#echo "${MENU}***********************************************${NORMAL}"
	
	#Creating menu based on individual configuration
	iii=1;
	for i in {1..30}
	do
		title="Menu_Heading"$i"_Title"
		if [ "${!title}" != "" ]; then
			#echo ${!title}
			#echo ${!command}
			echo "\n${NUMBER}${!title}"
			
			for ii in {1..30}
			do
				title="Menu_Heading"$i"_Item"$ii"_Title"
				#command="Menu_Item"$i"_Command"
				if [ "${!title}" != "" ]; then
					#echo ${!title}
					#echo ${!command}
					echo "${MENU}${NUMBER} $iii)${MENU} ${!title}${NORMAL}"
					iii=$(($iii+1));
				fi
			done
		fi
	done


	#echo "${MENU}${NUMBER} x)${MENU} Exit ${NORMAL}"

	echo ""
	#echo "${MENU}***********************************************${NORMAL}"
	echo "${RED_TEXT}NOTE: ${ENTER_LINE}This should be run from your LOCAL environment. ${NORMAL}"
	read opt
}

mainmenu_input() {
	clear
	show_mainmenu
	while [ opt != '' ]
		do
		if [[ $opt = "" ]]; then 
				exit;
		else
			case $opt in
			#1) clear;
			#option_picked "Option 1 Picked";
			##sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte
			#echo test tst
			#show_menu;
			#;;
	
			x)exit;
			;;
	
			\n)exit;
			;;
	
			*)clear;
	
			#Configured menu items
			iii=1;
			for i in {1..30}
			do
				title="Menu_Heading"$i"_Title"
				if [ "${!title}" != "" ]; then
					
					for ii in {1..30}
					do
						title="Menu_Heading"$i"_Item"$ii"_Title"
						if [ "${!title}" != "" ]; then

							if (( $iii == $opt ))
							then
								#Executing the configured command
								command="Menu_Heading"$i"_Item"$ii"_Command"
								execute_start_note "${!title}";

								execCmd="$BASEDIR/${!command}" 
								
								echo $execCmd;
								$execCmd;
								
								execute_end_note "${!title}";
								read -p "Press enter for menu...";
								mainmenu_input;
							fi	
						
						
						
							iii=$(($iii+1));
						fi
					done
				fi
			done

			exit;
			;;
		esac
	fi
	done

}

#This is what's shown whenever a command from the menu is executed
execute_start_note() {
	echo "${MENU}***********************************************${NORMAL}"
	echo "${MENU}Executing ${NORMAL}$1 ${MENU}...${NORMAL}"
	#echo "Direct command: $SCRIPT_COMMAND $ALL_ARGS"
	echo "${MENU}***********************************************${NORMAL}"

}
#This is what's shown whenever a command from the menu has finished executing
execute_end_note() {
	echo "${MENU}***********************************************${NORMAL}"
	echo "${MENU}${NORMAL}$1 ${MENU}has finished executing.${NORMAL}"
	echo "${MENU}***********************************************${NORMAL}"

}


mainmenu_input;



