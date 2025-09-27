-- Indent-blankline plugin for Hollow Knight theme
-- Ancient Architecture and Structural Lines

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- v2 compatibility (legacy names)
    IndentBlanklineChar = { fg = colors.mask_gray, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.soul_blue, nocombine = true },
    IndentBlanklineContextStart = { sp = colors.soul_blue, underline = true },
    IndentBlanklineSpaceChar = { fg = colors.mask_gray, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = colors.shadow_black, nocombine = true },

    -- v3 highlight groups (current version)
    IblIndent = { fg = colors.mask_gray, nocombine = true },
    IblWhitespace = { fg = colors.shadow_black, nocombine = true },
    IblScope = { fg = colors.soul_blue, nocombine = true },

    -- Scope highlighting variants for different contexts
    IblScopeChar = { fg = colors.soul_blue, nocombine = true },
    IblScopeStart = { sp = colors.soul_blue, underline = true },
    IblScopeEnd = { sp = colors.soul_blue, underline = true },

    -- Rainbow indent colors (for rainbow-delimiters integration)
    RainbowDelimiterRed = { fg = colors.nail_red },
    RainbowDelimiterYellow = { fg = colors.geo_yellow },
    RainbowDelimiterBlue = { fg = colors.soul_blue },
    RainbowDelimiterOrange = { fg = colors.infection_orange },
    RainbowDelimiterGreen = { fg = colors.moss_green },
    RainbowDelimiterViolet = { fg = colors.void_purple },
    RainbowDelimiterCyan = { fg = colors.crystal_blue },
  }
end

return M