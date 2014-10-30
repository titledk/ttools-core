#!/bin/sh
# The Terminal Tools Core File
# Acts as menu, and as shortcut handler


#getting all arguments
ALL_ARGS="$@";

#defining the module directory
MODULEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )";

#including libraries
source $MODULEDIR/lib/inc.sh;

#getting configuration variables
VARS="$MODULEDIR/lib/vars.sh"

#show variables:
#$VARS;

#evaluate variables:
eval `$VARS`


#Environments
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
	echo "${ENTER_LINE}Please choose environment and press ENTER.${NORMAL}"
	#echo "${MENU}***********************************************${NORMAL}"
	
	

	i=1;

	for element in "${ENV_ARRAY[@]}"
	do
		#echo "${MENU}${NUMBER} $i)${MENU} $element (${NORMAL}$SCRIPT_COMMAND menu $element${MENU})${NORMAL}"
		echo "${MENU}${NUMBER} $i)${MENU} $element${NORMAL}"
		
		let i++;
	done


	echo "${MENU}${NUMBER} x)${MENU} Exit ${NORMAL}"

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
	
			#Environments
			i=1
			for element in "${ENV_ARRAY[@]}"
			do
	
				if (( $i == $opt ))
				then
					CMD="$SCRIPT_COMMAND menu $element";
					execute_note "executing $CMD...";
					$CMD;
				fi
				
				let i++;
			done

			exit;
			;;
		esac
	fi
	done

}

show_envmenu(){
	
	logo;
	
	echo "for ${NORMAL}$Projectname ($1) ${NORMAL}"
	echo ''
	echo "${ENTER_LINE}Press ENTER to deploy directly, or enter an option and press ENTER." 
	echo ""
	#echo "${MENU}***********************************************${NORMAL}"
	
	
	#echo "${MENU}${NUMBER} ENTER)${MENU} Deploy${NORMAL}"
	echo "${MENU}${NUMBER} push)${MENU} Push & Deploy${NORMAL}"
	#echo "${MENU}${NUMBER} sudo)${MENU} Sudo Deploy (clears cache, rebuilds database, updates Composer...)${NORMAL}"
	echo "${MENU}${NUMBER} sudo)${MENU} Sudo Deploy${NORMAL}"
	echo "${MENU}${NUMBER} sudo push)${MENU} Push & Sudo Deploy${NORMAL}"
	echo "${MENU}${NUMBER} ssh)${MENU} SSH to $1 environment${NORMAL}"
	
	echo "";
	
	echo "${MENU}${NUMBER} shortcuts)${MENU} Back to Main menu${NORMAL}"
	echo "${MENU}${NUMBER} back)${MENU} Back to Main menu${NORMAL}"

	echo "";

	#echo "${MENU}***********************************************${NORMAL}"
	echo "${RED_TEXT}Press x and ENTER to exit. ${NORMAL}"
	echo "${RED_TEXT}NOTE: ${ENTER_LINE}This should be run from your LOCAL environment. ${NORMAL}"
	
	read opt
}

envmenu_input() {
	clear
	show_envmenu $1
	while [ opt != '' ]
		do
		if [[ $opt = "" ]]; then
		 
		 	#deploy by default
			CMD="$SCRIPT_COMMAND $1";
			execute_note "$CMD";
			$CMD;
			exit;
		else
			case $opt in
			x)exit;
			;;
	
			\n)exit;
			;;
			
			ENTER)
			CMD="$SCRIPT_COMMAND $1";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
			push)
			CMD="$SCRIPT_COMMAND push $1";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
			sudo)
			CMD="$SCRIPT_COMMAND sudo $1";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
			"sudo push")
			CMD="$SCRIPT_COMMAND sudo push $1";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
			"ssh")
			CMD="$SCRIPT_COMMAND ssh $1";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
			
			"shortcuts")
			echo ""
			echo 'Shortcuts:'
			echo "${ENTER_LINE}Deploy to $1 environment: ${NORMAL}$SCRIPT_COMMAND $1"
			echo "${ENTER_LINE}Sudo Push & deploy: ${NORMAL}$SCRIPT_COMMAND sudo push $1"
			echo ""
			echo "${ENTER_LINE}Call this menu directly: ${NORMAL}$SCRIPT_COMMAND menu $1"
			$CMD;
			exit;
			;;
			
			"back")
			CMD="$SCRIPT_COMMAND menu";
			execute_note "$CMD";
			$CMD;
			exit;
			;;
			
	
			*)clear;

			exit;
			;;
		esac
	fi
	done

}



