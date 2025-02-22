return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    -- configure autopairs
    local npairs = require("nvim-autopairs")
    local Rule = require('nvim-autopairs.rule')

    npairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
      },
      -- Don't add pairs if it already has a close pair in the same line
      enable_check_bracket_line = true,
      -- Will not add pair on that line if there are no symbols
      ignored_next_char = "[%w%.]",
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        manual_position = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    })

    -- add more pairs if you want
    npairs.add_rules({
      Rule("$$", "$$", "tex"), -- add $$ pairs for tex
      Rule("$", "$", "tex"),   -- add $ pairs for tex
    })

    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
