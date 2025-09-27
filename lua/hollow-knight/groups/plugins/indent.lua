-- Indent-blankline plugin for Hollow Knight theme
-- Ancient Architecture and Structural Lines

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- v2 compatibility (legacy names)
    IndentBlanklineChar = { fg = colors.palette.ui.mask, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.palette.soul.bright, nocombine = true },
    IndentBlanklineContextStart = { sp = colors.palette.soul.bright, underline = true },
    IndentBlanklineSpaceChar = { fg = colors.palette.ui.mask, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = colors.palette.abyss.shadow, nocombine = true },

    -- v3 highlight groups (current version)
    IblIndent = { fg = colors.palette.ui.mask, nocombine = true },
    IblWhitespace = { fg = colors.palette.abyss.shadow, nocombine = true },
    IblScope = { fg = colors.palette.soul.bright, nocombine = true },

    -- Scope highlighting variants for different contexts
    IblScopeChar = { fg = colors.palette.soul.bright, nocombine = true },
    IblScopeStart = { sp = colors.palette.soul.bright, underline = true },
    IblScopeEnd = { sp = colors.palette.soul.bright, underline = true },

    -- Rainbow indent colors (for rainbow-delimiters integration)
    RainbowDelimiterRed = { fg = colors.palette.combat.nail },
    RainbowDelimiterYellow = { fg = colors.palette.city.geo },
    RainbowDelimiterBlue = { fg = colors.palette.soul.bright },
    RainbowDelimiterOrange = { fg = colors.palette.infection.bright },
    RainbowDelimiterGreen = { fg = colors.palette.greenpath.moss },
    RainbowDelimiterViolet = { fg = colors.palette.void.bright },
    RainbowDelimiterCyan = { fg = colors.palette.soul.crystal },
  }
end

return M