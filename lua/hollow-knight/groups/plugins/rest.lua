-- rest.nvim plugin for Hollow Knight theme
-- Ancient Tablets and Soul Communication

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- rest.nvim UI highlights
    RestNvim = { fg = colors.palette.palace.soul },
    RestNvimRequest = { fg = colors.palette.soul.bright, bold = true },
    RestNvimResponse = { fg = colors.palette.greenpath.moss },
    RestNvimError = { fg = colors.palette.combat.blood },
    RestNvimLoading = { fg = colors.palette.city.geo },

    -- HTTP Tree-sitter syntax highlights for .http files
    ['@method.http'] = { fg = colors.palette.soul.bright, bold = true },
    ['@method.get.http'] = { fg = colors.palette.greenpath.moss, bold = true },
    ['@method.post.http'] = { fg = colors.palette.city.geo, bold = true },
    ['@method.put.http'] = { fg = colors.palette.infection.bright, bold = true },
    ['@method.delete.http'] = { fg = colors.palette.combat.nail, bold = true },
    ['@method.patch.http'] = { fg = colors.palette.void.bright, bold = true },
    ['@method.head.http'] = { fg = colors.palette.palace.silver, bold = true },
    ['@method.options.http'] = { fg = colors.palette.ui.mask, bold = true },

    -- URL and path highlighting
    ['@uri.http'] = { fg = colors.palette.soul.crystal, underline = true },
    ['@url.http'] = { fg = colors.palette.soul.crystal, underline = true },
    ['@path.http'] = { fg = colors.palette.palace.pale },
    ['@query.http'] = { fg = colors.palette.greenpath.lumafly },
    ['@fragment.http'] = { fg = colors.palette.void.bright },

    -- Headers
    ['@header.http'] = { fg = colors.palette.city.pale_gold },
    ['@header.name.http'] = { fg = colors.palette.city.pale_gold, bold = true },
    ['@header.value.http'] = { fg = colors.palette.palace.ghost },

    -- Content and body
    ['@body.http'] = { fg = colors.palette.palace.soul },
    ['@json.http'] = { fg = colors.palette.greenpath.lumafly },
    ['@xml.http'] = { fg = colors.palette.infection.bright },

    -- Variables and interpolation
    ['@variable.http'] = { fg = colors.palette.void.bright },
    ['@variable.name.http'] = { fg = colors.palette.void.bright, italic = true },
    ['@variable.interpolation.http'] = { fg = colors.palette.soul.dream, bold = true },

    -- Comments and documentation
    ['@comment.http'] = { fg = colors.palette.ui.mask, italic = true },
    ['@comment.documentation.http'] = { fg = colors.palette.ui.stone, italic = true },

    -- Status codes
    ['@number.http'] = { fg = colors.palette.city.geo },
    ['@status.success.http'] = { fg = colors.palette.greenpath.moss, bold = true },
    ['@status.redirect.http'] = { fg = colors.palette.city.geo, bold = true },
    ['@status.client_error.http'] = { fg = colors.palette.infection.bright, bold = true },
    ['@status.server_error.http'] = { fg = colors.palette.combat.blood, bold = true },

    -- Separators and delimiters
    ['@separator.http'] = { fg = colors.palette.ui.mask },
    ['@delimiter.http'] = { fg = colors.palette.palace.silver },

    -- Protocol version
    ['@version.http'] = { fg = colors.palette.soul.pale },
    ['@protocol.http'] = { fg = colors.palette.soul.bright },

    -- Authentication
    ['@auth.http'] = { fg = colors.palette.void.grimm },
    ['@token.http'] = { fg = colors.palette.void.deep, bold = true },

    -- Special keywords
    ['@keyword.http'] = { fg = colors.palette.soul.dream },
    ['@keyword.import.http'] = { fg = colors.palette.void.bright },
    ['@keyword.export.http'] = { fg = colors.palette.city.brass },

    -- Request/response sections
    ['@section.request.http'] = { fg = colors.palette.soul.bright, bg = colors.palette.abyss.shadow },
    ['@section.response.http'] = { fg = colors.palette.greenpath.moss, bg = colors.palette.abyss.shadow },

    -- Environment and configuration
    ['@environment.http'] = { fg = colors.palette.city.brass, italic = true },
    ['@config.http'] = { fg = colors.palette.palace.silver },

    -- File references
    ['@file.http'] = { fg = colors.palette.greenpath.acid, underline = true },
    ['@filename.http'] = { fg = colors.palette.greenpath.acid },

    -- Error highlighting
    ['@error.http'] = { fg = colors.palette.combat.blood, undercurl = true, sp = colors.palette.combat.blood },
    ['@warning.http'] = { fg = colors.palette.infection.bright, undercurl = true, sp = colors.palette.infection.bright },

    -- Generic HTTP syntax (fallback)
    httpMethod = { fg = colors.palette.soul.bright, bold = true },
    httpUrl = { fg = colors.palette.soul.crystal, underline = true },
    httpHeader = { fg = colors.palette.city.pale_gold },
    httpHeaderName = { fg = colors.palette.city.pale_gold, bold = true },
    httpHeaderValue = { fg = colors.palette.palace.ghost },
    httpBody = { fg = colors.palette.palace.soul },
    httpComment = { fg = colors.palette.ui.mask, italic = true },
    httpVersion = { fg = colors.palette.soul.pale },
    httpStatus = { fg = colors.palette.city.geo },
  }
end

return M