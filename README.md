# Terminal Tools

_by Title Web Solutions / Anselm Christophersen_


A helper for running local command line scripts.    

**NOTE: THIS IS WORK IN PROGRESS/PROOF OF CONCEPT**    
**API/CONFIG SYSTEM MAY CHANGE DRASTICALLY**


## Idea

The idea behind _Terminal Tools_ is to have a common set of easy-to-use
tools whenever working on a **Web Development Project**.

It should be the goto-toolbox for any commandline-related tasks - with
all project-specific configuration done in one central `yml` file.    
Additionally menu/used scripts are easily customizeable in the config on
a per-project basis.

![Main menu](docs/img/ttools.png)


## Configuration example

A standard config will be set up for you on install. Here's an example of how this might look:

	Projectname: "My Project"
	Environments:
		Live:
			Host: "mysite.com"
			Sshuser: "myuser"
			Repodir: "/var/git-repos/mysite"
			Sshport: ""
			Composerpath: ""
		Test:
		#here goes data for a test server
		Dev:
		#here goes data for dev server - you can add as many servers as you want
	
	#this is the menu - you can configure it exactly like you like
	Menu:
		Item1:
			Title: SSH Live Site
			Command: "ttools-core/local/ssh.sh Live"
		Item2:
			Title: My specific command
			Command: "my-scripts/my-specific-command.sh"


## How To Use

_Terminal Tools_ will be installed in your repository root.    
Once installed, run `./ttools`, and you'll be presented with a list of options.    

The `ttools-core` module contains the very basics - libraries, menu, and a means
to easily ssh into your specific servers.    
The idea is for everything else to be added via modules. We're planning to port 
the following functionality over to modules from already existing code, 
but there should be many more use cases:

* easy deployment of your SilverStripe sites
* one-click sync of your local site with your production site
* git/composer/silversmith helpers


## SilverStripe specific

By reading this you might see that much of what we plan to use this tool for is
SilverStripe specific. That's because we love and endorse SilverStripe, but
the core of this module is deliberately decoupled to allow you to use it with any
framework or scripting language. It's written in pure bash.


## Installation

Run the following command. This module will be added to your project as a sub module.

	git submodule add git://github.com/titledk/ttools-core.git;./ttools-core/_install.sh;

