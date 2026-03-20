-- Set git merge marker highlights - See :h diff.txt
vim.api.nvim_set_hl(0, "DiffText", { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#ffffff", bg = "#1d3450" })

return {
  {
    -- Git blame virtual text, code change markers.
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 250,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "      <author>, <author_time:%R> • <summary>",
      current_line_blame_formatter_nc = "      <author>",
    },
  },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>gv", "<cmd>CodeDiff<cr>" },
    },
    config = function()
      require("codediff").setup({
        explorer = {
          view_mode = "tree",
          indent_markers = false,
        },
      })
      -- Monkey-patch group headers to use a distinct highlight
      vim.api.nvim_set_hl(0, "CodeDiffGroupHeader", { link = "Title", default = true })
      local nodes = require("codediff.ui.explorer.nodes")
      local orig_prepare_node = nodes.prepare_node
      nodes.prepare_node = function(node, max_width, selected_path, selected_group)
        if node.data and node.data.type == "group" then
          local Line = require("codediff.ui.lib.line")
          local line = Line()
          line:append(" ", "CodeDiffGroupHeader")
          line:append(node.text, "CodeDiffGroupHeader")
          return line
        end
        return orig_prepare_node(node, max_width, selected_path, selected_group)
      end

      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          if vim.bo.filetype == "codediff-explorer" then
            vim.wo.spell = false
          end
        end,
      })
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = true, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = {
        -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },
}
