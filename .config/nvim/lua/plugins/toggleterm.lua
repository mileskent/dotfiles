return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = 'float',
            open_mapping = [[<leader>\]],
            shell = "bash"
        })

        vim.keymap.set('n', [[<leader>\]], '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
        vim.keymap.set('t', [[<leader>\]], [[<cmd>ToggleTerm<CR>]], { desc = 'Toggle Terminal' })
    end
}
