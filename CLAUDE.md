# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim colorscheme plugin inspired by the atmospheric world of Hollow Knight. The theme provides dark, atmospheric colors with mystical blue accents and comprehensive plugin support.

## Architecture

The plugin follows a modular structure for better organization and maintainability:

- **`colors/hollow-knight.lua`**: Standard colorscheme entry point that calls the main setup
- **`lua/hollow-knight/init.lua`**: Main setup function with modular loading system
- **`lua/hollow-knight/colors.lua`**: Color palette definitions, utilities, and variants
- **`lua/hollow-knight/groups/`**: Modular highlight group definitions
  - **`core.lua`**: Core editor highlights (Normal, Visual, etc.)
  - **`syntax.lua`**: Syntax and Treesitter highlights
  - **`lsp.lua`**: LSP and diagnostic highlights
  - **`plugins/`**: Plugin-specific highlight modules
    - **`telescope.lua`**: Telescope support
    - **`tree.lua`**: NvimTree & Neo-tree support
    - **`ui.lua`**: WhichKey, Bufferline, Alpha, etc.
    - **`git.lua`**: GitSigns and git integration
    - **`barbecue.lua`**: Barbecue.nvim support
    - **`terminal.lua`**: Terminal colors
- **`plugin/hollow-knight.lua`**: Auto-initialization plugin file

### Color System

The color system is organized into thematic groups inspired by Hollow Knight locations:

- **Abyss**: Background colors (void, deep, shadow)
- **Palace**: Text colors (soul, pale, ghost, silver)
- **Soul**: Blue variants for accents and UI elements
- **Greenpath**: Green colors for strings and success states
- **City**: Gold/yellow colors for functions and highlights
- **Infection**: Orange colors for warnings and special elements
- **Combat**: Red colors for errors and danger
- **Void**: Purple colors for keywords and selections

### Theme Variants

The color system supports multiple variants:
- **Hallownest** (default): Main dark theme
- **White Palace**: Light theme variant
- **Deepnest**: Extra dark variant
- **Preset variations**: Grimmchild, Pale Court, Crystal Peak

## Development Commands

### Testing the Theme
```lua
-- Basic reload:
:colorscheme hollow-knight

-- Full module reload for development:
:lua for name,_ in pairs(package.loaded) do if name:match('^hollow%-knight') then package.loaded[name] = nil end end
:colorscheme hollow-knight

-- Test with custom configuration:
:lua require('hollow-knight').setup({transparent = true, plugins = {telescope = false}})
```

### Color Development
The theme provides utilities in `lua/hollow-knight/colors.lua`:
- `blend(color1, color2, ratio)`: Blend two hex colors
- `fade(color, alpha)`: Create transparent version
- `get_colors(variant)`: Get complete color set for variant
- `create_variant(name, overrides)`: Create custom variants

## Plugin Support

The theme includes specific highlights for:
- **File explorers**: Neo-tree, NvimTree (with transparency support)
- **Fuzzy finders**: Telescope (with transparency support)
- **LSP**: Diagnostics, references, semantic highlighting
- **Git**: GitSigns, diff colors
- **UI plugins**: WhichKey, Bufferline, notifications
- **Syntax**: Treesitter and standard syntax groups

## Configuration Options

### Modern Configuration (Recommended)
```lua
require('hollow-knight').setup({
  transparent = false,
  background_clear = {'telescope', 'neo-tree'},
  plugins = {
    telescope = true,
    tree = true,      -- NvimTree & Neo-tree
    ui = true,        -- WhichKey, Bufferline, Alpha, etc.
    git = true,       -- GitSigns and git integration
    barbecue = true,  -- Barbecue.nvim winbar
    terminal = true,  -- Terminal colors
  }
})
```

### Legacy Configuration (Still Supported)
Users can also configure transparency through global variables:
- `vim.g.hollow_knight_transparent`: Enable global transparency
- `vim.g.hollow_knight_background_clear`: Array of plugins to make transparent
  - Supported: 'telescope', 'neo-tree', 'float_win', 'notify', 'noice'

### Plugin-Specific Control
Individual plugins can be disabled or forced:
```lua
plugins = {
  telescope = false,  -- Disable Telescope highlights
  barbecue = 'force', -- Force load even if plugin not detected
}
```

## File Organization

### Modular Structure Benefits
- **Color definitions**: Centralized in `colors.lua` with utilities
- **Core highlights**: Organized in `groups/core.lua` (editor fundamentals)
- **Syntax highlights**: Separated into `groups/syntax.lua` (language support)
- **LSP highlights**: Isolated in `groups/lsp.lua` (diagnostic and semantic tokens)
- **Plugin support**: Individual modules in `groups/plugins/` directory
- **Semantic naming**: All colors use Hollow Knight lore-based naming
- **Selective loading**: Only loads highlights for detected/enabled plugins

## Key Implementation Details

### Modular Architecture
- **Plugin detection**: Automatically detects installed plugins and loads appropriate highlights
- **Configurable loading**: Users can enable/disable specific plugin support
- **Backwards compatibility**: Maintains support for legacy configuration methods
- **Performance optimization**: Only loads highlights for enabled/detected plugins
- **Extensible design**: Easy to add new plugin support without modifying core files

### Technical Implementation
- Uses `vim.api.nvim_set_hl()` for highlight group definition
- Supports true color terminals with RGB hex colors
- Transparency handled through conditional background clearing
- Color blending utilities enable smooth gradient effects
- Lazy loading system for plugin-specific highlights
- Comprehensive error handling and fallbacks