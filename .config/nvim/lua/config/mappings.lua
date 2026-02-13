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

-- tabs
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<Leader>to', ':tabonly<CR>')
vim.keymap.set('n', '<Leader>tl', ':tabs<CR>')

-- buffers
local function goto_buffer_by_index(index)
    local buffers = vim.fn.getcompletion('', 'buffer')
    local target = buffers[index]
    if target then
        vim.cmd('buffer ' .. target)
    else
        print("No buffer at index " .. index)
    end
end
for i = 1, 9 do
    vim.keymap.set('n', string.format('<M-%d>', i), function()
        goto_buffer_by_index(i)
    end, { desc = "Go to buffer " .. i })
end
vim.keymap.set('n', 'gb', ':bnext<CR>')
vim.keymap.set('n', 'gB', ':bprev<CR>')
vim.keymap.set('n', '<Leader>bl', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>bc', ':bdelete!<CR>') -- force
