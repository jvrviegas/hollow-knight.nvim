-- Core editor highlight groups for Hollow Knight theme
-- The Kingdom's foundation

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

function M.setup(colors, transparent, should_clear_bg)
  return {
    -- Editor highlights - The Kingdom's foundation
    Normal = { fg = colors.soul_white, bg = transparent and 'NONE' or colors.void_black },
    NormalFloat = { fg = colors.soul_white, bg = (transparent or should_clear_bg('float_win')) and 'NONE' or colors.shadow_black },
    NormalNC = { fg = colors.ghost_white, bg = transparent and 'NONE' or colors.void_black }, -- Non-current window

    -- Cursor and selection
    Cursor = { fg = colors.void_black, bg = colors.soul_blue },
    lCursor = { fg = colors.void_black, bg = colors.soul_blue },
    CursorIM = { fg = colors.void_black, bg = colors.soul_blue },
    TermCursor = { fg = colors.void_black, bg = colors.soul_blue },
    TermCursorNC = { fg = colors.void_black, bg = colors.ghost_white },
    CursorLine = { bg = colors.shadow_black },
    CursorColumn = { bg = colors.shadow_black },

    -- Line numbers and signs
    LineNr = { fg = colors.mask_gray },
    LineNrAbove = { fg = colors.mask_gray },
    LineNrBelow = { fg = colors.mask_gray },
    CursorLineNr = { fg = colors.soul_blue, bold = true },
    CursorLineSign = { fg = colors.soul_blue },
    SignColumn = { fg = colors.mask_gray, bg = transparent and 'NONE' or colors.void_black },

    -- Folds
    Folded = { fg = colors.pale_white, bg = colors.shadow_black, italic = true },
    FoldColumn = { fg = colors.mask_gray, bg = transparent and 'NONE' or colors.void_black },

    -- Columns and separators
    ColorColumn = { bg = colors.shadow_black },
    VertSplit = { fg = colors.soul_blue },
    WinSeparator = { fg = colors.soul_blue },

    -- Visual selection
    Visual = { bg = colors.shadow_black },
    VisualNOS = { bg = colors.shadow_black },

    -- Search and matching
    Search = { fg = colors.void_black, bg = colors.geo_yellow },
    IncSearch = { fg = colors.void_black, bg = colors.infection_orange },
    CurSearch = { fg = colors.void_black, bg = colors.infection_orange, bold = true }, -- Current search result
    Substitute = { fg = colors.void_black, bg = colors.nail_red }, -- Substitute preview
    MatchParen = { fg = colors.soul_blue, bg = colors.shadow_black, bold = true, underline = true },

    -- Popup/Completion menu
    Pmenu = { fg = colors.soul_white, bg = colors.shadow_black },
    PmenuSel = { fg = colors.void_black, bg = colors.soul_blue },
    PmenuKind = { fg = colors.crystal_blue, bg = colors.shadow_black }, -- Kind icons
    PmenuKindSel = { fg = colors.void_black, bg = colors.soul_blue },
    PmenuExtra = { fg = colors.ghost_white, bg = colors.shadow_black }, -- Extra info
    PmenuExtraSel = { fg = colors.pale_white, bg = colors.soul_blue },
    PmenuSbar = { bg = colors.pale_black },
    PmenuThumb = { bg = colors.mask_gray },

    -- Statusline
    StatusLine = { fg = colors.soul_white, bg = colors.pale_black },
    StatusLineNC = { fg = colors.mask_gray, bg = colors.shadow_black },

    -- Messages
    ModeMsg = { fg = colors.geo_yellow, bold = true },
    MsgArea = { fg = colors.soul_white },
    MsgSeparator = { fg = colors.soul_blue, bg = colors.shadow_black },
    MoreMsg = { fg = colors.lumafly_green },
    Question = { fg = colors.soul_blue },
    WarningMsg = { fg = colors.infection_orange, bold = true },
    ErrorMsg = { fg = colors.nail_red, bold = true },

    -- Tabline
    TabLine = { fg = colors.ghost_white, bg = colors.shadow_black },
    TabLineFill = { bg = colors.void_black },
    TabLineSel = { fg = colors.soul_white, bg = colors.pale_black, bold = true },

    -- Floating windows
    FloatBorder = { fg = colors.soul_blue, bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black },
    FloatTitle = { fg = colors.geo_yellow, bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black, bold = true },
    FloatFooter = { fg = colors.ghost_white, bg = should_clear_bg('float_win') and 'NONE' or colors.shadow_black },

    -- Diff colors
    DiffAdd = { bg = blend(colors.moss_green, colors.void_black, 0.2) },
    DiffChange = { bg = blend(colors.soul_blue, colors.void_black, 0.15) },
    DiffDelete = { fg = colors.nail_red, bg = blend(colors.nail_red, colors.void_black, 0.15) },
    DiffText = { bg = blend(colors.soul_blue, colors.void_black, 0.3), bold = true },

    -- Diff line-based (modern)
    DiffAdded = { fg = colors.moss_green },
    DiffRemoved = { fg = colors.nail_red },
    DiffChanged = { fg = colors.soul_blue },
    DiffFile = { fg = colors.geo_yellow, bold = true },
    DiffIndexLine = { fg = colors.crystal_blue },
    DiffLine = { fg = colors.soul_blue },
    DiffNewFile = { fg = colors.moss_green, bold = true },
    DiffOldFile = { fg = colors.nail_red, bold = true },

    -- Spell checking
    SpellBad = { sp = colors.nail_red, undercurl = true },
    SpellCap = { sp = colors.infection_orange, undercurl = true },
    SpellLocal = { sp = colors.soul_blue, undercurl = true },
    SpellRare = { sp = colors.lumafly_green, undercurl = true },

    -- Quickfix and location list
    QuickFixLine = { bg = colors.shadow_black, bold = true },
    qfLineNr = { fg = colors.mask_gray },
    qfFileName = { fg = colors.soul_blue },
    qfError = { fg = colors.nail_red },

    -- Conceal
    Conceal = { fg = colors.mask_gray },

    -- Special
    NonText = { fg = colors.mask_gray },
    SpecialKey = { fg = colors.mask_gray },
    Whitespace = { fg = blend(colors.mask_gray, colors.void_black, 0.3) },
    EndOfBuffer = { fg = colors.void_black },

    -- Window chrome
    Title = { fg = colors.geo_yellow, bold = true },
    Directory = { fg = colors.soul_blue },

    -- Wildmenu
    WildMenu = { fg = colors.void_black, bg = colors.geo_yellow },

    -- Health check (for :checkhealth)
    healthError = { fg = colors.nail_red },
    healthSuccess = { fg = colors.moss_green },
    healthWarning = { fg = colors.infection_orange },

    -- Basic text formatting
    Underlined = { underline = true },
    Ignore = { fg = colors.mask_gray },
    Error = { fg = colors.nail_red, bold = true },
    Todo = { fg = colors.geo_yellow, bg = colors.shadow_black, bold = true },
    Bold = { bold = true },
    Italic = { italic = true },
  }
end

return M