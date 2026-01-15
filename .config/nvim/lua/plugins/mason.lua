return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            automatic_enable = true,
            ensure_installed = {}
        })
    end
}
