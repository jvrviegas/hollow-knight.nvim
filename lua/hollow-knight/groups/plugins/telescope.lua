-- Telescope plugin support for Hollow Knight theme
-- Dreamer's Vision

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- Main border highlights with high contrast
    TelescopeBorder = { fg = colors.soul_blue, bg = 'NONE' },
    TelescopePromptBorder = { fg = colors.soul_blue, bg = 'NONE' },
    TelescopeResultsBorder = { fg = colors.soul_blue, bg = 'NONE' },
    TelescopePreviewBorder = { fg = colors.soul_blue, bg = 'NONE' },

    -- Alternative border names that some Telescope configs use
    TelescopePromptBorderFocus = { fg = colors.soul_blue, bg = 'NONE' },
    TelescopeResultsBorderFocus = { fg = colors.soul_blue, bg = 'NONE' },
    TelescopePreviewBorderFocus = { fg = colors.soul_blue, bg = 'NONE' },

    -- Window backgrounds
    TelescopeNormal = { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black },
    TelescopePromptNormal = { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black },
    TelescopeResultsNormal = { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black },
    TelescopePreviewNormal = { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black },

    -- Content highlights
    TelescopeSelection = { bg = colors.void_purple, fg = colors.soul_white },
    TelescopeMultiSelection = { fg = colors.infection_orange },
    TelescopePromptPrefix = { fg = colors.geo_yellow },
    TelescopeMatching = { fg = colors.radiance_gold, bold = true },

    -- Titles with borders
    TelescopeTitle = { fg = colors.soul_blue, bold = true },
    TelescopePromptTitle = { fg = colors.geo_yellow, bold = true },
    TelescopeResultsTitle = { fg = colors.soul_blue, bold = true },
    TelescopePreviewTitle = { fg = colors.soul_blue, bold = true },
  }
end

return M