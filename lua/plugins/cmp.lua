return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparawaiz1/cmp_luasnip',
    -- 'rafamadriz/friendly-snippets',
    'zbirenbaum/copilot-cmp',
  },
  config = function()
    local cmp = require('cmp')
    -- local luasnip = require('luasnip')

    cmp.setup({
      -- snippet = {
      --   expand = function(args)
      --     luasnip.lsp_expand(args.body)
      --   end,
      -- },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' })
      }),
      sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      formatting = {
        format = function(entry, vim_item)
          local kind_icons = {
            Text = ' ',
            Method = '󰆧  ',
            Function = '󰊕',
            Constructor = ' ',
            Field = '󰇽 ',
            Variable = '󰂡',
            Class = '󰠱 ',
            Interface = '  ',
            Module = '  ',
            Property = '󰜢 ',
            Unit = ' ',
            Value = '󰎠 ',
            Enum = ' ',
            Keyword = '󰌋 ',
            Snippet = ' ',
            Color = '󰏘 ',
            File = '󰈙 ',
            Reference = ' ',
            Folder = '󰉋 ',
            EnumMember = ' ',
            Constant = '󰏿',
            Struct = '  ',
            Event = ' ',
            Operator = '󰆕 ',
            TypeParameter = '󰅲',
            Copilot = '󰚩 ',
          }

          if entry.source.name == "copilot" then
            vim_item.kind = "Copilot"
          end

          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end
      },
    })
  end,
}
