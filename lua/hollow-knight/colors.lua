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
  return blend(hex, '#0d0d14', 1 - alpha)
end

-- Hallownest's Core Palette - Enhanced for better contrast and readability
-- Colors chosen with WCAG contrast guidelines in mind
M.palette = {
  -- The Abyss - Deepest darkness (improved background separation)
  abyss = {
    void = '#0d0d14',      -- Main background
    deep = '#1a1a24',      -- Secondary background (better contrast)
    shadow = '#2a2a3a',    -- Highlighted background (improved separation)
    border = '#3a3a4a',    -- Border color (better visibility)
  },

  -- The White Palace - Pure essence (enhanced text contrast)
  palace = {
    soul = '#e8e8f0',      -- Main text (slightly softer for reduced eye strain)
    pale = '#c8c8d8',      -- Secondary text
    ghost = '#a8a8c0',     -- Tertiary text
    silver = '#888898',    -- Muted text
    dim = '#686878',       -- Very dim text
  },

  -- Soul and Dreams - Mystical blues (optimized for readability)
  soul = {
    bright = '#7bb8e8',    -- Bright accent (increased saturation)
    dream = '#6ba8df',     -- Dream-like blue
    pale = '#5d93c4',      -- Pale soul
    crystal = '#69a8cf',   -- Crystal blue
    essence = '#77b8db',   -- Soul essence
    deep = '#4d7fb4',      -- Deep soul (for better contrast)
  },

  -- Greenpath - Life and nature (enhanced visibility)
  greenpath = {
    lumafly = '#7dd6c0',   -- Bright teal (strings)
    moss = '#5db898',      -- Moss green (improved contrast)
    acid = '#4a9d70',      -- Acid green
    vine = '#3a7d5a',      -- Vine green (darker for contrast)
  },

  -- City of Tears - Ancient gold (optimized yellows)
  city = {
    geo = '#e8c84f',       -- Bright geo (improved visibility)
    gold = '#d4b547',      -- Gold
    pale_gold = '#c4a542', -- Pale gold
    brass = '#a8860b',     -- Brass
    shine = '#f8d85f',     -- Shiny gold (for highlights)
  },

  -- The Infection - Orange corruption (enhanced warnings)
  infection = {
    bright = '#e89858',    -- Bright orange (better visibility)
    glow = '#d88850',      -- Orange glow
    deep = '#c87840',      -- Deep orange
    radiance = '#e8b847',  -- Radiant gold-orange
  },

  -- Combat - Reds of battle (improved error visibility)
  combat = {
    nail = '#e85850',      -- Bright red (better visibility)
    blood = '#c84040',     -- Blood red
    crimson = '#a83838',   -- Crimson
    shade = '#882828',     -- Shade red
  },

  -- The Void - Purples of emptiness (enhanced keywords)
  void = {
    bright = '#9888d8',    -- Bright purple (better visibility)
    deep = '#7868c8',      -- Deep purple
    grimm = '#a84870',     -- Grimm purple-red
    shadow = '#584878',    -- Shadow purple
  },

  -- UI Elements (improved neutrals)
  ui = {
    mask = '#888898',      -- Comment gray (better readability)
    bench = '#685850',     -- Bench brown
    stone = '#686878',     -- Stone gray
    metal = '#888898',     -- Metal gray
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

  -- Legacy color names for backward compatibility
  soul_white = M.palette.palace.soul,
  soul_blue = M.palette.soul.bright,
  geo_yellow = M.palette.city.geo,
  mask_gray = M.palette.ui.mask,
  shadow_black = M.palette.abyss.shadow,
  void_black = M.palette.abyss.void,
  pale_black = M.palette.abyss.deep,
  crystal_blue = M.palette.soul.crystal,
  pale_white = M.palette.palace.pale,
  infection_orange = M.palette.infection.bright,
  blood_red = M.palette.combat.blood,
  ghost_white = M.palette.palace.ghost,
  radiance_gold = M.palette.infection.radiance,
  lumafly_green = M.palette.greenpath.lumafly,
  moss_green = M.palette.greenpath.moss,
  pale_gold = M.palette.city.pale_gold,
  void_purple = M.palette.void.bright,
  dream_blue = M.palette.soul.dream,
  essence_blue = M.palette.soul.essence,
  acid_green = M.palette.greenpath.acid,
  vine_green = M.palette.greenpath.vine,
  brass_yellow = M.palette.city.brass,
  crimson_red = M.palette.combat.crimson,
  nail_red = M.palette.combat.nail,
  grimm_purple = M.palette.void.grimm,
  deep_purple = M.palette.void.deep,
  shadow_purple = M.palette.void.shadow,
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
