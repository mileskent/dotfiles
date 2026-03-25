return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true },
    picker = { enabled = true },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    local function goto_buffer_by_index(index)
      local bufs = vim.tbl_filter(function(b)
        return vim.api.nvim_get_option_value("buflisted", { buf = b })
      end, vim.api.nvim_list_bufs())
      local target = bufs[index]
      if target and vim.api.nvim_buf_is_valid(target) then
        vim.api.nvim_set_current_buf(target)
      end
    end
    for i = 1, 9 do
      vim.keymap.set('n', string.format('<M-%d>', i), function()
        goto_buffer_by_index(i)
      end, { desc = "Go to buffer " .. i })
    end
  end,
  keys = {
    { "gb", ":bnext<CR>", desc = "Next Buffer" },
    { "gB", ":bprev<CR>", desc = "Prev Buffer" },
    { "<leader>bl", function() Snacks.picker.buffers() end, desc = "Buffer List" },
    { "<leader>bc", function() Snacks.bufdelete({ force = true }) end, desc = "Close Buffer" },
    { "<leader>bC", function() Snacks.bufdelete.other() end, desc = "Close other Buffers" },
  },
}
