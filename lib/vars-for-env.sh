#! /bin/bash
#Getting environment specific variables

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source $DIR/inc.sh;

ENV=$1
#echo $ENV;

env_check $ENV



VARS="$DIR/vars.sh"

#show variables:
#$VARS;

#evaluate variables:
eval `$VARS`


PRE="Environments_$ENV"

host=$PRE"_Host"
sshuser=$PRE"_Sshuser"
repodir=$PRE"_Repodir"
domain=$PRE"_Domain"
sshport=$PRE"_Sshport"
composerpath=$PRE"_Composerpath"
phppath=$PRE"_PhpPath"



#These are the variables that are exported:

echo "ENV_HOST=${!host}"
echo "ENV_SSHUSER=${!sshuser}"
echo "ENV_REPODIR=${!repodir}"
echo "ENV_SSHPORT=${!sshport}"
echo "ENV_Domain=${!domain}"
#php path
if [[ -z "${!phppath}" || "${!phppath}" == "" ]]; then
	echo "ENV_PHPPATH=php"
	ENV_PHPPATH="php";
else
	echo "ENV_PHPPATH=\"${!phppath}\""
	ENV_PHPPATH="${!phppath}";
fi
#composer path
if [[ -z "${!composerpath}" || "${!composerpath}" == "" ]]; then
	echo "ENV_COMPOSERPATH=composer"
else
	#this creates the full composer path - with the php command
	echo "ENV_COMPOSERPATH=\"$ENV_PHPPATH ${!composerpath}\""
fi




# Based on these, the folling variables are defined
if [ "${!host}" != "" ]; then

	#defining custom_sshconnectionstr
	PORTSTR="";
	RSYNCPORTSTR="";
	if [ "${!sshport}" != "" ]; then
	  PORTSTR="-p ${!sshport}"
	  RSYNCPORTSTR="ssh -p ${!sshport}";
	fi
	echo "ENV_CUSTOM_SSHPORTSTR=\"$PORTSTR\"";
	echo "ENV_CUSTOM_RSYNCPORTSTR=\"$RSYNCPORTSTR\"";

	#custom connection string that respects different ports
	CUSTOM_SSHCONNECTIONSTR="$PORTSTR ${!sshuser}@${!host}";
	echo "ENV_CUSTOM_SSHCONNECTIONSTR=\"$CUSTOM_SSHCONNECTIONSTR\"";
	


fi
