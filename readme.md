QuicklookDot
============

This bundle allows you to conveniently preview [dot] files in a OS X Quick Look preview.

![screenshot]

Installation
------------

- The dot binary is a pre-requisite. Install it from <http://www.graphviz.org>, or using [Homebrew][homebrew]:
        
        brew install graphviz

- Download the current version of the plugin from the "[Releases]" section
- Copy the QuickLook plugin bundle with the `.qlgenerator` ending to the folder `~/Library/QuickLook` (Create the folder, if it does not exist)


Using the plugin
----------------

- You should be able to preview your `.dot` or `.gv` files using the space key in Finder.
- You also see a preview if your file is selected and if you are in column mode (⌘3).
- You can use a simple `HelloWorld.dot`

        digraph G{
        	Hello -> World
        	this -> is -> a -> test
        }


Development
-----------

Git repository: `git@github.com:besi/quicklook-dot.git`
         
Debugging

	defaults write -g QLEnableLogging YES
	
	# Create preview from the command line
	qlmanage -p ~/Dropbox/projects/OSX/quicklook-dot/sample.dot


Links
-----

- [DOT on Wikipedia][dot]
- [Graphviz DOT Gallery][graphvizgallery]
- quicklook-dot was inpired by [qlmarkdown]

[dot]: http://en.wikipedia.org/wiki/DOT_language     
[releases]: https://github.com/ytsutano/quicklook-dot/releases/
[screenshot]: screenshot.png
[qlmarkdown]: https://github.com/toland/qlmarkdown
[graphvizgallery]: http://graphviz.org/Gallery.php
[homebrew]: http://brew.sh
