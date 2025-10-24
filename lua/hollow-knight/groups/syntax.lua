-- Syntax highlighting and Treesitter support for Hollow Knight theme
-- The Ancient Language

local M = {}

function M.setup(colors)
  return {
    -- Standard syntax highlighting groups
    Comment = { fg = colors.mask_gray, italic = true },

    -- Constants
    Constant = { fg = colors.crystal_blue },
    String = { fg = colors.lumafly_green },
    Character = { fg = colors.moss_green },
    Number = { fg = colors.pale_gold },
    Boolean = { fg = colors.crystal_blue, italic = true },
    Float = { fg = colors.pale_gold },

    -- Identifiers
    Identifier = { fg = colors.soul_white },
    Function = { fg = colors.geo_yellow },

    -- Statements
    Statement = { fg = colors.void_purple },
    Conditional = { fg = colors.void_purple, italic = true },
    Repeat = { fg = colors.void_purple, italic = true },
    Label = { fg = colors.infection_orange },
    Operator = { fg = colors.pale_white },
    Keyword = { fg = colors.void_purple },
    Exception = { fg = colors.nail_red },

    -- Preprocessor
    PreProc = { fg = colors.infection_orange },
    Include = { fg = colors.infection_orange, italic = true },
    Define = { fg = colors.infection_orange },
    Macro = { fg = colors.infection_orange, italic = true },
    PreCondit = { fg = colors.infection_orange, italic = true },

    -- Types
    Type = { fg = colors.soul_blue },
    StorageClass = { fg = colors.void_purple, italic = true },
    Structure = { fg = colors.soul_blue },
    Typedef = { fg = colors.soul_blue, italic = true },

    -- Special
    Special = { fg = colors.geo_yellow },
    SpecialChar = { fg = colors.infection_orange },
    Tag = { fg = colors.crystal_blue },
    Delimiter = { fg = colors.pale_white },
    SpecialComment = { fg = colors.soul_blue, italic = true },
    Debug = { fg = colors.nail_red },

    -- Treesitter core highlighting
    -- Variables
    ['@variable'] = { fg = colors.soul_white },
    ['@variable.builtin'] = { fg = colors.soul_blue, italic = true },
    ['@variable.parameter'] = { fg = colors.ghost_white, italic = true },
    ['@variable.member'] = { fg = colors.lumafly_green },

    -- Constants
    ['@constant'] = { fg = colors.crystal_blue },
    ['@constant.builtin'] = { fg = colors.crystal_blue, italic = true },
    ['@constant.macro'] = { fg = colors.infection_orange },

    -- Functions and methods
    ['@function'] = { fg = colors.geo_yellow },
    ['@function.builtin'] = { fg = colors.geo_yellow, italic = true },
    ['@function.call'] = { fg = colors.geo_yellow },
    ['@function.macro'] = { fg = colors.infection_orange },
    ['@method'] = { fg = colors.geo_yellow },
    ['@method.call'] = { fg = colors.geo_yellow },
    ['@constructor'] = { fg = colors.geo_yellow },

    -- Keywords
    ['@keyword'] = { fg = colors.void_purple },
    ['@keyword.coroutine'] = { fg = colors.void_purple, italic = true }, -- async/await
    ['@keyword.function'] = { fg = colors.void_purple },
    ['@keyword.operator'] = { fg = colors.void_purple },
    ['@keyword.import'] = { fg = colors.infection_orange, italic = true },
    ['@keyword.export'] = { fg = colors.infection_orange, italic = true },
    ['@keyword.return'] = { fg = colors.void_purple },
    ['@keyword.conditional'] = { fg = colors.void_purple, italic = true },
    ['@keyword.repeat'] = { fg = colors.void_purple, italic = true },
    ['@keyword.exception'] = { fg = colors.nail_red },

    -- Types
    ['@type'] = { fg = colors.soul_blue },
    ['@type.builtin'] = { fg = colors.soul_blue, italic = true },
    ['@type.definition'] = { fg = colors.soul_blue },
    ['@type.qualifier'] = { fg = colors.void_purple, italic = true }, -- const, readonly

    -- Properties and fields
    ['@property'] = { fg = colors.lumafly_green },
    ['@field'] = { fg = colors.lumafly_green },

    -- Literals
    ['@string'] = { fg = colors.lumafly_green },
    ['@string.documentation'] = { fg = colors.moss_green, italic = true },
    ['@string.escape'] = { fg = colors.infection_orange },
    ['@string.regex'] = { fg = colors.infection_orange, italic = true },
    ['@string.special'] = { fg = colors.infection_orange },
    ['@string.special.symbol'] = { fg = colors.crystal_blue },
    ['@character'] = { fg = colors.moss_green },
    ['@character.special'] = { fg = colors.infection_orange },
    ['@number'] = { fg = colors.pale_gold },
    ['@boolean'] = { fg = colors.crystal_blue, italic = true },
    ['@float'] = { fg = colors.pale_gold },

    -- Comments
    ['@comment'] = { fg = colors.mask_gray, italic = true },
    ['@comment.documentation'] = { fg = colors.soul_blue, italic = true },
    ['@comment.error'] = { fg = colors.nail_red },
    ['@comment.warning'] = { fg = colors.infection_orange },
    ['@comment.note'] = { fg = colors.soul_blue },
    ['@comment.todo'] = { fg = colors.geo_yellow },

    -- Punctuation
    ['@punctuation.delimiter'] = { fg = colors.pale_white },
    ['@punctuation.bracket'] = { fg = colors.pale_white },
    ['@punctuation.special'] = { fg = colors.infection_orange },

    -- Operators
    ['@operator'] = { fg = colors.pale_white },

    -- Other
    ['@label'] = { fg = colors.infection_orange },
    ['@namespace'] = { fg = colors.soul_blue },
    ['@attribute'] = { fg = colors.infection_orange, italic = true },
    ['@module'] = { fg = colors.soul_blue },

    -- Markup (Markdown, etc.)
    ['@markup'] = { fg = colors.soul_white },
    ['@markup.strong'] = { bold = true },
    ['@markup.emphasis'] = { italic = true },
    ['@markup.underline'] = { underline = true },
    ['@markup.strike'] = { strikethrough = true },
    ['@markup.heading'] = { fg = colors.geo_yellow, bold = true },
    ['@markup.heading.1'] = { fg = colors.geo_yellow, bold = true },
    ['@markup.heading.2'] = { fg = colors.soul_blue, bold = true },
    ['@markup.heading.3'] = { fg = colors.crystal_blue, bold = true },
    ['@markup.heading.4'] = { fg = colors.lumafly_green, bold = true },
    ['@markup.heading.5'] = { fg = colors.ghost_white, bold = true },
    ['@markup.heading.6'] = { fg = colors.mask_gray, bold = true },
    ['@markup.quote'] = { fg = colors.ghost_white, italic = true },
    ['@markup.math'] = { fg = colors.pale_gold },
    ['@markup.link'] = { fg = colors.soul_blue, underline = true },
    ['@markup.link.label'] = { fg = colors.crystal_blue },
    ['@markup.link.url'] = { fg = colors.soul_blue, underline = true },
    ['@markup.raw'] = { fg = colors.lumafly_green },
    ['@markup.raw.block'] = { fg = colors.lumafly_green },
    ['@markup.list'] = { fg = colors.infection_orange },
    ['@markup.list.checked'] = { fg = colors.moss_green },
    ['@markup.list.unchecked'] = { fg = colors.mask_gray },

    -- Diff
    ['@diff.plus'] = { fg = colors.moss_green },
    ['@diff.minus'] = { fg = colors.nail_red },
    ['@diff.delta'] = { fg = colors.soul_blue },

    -- Tags (HTML, JSX, etc.)
    ['@tag'] = { fg = colors.crystal_blue },
    ['@tag.attribute'] = { fg = colors.soul_blue, italic = true },
    ['@tag.delimiter'] = { fg = colors.pale_white },

    -- Language-specific overrides for better semantic highlighting

    -- Legacy @text.* groups (for older Treesitter versions)
    ['@text'] = { fg = colors.soul_white },
    ['@text.strong'] = { bold = true },
    ['@text.emphasis'] = { italic = true },
    ['@text.underline'] = { underline = true },
    ['@text.strike'] = { strikethrough = true },
    ['@text.title'] = { fg = colors.geo_yellow, bold = true },
    ['@text.literal'] = { fg = colors.lumafly_green },
    ['@text.uri'] = { fg = colors.soul_blue, underline = true },
    ['@text.math'] = { fg = colors.pale_gold },
    ['@text.reference'] = { fg = colors.soul_blue },
    ['@text.environment'] = { fg = colors.infection_orange },
    ['@text.environment.name'] = { fg = colors.geo_yellow },

    -- Notes and TODOs
    ['@text.note'] = { fg = colors.soul_blue },
    ['@text.warning'] = { fg = colors.infection_orange },
    ['@text.danger'] = { fg = colors.nail_red },
    ['@text.todo'] = { fg = colors.geo_yellow },
  }
end

return M