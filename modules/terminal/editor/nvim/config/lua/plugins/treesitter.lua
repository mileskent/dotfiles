return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "c", "markdown", "markdown_inline",
                "bash", "c_sharp", "cmake", "cpp", "cuda",
                "diff", "rust"
            },
            highlight = { enable = true }, -- Don't forget to enable highlighting!
        })
        vim.treesitter.language.register("cuda", "hip")
        vim.filetype.add({
            extension = {
                hip = "cuda",
            },
        })
    end
}
