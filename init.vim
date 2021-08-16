call plug#begin('~/.vim/plugged')

    Plug 'mhinz/vim-startify'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/nerdtree'
    Plug 'cdelledonne/vim-cmake'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'sheerun/vim-polyglot'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'onsails/lspkind-nvim'
    Plug 'voldikss/vim-floaterm'
    Plug 'psliwka/vim-smoothie'
    Plug 'itchyny/vim-gitbranch'
    Plug 'dense-analysis/ale'
    "Plug 'neovimhaskell/haskell-vim'
    Plug 'vim-python/python-syntax'
    Plug 'preservim/tagbar'

call plug#end()

syntax on

source ~/.config/nvim/plug-config/lsp-config.vim
luafile ~/.config/nvim/lua/plugins/compe-config.lua
luafile ~/.config/nvim/lsp/python-ls.lua
luafile ~/.config/nvim/lsp/cpp-ls.lua
luafile ~/.config/nvim/lsp/haskell-ls.lua
luafile ~/.config/nvim/lua/plugins/lspsaga-config.lua
luafile ~/.config/nvim/lsp/lspkind.lua
luafile ~/.config/nvim/lsp/texlab-ls.lua

set tabstop=4
set shiftwidth=4
set expandtab

set number                     " Show current line number
set relativenumber             " Show relative line numbers

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
filetype plugin on
set encoding=UTF-8

"Tagbar
nmap <F8> :TagbarToggle<CR>

" Save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
set mouse=a

"Ale ignore pylint
let g:ale_linters_ignore = {
    \ 'python': ['pylint']
    \}

"<----------Floaterm config---------->"
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

"<----------CMake shortcuts---------->"
let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>cq :CMakeClose<cr>

"<----------NerdTree shortcuts---------->"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"<----------haskell-vim---------->"
"let g:haskell_classic_highlighting = 1
"let g:haskell_indent_if = 3
"let g:haskell_indent_case = 2
"let g:haskell_indent_let = 4
"let g:haskell_indent_where = 6
"let g:haskell_indent_before_where = 2
"let g:haskell_indent_after_bare_where = 2
"let g:haskell_indent_do = 3
"let g:haskell_indent_in = 1
"let g:haskell_indent_guard = 2
"let g:haskell_indent_case_alternative = 1
"let g:cabal_indent_section = 2

"<----------LightLine config---------->"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust"},  -- list of language that will be disabled
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
colorscheme nvcode  "Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

