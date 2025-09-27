-- LSP and diagnostic highlights for Hollow Knight theme
-- The Infection's spread

local M = {}

function M.setup(colors)
  return {
    -- LSP highlights - The Infection's spread
    DiagnosticError = { fg = colors.blood_red },
    DiagnosticWarn = { fg = colors.infection_orange },
    DiagnosticInfo = { fg = colors.soul_blue },
    DiagnosticHint = { fg = colors.lumafly_green },
    DiagnosticUnderlineError = { sp = colors.blood_red, underline = true },
    DiagnosticUnderlineWarn = { sp = colors.infection_orange, underline = true },
    DiagnosticUnderlineInfo = { sp = colors.soul_blue, underline = true },
    DiagnosticUnderlineHint = { sp = colors.lumafly_green, underline = true },
    LspReferenceText = { bg = colors.pale_black },
    LspReferenceRead = { bg = colors.pale_black },
    LspReferenceWrite = { bg = colors.shadow_black },

    -- LSP semantic tokens (consistent with Tree-sitter)
    ['@lsp.type.class'] = { fg = colors.radiance_gold, bold = true }, -- More distinct from types
    ['@lsp.type.decorator'] = { fg = colors.infection_orange },
    ['@lsp.type.enum'] = { fg = colors.radiance_gold },
    ['@lsp.type.enumMember'] = { fg = colors.pale_gold },
    ['@lsp.type.function'] = { fg = colors.geo_yellow, bold = true },
    ['@lsp.type.interface'] = { fg = colors.crystal_blue, bold = true }, -- More distinct
    ['@lsp.type.macro'] = { fg = colors.infection_orange, italic = true },
    ['@lsp.type.method'] = { fg = colors.geo_yellow, bold = true }, -- Match function color for consistency
    ['@lsp.type.namespace'] = { fg = colors.dream_blue },
    ['@lsp.type.parameter'] = { fg = colors.soul_white, italic = true }, -- Match variable color
    ['@lsp.type.property'] = { fg = colors.lumafly_green }, -- Interface property names (green)
    ['@lsp.type.struct'] = { fg = colors.soul_blue },
    ['@lsp.type.type'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.typeParameter'] = { fg = colors.dream_blue, italic = true },
    ['@lsp.type.variable'] = { fg = colors.soul_white },

    -- LSP semantic modifiers
    ['@lsp.mod.deprecated'] = { fg = colors.mask_gray, strikethrough = true },
    ['@lsp.mod.readonly'] = { fg = colors.pale_blue, italic = true },
    ['@lsp.mod.static'] = { fg = colors.dream_blue, bold = true },
    ['@lsp.mod.declaration'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.mod.definition'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.mod.async'] = { fg = colors.infection_orange, italic = true },

    -- Additional TypeScript-specific LSP types
    ['@lsp.type.module'] = { fg = colors.dream_blue },
    ['@lsp.type.keyword'] = { fg = colors.void_purple, bold = true },
    ['@lsp.type.operator'] = { fg = colors.pale_white, bold = true },
    ['@lsp.type.comment'] = { fg = colors.mask_gray, italic = true },

    -- Code actions and references
    LspCodeLens = { fg = colors.mask_gray, italic = true },
    LspCodeLensSeparator = { fg = colors.mask_gray },
    LspSignatureActiveParameter = { fg = colors.geo_yellow, bold = true },

    -- Inlay hints
    LspInlayHint = { fg = colors.mask_gray, bg = colors.shadow_black, italic = true },
  }
end

return M