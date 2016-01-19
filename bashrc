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
#if [[ -n "${SSH_TTY}" ]] && [[ -z "${STY}" ]]; then
# screen -xRR
#fi

# i-search Ctrl+s
stty -ixon

# http://lifehacker.com/5535495/create-and-change-to-a-new-directory-in-one-command
mkcd () {
mkdir -p "$*"
cd "$*"
}

# http://www.linuxjournal.com/content/tech-tip-extract-pages-pdf 
function pdfpextr()
{
    # this function uses 3 arguments:
    #     $1 is the first page of the range to extract
    #     $2 is the last page of the range to extract
    #     $3 is the input file
    #     output file will be named "inputfile_pXX-pYY.pdf"
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -dFirstPage=${1} \
       -dLastPage=${2} \
       -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
       ${3}
}

function pdf-nocover()
{
    pdftk ${1} cat 2-end output ${1}.nocoverpage
    mv ${1}.nocoverpage ${1}
}

function sqlpp()
{
  echo ${1} | python -c "import sys; import sqlparse; print sqlparse.format(sys.stdin.read(), reindent=True, keyword_case='upper')"
}

# http://superuser.com/questions/71588/how-to-syntax-highlight-via-less
function cless () {
    pygmentize -f terminal "$1" | less -R
}

function _cheat_autocomplete {
    sheets=$(cheat -l | cut -d' ' -f1)
    COMPREPLY=()
    if [ $COMP_CWORD = 1 ]; then
  COMPREPLY=(`compgen -W "$sheets" -- $2`)                                                                                                                                                                         
    fi
}

function nonascii() { LANG=C grep --color=always '[^ -~]\+'; }
 
complete -F _cheat_autocomplete cheat
complete -F _todo t
