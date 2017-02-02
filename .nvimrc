" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
    
" VIM plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'joshdick/onedark.vim'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-characterize'

" Git plugins
Plugin 'airblade/vim-gitgutter'

" Programming plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'joonty/vdebug'

call vundle#end()

filetype plugin indent on

" Leader
let mapleader=","

" Neovim specific settings
set termguicolors
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:ycm_python_binary_path = '/usr/bin/python3'

nmap <Leader>t :tabnew<ENTER>:terminal<ENTER>
let g:gitgutter_sign_removed_first_line = "^_"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Nerdtree setup
map <F2> :NERDTreeToggle<CR>

" Python-mode setup
let g:pymode_rope = 0

" colourscheme
syntax on
colorscheme onedark
set nofoldenable
set t_Co=256

" set working directory to current file's directory
set autochdir

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" line numbers
set number
set relativenumber

" bracket autocompletion
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>]"

" autoindent inside of bracket
:set autoindent
:set cindent

" highlight characters past column 90
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%90v.*/
    autocmd FileType python set nowrap
augroup END

" using bc to calculate
nmap <Leader>c :r ! echo "" \| bc 6<Left>

" rendering with <leader>l
autocmd FileType markdown nmap <Leader>l :!rm<c-R>%<BS><BS>pdf<ENTER>:w<ENTER>:! pandoc -o <c-R>%<BS><BS>pdf --template assignment <c-R>%<ENTER><ENTER>:! evince <c-R>%<BS><BS>pdf<ENTER>
autocmd FileType python nmap <Leader>l :w<ENTER> :! python3 <c-R>%<ENTER>
autocmd FileType tex nmap <Leader>l :! rm <c-R>%<BS><BS><BS>pdf :w<ENTER> :! pdflatex <c-R>%<ENTER><ENTER> :! evince <c-R>%<BS><BS><BS>pdf<ENTER>

xmap " S"
xmap ' S'
xmap ( S)
xmap [ S]
xmap { S}

" Prefrences
set noswapfile
set nohlsearch
