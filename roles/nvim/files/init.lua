local vim = vim
local Plug = vim.fn['plug#']

vim.api.nvim_command('filetype plugin indent on')

vim.call('plug#begin')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

-- auto save
Plug 'Pocco81/auto-save.nvim'

Plug 'preservim/nerdtree'
Plug('iamcco/markdown-preview.nvim', { ['do'] = function()
    vim.fn['mkdp#util#install']() end,
    ['for'] = 'markdown' })

-- telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'stevearc/dressing.nvim'

Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })

Plug 'zhimsel/vim-stay'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

-- cosmetics
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'frazrepo/vim-rainbow'
Plug('rmehri01/onenord.nvim', { ['branch'] = 'main' })

vim.call('plug#end')

vim.g.mapleader = ","

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nerdTree
vim.keymap.set('n', '<leader><space>', ":NERDTreeToggle<CR>", {})

-- golang config
vim.keymap.set('n', '<leader>gd', ":GoDef<CR>", {})
vim.keymap.set('n', '<leader>gr', ":GoReferrers<CR>", {})
vim.keymap.set('n', '<leader>gl', ":GoLint<CR>", {})
vim.keymap.set('n', '<leader>gn', ":GoRename<CR>", {})

-- buffer
vim.keymap.set('n', '<leader>n', ":bnext<CR>", {})
vim.keymap.set('n', '<leader>p', ":bprevious<CR>", {})

-- window
vim.keymap.set('n', '<leader>w', "<C-w>", {})

require('onenord').setup({
    disable = {
    background = true
    },
})

vim.cmd([[
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

" Exit insert mode
inoremap jk <ESC>

" Tabs
nnoremap T :tabnew<cr>
nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>

" search
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" remove search highlight with //
noremap <silent> // :nohlsearch<cr>

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
]])