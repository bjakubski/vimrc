" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 May 26
"
call pathogen#infect()
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

set showmatch
set nohls
set backupdir=~/.vim/backups,.
set undodir=~/.vim/undos,.
set undofile
set laststatus=2
set wildmenu
set shell=bash
set lazyredraw
set background=dark
set formatoptions=tcqn21
set pastetoggle=<F12>
set mouse=
set fileencodings="utf-8,latin1"

"autocmd FileType perl set equalprg=perltidy

"syntax on
autocmd FileType spec set tw=70
"autocmd FileType tex set indentexpr=

let g:Header_name="Bartosz Jakubski"
let g:Header_email="bartosz.jakubski@hurra.com"

let g:www_client = "links"
let g:mail_client = "mutt"

let g:man_vertical_split = 0

set statusline=%<\ %{fugitive#statusline()}\ %f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set fileencodings="utf-8,latin2"
let tidy_compiler_040800=1

if has("gui_running")
	cmap :q bdelete
endif
autocmd BufEnter *.tt set ft=tt2
autocmd BufEnter *.t set ft=perl
autocmd BufEnter *.test set ft=c
imap [H <Home>
imap [F <End>
nmap <silent> <unique> <F3> <Plug>SelectBuf
nnoremap <silent> <F8> :Tlist<CR>
let Tlist_Ctags_Cmd="exctags"

" Work-specific
"syntax sync ccomment maxlines=50
set visualbell
autocmd FileType perl compiler perl
autocmd FileType perl set fdm=marker
autocmd FileType perl set softtabstop=4
autocmd FileType perl set tabstop=4
autocmd FileType perl set shiftwidth=4
autocmd FileType perl set expandtab
autocmd FileType perl set iskeyword+=:
" POD
autocmd FileType pod set softtabstop=4
autocmd FileType pod set tabstop=4
autocmd FileType pod set shiftwidth=4
autocmd FileType pod set expandtab
imap  
cmap  

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
