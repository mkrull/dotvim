" Vim color scheme
"
" Name:         railscasts.vim
" Maintainer:   Nick Moffitt <nick@zork.net>
" Last Change:  01 Mar 2008
" License:      WTFPL <http://sam.zoy.org/wtfpl/>
" Version:      2.1
"
" This theme is based on Josh O'Rourke's Vim clone of the railscast
" textmate theme.  The key thing I have done here is supply 256-color
" terminal equivalents for as many of the colors as possible, and fixed
" up some of the funny behaviors for editing e-mails and such.
"
" To use for gvim:
" 1: install this file as ~/.vim/colors/railscasts.vim
" 2: put "colorscheme railscasts" in your .gvimrc
"
" If you are using Ubuntu, you can get the benefit of this in your
" terminals using ordinary vim by taking the following steps:
"
" 1: sudo apt-get install ncurses-term
" 2: put the following in your .vimrc
"     if $COLORTERM == 'gnome-terminal'
"         set term=gnome-256color
"         colorscheme railscasts
"     else
"         colorscheme default
"     endif
" 3: if you wish to use this with screen, add the following to your .screenrc:
"     attrcolor b ".I"
"     termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
"     defbce "on"
"     term screen-256color-bce

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "makonrails"

hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

hi Normal                    guifg=#E6E1DC  guibg=#111111
hi Cursor                    guifg=#000000  guibg=#FFFFFF                   ctermfg=0       ctermbg=15
hi CursorLine                               guibg=#000000                                   ctermbg=233     cterm=NONE

hi Comment                   guifg=#a8a8a8                                  ctermfg=180
hi Constant                  guifg=#6D9CBE                                  ctermfg=73
hi Define                    guifg=#CC7833                                  ctermfg=173
hi Error                     guifg=#FFC66D  guibg=#990000                   ctermfg=221     ctermbg=88
hi Function                  guifg=#FFC66D                  gui=NONE        ctermfg=221                     cterm=NONE
hi Identifier                guifg=#6D9CBE                  gui=NONE        ctermfg=73                      cterm=NONE
hi Include                   guifg=#CC7833                  gui=NONE        ctermfg=173                     cterm=NONE
hi PreCondit                 guifg=#CC7833                  gui=NONE        ctermfg=173                     cterm=NONE
hi Keyword                   guifg=#CC7833                                  ctermfg=173                     cterm=NONE
hi LineNr                    guifg=#d8d8d8  guibg=#1a1a1a
hi VertSplit                 guifg=#000000  guibg=#d8d8d8
hi StatusLine                guifg=#d8d8d8  guibg=#000000
hi StatusLineNC              guifg=#d8d8d8  guibg=#000000
hi Number                    guifg=#A5C261                                  ctermfg=107
hi PreProc                   guifg=#E6E1DC                                  ctermfg=103
hi Search                    guifg=NONE     guibg=#2b2b2b   gui=italic      ctermfg=NONE    ctermbg=235     cterm=underline
hi Statement                 guifg=#CC7833                  gui=NONE        ctermfg=173                     cterm=NONE
hi String                    guifg=#A5C261                                  ctermfg=107
hi Title                     guifg=#FFFFFF                                  ctermfg=15
hi Type                      guifg=#DA4939                  gui=NONE        ctermfg=167                     cterm=NONE
hi Visual                                   guibg=#5A647E                                   ctermbg=60
hi Pmenu                     guifg=#000000  guibg=#a8a8a8
hi PmenuSel                  guifg=#000000  guibg=#cc7833

hi DiffAdd                   guifg=#E6E1DC  guibg=#519F50                   ctermfg=7       ctermbg=71
hi DiffDelete                guifg=#E6E1DC  guibg=#660000                   ctermfg=7       ctermbg=52
hi Special                   guifg=#DA4939                                  ctermfg=167

hi pythonBuiltin             guifg=#6D9CBE                  gui=NONE        ctermfg=73                      cterm=NONE
hi rubyBlockParameter        guifg=#FFFFFF                                  ctermfg=15
hi rubyClass                 guifg=#FFFFFF                                  ctermfg=15
hi rubyConstant              guifg=#DA4939                                  ctermfg=167
hi rubyInstanceVariable      guifg=#D0D0FF                                  ctermfg=189
hi rubyInterpolation         guifg=#519F50                                  ctermfg=107
hi rubyLocalVariableOrMethod guifg=#D0D0FF                                  ctermfg=189
hi rubyPredefinedConstant    guifg=#DA4939                                  ctermfg=167
hi rubyPseudoVariable        guifg=#FFC66D                                  ctermfg=221
hi rubyStringDelimiter       guifg=#A5C261                                  ctermfg=143

hi xmlTag                    guifg=#E8BF6A                                  ctermfg=179
hi xmlTagName                guifg=#E8BF6A                                  ctermfg=179
hi xmlEndTag                 guifg=#E8BF6A                                  ctermfg=179

hi mailSubject               guifg=#A5C261                                  ctermfg=107
hi mailHeaderKey             guifg=#FFC66D                                  ctermfg=221
hi mailEmail                 guifg=#A5C261                  gui=italic      ctermfg=107                     cterm=underline

" perl related
hi perlArrow                 guifg=#d84000                                  ctermfg=173                     cterm=NONE
" regex specials
"hi perlSpecial               guifg=#ff0000                                  ctermfg=173                     cterm=NONE
hi perlVarSimpleMember       guifg=#d84000

hi perlBareword              guifg=#d84000                                  ctermfg=173                     cterm=NONE
hi perlStringStartEnd        guifg=#ff4800                                  ctermfg=173                     cterm=NONE

hi SpellBad                  guifg=#D70000                                  ctermfg=160     ctermbg=NONE    cterm=underline
hi SpellRare                 guifg=#D75F87  guibg=NONE      gui=underline   ctermfg=168     ctermbg=NONE    cterm=underline
hi SpellCap                  guifg=#D0D0FF  guibg=NONE      gui=underline   ctermfg=189     ctermbg=NONE    cterm=underline
hi MatchParen                guifg=#FFFFFF  guibg=#005f5f                   ctermfg=15      ctermbg=23

