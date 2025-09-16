-- Core editor highlight groups for Hollow Knight theme
-- The Kingdom's foundation

local M = {}

function M.setup(colors, transparent, should_clear_bg)
  return {
    -- Editor highlights - The Kingdom's foundation
    Normal = { fg = colors.soul_white, bg = transparent and 'NONE' or colors.void_black },
    NormalFloat = { fg = colors.soul_white, bg = (transparent or should_clear_bg('float_win')) and 'NONE' or colors.shadow_black },
    CursorLine = { bg = colors.shadow_black },
    CursorColumn = { bg = colors.shadow_black },
    LineNr = { fg = colors.mask_gray },
    CursorLineNr = { fg = colors.crystal_blue, bold = true }, -- More vibrant for better visibility
    SignColumn = { bg = colors.void_black },
    Folded = { fg = colors.pale_white, bg = colors.pale_black, italic = true }, -- Better contrast
    FoldColumn = { fg = colors.mask_gray, bg = colors.void_black },
    ColorColumn = { bg = colors.shadow_black },
    VertSplit = { fg = colors.soul_blue, bg = colors.void_black }, -- Improved visibility
    WinSeparator = { fg = colors.soul_blue, bg = 'NONE' }, -- Modern Neovim window separator
    Visual = { bg = colors.shadow_black, fg = colors.soul_white }, -- Very subtle background, same as cursor line
    VisualNOS = { bg = colors.shadow_black, fg = colors.soul_white }, -- Consistent with Visual
    Search = { fg = colors.void_black, bg = colors.geo_yellow, bold = true }, -- Made bold for prominence
    IncSearch = { fg = colors.void_black, bg = colors.infection_orange, bold = true }, -- Made bold for prominence
    MatchParen = { fg = colors.crystal_blue, bg = colors.pale_black, bold = true, underline = true }, -- Added background for better visibility

    -- Popup menu - Ancient UI
    Pmenu = { fg = colors.soul_white, bg = colors.shadow_black },
    PmenuSel = { fg = colors.void_black, bg = colors.soul_blue },
    PmenuSbar = { bg = colors.pale_black },
    PmenuThumb = { bg = colors.mask_gray },

    -- Statusline - The Knight's HUD
    StatusLine = { fg = colors.soul_white, bg = colors.pale_black },
    StatusLineNC = { fg = colors.mask_gray, bg = colors.shadow_black },
    ModeMsg = { fg = colors.geo_yellow, bold = true },
    MoreMsg = { fg = colors.lumafly_green },
    Question = { fg = colors.soul_blue },
    WarningMsg = { fg = colors.infection_orange },
    ErrorMsg = { fg = colors.blood_red, bold = true },

    -- Tabline - Ancient Tablets
    TabLine = { fg = colors.ghost_white, bg = colors.shadow_black },
    TabLineFill = { bg = colors.shadow_black },
    TabLineSel = { fg = colors.soul_white, bg = colors.pale_black },

    -- General floating window borders
    FloatBorder = { fg = colors.soul_blue, bg = 'NONE' },

    -- Basic text formatting
    Underlined = { fg = colors.soul_blue, underline = true },
    Ignore = { fg = colors.mask_gray },
    Error = { fg = colors.blood_red, bold = true },
    Todo = { fg = colors.geo_yellow, bg = colors.shadow_black, bold = true },
  }
end

return M