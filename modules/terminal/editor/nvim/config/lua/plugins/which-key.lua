return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  win = {
    -- You can use absolute numbers (columns/lines) 
    -- or a float between 0 and 1 (percentage of screen)
    height = { min = 4, max = 25 }, -- Allow it to grow up to 25 lines high
    width = { min = 20, max = 50 },  -- Allow it to be wider
    border = "rounded", -- Optional: makes it look nicer
  },
  layout = {
    align = "left", -- "left", "center", or "right"
  }
}
