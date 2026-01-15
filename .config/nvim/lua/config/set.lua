vim.cmd[[syntax on]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set shiftround]]
vim.cmd[[set expandtab]]
vim.cmd[[set linebreak]]
vim.cmd[[set breakindent]]
vim.cmd[[set formatoptions=1]]
vim.cmd[[set lbr]]
vim.cmd[[set scrolloff=999]]
vim.cmd[[set laststatus=2]]
vim.cmd[[set autowrite]]
vim.cmd[[set autoread]]
vim.cmd[[set showcmd]]
vim.cmd[[set number]]
vim.cmd[[set relativenumber]]
vim.cmd[[set colorcolumn=80]]
vim.cmd[[set cursorline]]
vim.cmd[[colorscheme miniautumn]]
vim.o.cursorlineopt = 'both'
vim.opt.termguicolors = true

vim.keymap.set('n', '<C-e>', ':lua MiniFiles.open()<CR>', { noremap = true, silent = false })

