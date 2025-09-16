-- ~/.config/nvim/lua/hollow-knight/init.lua
-- A Neovim theme inspired by Hollow Knight's atmospheric palette

local M = {}

-- Hollow Knight inspired color palette
local colors = {
  -- Core Hallownest colors
  void_black = '#0a0a0f', -- The deepest darkness of the Abyss
  shadow_black = '#1a1a24', -- Ancient Kingdom shadows
  pale_black = '#2a2a3a', -- Faded stone and ruins

  -- The Knight's essence
  soul_white = '#e8e8f0', -- Pure soul energy
  pale_white = '#c8c8d8', -- Faded memories
  ghost_white = '#a8a8c0', -- Spectral presence

  -- Hallownest's mystical glows
  soul_blue = '#7fb3d3', -- Soul vessel blue
  dream_blue = '#5a9fd4', -- Dream nail essence
  pale_blue = '#4a8bc2', -- Ancient magic
  crystal_blue = '#6bb6ff', -- Crystal Peak crystals

  -- Life and infection
  lumafly_green = '#7dd3c0', -- Lumafly lantern glow
  moss_green = '#4a9d88', -- Greenpath moss
  acid_green = '#3d8b5f', -- Acid pools

  -- The Radiance and infection
  infection_orange = '#ff9500', -- Infected enemy glow
  radiance_gold = '#ffb347', -- The Radiance's light
  pale_gold = '#e6a534', -- Ancient gold

  -- Blood and danger
  nail_red = '#d73027', -- Pure Nail red
  blood_red = '#b71c1c', -- Deepnest dangers
  crimson_red = '#8b0000', -- Grimmchild red

  -- Special elements
  void_purple = '#6a4c93', -- Void tendrils
  shade_purple = '#5a3d7a', -- Shade essence
  grimm_purple = '#8b1538', -- Grimm Troupe

  -- UI specific
  mask_gray = '#666677', -- Broken mask fragments
  bench_brown = '#4a3c28', -- Rest bench wood
  geo_yellow = '#ffd700', -- Geo currency
}

