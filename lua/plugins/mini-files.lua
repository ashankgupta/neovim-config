return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    local mini_files = require("mini.files")

    mini_files.setup({
      mappings = {
        close       = 'q',
        go_in       = '<Right>',
        go_out      = '<Left>',
        reset       = '<BS>',
        show_help   = 'g?',
        synchronize = 's',
        trim_left   = '<',
        trim_right  = '>',
        create      = 'a',
      }
    })

    -- 🗂 Custom Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "" }

    -- Toggle dotfiles logic
    local show_dotfiles = true
    local filter_show = function(fs_entry) return true end
    local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

    local function toggle_dotfiles()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      mini_files.refresh({ content = { filter = new_filter } })
    end

    map("n", "<leader>e", function()
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" then path = vim.loop.cwd() end
      mini_files.open(path, true)
    end, { desc = "Open MiniFiles (current file dir)" })

    vim.keymap.set("n", "<leader>.", toggle_dotfiles, { desc = "Toggle dotfiles in MiniFiles" })

    map("n", "<leader>u", function()
      mini_files.go_out()
    end, { desc = "Go up in MiniFiles" })

    map("n", "<leader>r", function()
      mini_files.refresh()
    end, { desc = "Refresh MiniFiles view" })
  end,
}
