QuickLook dot
=============

Allow to quickly preview dot files from the finder

Installation
------------

- Copy the Quick look plugin to the folder ~/Library/QuickLook
- The dot binary is a pre-requisite. Install it from <http://www.graphviz.org>
- Make sure that the dot binary is available via `/usr/bin/dot`:

	ln -s `which dot` /usr/bin/dot
         

Debugging
---------

	defaults write -g QLEnableLogging YES
	
	# Create Preview
	qlmanage -p ~/Dropbox/projects/quicklook-dot/test.gurgelidot


Todos
-----

- Uplaod to Github
- Initial release