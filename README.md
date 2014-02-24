# NAME

colorize - colorize lines from stdin

# SYNOPSIS

__colorize.pl__ --green INFO --yellow '\\bWARN(ING)?\\b' --red '(?^i:error)'
                   --bold --blue DEBUG --reverse --default TRACE

# DESCRIPTION

__colorize__ reads from stdin and applies ANSI color codes and attributes
like _reverse_ or _bold_ to lines matching a given regular expression.

Options are color names followed by a regular expression, attribute options
and options to control case sensitivity or what to colorize.

Each color option must follow a regex. If a line from stdin matches the
regex, the line is printed in the colors and with the attributes given
before the regex. The matching is done in the order given on the command
line, at the first successful match the line from stdin will be colorized
and printed to stdout.

# OPTIONS

## Attributes

- \--bold | -B
- \--dark | -D
- \--blink
- \--underline | -U
- \--underscore
- \--faint
- \--reverse | -R

## Colors

Known color names are

- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white

Color options are either _\--NAME_ or _\--NAME1-on-NAME2_ with the NAMEs
being either one of the colors above or _bright-NAME_.

__NOTE__: each color option __must__ have a regular expression as argument.

To apply just attributes to a text matching a regular expression, use the
special color

- \--default

## Other options

- \--flush | -F

Immedeately flush buffers after writing one line

- \--no-case-sense | -i

Match case insensitive

- \--match-only | -M

Only apply the color and attribute options to that part of the line that
matches the text.

- \--all | -A

Same as above, but the color is applied to all ocurrences in the line, not
only the first

- \--line | -L

Color the full line, this is the default.

- \--config | -C SECTION

Read the options from ~/.colorize.ini's section SECTION. All keys are names
from command line options without the leading `--`. Example config:

    [diff]
    red = ^-
    green = ^\+
    yellow = ^@

Use with `colorize -C diff` and pipe a diff output to this...

# FILES

- ~/.colorize.ini

INI style file with options

# EXAMPLE

    colorize --reverse --match-only --default bar --red foo

That would reverse the charachters 'bar' and make the full line red if it
contains 'foo' (and not 'bar', which would match before).

# AUTHOR

Hanno Hecker <vetinari@ankh-morp.org>
