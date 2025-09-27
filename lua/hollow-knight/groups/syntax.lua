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
    ['@property'] = { fg = colors.lumafly_green }, -- Interface/object properties in green
    ['@function'] = { fg = colors.geo_yellow, bold = true },
    ['@function.builtin'] = { fg = colors.radiance_gold, italic = true }, -- Distinguished from user functions
    ['@method'] = { fg = colors.lumafly_green, bold = true }, -- More prominent
    ['@constructor'] = { fg = colors.crystal_blue, bold = true },
    ['@keyword'] = { fg = colors.shade_purple, bold = true }, -- Consistent with syntax keywords
    ['@keyword.function'] = { fg = colors.void_purple, italic = true }, -- Distinct from regular keywords
    ['@keyword.storage'] = { fg = colors.void_purple, bold = true }, -- const, let, var
    ['@keyword.operator'] = { fg = colors.pale_white, bold = true }, -- typeof, instanceof
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
    ['@field'] = { fg = colors.lumafly_green }, -- Object fields/properties
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

    -- Enhanced JavaScript/TypeScript/JSX/TSX highlighting
    -- Template strings and interpolation (enhanced for template literals)
    ['@string.template'] = { fg = colors.moss_green, italic = true },
    ['@punctuation.special'] = { fg = colors.radiance_gold, bold = true }, -- Template literal ${...}

    -- JSX/React specific enhancements
    ['@tag'] = { fg = colors.crystal_blue }, -- HTML-like tags in JSX
    ['@tag.attribute'] = { fg = colors.soul_blue, italic = true }, -- JSX prop names (blue)
    ['@tag.delimiter'] = { fg = colors.pale_white }, -- JSX angle brackets < >

    -- Enhanced JSX prop value highlighting
    ['@string.quoted'] = { fg = colors.lumafly_green }, -- Quoted prop values (green)
    ['@punctuation.bracket'] = { fg = colors.radiance_gold }, -- Curly braces {}
    ['@variable.parameter.jsx'] = { fg = colors.geo_yellow }, -- Variables in JSX expressions
    ['@variable.parameter.tsx'] = { fg = colors.geo_yellow }, -- Variables in TSX expressions

    -- Better function call highlighting (for React hooks and JavaScript methods)
    ['@function.call'] = { fg = colors.geo_yellow },

    -- Import/Export enhancements
    ['@keyword.import'] = { fg = colors.crystal_blue, italic = true },
    ['@keyword.export'] = { fg = colors.infection_orange, italic = true },

    -- Object method highlighting
    ['@method.call'] = { fg = colors.lumafly_green },

    -- Variable member access (for object.property syntax)
    ['@variable.member'] = { fg = colors.crystal_blue },

    -- Enhanced TypeScript-specific highlighting
    ['@type'] = { fg = colors.soul_blue, bold = true }, -- Type annotations
    ['@type.builtin'] = { fg = colors.crystal_blue, italic = true }, -- Built-in types (string, number, etc.)
    ['@type.definition'] = { fg = colors.soul_blue, bold = true }, -- Type definitions
    ['@keyword.storage'] = { fg = colors.void_purple, bold = true }, -- const, let, var
    ['@keyword.type'] = { fg = colors.dream_blue, italic = true }, -- interface, type, enum
    ['@keyword.modifier'] = { fg = colors.shade_purple, italic = true }, -- public, private, static
    ['@constructor.name'] = { fg = colors.radiance_gold, bold = true }, -- Class constructors

    -- Better class and interface distinction
    ['@type.qualifier'] = { fg = colors.soul_blue, bold = true }, -- Class names in types

    -- Interface property names vs types distinction
    ['@property'] = { fg = colors.lumafly_green }, -- Interface property names (green)
    ['@property.typescript'] = { fg = colors.lumafly_green }, -- TypeScript property names
    ['@field'] = { fg = colors.lumafly_green }, -- Interface field names

    -- Async/await keywords
    ['@keyword.coroutine'] = { fg = colors.infection_orange, bold = true }, -- async, await

    -- Generic type parameters
    ['@parameter.type'] = { fg = colors.dream_blue, italic = true }, -- <T, K, V>

    -- Decorators (if using)
    ['@decorator'] = { fg = colors.infection_orange, italic = true },

    -- Better property highlighting
    ['@property.definition'] = { fg = colors.lumafly_green, bold = true }, -- Property definitions

    -- Enhanced conditional and control flow
    ['@keyword.conditional'] = { fg = colors.void_purple, italic = true },
    ['@keyword.repeat'] = { fg = colors.void_purple, italic = true },

    -- Specific TypeScript/JavaScript Tree-sitter groups
    ['@variable.builtin.typescript'] = { fg = colors.soul_blue, italic = true },
    ['@type.typescript'] = { fg = colors.soul_blue, bold = true },
    ['@type.builtin.typescript'] = { fg = colors.crystal_blue, italic = true },
    ['@constructor.typescript'] = { fg = colors.radiance_gold, bold = true },
    ['@keyword.storage.typescript'] = { fg = colors.void_purple, bold = true },
    ['@keyword.type.typescript'] = { fg = colors.dream_blue, italic = true },
    ['@function.typescript'] = { fg = colors.geo_yellow, bold = true },
    ['@method.typescript'] = { fg = colors.geo_yellow, bold = true },
    ['@property.typescript'] = { fg = colors.lumafly_green },
    ['@parameter.typescript'] = { fg = colors.soul_white, italic = true },

    -- JavaScript specific
    ['@variable.builtin.javascript'] = { fg = colors.soul_blue, italic = true },
    ['@function.javascript'] = { fg = colors.geo_yellow, bold = true },
    ['@method.javascript'] = { fg = colors.geo_yellow, bold = true },
    ['@property.javascript'] = { fg = colors.lumafly_green },

    -- More specific Tree-sitter groups
    ['@lsp.type.class.typescript'] = { fg = colors.radiance_gold, bold = true },
    ['@lsp.type.interface.typescript'] = { fg = colors.crystal_blue, bold = true },
    ['@lsp.type.type.typescript'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.enum.typescript'] = { fg = colors.radiance_gold, bold = true },

    -- Specific JSX/TSX prop highlighting
    ['@tag.attribute.jsx'] = { fg = colors.soul_blue, italic = true }, -- JSX prop names
    ['@tag.attribute.tsx'] = { fg = colors.soul_blue, italic = true }, -- TSX prop names
    ['@string.quoted.jsx'] = { fg = colors.lumafly_green }, -- JSX quoted prop values
    ['@string.quoted.tsx'] = { fg = colors.lumafly_green }, -- TSX quoted prop values
    ['@punctuation.bracket.jsx'] = { fg = colors.radiance_gold }, -- JSX {} brackets
    ['@punctuation.bracket.tsx'] = { fg = colors.radiance_gold }, -- TSX {} brackets

    -- JSX/TSX expression highlighting
    ['@variable.jsx'] = { fg = colors.geo_yellow }, -- Variables inside JSX {}
    ['@variable.tsx'] = { fg = colors.geo_yellow }, -- Variables inside TSX {}
    ['@function.call.jsx'] = { fg = colors.geo_yellow }, -- Function calls in JSX
    ['@function.call.tsx'] = { fg = colors.geo_yellow }, -- Function calls in TSX

    -- TypeScript-specific type annotations and interface improvements
    ['@type.qualifier'] = { fg = colors.dream_blue, italic = true }, -- readonly, public, etc.
    ['@type.definition'] = { fg = colors.crystal_blue, bold = true }, -- interface, type definitions

    -- Enhanced TypeScript interface and object type highlighting
    ['@property.typescript'] = { fg = colors.lumafly_green }, -- Interface property names
    ['@property.tsx'] = { fg = colors.lumafly_green }, -- TSX interface property names
    ['@type.typescript'] = { fg = colors.soul_blue, bold = true }, -- Type annotations
    ['@type.tsx'] = { fg = colors.soul_blue, bold = true }, -- TSX type annotations
    ['@type.builtin.typescript'] = { fg = colors.pale_blue, italic = true }, -- Built-in types (string, number, etc.)
    ['@type.builtin.tsx'] = { fg = colors.pale_blue, italic = true },

    -- Optional and union type operators
    ['@operator.type'] = { fg = colors.infection_orange, bold = true }, -- ? : | & operators in types
    ['@punctuation.delimiter.typescript'] = { fg = colors.pale_white }, -- : ; , in interfaces
    ['@punctuation.delimiter.tsx'] = { fg = colors.pale_white },

    -- Decorators (TypeScript/experimental JavaScript)
    ['@attribute'] = { fg = colors.infection_orange, italic = true }, -- @decorator

    -- Module/namespace keywords
    ['@keyword.storage'] = { fg = colors.void_purple, bold = true }, -- const, let, var
    ['@keyword.modifier'] = { fg = colors.dream_blue, italic = true }, -- async, static, etc.

    -- Enhanced constants and special values
    ['@constant.builtin'] = { fg = colors.dream_blue, italic = true }, -- true, false, null, undefined

    -- JavaScript/TypeScript specific literals and values
    ['@string.regex'] = { fg = colors.infection_orange, italic = true }, -- Regular expressions
    ['@number.float'] = { fg = colors.radiance_gold }, -- Float numbers

    -- Enhanced error/exception handling
    ['@keyword.exception'] = { fg = colors.nail_red, bold = true }, -- try, catch, throw

    -- JSX expression braces highlighting
    ['@punctuation.bracket.jsx'] = { fg = colors.geo_yellow, bold = true },
    ['@punctuation.bracket.tsx'] = { fg = colors.geo_yellow, bold = true },
  }
end

return M