start_message() {
	#echo "${MENU}***********************************************${NORMAL}"
	echo $1
	#echo "Direct command: $SCRIPT_COMMAND $ALL_ARGS"
	echo "${MENU}***********************************************${NORMAL}"
	echo "";
}

end_message() {
	echo "";
	echo "${MENU}***********************************************${NORMAL}"
	echo $1 
	echo "${MENU}***********************************************${NORMAL}"
}

execute_note() {
	echo "${MENU}***********************************************${NORMAL}"
	echo "${MENU}Executing ${NORMAL}$1 ${MENU}...${NORMAL}"
	#echo "Direct command: $SCRIPT_COMMAND $ALL_ARGS"
	echo "${MENU}***********************************************${NORMAL}"

}




#If the script is called only with menu, show the menu

if [ $1 ] && [ $1 == 'menu' ] && [ -z $2 ]
then
	mainmenu_input;
fi





#Checking if any parameters have been supplied
#if not, show the menu
if [ -n "$1" ]
then

	#we expect the script to be called with the environment
	#echo 'we do some execution:'
	#$MODULEDIR/local/deploy.sh $1
	

	# Reset all variables that might be set
	verbose=0
	
	MODE_SSH=0
	MODE_PUSH=0
	MODE_SUDO=0
	MODE_MENU=0
	ENV=
	
	
	
	# handling command line arguments, see http://mywiki.wooledge.org/BashFAQ/035
	while :; do
	
		#echo $1;
	
		#Environments
		i=1
		
		envtest=$1
		
		#Environments
		i=1
		for element in "${ENV_ARRAY[@]}"
		do
			if [ $element == $1 ]
			then
				ENV=$element;
				#CMD="$SCRIPT_COMMAND $element";
				#echo "executing $CMD...";
				#$CMD;
			fi
			
			let i++;
		done
	
	
		case $1 in
		
			ssh)
				MODE_SSH=1
				;;
			sudo)
				MODE_SUDO=1
				;;
			push)
				MODE_PUSH=1
				;;
			menu)
				MODE_MENU=1
				;;
		
			-h|-\?|--help)   # Call a "show_help" function to display a synopsis, then exit.
				show_help
				exit
				;;
			-v|--verbose)
				verbose=$((verbose + 1)) # Each -v argument adds 1 to verbosity.
				;;
			--)              # End of all options.
				shift
				break
				;;
			-?*)
				printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
				;;
			*) # Default case: If no more options then break out of the loop.
				break
		esac
	
		shift
	done
	
	
	
	#echo ssh: $MODE_SSH;
	#echo sudo: $MODE_SUDO;
	#echo push: $MODE_PUSH;
	#echo menu: $MODE_MENU;
	#
	#exit;
	
	
	if [ -z "$ENV" ]; then
		echo "You need to set one of your environments."
		exit;
		
	else 

		#Environment menu
		#Showing options for the environment
		if [ $MODE_MENU -eq 1 ]
		then
			envmenu_input $ENV;
			exit;
		fi


		#If "push" is added, the first thing to do is to push the repo
		if [ $MODE_PUSH -eq 1 ]
		then
			#It's the branch that we're currently on that will be pushed
			echo "pushing git repository...";
			$MODULEDIR/local/git-push.sh
		fi
		
		
		# Based on the different modes we'll perform different actions
		if [ $MODE_SSH -eq 1 ]
		then
			start_message "Connecting via SSH to $ENV (disconnect by typing \"exit\")";
			$MODULEDIR/local/ssh.sh $ENV;
			end_message "Welcome back to your local machine!";
		elif [ $MODE_SUDO -eq 1 ]
		then
			start_message "Deploying $ENV (sudo mode - you will be prompted for a password)";
			$MODULEDIR/local/deploy.sh $ENV sudo;
			end_message "Sudo deployment has finished executing";
		else
			start_message "Deploying $ENV";
			$MODULEDIR/local/deploy.sh $ENV;
			end_message "Deployment has finished executing";
			
		fi
	fi


	
else
	
	if [ ${#ENV_ARRAY[@]} -eq 1 ]
	then
		#When there's only 1 active environment, there's no need to show the main menu
		CMD="$SCRIPT_COMMAND menu ${ENV_ARRAY[0]}";
		#echo "executing $CMD...";
		$CMD;
	else
		mainmenu_input;
	fi
	
fi



###The script can be called with a few shortcuts
#case "$1" in
#
#help)  echo "Help"
#	
#	;;
#
#Live) echo 'testing'
#
#
#	;;
#	
#*) echo "Please choose environment:"
#	
#	
#	;;
#esac
#

