-- Terminal colors for Hollow Knight theme
-- The Void's palette

local M = {}

function M.setup(colors)
  return {
    -- Terminal color definitions
    -- These are set as global variables for terminal integration
    terminal_colors = {
      terminal_color_0 = colors.void_black,
      terminal_color_1 = colors.nail_red,
      terminal_color_2 = colors.moss_green,
      terminal_color_3 = colors.geo_yellow,
      terminal_color_4 = colors.soul_blue,
      terminal_color_5 = colors.void_purple,
      terminal_color_6 = colors.lumafly_green,
      terminal_color_7 = colors.soul_white,
      terminal_color_8 = colors.mask_gray,
      terminal_color_9 = colors.blood_red,
      terminal_color_10 = colors.lumafly_green,
      terminal_color_11 = colors.infection_orange,
      terminal_color_12 = colors.crystal_blue,
      terminal_color_13 = colors.shade_purple,
      terminal_color_14 = colors.dream_blue,
      terminal_color_15 = colors.pale_white,
    }
  }
end

-- Function to set terminal colors as vim globals
function M.set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.void_black
  vim.g.terminal_color_1 = colors.nail_red
  vim.g.terminal_color_2 = colors.moss_green
  vim.g.terminal_color_3 = colors.geo_yellow
  vim.g.terminal_color_4 = colors.soul_blue
  vim.g.terminal_color_5 = colors.void_purple
  vim.g.terminal_color_6 = colors.lumafly_green
  vim.g.terminal_color_7 = colors.soul_white
  vim.g.terminal_color_8 = colors.mask_gray
  vim.g.terminal_color_9 = colors.blood_red
  vim.g.terminal_color_10 = colors.lumafly_green
  vim.g.terminal_color_11 = colors.infection_orange
  vim.g.terminal_color_12 = colors.crystal_blue
  vim.g.terminal_color_13 = colors.shade_purple
  vim.g.terminal_color_14 = colors.dream_blue
  vim.g.terminal_color_15 = colors.pale_white
end

return M