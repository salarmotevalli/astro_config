return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("crates").setup() end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    {
      "saecki/crates.nvim",
      version = "v0.3.0",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("crates").setup {
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
          popup = {
            border = "rounded",
          },
        }
      end,
    },

    {
      "simrat39/rust-tools.nvim",
      -- ft = { "rust", "rs" }, -- IMPORTANT: re-enabling this seems to break inlay-hints
      config = function()
        require("rust-tools").setup {
          tools = {
            executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
            reload_workspace_from_cargo_toml = true,
            inlay_hints = {
              auto = true,
              only_current_line = false,
              show_parameter_hints = true,
              parameter_hints_prefix = "<-",
              other_hints_prefix = "=>",
              max_len_align = false,
              max_len_align_padding = 1,
              right_align = false,
              right_align_padding = 7,
              highlight = "Comment",
            },
            hover_actions = {
              border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
              },
              auto_focus = true,
            },
          },
          server = {
            standalone = false,
          },
        }
      end,
    },
  },
}
