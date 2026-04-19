return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Automatically update parsers
  event = { "BufReadPost", "BufNewFile" }, -- Lazy load on file open
  opts = {
    ensure_installed = { "c", "cpp", "python", "lua", "javascript", "typescript", "java" }, -- Add your required languages
    highlight = { enable = true }, -- Syntax highlighting
    indent = { enable = true }, -- Auto indentation
    incremental_selection = { enable = true },
    fold = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)
    -- Enable treesitter-based folding
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable = true
    vim.opt.foldlevel = 99 -- Open all folds by default
  end
}
