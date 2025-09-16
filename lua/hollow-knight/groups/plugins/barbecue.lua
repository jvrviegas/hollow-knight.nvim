-- Barbecue.nvim plugin support for Hollow Knight theme
-- Hallownest's Navigation Bar

local M = {}

function M.setup(colors)
  return {
    -- Core elements
    barbecue_normal = { fg = colors.soul_white, bg = 'NONE' },
    barbecue_ellipsis = { fg = colors.mask_gray, bg = 'NONE' },
    barbecue_separator = { fg = colors.mask_gray, bg = 'NONE' },
    barbecue_modified = { fg = colors.infection_orange, bg = 'NONE' },
    barbecue_dirname = { fg = colors.pale_blue, bg = 'NONE' },
    barbecue_basename = { fg = colors.soul_white, bold = true, bg = 'NONE' },
    barbecue_context = { fg = colors.ghost_white, bg = 'NONE' },

    -- LSP symbol context types
    barbecue_context_file = { fg = colors.soul_white, bg = 'NONE' },
    barbecue_context_module = { fg = colors.crystal_blue, bg = 'NONE' },
    barbecue_context_namespace = { fg = colors.dream_blue, bg = 'NONE' },
    barbecue_context_package = { fg = colors.pale_blue, bg = 'NONE' },
    barbecue_context_class = { fg = colors.soul_blue, bg = 'NONE' },
    barbecue_context_method = { fg = colors.lumafly_green, bg = 'NONE' },
    barbecue_context_property = { fg = colors.crystal_blue, bg = 'NONE' },
    barbecue_context_field = { fg = colors.pale_blue, bg = 'NONE' },
    barbecue_context_constructor = { fg = colors.geo_yellow, bg = 'NONE' },
    barbecue_context_enum = { fg = colors.radiance_gold, bg = 'NONE' },
    barbecue_context_interface = { fg = colors.soul_blue, bg = 'NONE' },
    barbecue_context_function = { fg = colors.geo_yellow, bg = 'NONE' },
    barbecue_context_variable = { fg = colors.soul_white, bg = 'NONE' },
    barbecue_context_constant = { fg = colors.crystal_blue, bg = 'NONE' },
    barbecue_context_string = { fg = colors.lumafly_green, bg = 'NONE' },
    barbecue_context_number = { fg = colors.pale_gold, bg = 'NONE' },
    barbecue_context_boolean = { fg = colors.dream_blue, bg = 'NONE' },
    barbecue_context_array = { fg = colors.ghost_white, bg = 'NONE' },
    barbecue_context_object = { fg = colors.pale_white, bg = 'NONE' },
    barbecue_context_key = { fg = colors.soul_blue, bg = 'NONE' },
    barbecue_context_null = { fg = colors.mask_gray, bg = 'NONE' },
    barbecue_context_enum_member = { fg = colors.radiance_gold, bg = 'NONE' },
    barbecue_context_struct = { fg = colors.soul_blue, bg = 'NONE' },
    barbecue_context_event = { fg = colors.infection_orange, bg = 'NONE' },
    barbecue_context_operator = { fg = colors.pale_white, bg = 'NONE' },
    barbecue_context_type_parameter = { fg = colors.dream_blue, bg = 'NONE' },
  }
end

return M