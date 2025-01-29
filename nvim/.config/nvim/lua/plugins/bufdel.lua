return {
  { "ojroques/nvim-bufdel" },
  config = function ()
    require('bufdel').setup()  
    vim.keymap.set("n", "<leader>bd", ":BufDel", { desc = "Delete Buffer" })
  end 
  
}
