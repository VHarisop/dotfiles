set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle#install_process_timeout=1500

" NeoBundle settings and packages
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My bundles here
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'garbas/vim-snipmate'

call neobundle#end()

" basic syntax stuff
filetype on
filetype plugin on
highlight Comment ctermfg=blue
syntax on

" enable indentation features
set smartindent
set autoindent
set smarttab

" tab spacing
set shiftwidth=4
set tabstop=4

" tab completion style
set wildmenu
set wildmode=list:longest,full

" vim command history
set history=1000

" highlight results before Enter is pressed
set incsearch 

" pressing \d enables relative number display (useful for visual mode)
nmap <leader>d :set relativenumber!<CR>

" always display status line
set laststatus=2

" show some info on statusline
set statusline=
	\%F%m%r%h%w\ [format=%{&ff}]\ [type=%{&ft}]\ [%l,%v][%p%%]\ 
	\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Use skeletons for certain file types 
au BufNewFile *.c  r .vim/skeletons/skeleton.c
au BufNewFile *.sh r .vim/skeletons/skeleton.sh
au BufNewFile *.pl r .vim/skeletons/skeleton.pl

" java filenames coincide with classes inside
au BufNewFile *.java
	\ exe "normal Opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1G"

" same goes with scala!
au BufNewFile *.scala
	\ exe "normal Oobject " . expand('%:t:r') . 
	\ " {\ndef main(args: Array[String]) {\n\n}\n}"

" reload files changed outside vim
set autoread

" default colorscheme
colorscheme molokai

" re-source file with \rr
map <leader>rr :source ~/.vimrc<CR>

" auto-indentation for pastes
nnoremap p p=']<C-o>
nnoremap P P=']<C-o>

" shortcut to switch between colorschemes (molokai / jellybeans)
nmap <F3> :exec "color " . ((g:colors_name == "molokai") ? "jellybeans" : "molokai") <CR>

" set off closing parentheses
highlight MatchParen ctermbg=4
