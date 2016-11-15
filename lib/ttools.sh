#!/bin/bash
# The Terminal Tools Core File
# Acts as menu, and as shortcut handler



#getting all arguments
ALL_ARGS="$@";

#defining the module directory
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. && pwd )";
CURRENT_BRANCH="$(git branch | sed -n '/\* /s///p')";

MODULEDIR="$BASEDIR/ttools/core";

cd $MODULEDIR;
REVISION=$(git log -1 --pretty=format:'%h' --abbrev-commit)
REVISIONMSG=$(git log -1 --pretty=format:'%s' --abbrev-commit)
REVISIONDATE=$(git log -1 --pretty=format:'%ci' --abbrev-commit)

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






#echo -e "${FG_RED}${BG_GREEN}${FS_BOLD}Hello world!${RESET_ALL}"

#exit;



logo() {

#	echo -e "Title Web Solution's ${FG_YELLOW}${FS_BOLD}"
#	echo '  ______                    _             __   ______            __    '
#	echo ' /_  __/__  _________ ___  (_)___  ____ _/ /  /_  __/___  ____  / /____'
#	echo '  / / / _ \/ ___/ __ `__ \/ / __ \/ __ `/ /    / / / __ \/ __ \/ / ___/'
#	echo ' / / /  __/ /  / / / / / / / / / / /_/ / /    / / / /_/ / /_/ / (__  ) '
#	echo '/_/  \___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_/    /_/  \____/\____/_/____/  '
#	echo -e "                                                                        ${RESET_ALL}"

	echo -e "Title Web Solution's ${FG_YELLOW}${FS_BOLD}"
	echo ' ______              _           __  ______          __  '
	echo '/_  __/__ ______ _  (_)__  ___ _/ / /_  __/__  ___  / /__'
	echo " / / / -_) __/  ' \/ / _ \/ _ \`/ /   / / / _ \/ _ \/ (_-/"
	echo '/_/  \__/_/ /_/_/_/_/_//_/\_,_/_/   /_/  \___/\___/_/___/'
	echo -e "                                                                        ${RESET_ALL}"
}


show_mainmenu(){
	
	logo;
	
	echo -e "for ${FG_YELLOW}${FS_BOLD}$Projectname ${RESET_ALL}($CURRENT_BRANCH)"
	echo ''
	echo "Please choose a menu number and press ENTER."
	
	#Creating menu based on individual configuration
	iii=1;
	for i in {1..30}
	do
		title="Menu_Heading"$i"_Title"
		if [ "${!title}" != "" ]; then
			#echo ${!title}
			#echo ${!command}
			
			echo ''
			echo -e "${FG_YELLOW}${FS_BOLD}${!title} ${RESET_ALL}"
			
			for ii in {1..30}
			do
				title="Menu_Heading"$i"_Item"$ii"_Title"
				#command="Menu_Item"$i"_Command"
				if [ "${!title}" != "" ]; then
					#echo ${!title}
					#echo ${!command}
					echo " $iii) ${!title}"
					iii=$(($iii+1));
				fi
			done
		fi
	done


	#echo "${MENU}${NUMBER} x)${MENU} Exit ${NORMAL}"

	echo ""
	echo "NOTE: This should be run from your LOCAL environment."
	echo "ttools core v. $REVISIONDATE (#$REVISION)"
	echo "Press \"U\" to update ttools libraries."
	read opt
}

update() {
	clear
	$BASEDIR/ttools/core/local/upgrade.sh
	read -p "Press enter for menu...";
	mainmenu_input;
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

			u)update;
			;;
			U)update;
			;;

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

								echo -e "${FG_BLUE}${FS_BOLD}***********************************************${RESET_ALL}"
								echo "Executing: ${!title}..."
								echo "Command:   ${!command}";
								echo -e "${FG_BLUE}${FS_BOLD}***********************************************${RESET_ALL}"

								execCmd="$BASEDIR/${!command}" 
								
								echo $execCmd;
								$execCmd;

								echo -e "${FG_BLUE}${FS_BOLD}***********************************************${RESET_ALL}"
								echo "${!title} has finished executing."
								echo -e "${FG_BLUE}${FS_BOLD}***********************************************${RESET_ALL}"

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

mainmenu_input;



