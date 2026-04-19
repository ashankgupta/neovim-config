return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  config = function()
    require("venv-selector").setup({
      -- 👇 Add your project venv paths
      search_venv_managers = false, -- don't search pyenv/conda etc if not needed
      parents = 1, -- look up 1 parent folder
      name = { "venv", ".venv", "env", ".env" }, -- common venv folder names
      fd_binary_name = "fd", -- use `fd` for better performance (optional)
    })

    vim.keymap.set(
      "n",
      "<leader>v",
      ":VenvSelect<CR>",
      { noremap = true, silent = true, desc = "Select Python Virtual Env" }
    )
  end,
}

