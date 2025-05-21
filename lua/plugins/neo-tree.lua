-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  window = {
    mappings = {
      ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
      ['l'] = 'focus_preview',
      ['<C-b>'] = { 'scroll_preview', config = { direction = 10 } },
      ['<C-f>'] = { 'scroll_preview', config = { direction = -10 } },
    },
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {},
        never_show = {},
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      window = {},
    },
  },
}
