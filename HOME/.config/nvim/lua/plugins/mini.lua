return { 
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.comment').setup()
        require('mini.snippets').setup()
        require('mini.completion').setup()
        require('mini.icons').setup()
        require('mini.move').setup()
        require('mini.pairs').setup()
        require('mini.files').setup()
        require('mini.colors').setup()
        require('mini.cursorword').setup({delay=0})
        require('mini.indentscope').setup({draw={delay=20}})
        require('mini.notify').setup()
        require('mini.starter').setup()
        require('mini.trailspace').setup()
    end
} 
