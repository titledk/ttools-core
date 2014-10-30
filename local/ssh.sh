#! /bin/bash
#This script logs you into a server, and changes the directory
#It needs the environment provided in the url ($1)
#E.g. Live, Test, Dev...

#Run like this:
#./ssh.sh Live


MODULEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )";

#Getting environment specific vars
VARS="$MODULEDIR/lib/vars-for-env.sh $1"


#evaluate variables:
eval `$VARS`


#SSH in, and change dir
#See also http://serverfault.com/questions/167416/change-directory-automatically-on-ssh-login
ssh $ENV_CUSTOM_SSHCONNECTIONSTR -t "cd $ENV_REPODIR; bash --login"