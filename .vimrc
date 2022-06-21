call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox  
set background=dark
syntax on

set number relativenumber
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


let mapleader=","
" for YCM
let g:ycm_extra_conf_globlist = ['~/git/kudu/*']
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>ji :YcmCompleter GoToImprecise<CR>
let g:ycm_auto_hover = ''
nmap <leader>h <plug>(YCMHover)

nnoremap <silent> <leader>f :FZF<cr>
