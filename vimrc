" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 May 26

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
set backup		    " keep a backup file
set history=500 	" keep 500 lines of command line history
set ruler		    " show the cursor position all the time
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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

set showmatch
set nohls
set backupdir=~/.vim/backups,.
set undodir=~/.vim/undos,.
set undofile
set laststatus=2
set wildmenu
set lazyredraw
set background=dark
set formatoptions=tcqn21
set pastetoggle=<F12>
set mouse=

let g:Header_name="Bartosz Jakubski"
let g:Header_email="bartosz.jakubski@hurra.com"

let g:www_client = "links"
let g:mail_client = "mutt"

set fileencodings="utf-8,latin2"

autocmd FileType spec set tw=70
autocmd BufEnter *.tt set ft=tt2
autocmd BufEnter *.t set ft=perl
imap [H <Home>
imap [F <End>
nmap <silent> <unique> <F3> <Plug>SelectBuf
nmap <F8> :TagbarToggle<CR>

set visualbell
imap  
cmap  

set statusline=%<\ %{fugitive#statusline()}\ %f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

" let g:solarized_contrast="medium";
" let g:solarized_visibility="low";
colorscheme solarized
set cursorline
set cursorcolumn

set colorcolumn=80,100

let g:CommandTMaxFiles=100000
let g:CommandTMinHeight=20
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1

map <C-p> :CommandT<CR>
