-- Telescope plugin support for Hollow Knight theme
-- Dreamer's Vision

local M = {}

function M.setup(colors, should_clear_bg)
  local telescope_bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black
  local telescope_transparent = should_clear_bg('telescope')

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

    -- Window backgrounds - core telescope windows
    TelescopeNormal = { fg = colors.soul_white, bg = telescope_bg },
    TelescopePromptNormal = { fg = colors.soul_white, bg = telescope_bg },
    TelescopeResultsNormal = { fg = colors.soul_white, bg = telescope_bg },
    TelescopePreviewNormal = { fg = colors.soul_white, bg = telescope_bg },

    -- Additional window backgrounds for full transparency support
    TelescopePrompt = { fg = colors.soul_white, bg = telescope_bg },
    TelescopeResults = { fg = colors.soul_white, bg = telescope_bg },
    TelescopePreview = { fg = colors.soul_white, bg = telescope_bg },

    -- Content highlights
    TelescopeSelection = { bg = telescope_transparent and colors.shadow_black or colors.void_purple, fg = colors.soul_white },
    TelescopeSelectionCaret = { fg = colors.geo_yellow },
    TelescopeMultiSelection = { fg = colors.infection_orange },
    TelescopeMultiIcon = { fg = colors.infection_orange },

    -- Prompt elements
    TelescopePromptPrefix = { fg = colors.geo_yellow },
    TelescopePromptCounter = { fg = colors.mask_gray },

    -- Matching and searching
    TelescopeMatching = { fg = colors.radiance_gold, bold = true },

    -- Titles with borders
    TelescopeTitle = { fg = colors.soul_blue, bold = true, bg = 'NONE' },
    TelescopePromptTitle = { fg = colors.geo_yellow, bold = true, bg = 'NONE' },
    TelescopeResultsTitle = { fg = colors.soul_blue, bold = true, bg = 'NONE' },
    TelescopePreviewTitle = { fg = colors.soul_blue, bold = true, bg = 'NONE' },

    -- Results content
    TelescopeResultsClass = { fg = colors.void_purple },
    TelescopeResultsConstant = { fg = colors.crystal_blue },
    TelescopeResultsField = { fg = colors.lumafly_green },
    TelescopeResultsFunction = { fg = colors.geo_yellow },
    TelescopeResultsMethod = { fg = colors.geo_yellow },
    TelescopeResultsOperator = { fg = colors.soul_white },
    TelescopeResultsStruct = { fg = colors.void_purple },
    TelescopeResultsVariable = { fg = colors.soul_white },
    TelescopeResultsLineNr = { fg = colors.mask_gray },
    TelescopeResultsIdentifier = { fg = colors.soul_white },
    TelescopeResultsNumber = { fg = colors.pale_gold },
    TelescopeResultsComment = { fg = colors.mask_gray, italic = true },
    TelescopeResultsSpecialComment = { fg = colors.mask_gray, italic = true },

    -- Path and file info
    TelescopePathSeparator = { fg = colors.mask_gray },
    TelescopeResultsDiffAdd = { fg = colors.moss_green },
    TelescopeResultsDiffChange = { fg = colors.soul_blue },
    TelescopeResultsDiffDelete = { fg = colors.blood_red },
  }
end

return M