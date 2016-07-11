set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	set runtimepath+=~/.vim/neocomplete.vim/
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
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'davidhalter/jedi-vim'

" Asynchronous tag generation
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'

call neobundle#end()

" Merlin Settings
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" basic syntax stuff
filetype on
filetype plugin on
highlight Comment ctermfg=blue
syntax enable

" expand brackets on delimitMate
let delimitMate_expand_cr = 1

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
set omnifunc=syntaxcomplete#Complete
set autoread

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

" Remove trailing whitespace automatically
autocmd FileType c,cpp,java,php,python,ruby,haskell,ocaml,scala
	\ autocmd BufWritePre <buffer> :%s/\s\+$//e


" re-source file with \rr
map <leader>rr :source ~/.vimrc<CR>

" pressing \d enables relative number display (useful for visual mode)
nmap <leader>d :set relativenumber!<CR>

" generate or delete ctags by filetype -> use correct extensions
let g:ctags_languages = {
	\	'c': 'c',
	\   'python': 'py',
	\   'perl': 'pl',
	\   'java': 'java',
	\   'scala': 'scala',
	\   'ocaml': 'ml',
	\   'matlab' : 'm'
\ }

nmap <leader>ct :exec "!ctags *." . (g:ctags_languages[&filetype]) <CR>
nmap <leader>rt :exec "!rm tags" <CR>

" indentation for pastes
nnoremap p p=']<C-o>
nnoremap P P=']<C-o>

colorscheme molokai
" shortcut to switch between colorschemes (molokai / jellybeans)
nmap <F3> :exec "color " . ((g:colors_name == "molokai") ? "jellybeans" : "molokai") <CR>

" TagBar Settings
" adjust window size for easier browsing
let g:tagbar_width = 60
nmap <F8> :TagbarToggle <CR>

highlight MatchParen ctermbg=4

" neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell': $HOME.'/.vimshell_hist',
	\ }

" Define keyword 
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" enable auto selection
let g:neocomplete#enable_auto_select = 1

" Load per-folder settings, if available
if filereadable(".vim.custom")
	so .vim.custom
endif
