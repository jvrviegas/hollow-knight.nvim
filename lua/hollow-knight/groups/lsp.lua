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

    -- LSP semantic tokens
    ['@lsp.type.class'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.decorator'] = { fg = colors.infection_orange },
    ['@lsp.type.enum'] = { fg = colors.radiance_gold },
    ['@lsp.type.enumMember'] = { fg = colors.pale_gold },
    ['@lsp.type.function'] = { fg = colors.geo_yellow, bold = true },
    ['@lsp.type.interface'] = { fg = colors.crystal_blue },
    ['@lsp.type.macro'] = { fg = colors.infection_orange, italic = true },
    ['@lsp.type.method'] = { fg = colors.lumafly_green, bold = true },
    ['@lsp.type.namespace'] = { fg = colors.dream_blue },
    ['@lsp.type.parameter'] = { fg = colors.ghost_white, italic = true },
    ['@lsp.type.property'] = { fg = colors.crystal_blue },
    ['@lsp.type.struct'] = { fg = colors.soul_blue },
    ['@lsp.type.type'] = { fg = colors.soul_blue, bold = true },
    ['@lsp.type.typeParameter'] = { fg = colors.dream_blue, italic = true },
    ['@lsp.type.variable'] = { fg = colors.soul_white },

    -- LSP semantic modifiers
    ['@lsp.mod.deprecated'] = { fg = colors.mask_gray, strikethrough = true },
    ['@lsp.mod.readonly'] = { fg = colors.pale_blue, italic = true },
    ['@lsp.mod.static'] = { fg = colors.dream_blue, bold = true },

    -- Code actions and references
    LspCodeLens = { fg = colors.mask_gray, italic = true },
    LspCodeLensSeparator = { fg = colors.mask_gray },
    LspSignatureActiveParameter = { fg = colors.geo_yellow, bold = true },

    -- Inlay hints
    LspInlayHint = { fg = colors.mask_gray, bg = colors.shadow_black, italic = true },
  }
end

return M