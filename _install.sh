#! /bin/sh

#colors
NORMAL=`echo "\033[m"`
MENU=`echo "\033[36m"` #Blue
NUMBER=`echo "\033[33m"` #yellow
FGRED=`echo "\033[41m"`
RED_TEXT=`echo "\033[31m"`
ENTER_LINE=`echo "\033[33m"`


echo "${ENTER_LINE} _   _ _   _          _ _     "
echo '| |_(_) |_| |___   __| | |__  '
echo '|  _| |  _| / -_)_/ _` | / /  '
echo " \__|_|\__|_\___(_)__,_|_\_\  "
echo ''
echo "Terminal Tools Installer"
echo ''    
echo "${MENU}***********************************************${NORMAL}"



#cd ../..;

echo "Welcome to the Terminal Tools Installer";
echo "";
echo "Now creating your config file.";
echo "This assumes you've already got a server set up."; 
echo "If you don't have a server set up yet, you can just enter expected information";
echo "- you can always change this in the config later.";



echo "";

echo "Please enter the project name:"
read PROJECTNAME


echo "Please enter the host name of your server:"
read HOST

echo "Please enter your SSH user:"
read SSHUSER

echo "Please enter the path that your repository is checked out to on the server:"
read REPODIR



#creation of config, based on input

echo "Projectname: \"$PROJECTNAME\"
AvailableEnvironments: \"Live, Test, Dev\"
Environments:
  Live:
    #required
    Host: \"$HOST\"
    Sshuser: \"$SSHUSER\"
    Repodir: \"$REPODIR\"
    #additional settings
    Domain: \"\"
    Sshport: \"\"
    Composerpath: \"\"
    PhpPath: \"\"
  Test:
    #here goes data for a test server
  Dev:
    #here goes data for dev server - you can add as many servers as you want
Menu:
  Heading1:
    Title: Live Site
    Item1:
      Title: SSH Live Site
      Command: \"ttools-core/local/ssh.sh Live\"
" > ttools/config.yml;


#creating the "deploy" script, and setting permissions

#It'll create a file with the following contents:
##!/bin/sh
#./ttools-core/lib/ttools.sh "$@"


echo "#!/bin/sh
./ttools/core/lib/ttools.sh \"\$@\"" > tt;
chmod u+x tt;

echo "";
echo "Installation is done. You can now run Terminal Tools by running \"./tt\"";
echo "Remember to commit the changes to your repository."
echo ""

echo "${MENU}***********************************************${NORMAL}"

echo ""