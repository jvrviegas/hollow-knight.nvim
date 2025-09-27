-- rest.nvim plugin for Hollow Knight theme
-- Ancient Tablets and Soul Communication

local M = {}

function M.setup(colors, should_clear_bg)
  return {
    -- rest.nvim UI highlights
    RestNvim = { fg = colors.soul_white },
    RestNvimRequest = { fg = colors.soul_blue, bold = true },
    RestNvimResponse = { fg = colors.moss_green },
    RestNvimError = { fg = colors.blood_red },
    RestNvimLoading = { fg = colors.geo_yellow },

    -- HTTP Tree-sitter syntax highlights for .http files
    ['@method.http'] = { fg = colors.soul_blue, bold = true },
    ['@method.get.http'] = { fg = colors.moss_green, bold = true },
    ['@method.post.http'] = { fg = colors.geo_yellow, bold = true },
    ['@method.put.http'] = { fg = colors.infection_orange, bold = true },
    ['@method.delete.http'] = { fg = colors.nail_red, bold = true },
    ['@method.patch.http'] = { fg = colors.void_purple, bold = true },
    ['@method.head.http'] = { fg = colors.ghost_white, bold = true },
    ['@method.options.http'] = { fg = colors.mask_gray, bold = true },

    -- URL and path highlighting
    ['@uri.http'] = { fg = colors.crystal_blue, underline = true },
    ['@url.http'] = { fg = colors.crystal_blue, underline = true },
    ['@path.http'] = { fg = colors.pale_white },
    ['@query.http'] = { fg = colors.lumafly_green },
    ['@fragment.http'] = { fg = colors.void_purple },

    -- Headers
    ['@header.http'] = { fg = colors.pale_gold },
    ['@header.name.http'] = { fg = colors.pale_gold, bold = true },
    ['@header.value.http'] = { fg = colors.ghost_white },

    -- Content and body
    ['@body.http'] = { fg = colors.soul_white },
    ['@json.http'] = { fg = colors.lumafly_green },
    ['@xml.http'] = { fg = colors.infection_orange },

    -- Variables and interpolation
    ['@variable.http'] = { fg = colors.void_purple },
    ['@variable.name.http'] = { fg = colors.void_purple, italic = true },
    ['@variable.interpolation.http'] = { fg = colors.dream_blue, bold = true },

    -- Comments and documentation
    ['@comment.http'] = { fg = colors.mask_gray, italic = true },
    ['@comment.documentation.http'] = { fg = colors.mask_gray, italic = true },

    -- Status codes
    ['@number.http'] = { fg = colors.geo_yellow },
    ['@status.success.http'] = { fg = colors.moss_green, bold = true },
    ['@status.redirect.http'] = { fg = colors.geo_yellow, bold = true },
    ['@status.client_error.http'] = { fg = colors.infection_orange, bold = true },
    ['@status.server_error.http'] = { fg = colors.blood_red, bold = true },

    -- Separators and delimiters
    ['@separator.http'] = { fg = colors.mask_gray },
    ['@delimiter.http'] = { fg = colors.ghost_white },

    -- Protocol version
    ['@version.http'] = { fg = colors.pale_white },
    ['@protocol.http'] = { fg = colors.soul_blue },

    -- Authentication
    ['@auth.http'] = { fg = colors.grimm_purple },
    ['@token.http'] = { fg = colors.shade_purple, bold = true },

    -- Special keywords
    ['@keyword.http'] = { fg = colors.dream_blue },
    ['@keyword.import.http'] = { fg = colors.void_purple },
    ['@keyword.export.http'] = { fg = colors.geo_yellow },

    -- Request/response sections
    ['@section.request.http'] = { fg = colors.soul_blue, bg = colors.shadow_black },
    ['@section.response.http'] = { fg = colors.moss_green, bg = colors.shadow_black },

    -- Environment and configuration
    ['@environment.http'] = { fg = colors.geo_yellow, italic = true },
    ['@config.http'] = { fg = colors.ghost_white },

    -- File references
    ['@file.http'] = { fg = colors.acid_green, underline = true },
    ['@filename.http'] = { fg = colors.acid_green },

    -- Error highlighting
    ['@error.http'] = { fg = colors.blood_red, undercurl = true, sp = colors.blood_red },
    ['@warning.http'] = { fg = colors.infection_orange, undercurl = true, sp = colors.infection_orange },

    -- Generic HTTP syntax (fallback)
    httpMethod = { fg = colors.soul_blue, bold = true },
    httpUrl = { fg = colors.crystal_blue, underline = true },
    httpHeader = { fg = colors.pale_gold },
    httpHeaderName = { fg = colors.pale_gold, bold = true },
    httpHeaderValue = { fg = colors.ghost_white },
    httpBody = { fg = colors.soul_white },
    httpComment = { fg = colors.mask_gray, italic = true },
    httpVersion = { fg = colors.pale_white },
    httpStatus = { fg = colors.geo_yellow },
  }
end

return M