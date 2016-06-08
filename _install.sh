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


echo "";

echo "Please enter the project name:"
read PROJECTNAME



#creation of config, based on input

echo "Projectname: \"$PROJECTNAME\"
Environments:
  Live:
    #required
    Host: \"\"
    Sshuser: \"\"
    Repodir: \"\"
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
      Command: \"ttools/core/local/ssh.sh Live\"
" > ttools/config.yml;


echo "#!/bin/sh
./ttools/core/lib/ttools.sh \"\$@\"" > tt;
chmod u+x tt;

echo "";
echo "Installation is done. You can now run Terminal Tools by running \"./tt\"";
echo "Remember to commit the changes to your repository."
echo ""

echo "${MENU}***********************************************${NORMAL}"

echo ""
