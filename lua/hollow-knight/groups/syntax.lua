-- Syntax highlighting and Treesitter support for Hollow Knight theme
-- The Ancient Language

local M = {}

function M.setup(colors)
  return {
    -- Syntax highlighting - The Ancient Language (Enhanced for readability)
    Comment = { fg = colors.mask_gray, italic = true },
    Constant = { fg = colors.crystal_blue, bold = true }, -- Made bold for prominence
    String = { fg = colors.lumafly_green },
    Character = { fg = colors.moss_green, bold = true }, -- Better distinction from strings
    Number = { fg = colors.pale_gold },
    Boolean = { fg = colors.crystal_blue, italic = true }, -- Different from constants
    Float = { fg = colors.radiance_gold },
    Identifier = { fg = colors.soul_white }, -- Better contrast, use main text color
    Function = { fg = colors.geo_yellow, bold = true },
    Statement = { fg = colors.void_purple, bold = true },
    Conditional = { fg = colors.void_purple, italic = true }, -- Consistent with statement but distinct
    Repeat = { fg = colors.void_purple, italic = true }, -- Consistent with conditional
    Label = { fg = colors.infection_orange, bold = true }, -- More prominent
    Operator = { fg = colors.pale_white, bold = true }, -- Better visibility
    Keyword = { fg = colors.shade_purple, bold = true }, -- More distinct from dream_blue
    Exception = { fg = colors.nail_red, bold = true },
    PreProc = { fg = colors.infection_orange }, -- Different from void_purple for distinction
    Include = { fg = colors.crystal_blue, italic = true }, -- Distinct from other preprocessor
    Define = { fg = colors.pale_blue, bold = true }, -- More prominent
    Macro = { fg = colors.infection_orange, italic = true }, -- Distinct from other orange elements
    PreCondit = { fg = colors.shade_purple, italic = true },
    Type = { fg = colors.soul_blue, bold = true },
    StorageClass = { fg = colors.dream_blue, italic = true }, -- Distinct from type
    Structure = { fg = colors.pale_blue, bold = true }, -- More prominent
    Typedef = { fg = colors.crystal_blue, italic = true }, -- Distinct from structure
    Special = { fg = colors.radiance_gold, bold = true }, -- More prominent
    SpecialChar = { fg = colors.infection_orange, bold = true }, -- Better visibility
    Tag = { fg = colors.lumafly_green, bold = true }, -- More prominent
    Delimiter = { fg = colors.pale_white }, -- Better contrast than ghost_white
    SpecialComment = { fg = colors.soul_blue, bold = true, italic = true }, -- More distinct
    Debug = { fg = colors.crimson_red, bold = true },

    -- Treesitter highlights - Modern Hallownest Magic (Enhanced readability)
    ['@variable'] = { fg = colors.soul_white },
    ['@variable.builtin'] = { fg = colors.soul_blue, italic = true }, -- Distinguished from regular variables
    ['@property'] = { fg = colors.crystal_blue }, -- More distinct, brighter blue
    ['@function'] = { fg = colors.geo_yellow, bold = true },
    ['@function.builtin'] = { fg = colors.radiance_gold, italic = true }, -- Distinguished from user functions
    ['@method'] = { fg = colors.lumafly_green, bold = true }, -- More prominent
    ['@constructor'] = { fg = colors.crystal_blue, bold = true },
    ['@keyword'] = { fg = colors.shade_purple, bold = true }, -- Consistent with syntax keywords
    ['@keyword.function'] = { fg = colors.void_purple, italic = true }, -- Distinct from regular keywords
    ['@keyword.return'] = { fg = colors.nail_red, bold = true }, -- More attention-grabbing
    ['@type'] = { fg = colors.soul_blue, bold = true },
    ['@type.builtin'] = { fg = colors.pale_blue, italic = true }, -- Distinguished from user types
    ['@string'] = { fg = colors.lumafly_green },
    ['@string.escape'] = { fg = colors.infection_orange, bold = true }, -- More visible
    ['@number'] = { fg = colors.pale_gold, bold = true }, -- Better visibility
    ['@boolean'] = { fg = colors.crystal_blue, italic = true }, -- Consistent with syntax booleans
    ['@comment'] = { fg = colors.mask_gray, italic = true },
    ['@punctuation.bracket'] = { fg = colors.pale_white, bold = true }, -- Better visibility
    ['@punctuation.delimiter'] = { fg = colors.pale_white },

    -- Additional Treesitter groups for completeness
    ['@constant'] = { fg = colors.crystal_blue, bold = true },
    ['@constant.builtin'] = { fg = colors.dream_blue, italic = true },
    ['@constant.macro'] = { fg = colors.infection_orange, italic = true },
    ['@operator'] = { fg = colors.pale_white, bold = true },
    ['@field'] = { fg = colors.pale_blue },
    ['@parameter'] = { fg = colors.ghost_white, italic = true },
    ['@namespace'] = { fg = colors.dream_blue },
    ['@symbol'] = { fg = colors.crystal_blue },
    ['@text'] = { fg = colors.soul_white },
    ['@text.strong'] = { fg = colors.soul_white, bold = true },
    ['@text.emphasis'] = { fg = colors.soul_white, italic = true },
    ['@text.underline'] = { fg = colors.soul_white, underline = true },
    ['@text.strike'] = { fg = colors.mask_gray, strikethrough = true },
    ['@text.title'] = { fg = colors.geo_yellow, bold = true },
    ['@text.literal'] = { fg = colors.lumafly_green },
    ['@text.uri'] = { fg = colors.soul_blue, underline = true },
    ['@text.math'] = { fg = colors.pale_gold },
    ['@text.reference'] = { fg = colors.soul_blue },
    ['@text.environment'] = { fg = colors.infection_orange },
    ['@text.environment.name'] = { fg = colors.radiance_gold },
    ['@note'] = { fg = colors.soul_blue },
    ['@warning'] = { fg = colors.infection_orange },
    ['@danger'] = { fg = colors.blood_red },

    -- JSX/React focused highlighting for component vs props clarity
    ['@constructor'] = { fg = colors.radiance_gold, bold = true }, -- React components (PascalCase)
    ['@tag'] = { fg = colors.crystal_blue }, -- HTML tags (lowercase)
    ['@tag.attribute'] = { fg = colors.lumafly_green, italic = true }, -- JSX props/attributes
    ['@tag.delimiter'] = { fg = colors.pale_white }, -- JSX angle brackets
  }
end

return M