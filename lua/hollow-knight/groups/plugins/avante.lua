-- Avante.nvim AI copilot support for Hollow Knight theme
-- The Dream Realm and Ancient Knowledge

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- Main titles - Ancient Crown
    AvanteTitle = { fg = colors.void_black, bg = colors.radiance_gold, bold = true },
    AvanteReversedTitle = { fg = colors.radiance_gold },

    -- Subtitles - Soul Essence
    AvanteSubtitle = { fg = colors.void_black, bg = colors.soul_blue, bold = true },
    AvanteReversedSubtitle = { fg = colors.soul_blue },

    -- Third title - Crystal Wisdom
    AvanteThirdTitle = { fg = colors.void_black, bg = colors.crystal_blue, bold = true },
    AvanteReversedThirdTitle = { fg = colors.crystal_blue },

    -- UI Elements - Dream Realm
    AvantePopupHint = { fg = colors.soul_white, bg = should_clear_bg('avante') and 'NONE' or colors.shadow_black },
    AvanteInlineHint = { fg = colors.pale_blue, italic = true },
    AvanteConflictCurrent = { fg = colors.lumafly_green, bg = colors.void_black },
    AvanteConflictIncoming = { fg = colors.soul_blue, bg = colors.void_black },
    AvanteConflictAncestor = { fg = colors.infection_orange, bg = colors.void_black },

    -- Sidebar and panels - Ancient Architecture
    AvanteSidebarTitle = { fg = colors.geo_yellow, bold = true },
    AvanteSidebarContent = { fg = colors.soul_white },
    AvanteSelectedBackground = { bg = colors.pale_black },

    -- Chat interface - Soul Communication
    AvanteChatMessage = { fg = colors.soul_white },
    AvanteChatUser = { fg = colors.crystal_blue, bold = true },
    AvanteChatAssistant = { fg = colors.geo_yellow, bold = true },
    AvanteChatTimestamp = { fg = colors.mask_gray, italic = true },

    -- Code suggestions - Ancient Spells
    AvanteCodeSuggestion = { fg = colors.pale_blue, italic = true },
    AvanteCodeDiff = { fg = colors.lumafly_green },
    AvanteCodeBlock = { fg = colors.soul_white, bg = should_clear_bg('avante') and 'NONE' or colors.shadow_black },

    -- Status indicators - Life and Death
    AvanteStatusRunning = { fg = colors.soul_blue, bold = true },
    AvanteStatusCompleted = { fg = colors.lumafly_green, bold = true },
    AvanteStatusFailed = { fg = colors.blood_red, bold = true },
    AvanteStatusIdle = { fg = colors.mask_gray },

    -- Buttons - Soul Vessels
    AvanteButtonDefault = { fg = colors.soul_white, bg = colors.pale_black },
    AvanteButtonPrimary = { fg = colors.void_black, bg = colors.soul_blue, bold = true },
    AvanteButtonDanger = { fg = colors.soul_white, bg = colors.blood_red, bold = true },
    AvanteButtonHover = { fg = colors.radiance_gold, bg = colors.shadow_black },

    -- Input fields - Dream Gates
    AvanteInput = { fg = colors.soul_white, bg = should_clear_bg('avante') and 'NONE' or colors.shadow_black },
    AvanteInputBorder = { fg = colors.soul_blue },
    AvanteInputFocus = { fg = colors.soul_white, bg = should_clear_bg('avante') and 'NONE' or colors.pale_black },

    -- Progress and loading - Soul Energy
    AvanteProgress = { fg = colors.soul_blue },
    AvanteProgressBackground = { fg = colors.mask_gray },
    AvanteSpinner = { fg = colors.crystal_blue },

    -- Errors and warnings - Infection and Danger
    AvanteError = { fg = colors.blood_red, bold = true },
    AvanteWarning = { fg = colors.infection_orange, bold = true },
    AvanteInfo = { fg = colors.soul_blue },
    AvanteHint = { fg = colors.pale_blue },

    -- Logo gradient - Ancient Seal (14 progressive shades)
    AvanteLogoLine1 = { fg = colors.radiance_gold },
    AvanteLogoLine2 = { fg = colors.geo_yellow },
    AvanteLogoLine3 = { fg = colors.pale_gold },
    AvanteLogoLine4 = { fg = colors.soul_blue },
    AvanteLogoLine5 = { fg = colors.crystal_blue },
    AvanteLogoLine6 = { fg = colors.pale_blue },
    AvanteLogoLine7 = { fg = colors.dream_blue },
    AvanteLogoLine8 = { fg = colors.lumafly_green },
    AvanteLogoLine9 = { fg = colors.moss_green },
    AvanteLogoLine10 = { fg = colors.infection_orange },
    AvanteLogoLine11 = { fg = colors.void_purple },
    AvanteLogoLine12 = { fg = colors.shade_purple },
    AvanteLogoLine13 = { fg = colors.mask_gray },
    AvanteLogoLine14 = { fg = colors.ghost_white },

    -- Additional UI elements
    AvanteFloatBorder = { fg = colors.soul_blue },
    AvanteFloatTitle = { fg = colors.geo_yellow, bold = true },
    AvanteFloatNormal = { fg = colors.soul_white, bg = should_clear_bg('avante') and 'NONE' or colors.shadow_black },
    AvanteTooltip = { fg = colors.pale_blue, bg = should_clear_bg('avante') and 'NONE' or colors.void_black },

    -- Diff highlighting - Knowledge Comparison
    AvanteDiffAdd = { fg = colors.lumafly_green, bg = colors.void_black },
    AvanteDiffDelete = { fg = colors.blood_red, bg = colors.void_black },
    AvanteDiffChange = { fg = colors.infection_orange, bg = colors.void_black },
    AvanteDiffText = { fg = colors.soul_white, bg = colors.shadow_black },
  }
end

return M