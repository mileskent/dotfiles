return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'tiagovla/scope.nvim',
  },
  config = function()
    require("scope").setup()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal",
        separator_style = "slant",
        always_show_bufferline = true,
      }
    })
  end
}
