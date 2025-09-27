-- UI plugins (WhichKey, Bufferline, Alpha, etc.) for Hollow Knight theme
-- Ancient Spells and Soul Vessels

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- WhichKey - Ancient Spells
    WhichKey = { fg = colors.function_name },
    WhichKeyGroup = { fg = colors.accent },
    WhichKeyDesc = { fg = colors.fg },
    WhichKeySeparator = { fg = colors.comment },
    WhichKeyFloat = { bg = colors.bg_highlight },

    -- Bufferline - Soul Vessels
    BufferLineFill = { bg = colors.bg },
    BufferLineBackground = { fg = colors.comment, bg = colors.bg_highlight },
    BufferLineBuffer = { fg = colors.fg, bg = colors.bg_alt },
    BufferLineBufferSelected = { fg = colors.function_name, bg = colors.bg, bold = true },
    BufferLineIndicatorSelected = { fg = colors.accent },


    -- Dashboard/Alpha - The Pale King's Throne
    AlphaShortcut = { fg = colors.function_name },
    AlphaHeader = { fg = colors.accent },
    AlphaHeaderLabel = { fg = colors.number },
    AlphaButtons = { fg = colors.fg },
    AlphaFooter = { fg = colors.comment, italic = true },

    -- Notifications and Noice - Ancient Messages
    NotifyBackground = { bg = should_clear_bg('notify') and 'NONE' or colors.bg_highlight },
    NotifyERRORBorder = { fg = colors.error },
    NotifyWARNBorder = { fg = colors.warning },
    NotifyINFOBorder = { fg = colors.info },
    NotifyDEBUGBorder = { fg = colors.comment },
    NotifyTRACEBorder = { fg = colors.fg_alt },
    NoiceCmdlinePopup = { fg = colors.fg, bg = should_clear_bg('noice') and 'NONE' or colors.bg_highlight },
    NoiceCmdlineIcon = { fg = colors.function_name },
    NoiceConfirm = { fg = colors.fg, bg = should_clear_bg('noice') and 'NONE' or colors.bg_highlight },
    NoicePopupmenu = { fg = colors.fg, bg = should_clear_bg('noice') and 'NONE' or colors.bg_highlight },
  }
end

return M