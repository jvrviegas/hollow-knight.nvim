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

  }
end

return M