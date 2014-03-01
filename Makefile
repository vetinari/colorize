
doc:
	perl -MPod::Markdown -e '$$p=Pod::Markdown->new; $$p->parse_from_filehandle(\*STDIN); print $$p->as_markdown' < colorize > README.md

diff:
	git diff | ./colorize -f ./colorize.ini -C diff | less -R
