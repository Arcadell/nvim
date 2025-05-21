return {
  'sindrets/diffview.nvim',
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewFileHistory',
  },
  keys = {
    { '<leader>gg', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>gf', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
  },
  config = function()
    require('diffview').setup {
      -- Optional configuration
      enhanced_diff_hl = true,
      use_icons = true,
      signs = {
        fold_closed = '',
        fold_open = '',
      },
      file_panel = {
        listing_style = 'tree',
        win_config = {
          position = 'left',
          width = 35,
        },
      },
    }
  end,
}
