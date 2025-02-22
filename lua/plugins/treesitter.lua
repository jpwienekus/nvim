return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_intall = true,
      ensure_installed = {
        'lua',
        'vim',
        'vimdoc',
        'bash',
        'markdown',
        'markdown_inline',
        'svelte',
        'typescript',
        'javascript',
        'tsx',
        'html',
        'css',
        'json',
      },
      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    })
  end,
}
