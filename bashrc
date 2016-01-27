# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Aliases
alias ccat='pygmentize -g'
alias ducks='du -cks * | sort -rn | head'
alias igrep='grep -i'
alias jsonpp='python -mjson.tool | pygmentize -l json'
alias h1='history 10'
alias h2='history 20'
alias h3='history 30'
alias ll='ls -l'
alias marcdumphex='marcdump --hex --quiet --nostats'
alias mountp='mount | column -t'
alias nl2space="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{ }, @F) , qq{\n};}' "
alias nl2,="perl -ne 'push @F, \$_; END { chomp @F; print join(qq{,}, @F) , qq{\n};}' "
alias pdfnc='pdf-nocover'
alias php-man=pman
alias t='todo.sh'
alias vi='vim'
alias xml='xmlstarlet'
alias xmlpp='xmlstarlet format --indent-tab'

# Functions
## Tools
function _cheat_autocomplete {
    sheets=$(cheat -l | cut -d' ' -f1)
    COMPREPLY=()
    if [ $COMP_CWORD = 1 ]; then
    COMPREPLY=(`compgen -W "$sheets" -- $2`)
    fi
}

complete -F _cheat_autocomplete cheat
complete -F _todo t

## Misc

# i-search Ctrl+s
stty -ixon

# http://www.commandlinefu.com/commands/view/13193/pretty-print-sql-query-with-python-in-one-line
function sqlpp()
{
  echo ${1} | python -c "import sys; import sqlparse; print sqlparse.format(sys.stdin.read(), reindent=True, keyword_case='upper')"
}

# http://superuser.com/questions/71588/how-to-syntax-highlight-via-less
function cless () {
    pygmentize -f terminal "$1" | less -R
}

# http://stackoverflow.com/questions/13596531/how-to-search-for-non-ascii-characters-with-bash-tools
function nonascii() { LANG=C grep --color=always '[^ -~]\+'; }
