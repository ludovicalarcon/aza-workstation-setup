filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Pocco81/auto-save.nvim'

Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Plug 'towolf/vim-helm'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'zhimsel/vim-stay'

" cosmetics
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'

call plug#end()

let mapleader = ","

set cursorline  	" hihglight current line
set notimeout   	" no timeout on key codes
set number	 	" line number
set relativenumber	" line number relative to cursor
set scrolloff=999	" keep cursor centered
set showbreak=↪		" show break line with char
set inccommand=split	" interactive search and replace

highlight Normal ctermbg=none
highlight NonText ctermbg=none

syntax on " highlight syntax
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set expandtab               " Insert spaces instead of tabs

colorscheme OceanicNext

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nerdTree
nnoremap <leader><space> :NERDTreeToggle<cr>

" Buffer
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>

" window
nnoremap <Leader>w <C-w>

" remove search highlight with //
nnoremap <silent> // :nohlsearch<cr>

" Search
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Exit insert mode
inoremap jk <ESC>

" Tabs
nnoremap T :tabnew<cr>
nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>

au FileType sh,groovy,go,cpp,c call rainbow#load()
let g:rainbow_conf = {
                      \'parentheses':
                          \['start=/(/ end=/)/',
                           \'start=/\[/ end=/\]/',
                           \'start=/{/ end=/}/ fold'],
                    \}

autocmd FileType json syntax match Comment +\/\/.\+$+
" set groovy FileType for Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
