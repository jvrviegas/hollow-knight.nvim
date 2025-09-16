-- ~/.config/nvim/lua/hollow-knight/colors.lua
-- Hollow Knight inspired color palette with utilities

local M = {}

-- Color utility functions
local function hex_to_rgb(hex)
  hex = hex:gsub('#', '')
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format(
    '#%02x%02x%02x',
    math.max(0, math.min(255, math.floor(r))),
    math.max(0, math.min(255, math.floor(g))),
    math.max(0, math.min(255, math.floor(b)))
  )
end

-- Blend two colors together
local function blend(color1, color2, ratio)
  local r1, g1, b1 = hex_to_rgb(color1)
  local r2, g2, b2 = hex_to_rgb(color2)

  local r = r1 * (1 - ratio) + r2 * ratio
  local g = g1 * (1 - ratio) + g2 * ratio
  local b = b1 * (1 - ratio) + b2 * ratio

  return rgb_to_hex(r, g, b)
end

-- Create transparent version of color (for backgrounds)
local function fade(hex, alpha)
  if alpha == 1 then
    return hex
  end
  -- This would typically be used with a compositor
  -- For now, we blend with the background
  return blend(hex, '#0a0a0f', 1 - alpha)
end

-- Hallownest's Core Palette
M.palette = {
  -- The Abyss - Deepest darkness
  abyss = {
    void = '#0a0a0f',
    deep = '#1a1a24',
    shadow = '#2a2a3a',
  },

  -- The White Palace - Pure essence
  palace = {
    soul = '#e8e8f0',
    pale = '#c8c8d8',
    ghost = '#a8a8c0',
    silver = '#9898b0',
  },

  -- Soul and Dreams - Mystical blues
  soul = {
    bright = '#7fb3d3',
    dream = '#5a9fd4',
    pale = '#4a8bc2',
    crystal = '#6bb6ff',
    essence = '#87ceeb',
  },

  -- Greenpath - Life and nature
  greenpath = {
    lumafly = '#7dd3c0',
    moss = '#4a9d88',
    acid = '#3d8b5f',
    vine = '#2d6b4f',
  },

  -- City of Tears - Ancient gold
  city = {
    geo = '#ffd700',
    gold = '#ffb347',
    pale_gold = '#e6a534',
    brass = '#b8860b',
  },

  -- The Infection - Orange corruption
  infection = {
    bright = '#ff9500',
    glow = '#ff7f00',
    deep = '#cc7700',
    radiance = '#ffb347',
  },

  -- Combat - Reds of battle
  combat = {
    nail = '#d73027',
    blood = '#b71c1c',
    crimson = '#8b0000',
    shade = '#660000',
  },

  -- The Void - Purples of emptiness
  void = {
    bright = '#6a4c93',
    deep = '#5a3d7a',
    grimm = '#8b1538',
    shadow = '#4a2c5a',
  },

  -- UI Elements
  ui = {
    mask = '#666677',
    bench = '#4a3c28',
    stone = '#5a5a6a',
    metal = '#7a7a8a',
  },
}

-- Theme variants
M.variants = {
  -- Main dark theme (Hallownest)
  hallownest = {
    bg = M.palette.abyss.void,
    bg_alt = M.palette.abyss.deep,
    bg_highlight = M.palette.abyss.shadow,

    fg = M.palette.palace.soul,
    fg_alt = M.palette.palace.ghost,

    accent = M.palette.soul.bright,
    warning = M.palette.infection.bright,
    error = M.palette.combat.blood,
    success = M.palette.greenpath.moss,
    info = M.palette.soul.dream,
  },

  -- Light theme variant (White Palace)
  white_palace = {
    bg = '#f8f8fc',
    bg_alt = '#ececf0',
    bg_highlight = '#e0e0e8',

    fg = '#2a2a3a',
    fg_alt = '#4a4a5a',

    accent = '#4a8bc2',
    warning = '#cc7700',
    error = '#8b0000',
    success = '#2d6b4f',
    info = '#5a9fd4',
  },

  -- Deepnest variant (Extra dark)
  deepnest = {
    bg = '#000000',
    bg_alt = '#0f0f0f',
    bg_highlight = '#1f1f1f',

    fg = '#a8a8c0',
    fg_alt = '#666677',

    accent = blend(M.palette.soul.bright, '#000000', 0.3),
    warning = M.palette.infection.deep,
    error = M.palette.combat.crimson,
    success = M.palette.greenpath.vine,
    info = M.palette.soul.pale,
  },
}

-- Semantic color mappings
M.semantic = {
  -- Code syntax
  keyword = M.palette.soul.dream,
  string = M.palette.greenpath.lumafly,
  number = M.palette.city.pale_gold,
  comment = M.palette.ui.mask,
  function_name = M.palette.city.geo,
  variable = M.palette.palace.soul,
  type = M.palette.soul.bright,
  constant = M.palette.soul.crystal,
  operator = M.palette.palace.pale,

  -- Git
  git_add = M.palette.greenpath.moss,
  git_change = M.palette.soul.bright,
  git_delete = M.palette.combat.nail,

  -- Diagnostics
  diagnostic_error = M.palette.combat.blood,
  diagnostic_warn = M.palette.infection.bright,
  diagnostic_info = M.palette.soul.bright,
  diagnostic_hint = M.palette.greenpath.lumafly,

  -- Special UI
  selection = M.palette.void.bright,
  search = M.palette.city.geo,
  match = M.palette.infection.radiance,
  cursor_line = M.palette.abyss.deep,
}

-- Get colors for current variant
function M.get_colors(variant)
  variant = variant or 'hallownest'
  local base = M.variants[variant]
  if not base then
    variant = 'hallownest'
    base = M.variants[variant]
  end

  return vim.tbl_deep_extend('force', base, M.semantic, {
    -- Add palette access
    palette = M.palette,
    variant = variant,

    -- Utility functions
    blend = blend,
    fade = fade,
  })
end

-- Create custom color scheme
function M.create_variant(name, overrides)
  M.variants[name] = vim.tbl_deep_extend('force', M.variants.hallownest, overrides or {})
  return M.variants[name]
end

-- Preset alternative schemes
M.presets = {
  -- Grimmchild theme
  grimmchild = function()
    return M.create_variant('grimmchild', {
      accent = M.palette.void.grimm,
      warning = M.palette.combat.crimson,
      bg_highlight = blend(M.palette.abyss.shadow, M.palette.void.grimm, 0.1),
    })
  end,

  -- Pale Court theme
  pale_court = function()
    return M.create_variant('pale_court', {
      accent = M.palette.palace.silver,
      fg = blend(M.palette.palace.soul, M.palette.soul.essence, 0.2),
      bg_highlight = blend(M.palette.abyss.shadow, M.palette.palace.ghost, 0.05),
    })
  end,

  -- Crystal Peak theme
  crystal_peak = function()
    return M.create_variant('crystal_peak', {
      accent = M.palette.soul.crystal,
      success = M.palette.soul.essence,
      bg_highlight = blend(M.palette.abyss.shadow, M.palette.soul.crystal, 0.08),
    })
  end,
}

return M
