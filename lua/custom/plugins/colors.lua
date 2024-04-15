-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FFFFFF', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#FFFFFF', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FFFFFF', bold=true })
end

return {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- dark_style_background = 'transparent'
    },
    config = function(_, opts)
      -- vim.cmd.colorscheme 'monokai-nightasty'
      require("monokai-nightasty").load(opts)
      LineNumberColors()
    end,
}

-- return {
--   'folke/tokyonight.nvim',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     vim.cmd.colorscheme 'tokyonight-night'
--     vim.cmd.hi 'Comment gui=none'
-- 
--     LineNumberColors()
--   end,
-- }
