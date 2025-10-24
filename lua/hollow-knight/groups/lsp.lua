-- LSP and diagnostic highlights for Hollow Knight theme
-- The Infection's spread

local M = {}

-- Utility function for blending colors
local function hex_to_rgb(hex)
  hex = hex:gsub('#', '')
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format('#%02x%02x%02x',
    math.max(0, math.min(255, math.floor(r))),
    math.max(0, math.min(255, math.floor(g))),
    math.max(0, math.min(255, math.floor(b)))
  )
end

local function blend(color1, color2, ratio)
  local r1, g1, b1 = hex_to_rgb(color1)
  local r2, g2, b2 = hex_to_rgb(color2)

  local r = r1 * (1 - ratio) + r2 * ratio
  local g = g1 * (1 - ratio) + g2 * ratio
  local b = b1 * (1 - ratio) + b2 * ratio

  return rgb_to_hex(r, g, b)
end

function M.setup(colors)
  return {
    -- Diagnostics - Sign column and virtual text
    DiagnosticError = { fg = colors.nail_red },
    DiagnosticWarn = { fg = colors.infection_orange },
    DiagnosticInfo = { fg = colors.soul_blue },
    DiagnosticHint = { fg = colors.lumafly_green },
    DiagnosticOk = { fg = colors.moss_green },

    -- Diagnostic underlines (using undercurl for better visibility)
    DiagnosticUnderlineError = { sp = colors.nail_red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.infection_orange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.soul_blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.lumafly_green, undercurl = true },
    DiagnosticUnderlineOk = { sp = colors.moss_green, undercurl = true },

    -- Diagnostic virtual text (slightly muted for less distraction)
    DiagnosticVirtualTextError = { fg = blend(colors.nail_red, colors.void_black, 0.6), italic = true },
    DiagnosticVirtualTextWarn = { fg = blend(colors.infection_orange, colors.void_black, 0.6), italic = true },
    DiagnosticVirtualTextInfo = { fg = blend(colors.soul_blue, colors.void_black, 0.6), italic = true },
    DiagnosticVirtualTextHint = { fg = blend(colors.lumafly_green, colors.void_black, 0.6), italic = true },
    DiagnosticVirtualTextOk = { fg = blend(colors.moss_green, colors.void_black, 0.6), italic = true },

    -- Diagnostic signs in sign column
    DiagnosticSignError = { fg = colors.nail_red },
    DiagnosticSignWarn = { fg = colors.infection_orange },
    DiagnosticSignInfo = { fg = colors.soul_blue },
    DiagnosticSignHint = { fg = colors.lumafly_green },
    DiagnosticSignOk = { fg = colors.moss_green },

    -- Diagnostic floating windows
    DiagnosticFloatingError = { fg = colors.nail_red },
    DiagnosticFloatingWarn = { fg = colors.infection_orange },
    DiagnosticFloatingInfo = { fg = colors.soul_blue },
    DiagnosticFloatingHint = { fg = colors.lumafly_green },
    DiagnosticFloatingOk = { fg = colors.moss_green },

    -- Deprecated and unnecessary code
    DiagnosticDeprecated = { sp = colors.mask_gray, strikethrough = true },
    DiagnosticUnnecessary = { fg = colors.mask_gray, italic = true },

    -- LSP references and document highlights
    LspReferenceText = { bg = colors.shadow_black },
    LspReferenceRead = { bg = colors.shadow_black },
    LspReferenceWrite = { bg = blend(colors.shadow_black, colors.soul_blue, 0.1), underline = true },

    -- LSP semantic tokens - Type definitions
    ['@lsp.type.class'] = { fg = colors.geo_yellow, bold = true },
    ['@lsp.type.decorator'] = { fg = colors.infection_orange, italic = true },
    ['@lsp.type.enum'] = { fg = colors.geo_yellow, bold = true },
    ['@lsp.type.enumMember'] = { fg = colors.pale_gold },
    ['@lsp.type.function'] = { fg = colors.geo_yellow },
    ['@lsp.type.interface'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.macro'] = { fg = colors.infection_orange, italic = true },
    ['@lsp.type.method'] = { fg = colors.geo_yellow },
    ['@lsp.type.namespace'] = { fg = colors.dream_blue },
    ['@lsp.type.parameter'] = { fg = colors.ghost_white, italic = true },
    ['@lsp.type.property'] = { fg = colors.lumafly_green },
    ['@lsp.type.struct'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.type'] = { fg = colors.soul_blue },
    ['@lsp.type.typeParameter'] = { fg = colors.dream_blue, italic = true },
    ['@lsp.type.variable'] = { fg = colors.soul_white },
    ['@lsp.type.selfKeyword'] = { fg = colors.void_purple, italic = true },
    ['@lsp.type.builtinType'] = { fg = colors.crystal_blue, italic = true },

    -- Additional semantic token types
    ['@lsp.type.keyword'] = { fg = colors.void_purple },
    ['@lsp.type.operator'] = { fg = colors.pale_white },
    ['@lsp.type.comment'] = { fg = colors.mask_gray, italic = true },
    ['@lsp.type.string'] = { fg = colors.lumafly_green },
    ['@lsp.type.number'] = { fg = colors.pale_gold },
    ['@lsp.type.regexp'] = { fg = colors.infection_orange, italic = true },
    ['@lsp.type.module'] = { fg = colors.dream_blue },
    ['@lsp.type.event'] = { fg = colors.infection_orange },
    ['@lsp.type.modifier'] = { fg = colors.dream_blue, italic = true },
    ['@lsp.type.typeAlias'] = { fg = colors.soul_blue, italic = true },

    -- LSP semantic modifiers
    ['@lsp.mod.deprecated'] = { sp = colors.mask_gray, strikethrough = true },
    ['@lsp.mod.readonly'] = { italic = true },
    ['@lsp.mod.static'] = { bold = true },
    ['@lsp.mod.declaration'] = {},
    ['@lsp.mod.definition'] = {},
    ['@lsp.mod.async'] = { italic = true },
    ['@lsp.mod.abstract'] = { italic = true },
    ['@lsp.mod.defaultLibrary'] = { italic = true },
    ['@lsp.mod.documentation'] = { italic = true },

    -- TypeScript/JavaScript specific
    ['@lsp.typemod.variable.defaultLibrary'] = { fg = colors.soul_blue },
    ['@lsp.typemod.function.defaultLibrary'] = { fg = colors.crystal_blue },
    ['@lsp.typemod.method.defaultLibrary'] = { fg = colors.crystal_blue },
    ['@lsp.typemod.class.defaultLibrary'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.typemod.variable.readonly'] = { fg = colors.crystal_blue },
    ['@lsp.typemod.property.readonly'] = { fg = colors.moss_green, italic = true },

    -- Code actions and code lens
    LspCodeLens = { fg = colors.mask_gray, italic = true },
    LspCodeLensSeparator = { fg = colors.mask_gray },
    LspCodeLensSign = { fg = colors.mask_gray },
    LspCodeLensText = { fg = colors.mask_gray, italic = true },

    -- Signature help
    LspSignatureActiveParameter = { fg = colors.geo_yellow, bold = true, underline = true },

    -- Inlay hints (subtle, non-distracting)
    LspInlayHint = { fg = blend(colors.mask_gray, colors.void_black, 0.5), italic = true },

    -- Saga and other LSP UI plugins
    LspSagaFinderSelection = { fg = colors.geo_yellow, bold = true },
    LspSagaBorderTitle = { fg = colors.soul_blue, bold = true },
    LspSagaHoverBorder = { fg = colors.soul_blue },
    LspSagaRenameBorder = { fg = colors.soul_blue },
    LspSagaDefPreviewBorder = { fg = colors.soul_blue },
    LspSagaCodeActionBorder = { fg = colors.soul_blue },
    LspSagaCodeActionTitle = { fg = colors.geo_yellow },
    LspSagaCodeActionContent = { fg = colors.ghost_white },
    LspSagaDiagnosticBorder = { fg = colors.soul_blue },
    LspSagaDiagnosticHeader = { fg = colors.geo_yellow },
    LspSagaDiagnosticTruncateLine = { fg = colors.mask_gray },
    LspSagaShTruncateLine = { fg = colors.mask_gray },
    LspSagaDocTruncateLine = { fg = colors.mask_gray },
    LspSagaLspFinderBorder = { fg = colors.soul_blue },

    -- Lightbulb (code actions indicator)
    LspSagaLightBulb = { fg = colors.geo_yellow },
    LspSagaAutoPreview = { fg = colors.soul_blue },
    LspSagaSignatureHelpBorder = { fg = colors.soul_blue },
  }
end

return M