-- Helper function to set highlight groups
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Main setup function
function M.setup()
  -- Clear existing highlights
  vim.cmd 'highlight clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  -- Set colorscheme name
  vim.g.colors_name = 'hollow-knight'

  -- Check for transparency settings
  local transparent = vim.g.hollow_knight_transparent or false
  local background_clear = vim.g.hollow_knight_background_clear or {}

  -- Helper function to check if background should be cleared
  local function should_clear_bg(plugin_name)
    for _, name in ipairs(background_clear) do
      if name == plugin_name then
        return true
      end
    end
    return false
  end

  -- Editor highlights - The Kingdom's foundation
  hi('Normal', { fg = colors.soul_white, bg = transparent and 'NONE' or colors.void_black })
  hi('NormalFloat', { fg = colors.soul_white, bg = (transparent or should_clear_bg('float_win')) and 'NONE' or colors.shadow_black })
  hi('CursorLine', { bg = colors.shadow_black })
  hi('CursorColumn', { bg = colors.shadow_black })
  hi('LineNr', { fg = colors.mask_gray })
  hi('CursorLineNr', { fg = colors.soul_blue, bold = true })
  hi('SignColumn', { bg = colors.void_black })
  hi('Folded', { fg = colors.ghost_white, bg = colors.pale_black, italic = true })
  hi('FoldColumn', { fg = colors.mask_gray, bg = colors.void_black })
  hi('ColorColumn', { bg = colors.shadow_black })
  hi('VertSplit', { fg = colors.pale_black, bg = colors.void_black })
  hi('Visual', { bg = colors.void_purple })
  hi('VisualNOS', { bg = colors.shade_purple })
  hi('Search', { fg = colors.void_black, bg = colors.geo_yellow })
  hi('IncSearch', { fg = colors.void_black, bg = colors.infection_orange })
  hi('MatchParen', { fg = colors.crystal_blue, bold = true, underline = true })

  -- Syntax highlighting - The Ancient Language
  hi('Comment', { fg = colors.mask_gray, italic = true })
  hi('Constant', { fg = colors.crystal_blue })
  hi('String', { fg = colors.lumafly_green })
  hi('Character', { fg = colors.moss_green })
  hi('Number', { fg = colors.pale_gold })
  hi('Boolean', { fg = colors.dream_blue })
  hi('Float', { fg = colors.radiance_gold })
  hi('Identifier', { fg = colors.soul_blue })
  hi('Function', { fg = colors.geo_yellow, bold = true })
  hi('Statement', { fg = colors.void_purple, bold = true })
  hi('Conditional', { fg = colors.shade_purple })
  hi('Repeat', { fg = colors.shade_purple })
  hi('Label', { fg = colors.infection_orange })
  hi('Operator', { fg = colors.pale_white })
  hi('Keyword', { fg = colors.dream_blue, bold = true })
  hi('Exception', { fg = colors.nail_red, bold = true })
  hi('PreProc', { fg = colors.void_purple })
  hi('Include', { fg = colors.crystal_blue })
  hi('Define', { fg = colors.pale_blue })
  hi('Macro', { fg = colors.infection_orange })
  hi('PreCondit', { fg = colors.shade_purple })
  hi('Type', { fg = colors.soul_blue, bold = true })
  hi('StorageClass', { fg = colors.dream_blue })
  hi('Structure', { fg = colors.pale_blue })
  hi('Typedef', { fg = colors.crystal_blue })
  hi('Special', { fg = colors.radiance_gold })
  hi('SpecialChar', { fg = colors.infection_orange })
  hi('Tag', { fg = colors.lumafly_green })
  hi('Delimiter', { fg = colors.ghost_white })
  hi('SpecialComment', { fg = colors.mask_gray, bold = true })
  hi('Debug', { fg = colors.crimson_red })
  hi('Underlined', { fg = colors.soul_blue, underline = true })
  hi('Ignore', { fg = colors.mask_gray })
  hi('Error', { fg = colors.blood_red, bold = true })
  hi('Todo', { fg = colors.geo_yellow, bg = colors.shadow_black, bold = true })

  -- Treesitter highlights - Modern Hallownest Magic
  hi('@variable', { fg = colors.soul_white })
  hi('@variable.builtin', { fg = colors.soul_blue })
  hi('@property', { fg = colors.pale_blue })
  hi('@function', { fg = colors.geo_yellow, bold = true })
  hi('@function.builtin', { fg = colors.radiance_gold })
  hi('@method', { fg = colors.lumafly_green })
  hi('@constructor', { fg = colors.crystal_blue, bold = true })
  hi('@keyword', { fg = colors.dream_blue, bold = true })
  hi('@keyword.function', { fg = colors.void_purple })
  hi('@keyword.return', { fg = colors.shade_purple, bold = true })
  hi('@type', { fg = colors.soul_blue, bold = true })
  hi('@type.builtin', { fg = colors.pale_blue })
  hi('@string', { fg = colors.lumafly_green })
  hi('@string.escape', { fg = colors.infection_orange })
  hi('@number', { fg = colors.pale_gold })
  hi('@boolean', { fg = colors.dream_blue })
  hi('@comment', { fg = colors.mask_gray, italic = true })
  hi('@punctuation.bracket', { fg = colors.ghost_white })
  hi('@punctuation.delimiter', { fg = colors.pale_white })

  -- LSP highlights - The Infection's spread
  hi('DiagnosticError', { fg = colors.blood_red })
  hi('DiagnosticWarn', { fg = colors.infection_orange })
  hi('DiagnosticInfo', { fg = colors.soul_blue })
  hi('DiagnosticHint', { fg = colors.lumafly_green })
  hi('DiagnosticUnderlineError', { sp = colors.blood_red, underline = true })
  hi('DiagnosticUnderlineWarn', { sp = colors.infection_orange, underline = true })
  hi('DiagnosticUnderlineInfo', { sp = colors.soul_blue, underline = true })
  hi('DiagnosticUnderlineHint', { sp = colors.lumafly_green, underline = true })
  hi('LspReferenceText', { bg = colors.pale_black })
  hi('LspReferenceRead', { bg = colors.pale_black })
  hi('LspReferenceWrite', { bg = colors.shadow_black })

  -- Popup menu - Ancient UI
  hi('Pmenu', { fg = colors.soul_white, bg = colors.shadow_black })
  hi('PmenuSel', { fg = colors.void_black, bg = colors.soul_blue })
  hi('PmenuSbar', { bg = colors.pale_black })
  hi('PmenuThumb', { bg = colors.mask_gray })

  -- Statusline - The Knight's HUD
  hi('StatusLine', { fg = colors.soul_white, bg = colors.pale_black })
  hi('StatusLineNC', { fg = colors.mask_gray, bg = colors.shadow_black })
  hi('ModeMsg', { fg = colors.geo_yellow, bold = true })
  hi('MoreMsg', { fg = colors.lumafly_green })
  hi('Question', { fg = colors.soul_blue })
  hi('WarningMsg', { fg = colors.infection_orange })
  hi('ErrorMsg', { fg = colors.blood_red, bold = true })

  -- Tabline - Ancient Tablets
  hi('TabLine', { fg = colors.ghost_white, bg = colors.shadow_black })
  hi('TabLineFill', { bg = colors.shadow_black })
  hi('TabLineSel', { fg = colors.soul_white, bg = colors.pale_black })

  -- Git signs - The Kingdom's history
  hi('GitSignsAdd', { fg = colors.moss_green })
  hi('GitSignsChange', { fg = colors.soul_blue })
  hi('GitSignsDelete', { fg = colors.nail_red })
  hi('GitSignsCurrentLineBlame', { fg = colors.mask_gray, italic = true })

  -- Telescope - Dreamer's Vision (with transparency support)
  hi('TelescopeBorder', { fg = colors.pale_black })
  hi('TelescopePromptBorder', { fg = colors.soul_blue })
  hi('TelescopeResultsBorder', { fg = colors.pale_black })
  hi('TelescopePreviewBorder', { fg = colors.pale_black })
  hi('TelescopeNormal', { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black })
  hi('TelescopePromptNormal', { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black })
  hi('TelescopeResultsNormal', { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black })
  hi('TelescopePreviewNormal', { fg = colors.soul_white, bg = should_clear_bg('telescope') and 'NONE' or colors.shadow_black })
  hi('TelescopeSelection', { bg = colors.void_purple })
  hi('TelescopeMultiSelection', { fg = colors.infection_orange })
  hi('TelescopePromptPrefix', { fg = colors.geo_yellow })
  hi('TelescopeMatching', { fg = colors.radiance_gold, bold = true })

  -- NvimTree - Hallownest's paths (with transparency support)
  hi('NvimTreeNormal', { fg = colors.soul_white }) -- Transparent background
  hi('NvimTreeNormalNC', { fg = colors.soul_white }) -- Transparent background when not current
  hi('NvimTreeEndOfBuffer', { fg = colors.void_black }) -- Hide end of buffer tildes
  hi('NvimTreeVertSplit', { fg = colors.pale_black }) -- Transparent vertical split
  hi('NvimTreeFolderIcon', { fg = colors.soul_blue })
  hi('NvimTreeFolderName', { fg = colors.pale_blue })
  hi('NvimTreeOpenedFolderName', { fg = colors.soul_blue, bold = true })
  hi('NvimTreeIndentMarker', { fg = colors.mask_gray })
  hi('NvimTreeGitDirty', { fg = colors.infection_orange })
  hi('NvimTreeGitNew', { fg = colors.moss_green })
  hi('NvimTreeGitDeleted', { fg = colors.nail_red })
  hi('NvimTreeSpecialFile', { fg = colors.geo_yellow })
  hi('NvimTreeExecutable', { fg = colors.lumafly_green, bold = true })

  -- Neo-tree - Modern Hallownest navigation (with transparency support)
  hi('NeoTreeNormal', { fg = colors.soul_white, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black })
  hi('NeoTreeNormalNC', { fg = colors.soul_white, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black })
  hi('NeoTreeEndOfBuffer', { fg = colors.void_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.shadow_black })
  hi('NeoTreeVertSplit', { fg = colors.pale_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.void_black })
  hi('NeoTreeWinSeparator', { fg = colors.pale_black, bg = should_clear_bg('neo-tree') and 'NONE' or colors.void_black })
  hi('NeoTreeDirectoryName', { fg = colors.pale_blue })
  hi('NeoTreeDirectoryIcon', { fg = colors.soul_blue })
  hi('NeoTreeFileName', { fg = colors.soul_white })
  hi('NeoTreeFileIcon', { fg = colors.ghost_white })
  hi('NeoTreeModified', { fg = colors.infection_orange })
  hi('NeoTreeGitAdded', { fg = colors.moss_green })
  hi('NeoTreeGitModified', { fg = colors.soul_blue })
  hi('NeoTreeGitDeleted', { fg = colors.nail_red })
  hi('NeoTreeGitIgnored', { fg = colors.mask_gray })
  hi('NeoTreeGitUntracked', { fg = colors.lumafly_green })
  hi('NeoTreeIndentMarker', { fg = colors.mask_gray })
  hi('NeoTreeExpander', { fg = colors.soul_blue })
  hi('NeoTreeDimText', { fg = colors.mask_gray })

  -- WhichKey - Ancient Spells
  hi('WhichKey', { fg = colors.geo_yellow })
  hi('WhichKeyGroup', { fg = colors.soul_blue })
  hi('WhichKeyDesc', { fg = colors.soul_white })
  hi('WhichKeySeparator', { fg = colors.mask_gray })
  hi('WhichKeyFloat', { bg = colors.shadow_black })

  -- Bufferline - Soul Vessels
  hi('BufferLineFill', { bg = colors.void_black })
  hi('BufferLineBackground', { fg = colors.mask_gray, bg = colors.shadow_black })
  hi('BufferLineBuffer', { fg = colors.soul_white, bg = colors.pale_black })
  hi('BufferLineBufferSelected', { fg = colors.geo_yellow, bg = colors.void_black, bold = true })
  hi('BufferLineIndicatorSelected', { fg = colors.soul_blue })

  -- Indent Blankline - Ancient Architecture
  hi('IndentBlanklineChar', { fg = colors.mask_gray })
  hi('IndentBlanklineContextChar', { fg = colors.soul_blue })

  -- Dashboard/Alpha - The Pale King's Throne
  hi('AlphaShortcut', { fg = colors.geo_yellow })
  hi('AlphaHeader', { fg = colors.soul_blue })
  hi('AlphaHeaderLabel', { fg = colors.radiance_gold })
  hi('AlphaButtons', { fg = colors.soul_white })
  hi('AlphaFooter', { fg = colors.mask_gray, italic = true })

  -- Notifications and Noice - Ancient Messages
  hi('NotifyBackground', { bg = should_clear_bg('notify') and 'NONE' or colors.shadow_black })
  hi('NotifyERRORBorder', { fg = colors.blood_red })
  hi('NotifyWARNBorder', { fg = colors.infection_orange })
  hi('NotifyINFOBorder', { fg = colors.soul_blue })
  hi('NotifyDEBUGBorder', { fg = colors.mask_gray })
  hi('NotifyTRACEBorder', { fg = colors.ghost_white })
  hi('NoiceCmdlinePopup', { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black })
  hi('NoiceCmdlineIcon', { fg = colors.geo_yellow })
  hi('NoiceConfirm', { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black })
  hi('NoicePopupmenu', { fg = colors.soul_white, bg = should_clear_bg('noice') and 'NONE' or colors.shadow_black })

  -- Terminal colors - The Void's palette
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
