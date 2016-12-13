#! /bin/bash
#This script allows you to upgrade all your terminal tools modules to the latest version.
#NOTE that all modules will be upgraded to the latest version in their current branch.
#Later versions of the upgrade script could allow to upgrade to a specific branch or tag

echo "";
echo "Now updating all ttools modules...";


TTOOLSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )";

cd $TTOOLSDIR

for d in */ ; do
	echo '';
	echo Updating $d;
	cd $d;
	git fetch origin;
	git checkout master;
	git rebase origin/master;
	cd ..;
done

echo "";
echo "Done updating. You can now test, and commit the changes";