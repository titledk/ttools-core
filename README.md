# Terminal Tools

_by Title Web Solutions / Anselm Christophersen_


A helper for running local command line scripts.

## Idea

The idea behind _Terminal Tools_ is to have a common set of easy-to-use
tools whenever starting on a **Web Development Project**.    
Thus, _Terminal Tools_ will be developed to be web development specific, but
could also find usage for other use cases.

## How To Use

_Terminal Tools_ will be installed in your repository root.    
Once installed, run `./ttools`, and you'll be presented with a list of options.    

The `ttools-core` module only contains libraries, and menu. You'll need additional
modules for the actual functionality. We're planning to port the following
functionality over from already existing code, but there should be many more use cases:

* easy deployment of your SilverStripe sites
* one-click sync of your local site with your production site
* git/composer/silversmith helpers


## SilverStripe specific

By reading this you might see that much of what we plan to use this tool for is
SilverStripe specific. That's because we love and endorse SilverStripe, but
the core of this module is deliberately decoupled to allow you to use it with any
framework or scripting language. It's written in pure bash.


## Installation

	git submodule add git://github.com/titledk/ttools-core.git

