return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = "4916d6592ede8c07973490d9322f187e07dfefac",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      install = {
        "css",
        "comment",
        "markdown",
        "markdown_inline",
        "regex",
        "vimdoc",
      },
    },
    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      treesitter.setup(opts)

      if vim.fn.executable("tree-sitter") ~= 1 then
        vim.api.nvim_echo({
          { "tree-sitter CLI not found. Parsers cannot be installed.", "ErrorMsg" },
        }, true, {})
        return false
      end

      treesitter.install(opts.install)

      local function highlight(bufnr, lang)
        if not vim.treesitter.language.add(lang) then
          return vim.notify(
            string.format("Treesitter cannot load parser for language: %s", lang),
            vim.log.levels.INFO,
            { title = "Treesitter" }
          )
        end
        vim.treesitter.start(bufnr)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype
          local buf = args.buf

          -- Skip non-file buffers (terminals, quickfix, help, etc.)
          if bt ~= "" then
            return
          end

          if vim.fn.executable("tree-sitter") ~= 1 then
            return
          end

          if not vim.treesitter.language.get_lang(ft) then
            return
          end

          if vim.list_contains(treesitter.get_installed(), ft) then
            highlight(buf, ft)
          elseif vim.list_contains(treesitter.get_available(), ft) then
            treesitter.install(ft):await(function()
              highlight(buf, ft)
            end)
          end
        end,
      })
    end,
  },
  -- Automatically add and rename html tags.
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
