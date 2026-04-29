" plugins 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
  Plug 'gruvbox-community/gruvbox'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp-settings'
call plug#end()

" gruvbox
syntax on
set background=dark
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" general
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set incsearch
set hlsearch

set ignorecase
set smartcase
set clipboard=unnamedplus

nnoremap j gj
nnoremap k gk
