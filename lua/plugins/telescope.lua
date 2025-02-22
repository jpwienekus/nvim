return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    {
      '<leader>sf',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Search Files',
    },

    {
      '<leader>sg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sb',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = 'Search Buffers',
    },
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = 'Search Help Tags',
    },
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = 'Search Help Tags',
    },
  },
  opts = {
    defaults = {
      promt_prefix = ' ',
      selection_caret = ' ',
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
      layout_config = {
        horizontal = { width = 0.5 }
      },
      file_ignore_patterns = {
        'node%_modules/.*',
        'terraform/.*'
      }
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
}
