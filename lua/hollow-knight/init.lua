-- ~/.config/nvim/lua/hollow-knight/init.lua
-- A Neovim theme inspired by Hollow Knight's atmospheric palette
-- Modular structure for better organization and maintainability

local M = {}

-- Helper function to set highlight groups
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Helper function to merge highlight groups
local function merge_highlights(...)
  local result = {}
  for _, highlights in ipairs({...}) do
    for group, opts in pairs(highlights) do
      result[group] = opts
    end
  end
  return result
end

-- Plugin detection helpers
local function has_plugin(plugin_name)
  -- Simple plugin detection - can be enhanced
  return pcall(require, plugin_name) or vim.fn.exists(':' .. plugin_name) == 2
end

-- Configuration options
local default_config = {
  transparent = false,
  background_clear = {},
  plugins = {
    telescope = true,
    tree = true,  -- NvimTree & Neo-tree
    ui = true,    -- WhichKey, Bufferline, Alpha, etc.
    git = true,   -- GitSigns and git integration
    barbecue = true,
    terminal = true,
  }
}

-- Load color palette
local function get_colors()
  return require('hollow-knight.colors')
end

-- Main setup function
function M.setup(opts)
  opts = vim.tbl_deep_extend('force', default_config, opts or {})

  -- Clear existing highlights
  vim.cmd 'highlight clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  -- Set colorscheme name
  vim.g.colors_name = 'hollow-knight'

  -- Get colors and configuration
  local colors_module = get_colors()
  local colors = colors_module.get_colors('hallownest')

  -- Configuration helpers
  local transparent = opts.transparent or vim.g.hollow_knight_transparent or false
  local background_clear = opts.background_clear or vim.g.hollow_knight_background_clear or {}

  -- Helper function to check if background should be cleared
  local function should_clear_bg(plugin_name)
    for _, name in ipairs(background_clear) do
      if name == plugin_name then
        return true
      end
    end
    return false
  end

  -- Load core highlight groups
  local core_highlights = require('hollow-knight.groups.core').setup(colors, transparent, should_clear_bg)
  local syntax_highlights = require('hollow-knight.groups.syntax').setup(colors)
  local lsp_highlights = require('hollow-knight.groups.lsp').setup(colors)

  -- Load plugin-specific highlights based on configuration and detection
  local plugin_highlights = {}

  if opts.plugins.telescope and (has_plugin('telescope') or opts.plugins.telescope == 'force') then
    local telescope_highlights = require('hollow-knight.groups.plugins.telescope').setup(colors, should_clear_bg)
    plugin_highlights = merge_highlights(plugin_highlights, telescope_highlights)
  end

  if opts.plugins.tree and (has_plugin('nvim-tree') or has_plugin('neo-tree') or opts.plugins.tree == 'force') then
    local tree_highlights = require('hollow-knight.groups.plugins.tree').setup(colors, should_clear_bg)
    plugin_highlights = merge_highlights(plugin_highlights, tree_highlights)
  end

  if opts.plugins.ui then
    local ui_highlights = require('hollow-knight.groups.plugins.ui').setup(colors, should_clear_bg)
    plugin_highlights = merge_highlights(plugin_highlights, ui_highlights)
  end

  if opts.plugins.git and (has_plugin('gitsigns') or opts.plugins.git == 'force') then
    local git_highlights = require('hollow-knight.groups.plugins.git').setup(colors)
    plugin_highlights = merge_highlights(plugin_highlights, git_highlights)
  end

  if opts.plugins.barbecue and (has_plugin('barbecue') or opts.plugins.barbecue == 'force') then
    local barbecue_highlights = require('hollow-knight.groups.plugins.barbecue').setup(colors)
    plugin_highlights = merge_highlights(plugin_highlights, barbecue_highlights)
  end

  -- Combine all highlights
  local all_highlights = merge_highlights(
    core_highlights,
    syntax_highlights,
    lsp_highlights,
    plugin_highlights
  )

  -- Apply all highlight groups
  for group, opts_hl in pairs(all_highlights) do
    hi(group, opts_hl)
  end

  -- Set terminal colors if enabled
  if opts.plugins.terminal then
    local terminal_module = require('hollow-knight.groups.plugins.terminal')
    terminal_module.set_terminal_colors(colors)
  end
end

-- Legacy compatibility function
function M.load()
  M.setup()
end

-- Export color utilities for advanced users
function M.get_colors()
  return get_colors()
end

return M