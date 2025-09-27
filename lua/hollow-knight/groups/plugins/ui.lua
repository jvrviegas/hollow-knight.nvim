-- UI plugins (WhichKey, Bufferline, Alpha, etc.) for Hollow Knight theme
-- Ancient Spells and Soul Vessels

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- WhichKey - Ancient Spells
    WhichKey = { fg = colors.geo_yellow },
    WhichKeyGroup = { fg = colors.soul_blue },
    WhichKeyDesc = { fg = colors.soul_white },
    WhichKeySeparator = { fg = colors.mask_gray },
    WhichKeyFloat = { bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black },

    -- Bufferline - Soul Vessels
    BufferLineFill = { bg = colors.void_black },
    BufferLineBackground = { fg = colors.mask_gray, bg = colors.shadow_black },
    BufferLineBuffer = { fg = colors.soul_white, bg = colors.pale_black },
    BufferLineBufferSelected = { fg = colors.geo_yellow, bg = colors.void_black, bold = true },
    BufferLineIndicatorSelected = { fg = colors.soul_blue },
    BufferLineModified = { fg = colors.infection_orange },
    BufferLineModifiedSelected = { fg = colors.infection_orange, bg = colors.void_black },

    -- Dashboard/Alpha - The Pale King's Throne
    AlphaShortcut = { fg = colors.geo_yellow },
    AlphaHeader = { fg = colors.soul_blue },
    AlphaHeaderLabel = { fg = colors.pale_gold },
    AlphaButtons = { fg = colors.soul_white },
    AlphaFooter = { fg = colors.mask_gray, italic = true },

    -- Notifications and Noice - Ancient Messages
    NotifyBackground = { bg = should_clear_bg('notify') and 'NONE' or colors.shadow_black },
    NotifyERRORBorder = { fg = colors.blood_red },
    NotifyWARNBorder = { fg = colors.infection_orange },
    NotifyINFOBorder = { fg = colors.soul_blue },
    NotifyDEBUGBorder = { fg = colors.mask_gray },
    NotifyTRACEBorder = { fg = colors.ghost_white },
    NoiceCmdlinePopup = { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black },
    NoiceCmdlineIcon = { fg = colors.geo_yellow },
    NoiceConfirm = { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black },
    NoicePopupmenu = { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black },

    -- Additional UI elements
    FloatBorder = { fg = colors.soul_blue, bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black },
    NormalFloat = { fg = colors.soul_white, bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black },
  }
end

return M