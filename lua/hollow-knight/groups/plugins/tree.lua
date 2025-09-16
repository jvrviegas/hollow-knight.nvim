-- Tree explorer plugins (NvimTree & Neo-tree) for Hollow Knight theme
-- Hallownest's paths

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- NvimTree - Hallownest's paths (with transparency support)
    NvimTreeNormal = { fg = colors.soul_white }, -- Transparent background
    NvimTreeNormalNC = { fg = colors.soul_white }, -- Transparent background when not current
    NvimTreeEndOfBuffer = { fg = colors.void_black }, -- Hide end of buffer tildes
    NvimTreeVertSplit = { fg = colors.pale_black }, -- Transparent vertical split
    NvimTreeFolderIcon = { fg = colors.soul_blue },
    NvimTreeFolderName = { fg = colors.pale_blue },
    NvimTreeOpenedFolderName = { fg = colors.soul_blue, bold = true },
    NvimTreeIndentMarker = { fg = colors.mask_gray },
    NvimTreeGitDirty = { fg = colors.infection_orange },
    NvimTreeGitNew = { fg = colors.moss_green },
    NvimTreeGitDeleted = { fg = colors.nail_red },
    NvimTreeSpecialFile = { fg = colors.geo_yellow },
    NvimTreeExecutable = { fg = colors.lumafly_green, bold = true },

    -- Neo-tree - Modern Hallownest navigation (with transparency support)
    NeoTreeNormal = { fg = colors.soul_white, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black },
    NeoTreeNormalNC = { fg = colors.soul_white, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black },
    NeoTreeEndOfBuffer = { fg = colors.void_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black },
    NeoTreeVertSplit = { fg = colors.pale_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.void_black },
    NeoTreeWinSeparator = { fg = colors.pale_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.void_black },
    NeoTreeDirectoryName = { fg = colors.pale_blue },
    NeoTreeDirectoryIcon = { fg = colors.soul_blue },
    NeoTreeFileName = { fg = colors.soul_white },
    NeoTreeFileIcon = { fg = colors.ghost_white },
    NeoTreeModified = { fg = colors.infection_orange },
    NeoTreeGitAdded = { fg = colors.moss_green },
    NeoTreeGitModified = { fg = colors.soul_blue },
    NeoTreeGitDeleted = { fg = colors.nail_red },
    NeoTreeGitIgnored = { fg = colors.mask_gray },
    NeoTreeGitUntracked = { fg = colors.lumafly_green },
    NeoTreeIndentMarker = { fg = colors.mask_gray },
    NeoTreeExpander = { fg = colors.soul_blue },
    NeoTreeDimText = { fg = colors.mask_gray },
  }
end

return M