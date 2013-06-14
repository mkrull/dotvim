" load pathogen plugins
call pathogen#infect('vim-pathogen')

syntax on
filetype plugin indent on

set nocompatible
set nobackup
set noerrorbells
set noflash
set nowrap

function! Trailfix ()
	let _s=@/
	%s/\s\+$//e
	let @/=_s
	nohl
endfunction

function! Indenting(indent, what, cols)
	let spccol = repeat(' ', a:cols)
	let result = substitute(a:indent, spccol, '\t', 'g')
	let result = substitute(result, ' \+\ze\t', '', 'g')
	if a:what == 1
		let result = substitute(result, '\t', spccol, 'g')
	endif
	return result
endfunction

function! IndentConvert(line1, line2, what, cols)
	let savepos = getpos('.')
	let cols = empty(a:cols) ? &tabstop : a:cols
	execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
	call histdel('search', -1)
	call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

function! Help()
	let helpdoc = input('Call for help on: ')
	call inputrestore()
	exe 'vert bo help ' . helpdoc
endfunction

function! UseCpp()
	set ft=cpp
	nnoremap <silent> <F6> :%!indent<CR>
endfunction

function! UsePerl()
	set ft=perl
	nnoremap <silent> <F6> :%!perltidy<CR>
endfunction

command! -nargs=0 Trailfix :call Trailfix()
command! -nargs=0 Help :call Help()

" tabs and shifts
set vb
"set expandtab
set ts=4
set shiftwidth=4

" hidden chars
set list
set listchars=tab:\|-,trail:.,eol:¬

set background=dark

set number
set autoindent
set hlsearch
set ruler
set showcmd
set incsearch
set history=50
"set scrolloff=10
set wildmenu
set ruler
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting

" search
set hlsearch       " highlight search (very useful!)
set incsearch      " search incremently (search while typing)
set ignorecase     " case insensitive searching
set smartcase      " but become case sensitive if you type uppercase characters

" toggle paste-mode
map <F1> :Help <CR>
nnoremap <F2> :set invpaste paste? <CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

nnoremap <F3> :Space2Tab<CR>
nnoremap <F4> :make<CR>
nnoremap <F5> :call Trailfix()<CR>
" <F6> is maped for indentation
" source current buffer
nnoremap <F7> :so %<CR>

if has('gui')
	set go=rme

	if has('gui_macvim')
		set noantialias
		set transparency=5 " will only work with experimental renderer
		set guifont=Monaco:h14
	else
		set guifont=Terminus\ 11
	endif
endif

" global solarized settings
let g:solarized_contrast   = "high"
let g:solarized_visibility = "low"
let g:solarized_italic     = 0
let g:solarized_bold       = 0
let g:solarized_underline  = 0

if has('gui_running')
	if has('mouse')
		set mouse=a
	endif

	let NERDTreeWinSize=40
	exec 'autocmd VimEnter * NERDTree '.fnameescape($HOME.'/'.$NERD_TREE_ROOT)
	exec 'autocmd VimEnter * cd '.fnameescape($HOME.'/'.$NERD_TREE_ROOT)
else
	set t_Co=256
	let g:solarized_termcolors = 256
endif

colorscheme solarized

" set size on gui enter
autocmd GUIEnter * set lines=60 columns=150

" haskell mode
let g:haddock_browser = '/usr/bin/chromium'
autocmd BufNewFile,BufEnter *.hs compiler ghc

" syntastic
let g:syntastic_stl_format = '[%E{Error: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline=''
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F%m%r%h%w\ [%l,%v][%p%%]\ [%L]
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" nerdtree tabs
let g:nerdtree_tabs_synchronize_view = 0
let NERDTreeShowBookmarks = 1


" supertab
let g:SuperTabDefaultCompletionType = 'context'

" taglist
let Tlist_Use_Right_Window = 1

" perl files use Perl
autocmd BufNewFile,BufEnter *.pl call UsePerl()
autocmd BufNewFile,BufEnter *.pm call UsePerl()

" mojo.vim
let mojo_highlight_data = 1

" buffer dependent syntax highlighting
autocmd BufNewFile,BufEnter *.tt  set ft=tt2html
autocmd BufNewFile,BufEnter *.tt2 set ft=tt2html
autocmd BufNewFile,BufEnter *.pl6 set ft=perl6
autocmd BufNewFile,BufEnter *.pm6 set ft=perl6
autocmd BufNewFile,BufEnter *.c   call UseCpp()
autocmd BufNewFile,BufEnter *.cc  call UseCpp()
autocmd BufNewFile,BufEnter *.cpp call UseCpp()
autocmd BufNewFile,BufEnter *.h   call UseCpp()
autocmd BufNewFile,BufEnter *.hh  call UseCpp()
autocmd BufNewFile,BufEnter *.hpp call UseCpp()

" makefiles
autocmd BufNewFile,BufEnter Makefile set ft=make
autocmd BufNewFile,BufEnter makefile set ft=make

" lua
let g:lua_inspect_warnings = 0

" force me to use vim features to navigate
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" toggle nerd tree
noremap <C-N> :NERDTreeToggle<CR>

" faster window navigation
map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l


