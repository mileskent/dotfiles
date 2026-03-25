vim.cmd[[syntax on]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set mouse=]]
vim.cmd[[nnoremap <up> <nop>]]
vim.cmd[[nnoremap <down> <nop>]]
vim.cmd[[nnoremap <left> <nop>]]
vim.cmd[[nnoremap <right> <nop>]]
vim.cmd[[inoremap <up> <nop>]]
vim.cmd[[inoremap <down> <nop>]]
vim.cmd[[inoremap <left> <nop>]]
vim.cmd[[inoremap <right> <nop>]]
vim.cmd[[vnoremap <up> <nop>]]
vim.cmd[[vnoremap <down> <nop>]]
vim.cmd[[vnoremap <left> <nop>]]
vim.cmd[[vnoremap <right> <nop>]]
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
vim.cmd[[colorscheme retrobox]]
vim.o.cursorlineopt = 'both'
vim.opt.termguicolors = true
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR><Esc>', { desc = 'Clear highlights on Escape' })

-- pre buffer write add ons
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- telescope reg
vim.keymap.set('n', '<M-v>', '<cmd>Telescope registers<cr>')
vim.keymap.set('i', '<M-v>', '<cmd>Telescope registers<cr>')
vim.keymap.set('v', '<M-v>', '"_d<cmd>Telescope registers<cr>')

-- theme
vim.keymap.set('n', '<leader>rt', function()
    if vim.o.background == 'dark' then
        vim.o.background = 'light'
    else
        vim.o.background = 'dark'
    end
end, { desc = 'Toggle light/dark theme' })
vim.keymap.set('n', '<leader>rl', '<cmd>Telescope colorscheme enable_preview=true<cr>', {
    desc = 'List colorschemes (Telescope)'
})

-- tabs
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<Leader>to', ':tabonly<CR>')
vim.keymap.set('n', '<Leader>tl', ':tabs<CR>')
