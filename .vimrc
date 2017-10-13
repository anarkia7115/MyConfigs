colorscheme elflord

syntax on
set nocompatible              " be iMproved, required
set hlsearch
set nu
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'kovisoft/slimv'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'FastFold'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'git@github.com:tpope/vim-fugitive.git'
Plugin 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plugin 'VundleVim/Vundle.vim'
Plugin 'keith/swift.vim'
Plugin 'gfontenot/vim-xcode'
Plugin 'eraserhd/vim-ios'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'git@github.com:vim-scripts/taglist.vim.git'
Plugin 'git@github.com:majutsushi/tagbar.git'
Plugin 'git@github.com:tpope/vim-surround.git'
Plugin 'git@github.com:nvie/vim-flake8.git'
Plugin 'derekwyatt/vim-scala'
" Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
" set foldmethod=syntax
"syn region foldImports start="import" end=/import.*\n^$/ fold keepend
"set foldlevel=99
nnoremap <space> za

" python
let g:SimpylFold_docstring_preview=1

set tabstop=2
set softtabstop=2
set shiftwidth=2

au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

au BufNewFile,BufRead *.py,*.js,*.cu,*.cpp,*.c,*.h,*.hpp,*.java
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 
"    \ let g:flake8_show_in_gutter=1 |
"    \ let g:flake8_show_in_file=1 |
"    \ call Flake8()

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Shebang
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

" map
nmap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-t> :TagbarToggle<CR>
nmap \t :Tlist<CR>
imap ii <Esc>

" scala
silent! nmap \t :NERDTreeToggle<CR>
silent! nmap \f :NERDTreeFind<CR>
let g:NERDTreeToggle="\t"
let g:NERDTreeMapActivateNode="\f"
let g:NERDTreeMapPreview="<C-v>"

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_root_markers = ['build.sbt', 'pom.xml']

" always open new
let g:ctrlp_switch_buffer = 'et'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" neo-completion
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
set showcmd
set backspace=indent,eol,start

" markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" slimv
"let g:slimv_swank_cmd = '! xterm -e sbcl --load $VIMRUNTIME/slime/start-swank.lisp &'
set guioptions+=m
set guifont=Monospace\ 12

" map (
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf

function! ClosePairMap(close)
  return strpart(getline('.'), col('.')-1, 1) == a:close ? "\<Right>" : a:close
endf

function! ClosePairMark(mark)
 if (strpart(getline('.'), col('.')-1, 1) == ")" 
 \  || strpart(getline('.'), col('.')-1, 1) == ">" 
 \  || strpart(getline('.'), col('.')-1, 1) == "}" 
 \  || strpart(getline('.'), col('.')-1, 1) == "]") 
   return "\<Right>" . a:mark
 else
   return a:mark
 endif
endf

function! CurlyBracesMap()
  if (strpart(getline('.'), col('.')-1, 1) == ")")
    return "\<Right>" .  " {\<CR>}\<Esc>O"
  else
    return "{\<CR>}\<Esc>O"
  endif
endf

inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap () ()
"inoremap <expr> { CurlyBracesMap()
inoremap <expr> [ ConditionalPairMap('[', ']')
"inoremap <expr> < ConditionalPairMap('<', '>')
"inoremap << <<
inoremap <expr> ) ClosePairMap(')')
inoremap <expr> } ClosePairMap('}')
inoremap <expr> ] ClosePairMap(']')
"inoremap <expr> > ClosePairMap('>')
inoremap <expr> ;<CR> ClosePairMark(';<CR>')

