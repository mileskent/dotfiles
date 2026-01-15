return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = {
        "lua", "c", "markdown", "markdown_inline",
        "bash", "c_sharp", "cmake", "cpp", "cuda",
        "diff", "rust"
    }
}
