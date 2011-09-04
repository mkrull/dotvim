" maksimal vimrc

" load pathogen plugins
call pathogen#infect('vim-pathogen')

set nocompatible
set nobackup
set noerrorbells
set noflash
set nowrap

function Retab ()
    set expandtab
    %retab
    let _s=@/
    %s/\s\+$//e
    let @/=_s
    nohl
endfunction

if has('mouse')
    set mouse=a
endif

set columns=120

" tabs and shifts
set vb
set expandtab
set ts=4
set shiftwidth=4

" hidden chars
set list
set listchars=tab:\!\ ,trail:.

let g:solarized_contrast="high"
let g:solarized_visibility="high"
syntax on
set background=dark
colorscheme makonrails

set number
set autoindent
set hlsearch
set ruler
set showcmd
set incsearch
set history=50
set scrolloff=10
set wildmenu
set ruler
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting

" search
set hlsearch       " highlight search (very useful!)
set incsearch      " search incremently (search while typing)
set ignorecase     " case insensitive searching
set smartcase      " but become case sensitive if you type uppercase characters

filetype plugin indent on

" toggle paste-mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

nnoremap <silent> <F5> :call Retab()<CR>

if has('gui')
    set go=rm
    set guifont=Terminus\ 12
endif

if has('gui_running')
  let NERDTreeWinSize=40
  autocmd VimEnter * NERDTree /home/mak/programming
  autocmd VimEnter * wincmd p
endif

" haskell mode
let g:haddock_browser = '/usr/bin/chromium'
autocmd BufNewFile,BufEnter *.hs compiler ghc

" syntastic
let g:syntastic_stl_format = '[%E{Error: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F%m%r%h%w\ [%l,%v][%p%%]\ [%L]
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" perl tags
autocmd BufNewFile,BufEnter *.pl set tags=/home/mak/.vim/perltags
autocmd BufNewFile,BufEnter *.pm set tags=/home/mak/.vim/perltags

" buffer dependent syntax highlighting
autocmd BufNewFile,BufEnter *.tt set ft=tt2html
autocmd BufNewFile,BufEnter *.tt2 set ft=tt2html

