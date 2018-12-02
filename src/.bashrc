#!/usr/bin/env bash

What="Duo101"
Who="Tim Menzies"
When=2018
HERE=$PWD
Var=$HERE/var
Tmp=$HERE/tmp

dirs() {
	mkdir -p $Var $Tmp
}
reload() {
	.  .bashrc
}
runable() {
	chmod +x gold
	#THERE=$(echo $PATH | gawk -F: '{print $1}')
	#sudo ln -sf $HERE/gold $THERE/gold
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
	set ruler
	set scrolloff=3
	set showmatch
	set smartcase
	set splitbelow
	set syntax=on
	set title
	set visualbell
	syntax enable
	set fillchars+=vert:\ 
	colorscheme torte
	hi VertSplit guifg=#202020 guibg=#202020 gui=NONE ctermfg=DarkGray ctermbg=DarkGray cterm=NONE
	EOF
}
license() { cat<<-EOF
	
	# LICENSE
	
	$What Copyright (c) $When, $Who
	All rights reserved, BSD 3-Clause License
	
	Redistribution and use in source and binary forms, with
	or without modification, are permitted provided that
	the following conditions are met:
	
	- Redistributions of source code must retain the above
	  copyright notice, this list of conditions and the 
	  following disclaimer.
	- Redistributions in binary form must reproduce the
	  above copyright notice, this list of conditions and the 
	  following disclaimer in the documentation and/or other 
	  materials provided with the distribution.
	- Neither the name of the copyright holder nor the names 
	  of its contributors may be used to endorse or promote 
	  products derived from this software without specific 
	  prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
	CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
	PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
	THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
	USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
	HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
	IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
	USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
	EOF
}
gitignore() { cat<<-EOF
	tmp/
	var/
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
requires() { cat<<-EOF
	gawk>4.2
	EOF
}
citation() { cat<<-EOF
	# CITATION
	
	Please cite this as
	
	- T. Menzies, "DUO 101: An Introduction to Data Mining using/used-by Optimizers", 2018
	
	Bibtex:
	
	    @misc{menzies19,
	      author="T.Menzies",
	      year=2019,
	      title="DUO 101: An Introduction to Data Mining using/used-by Optimizers"
	      note="Download from http://github.com/d-u-o/101"
	    }
	
	EOF
}
ensure() {
  if [ ! -f "$1" ]; then $2 > $1; git add $1; fi
}
ensure ../.gitignore    gitignore
ensure .vimrc        vimrc
ensure ../LICENSE.md license
ensure ../requirements.txt requires
ensure ../CITATION.txt citation

#--- tag line stuff
_c1="\[\033[01;32m\]"
_c2="\[\033[01;34m\]"
_c3="\[\033[31m\]"
_c6="\033[33m"
_c5="\[\033[35m\]$"
_c0="\[\033[00m\]"
_c7="[\033]01;19\]"

here() { cd $1; basename "$PWD"; }

PROMPT_COMMAND='echo -ne "${_c6}${What}> \033]0;$(here ../..)/$(here ..)/$(here .)\007";PS1="${_c1} $(here ../..)/$_c2$(here ..)/$_c3$(here .) ${_c6}\!>${_c0}\e[m "'

alias ll='ls -GF'
alias vi="`which vim` -u .vimrc "

dirs
runable
pathadd $PWD
