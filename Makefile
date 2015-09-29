requirements:
	brew install imagemagick

install: requirements
	ln -sf $(shell pwd)/workdoc.sh ~/Applications/bin/workdoc.sh
