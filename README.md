# Terminal Tools

_by Title Web Solutions / Anselm Christophersen_


A helper for running local command line scripts.

## Idea

The idea behind _Terminal Tools_ is to have a common set of easy-to-use
tools whenever starting on a **Web Development Project**.    
It's centered around a `yml` file that contains project-specific configurations,
and libraries/menu, that leverage these.    
You can configure all kind of things here - the basic configuration is server-data,
which allows you to have your dev/test/live server-data in one place, as well as having
easy means of connecting to them via SSH.    
Thus, _Terminal Tools_ will be developed to be web development specific, but
could also find usage for other use cases.

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

