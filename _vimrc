"
" General options (source $MYVIMRC to reload _vimrc/.vimrc)
" Version: 20170824
" History:
"
" - added Zed's stuff
" - changed font 2 Consolas
" - added trailing whitespace stuff
" - added pathogen
" - cleanup
" - added C make and syntastic
" - added most of the stuff from https://unknwon.io/setup-vim-for-go-development/
" - added some stuff from http://mirnazim.org/writings/vim-plugins-i-use/
" - for tagbar doc look https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
"
execute pathogen#infect()
call pathogen#helptags()
"
set number            " I want line numbers
set nocompatible      " We're running Vim, not Vi!
set ruler             " Show row, column
set autoindent        " Indent automatically
set backspace=indent,eol,start " Backspace should behave like expected
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to next/prev lines
set printoptions=syntax:n,number:y
set printfont=courier:h8
set backspace=2
set history=50
set ignorecase smartcase
set incsearch
set hlsearch
"
" Use two space tabs
" Tabs, spaces, wrapping
"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1
set expandtab         " Convert tabs to blanks
set smarttab
set shiftwidth=2
"
" Syntax modifications
syntax on             " Enable syntax highlighting
set cindent
filetype on           " Enable fieltype detefackction
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"
"I don't want a f***ing bell at all visual or not
"

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"
" Windows Specific options
"

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=100
  " Don't need a toolbar
  set guioptions-=T
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=140
  endif
endif

if has("win32")
    set backupdir=c:\home\vimfiles\tmp\scratch
    set guifont=Consolas:h12:cANSI
    "set guifont=Meslo\ LG\ M:h12:cANSI
    "set guifont=Source\ Code\ Pro:h12:cANSI
    "set guifont=Source\ Code\ Pro:h12:cANSI
endif
"
" MacVim Specific options
if has("gui_macvim")
    set backupdir=/tmp
    set transp=1
    set anti enc=utf-8 tenc=macroman gfn=Monaco:h14
endif

" Remapping the Ctrl-] key specially useful for german/mac keyboards
nnoremap ü <C-]>
" To get rid of the "+gP and replace it by Ctrl-v
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

"
" Don't try to highlight lines longer than 800 characters.
"
set synmaxcol=800
"
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
"
set notimeout
set ttimeout
set ttimeoutlen=10
"
" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
"
" Save when losing focus
au FocusLost * :silent! wall
"
" Resize splits when the window is resized
au VimResized * :wincmd =
"
" Wildmenu completion
set wildmenu
set wildmode=list:longest
"
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
"
" Line Return
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"
" Backups
"
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
"
set directory=c:\home\vimfiles\tmp\swap\\     " swap files
set undodir=c:\home\vimfiles\tmp\undo\\     " undo files
set backupdir=c:\home\vimfiles\tmp\backup\\ " backups
"set directory=~/.vim/tmp/swap//   " swap files
"set undodir=~/.vim/tmp/undo//     " undo files
"set backupdir=~/.vim/tmp/backup// " backups
"
" Match closing parenthesis
"
set showmatch
" ack
" set grepprg=/home/mario/bin/ack
"
" Cscope
"
"if has("cscope")
"  " uncoment this and set if vim can't find it
"  set csprg=c:\bin\cscope.exe
"  set csto=0
"  set cst
"  set nocsverb
"  " add any database in current directory
"  if filereadable("cscope.out")
"    cs add cscope.out
"    " else add database pointed to by environment
"  elseif $CSCOPE_DB != ""
"    cs add $CSCOPE_DB
"  endif
"  set csverb
"endif
"
" Mapping stuff
"
let mapleader = "\<Space>"
nmap <silent><Leader>B <ESC>/end<CR>=%:noh<CR>
nmap <silent> <M-S-Left> <ESC>:bp<CR>
nmap <Leader>U <ESC>:TlistUpdate<CR>
nmap <Leader>M <ESC>:wa<CR>:make!<CR>
nmap <Leader>D <ESC>:w<CR>:diffthis<CR>
nmap <Leader>d <ESC>:w<CR>:diffoff<CR>
nmap <silent><Leader>q <ESC>:copen<CR>
nmap <silent><Leader>n <ESC>:cn<CR>
nmap <silent><Leader>; <ESC>d/;/e<CR>:noh<CR>
nmap <Leader><Leader>s <ESC>:cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><Leader>g <ESC>:cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><Leader>d <ESC>:cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><Leader>c <ESC>:cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><Leader>t <ESC>:cs find t
nmap <Leader><Leader>e <ESC>:cs find e
nmap <Leader><Leader>f <ESC>:cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><Leader>i <ESC>:cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>P <ESC>:Pydoc <C-R>=expand("<cword>")<CR>
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
noremap <f11> <esc>:syntax sync fromstart<cr>
inoremap <f11> <esc>:syntax sync fromstart<cr>
"
" Hightlight trailing whitespaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"
" Language specific options
" Force *.md to be markdown
"
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufRead *.asm  setfiletype=earing
"
" Compile c file
"
au BufEnter *.c compiler gcc
set makeprg=gcc\ -Wall\ -o\ %<\ %
map <F8> :w <CR> :!gcc -Wall % -o %< && %< <CR>
" Disable error keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
" ... and in insert mode. I'm not ready yet !
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
"
" Nerdtree
"
nmap <F10> :NERDTreeToggle<CR>
"
" Tagbar
"
nmap <F9> :TagbarToggle<CR>
"
" Use a textmate like colorscheme
"
":colorscheme smyck
":colorscheme molokai
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
"
"End
"
