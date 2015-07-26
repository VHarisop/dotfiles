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
NeoBundle 'derekwyatt/vim-scala'

call neobundle#end()

" basic syntax stuff
filetype on
filetype plugin on
highlight Comment ctermfg=blue
syntax enable

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
set smartcase

" show matching parentheses 
set showmatch

" lines fold after 79 characters
set tw=79
set formatoptions+=t

" map navigation to not skip folded lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" display status line by default + highlight current line
set cursorline
set laststatus=2

" show much info on statusline
set statusline=
	\%F%m%r%h%w\ [format=%{&ff}]\ [type=%{&ft}]\ [%l,%v][%p%%]\ 
	\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" shortcut to turn statusline on and off using \s
nmap <leader>s :exec "set laststatus=" . (( &laststatus == 1) ? 2 : 1) <CR>

" use omnicompletion (C-x + C-o)
set omnifunc=syntaxComplete#Complete

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

colorscheme molokai

" re-source file with \rr
map <leader>rr :source ~/.vimrc<CR>

" pressing \d enables relative number display (useful for visual mode)
nmap <leader>d :set relativenumber!<CR>


" indentation for pastes
nnoremap p p=']<C-o>
nnoremap P P=']<C-o>

" shortcut to switch between colorschemes (molokai / jellybeans)
nmap <F3> :exec "color " . ((g:colors_name == "molokai") ? "jellybeans" : "molokai") <CR>

" set off closing parentheses
highlight MatchParen ctermbg=4

" Load per-folder settings, if available
if filereadable(".vim.custom")
	so .vim.custom
endif