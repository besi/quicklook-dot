quicklook-dot
=============

This bundle allows you to conveniently preview [dot][dot] files in a OSX [QuickLook][QuickLook] preview.

Installation
------------

- The dot binary is a pre-requisite. Install it from <http://www.graphviz.org>
- Make sure that the dot binary is available in the shell environment. You can create a symbolic link like so:

		ln -s `which dot` /usr/bin/dot

- Copy the QuickLook plugin bundle (.qlgenerator ending) to the folder ~/Library/QuickLook


Using the plugin
----------------

- You should be able to preview your dot files using the space key in Finder.
- You also see a preview if your file is selected and if you are in column mode (⌘+ 3).
- You can use a simple `HelloWorld.dot`

		digraph G{
			Hello -> World
		}


Development
-----------

Git repository: `git@github.com:besi/quicklook-dot.git`
         
Debugging

	defaults write -g QLEnableLogging YES
	
	# Create preview from the command line
	qlmanage -p ~/Dropbox/projects/quicklook-dot/test.gurgelidot


Links
-----

- [DOT on Wikipedia](http://en.wikipedia.org/wiki/DOT_language)
- [Graphviz DOT Gallery](http://graphviz.org/Gallery.php)
- quicklook-dot was inpired by [qlmarkdown](https://github.com/toland/qlmarkdown)

[dot]: http://en.wikipedia.org/wiki/DOT_language     
[QuickLook]: http://www.apple.com/macosx/what-is-macosx/quick-look.html    
                                                                        
