#!/usr/bin/env bash

Tag="Duo101"
dirs() {
	Var=$HERE/var
	Tmp=$HERE/tmp
	mkdir -p $Var $Tmp
}
runablec() {
	chmod +x gold
	HERE=$PWD
	THERE=$(echo $PATH | gawk -F: '{print $1}')
	sudo ln -sf $HERE/gold $THERE/gold
}
pathadd() {
    	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        	PATH="${PATH:+"$PATH:"}$1"
    	fi
}
vimrc() { cat <<-EOF
	autocmd BufEnter * silent! lcd %:p:h
	filetype plugin indent on
	set autoindent
	set background=light
	set backspace=indent,eol,start
	set backupdir^=$Tmp
	set ignorecase
	set incsearch
	set laststatus=2
	set matchtime=15
	set modelines=3
	set mouse=a
	set nocompatible
	set nohlsearch
	set number
	set ruler
	set scrolloff=3
	set showmatch
	set smartcase
	set splitbelow
	set syntax=on
	set title
	set visualbell
	syntax enable
	set statusline=%f\
	set statusline+=%2*\ %y\                   "FileType
	set statusline+=%4*\%{&ff}\                 "FileFormat (dos/unix..)
	set statusline+=%8*\ %=\ %l/%L\              "Rownumber/total (%)
	set statusline+=%9*\ %03c\                   "Colnr
	set statusline+=%0*\ \ %m%r%w\ %P\           "Modified? Readonly? Top/bot.
EOF
}
gitignore() { cat<<-EOF
	$Tmp
	$Var
	### Vim ###
	[._]*.s[a-w][a-z]
	[._]s[a-w][a-z]
	*.un~
	Session.vim
	awkprof.out
	awkvars.out
	.netrwhist
	*~
	EOF
}
#--- tag line stuff
_c1="\[\033[01;32m\]"
_c2="\[\033[01;34m\]"
_c3="\[\033[31m\]"
_c6="\033[33m"
_c5="\[\033[35m\]$"
_c0="\[\033[00m\]"
_c7="[\033]01;19\]"

here() { cd $1; basename "$PWD"; }

PROMPT_COMMAND='echo -ne "${_c6}${Tag}> \033]0;$(here ../..)/$(here ..)/$(here .)\007";PS1="${_c1} $(here ../..)/$_c2$(here ..)/$_c3$(here .) ${_c6}\!>${_c0}\e[m "'

alias ll='ls -GF'
alias vi="`which vim` -u .vimrc "

dirs
runnable
if [ ! -f .gitignore ]; then gitignore > .gitignore; git add .gitignore; fi
if [ ! -f .vimrc ];     then vimrc     > .vimrc;     git add .vimrc;     fi

pathadd $PWD
