-- Git integration plugins for Hollow Knight theme
-- The Kingdom's history

local M = {}

function M.setup(colors)
  return {
    -- Git signs - The Kingdom's history
    GitSignsAdd = { fg = colors.moss_green },
    GitSignsChange = { fg = colors.soul_blue },
    GitSignsDelete = { fg = colors.nail_red },
    GitSignsCurrentLineBlame = { fg = colors.mask_gray, italic = true },

    -- Git diff
    DiffAdd = { fg = colors.moss_green, bg = colors.shadow_black },
    DiffChange = { fg = colors.soul_blue, bg = colors.shadow_black },
    DiffDelete = { fg = colors.nail_red, bg = colors.shadow_black },
    DiffText = { fg = colors.crystal_blue, bg = colors.pale_black, bold = true },

    -- Additional Git-related highlights
    GitSignsAddNr = { fg = colors.moss_green },
    GitSignsChangeNr = { fg = colors.soul_blue },
    GitSignsDeleteNr = { fg = colors.nail_red },
    GitSignsAddLn = { bg = colors.shadow_black },
    GitSignsChangeLn = { bg = colors.shadow_black },
    GitSignsDeleteLn = { bg = colors.shadow_black },

    -- Fugitive and other Git plugins
    gitcommitSelectedFile = { fg = colors.lumafly_green },
    gitcommitDiscardedFile = { fg = colors.nail_red },
    gitcommitOverflow = { fg = colors.infection_orange },
    gitcommitSummary = { fg = colors.soul_blue },
    gitcommitComment = { fg = colors.mask_gray, italic = true },
    gitcommitUntracked = { fg = colors.mask_gray },
    gitcommitDiscarded = { fg = colors.nail_red },
    gitcommitSelected = { fg = colors.lumafly_green },
    gitcommitHeader = { fg = colors.geo_yellow },
    gitcommitSelectedType = { fg = colors.soul_blue },
    gitcommitUnmergedType = { fg = colors.infection_orange },
    gitcommitDiscardedType = { fg = colors.nail_red },
    gitcommitBranch = { fg = colors.crystal_blue, bold = true },
    gitcommitUntrackedFile = { fg = colors.soul_white },
    gitcommitUnmergedFile = { fg = colors.infection_orange, bold = true },
    gitcommitSelectFile = { fg = colors.lumafly_green },
  }
end

return M