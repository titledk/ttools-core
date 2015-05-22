# Terminal Tools

_by Title Web Solutions / Anselm Christophersen_


_Terminal Tools_ is a menu based set of easy-to-use command line scripts for working on    
**Web Development**- and other projects. You can apply anywhere you need a light weight,
configurable menu for your bash scripts.
_Terminal Tools_ is easy to extend (through modules) and 
amend (through configuration) - both through global project settings, and environment specific settings 
(e.g. Live/Test/Dev servers), all done through one `yml` configuration file.


![Main menu](docs/img/ttools.png)


## Installation

In order to best get up and running with a full feature set, you should be using a module collection,
like these:

* [Terminal Tools for SilverStripe](https://github.com/titledk/ttools-silverstripe), or
* [Terminal Tools for Wordpress](https://github.com/CPHCloud/ttools-wordpress) (note that the wordpress version needs to be updated)

You can also install only the core like this:

	git submodule add git://github.com/titledk/ttools-core.git ttools/core;./ttools/core/_install.sh;

That will install a basic configuration file for you.

## Configuration example

A standard config will be set up for you on install. Here's an example of how this might look:

	Projectname: "My Project"
	Environments:
		Live:
			Host: "myserver.com"
			Sshuser: "myuser"
			Repodir: "/var/git-repos/mysite"
			Sshport: ""
			Composerpath: ""
			PhpPath: ""
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
Once installed, run `./tt`, and you'll be presented with a list of options.

The `ttools-core` module contains the very basics - libraries, menu, and a means
to easily ssh into your specific servers.    
Everything else can be added via modules.



## Roadmap/Ideas/Plans

Future plans with the module are many. You can find them here:
<https://github.com/titledk/ttools-core/issues>.

If there's anything specific you'd like to be done (fast), post a bounty on it!
We support bounties using [Bountysource](https://www.bountysource.com).


