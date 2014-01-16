# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# OpenCL headers + object's
OCL_INC="/usr/include/CL"
OCL_LIB="/usr/lib"

##
## gcc -c -I$(OCL_INC) file.cpp -o file.o
## gcc -L$(OCL_LIB) -lOpenCL file.o -o main
##

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
 
# Bug with screen hanging on using VIM-IPython "IDE"
# to unmap ctrl-s
stty stop undef

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi


if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Shortcuts for adb android on computer --To work from any directory
# Also includes copying adb to /usr/bin
export PATH=${PATH}:/home/synod/adt-android/sdk/tools
export PATH=${PATH}:/home/synod/adt-android/sdk/platform-tools

# activator - typesafe
export PATH=${PATH}:/usr/lib/activator/

# export PATH=${PATH}:/usr/lib/coffee/bin

# Play-Framework Hack
# alias play-framework='/usr/lib/play-2.0/play'

# Tweak for sl --the train animation :)
# alias sl='sl -l'
# alias LS='LS -l'

# virtualenv environments Juma Ian
# alias synod_virtualenv='source /home/synod/.virtualenvs/android_juma/bin/activate'
# alias synod_android='source /home/synod/.virtualenvs/synod_android2/bin/activate'
alias boto='source /home/synod/.virtualenvs/boto/bin/activate'
# deactivate -command to deactivate

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/bin/lein:$PATH"

# Bash-it export JUMA IAN
#export BASH_IT=$HOME/.bash_it

# Ian Juma CD to flask-apps
# cd ~/Desktop/android_python_django/flask_apps
 
# Load RVM, if you are using it

# Go root
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin

#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
# export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
#export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='bobby'
# bobby -theme 1

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
#export EDITOR="/usr/bin/vim"
#export GIT_EDITOR='/usr/bin/vim'

# Set the path nginx
#export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
#unset MAILCHECK


# Change this to your console based IRC client of choice.

#export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

#export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
#source $BASH_IT/bash_it.sh

# For python brew --config
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

export WORKON_HOME="~/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# Set JAVA_HOME path --Juma
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export GOPATH=$HOME/go

export PATH=$PATH:/usr/lib/google_appengine
export PATH=$PATH:/usr/lib/neo4j-1.9.4/bin

alias gremlin="/usr/lib/gremlin/bin/gremlin.sh"



# Apparix bash fnctions
function to () {
  if test "$2"; then
    cd "$(apparix --try-current-first -favour rOl "$1" "$2" || echo .)"
  elif test "$1"; then
    if test "$1" == '-'; then
      cd -
    else
      cd "$(apparix --try-current-first -favour rOl "$1" || echo .)"
    fi
  else
    cd $HOME
  fi
}
function bm () {
  if test "$2"; then
    apparix --add-mark "$1" "$2";
  elif test "$1"; then
    apparix --add-mark "$1";
  else
    apparix --add-mark;
  fi
}
function portal () {
  if test "$1"; then
    apparix --add-portal "$1";
  else
    apparix --add-portal;
  fi
}
# function to generate list of completions from .apparixrc
function _apparix_aliases ()
{ cur=$2
  dir=$3
  COMPREPLY=()
  nullglobsa=$(shopt -p nullglob)
  shopt -s nullglob
  if let $(($COMP_CWORD == 1)); then
    # now cur=<apparix mark> (completing on this) and dir='to'
    # Below will not complete on subdirectories. swap if so desired.
    # COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | grep "j,.*$cur.*," | cut -f2 -d, ) )
    COMPREPLY=( $( (cat $HOME/.apparix{rc,expand} | grep "\<j," | cut -f2 -d, ; ls -1p | grep '/$' | tr -d /) | grep "\<$cur.*" ) )
  else
    # now dir=<apparix mark> and cur=<subdirectory-of-mark> (completing on this)
    dir=`apparix --try-current-first -favour rOl $dir 2>/dev/null` || return 0
    eval_compreply="COMPREPLY=( $(
      cd "$dir"
      \ls -d $cur* | while read r
      do
        [[ -d "$r" ]] &&
        [[ $r == *$cur* ]] &&
          echo \"${r// /\\ }\"
      done
    ) )"
  eval $eval_compreply
  fi
  $nullglobsa
  return 0
}
# command to register the above to expand when the 'to' command's args are
# being expanded
complete -F _apparix_aliases to
