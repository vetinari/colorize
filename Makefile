
doc:
	pod2markdown colorize README.md

diff:
	git diff | ./colorize -f ./colorize.ini -C diff | less -R
