# Hollow Knight Theme for Neovim

A dark, atmospheric Neovim colorscheme inspired by the hauntingly beautiful world of Hollow Knight. This theme captures the essence of Hallownest with deep void backgrounds, soul-blue accents, and mystical highlights that evoke the game's unique aesthetic.

## ✨ Features

- **Rich Color Palette**: 8 thematic color groups inspired by Hollow Knight locations
- **Multiple Variants**: 3 core variants plus 3 preset variations
- **Transparency Support**: Configurable transparency for popular plugins
- **Comprehensive Plugin Support**: Telescope, Neo-tree, LSP, Git signs, and more
- **True Color Support**: Full 24-bit RGB color support
- **Semantic Highlighting**: Enhanced Treesitter and LSP integration

## 🎨 Theme Variants

### Core Variants

#### Hallownest (Default)
The classic dark theme representing the depths of the ancient kingdom.
```lua
-- Deep void backgrounds with soul-white text
bg = '#0a0a0f'
fg = '#e8e8f0'
accent = '#7fb3d3'  -- Soul blue
```

#### White Palace
A lighter variant inspired by the Pale King's pristine domain.
```lua
-- Light, ethereal backgrounds
bg = '#f8f8fc'
fg = '#2a2a3a'
accent = '#4a8bc2'  -- Muted blue
```

#### Deepnest
An extra dark variant for those who prefer the deepest shadows.
```lua
-- Pure black backgrounds with dimmed elements
bg = '#000000'
fg = '#a8a8c0'
accent = '#7fb3d3' -- Blended soul blue
```

### Preset Variations

#### Grimmchild
Crimson accents inspired by the Grimm Troupe.
```lua
-- Adds dramatic red highlights
accent = '#8b1538'  -- Grimm red
warning = '#8b0000' -- Crimson
```

#### Pale Court
Silver and ethereal tones of the Pale King's court.
```lua
-- Silver accents with soul essence blends
accent = '#9898b0'  -- Palace silver
fg = blend(soul, essence, 0.2)  -- Ethereal text
```

#### Crystal Peak
Bright crystal blue inspired by the crystalline caverns.
```lua
-- Enhanced crystal blue highlights
accent = '#6bb6ff'  -- Crystal blue
success = '#87ceeb' -- Soul essence
```

## 🚀 Installation

### Using Lazy.nvim

Add to your `init.lua`:

```lua
{
  dir = vim.fn.stdpath('config') .. '/lua/hollow-knight',
  name = 'hollow-knight',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'hollow-knight'
  end,
}
```

### Using other plugin managers

1. Ensure the `hollow-knight` directory is in your `lua/` folder
2. Add the colorscheme file to `colors/hollow-knight.lua`
3. Set the colorscheme: `:colorscheme hollow-knight`

## ⚙️ Configuration

### Modern Setup (Recommended)

```lua
{
  dir = vim.fn.stdpath('config') .. '/lua/hollow-knight',
  name = 'hollow-knight',
  priority = 1000,
  config = function()
    -- Configure the theme (stores settings without applying)
    require('hollow-knight').setup({
      transparent = false,
      background_clear = {'telescope', 'neo-tree'},
      plugins = {
        telescope = true,
        tree = true,      -- NvimTree & Neo-tree
        ui = true,        -- WhichKey, Bufferline, Alpha, etc.
        git = true,       -- GitSigns and git integration
        fugitive = true,  -- vim-fugitive Git integration
        barbecue = true,  -- Barbecue.nvim winbar
        avante = true,    -- Avante.nvim AI copilot
        indent = true,    -- indent-blankline.nvim
        rest = true,      -- rest.nvim HTTP client
        terminal = true,  -- Terminal colors
      }
    })

    -- Apply the theme
    vim.cmd.colorscheme 'hollow-knight'
  end,
}
```

### Transparency Options

Control which elements have transparent backgrounds:

```lua
require('hollow-knight').setup({
  -- Enable global transparency for all elements
  transparent = true,

  -- Or selectively clear backgrounds for specific plugins
  transparent = false,
  background_clear = {
    'telescope',    -- Telescope windows
    'neo-tree',     -- File explorer
    'float_win',    -- Floating windows
    'notify',       -- Notification popups
    'noice',        -- Noice command line
  },
})

vim.cmd.colorscheme 'hollow-knight'
```

### Plugin Control

Enable or disable specific plugin highlights:

```lua
require('hollow-knight').setup({
  plugins = {
    telescope = true,      -- Enable Telescope highlights
    tree = false,          -- Disable tree plugin highlights
    barbecue = 'force',    -- Force load even if plugin not detected
  }
})
```

### Legacy Configuration (Still Supported)

You can also use global variables for backwards compatibility:

```lua
-- Global transparency
vim.g.hollow_knight_transparent = true

-- Selective transparency
vim.g.hollow_knight_background_clear = {
  'telescope',
  'neo-tree',
  'float_win',
  'notify',
  'noice',
}

vim.cmd.colorscheme 'hollow-knight'
```

### Using Different Variants

Currently, the theme defaults to the Hallownest variant. To use other variants, you would need to modify the theme implementation (see Development section).

## 🎯 Supported Plugins

The theme includes optimized highlights for:

- **File Explorers**: Neo-tree, NvimTree
- **Fuzzy Finders**: Telescope
- **LSP**: Native LSP, diagnostics, references
- **Git**: GitSigns, Fugitive
- **UI**: Which-key, Bufferline, Statusline
- **Syntax**: Treesitter, native syntax
- **Notifications**: notify.nvim, Noice
- **Completion**: Blink.cmp, native completion

## 🌈 Color Palette

### The Abyss - Backgrounds
```lua
void = '#0a0a0f'    -- Deepest darkness
deep = '#1a1a24'    -- Ancient shadows
shadow = '#2a2a3a'  -- Faded stone
```

### The White Palace - Text
```lua
soul = '#e8e8f0'    -- Pure soul energy
pale = '#c8c8d8'    -- Faded memories
ghost = '#a8a8c0'   -- Spectral presence
silver = '#9898b0'  -- Palace metal
```

### Soul and Dreams - Blues
```lua
bright = '#7fb3d3'  -- Soul vessel blue
dream = '#5a9fd4'   -- Dream nail essence
pale = '#4a8bc2'    -- Ancient magic
crystal = '#6bb6ff' -- Crystal Peak crystals
essence = '#87ceeb' -- Soul essence
```

### Greenpath - Nature
```lua
lumafly = '#7dd3c0' -- Lumafly lantern glow
moss = '#4a9d88'    -- Greenpath moss
acid = '#3d8b5f'    -- Acid pools
vine = '#2d6b4f'    -- Deep vines
```

### City of Tears - Gold
```lua
geo = '#ffd700'     -- Geo currency
gold = '#ffb347'    -- Radiance gold
pale_gold = '#e6a534' -- Ancient gold
brass = '#b8860b'   -- City metal
```

### The Infection - Orange
```lua
bright = '#ff9500'  -- Infected enemy glow
glow = '#ff7f00'    -- Infection particles
deep = '#cc7700'    -- Deep corruption
radiance = '#ffb347' -- The Radiance's light
```

### Combat - Reds
```lua
nail = '#d73027'    -- Pure Nail red
blood = '#b71c1c'   -- Deepnest dangers
crimson = '#8b0000' -- Grimmchild red
shade = '#660000'   -- Deep shadow
```

### The Void - Purples
```lua
bright = '#6a4c93'  -- Void tendrils
deep = '#5a3d7a'    -- Shade essence
grimm = '#8b1538'   -- Grimm Troupe
shadow = '#4a2c5a'  -- Void shadow
```

## 🛠️ Development

### Creating Custom Variants

You can create custom variants using the color utilities:

```lua
local hollow_knight = require('hollow-knight.colors')

-- Create a custom variant
local my_variant = hollow_knight.create_variant('my_theme', {
  accent = hollow_knight.palette.city.geo,
  warning = hollow_knight.palette.infection.bright,
  bg_highlight = hollow_knight.blend(
    hollow_knight.palette.abyss.shadow,
    hollow_knight.palette.city.geo,
    0.1
  ),
})
```

### Using Preset Variations

Activate preset variations:

```lua
local hollow_knight = require('hollow-knight.colors')

-- Activate Grimmchild preset
hollow_knight.presets.grimmchild()

-- Activate Pale Court preset
hollow_knight.presets.pale_court()

-- Activate Crystal Peak preset
hollow_knight.presets.crystal_peak()
```

### Color Utilities

The theme includes utility functions for color manipulation:

```lua
local colors = require('hollow-knight.colors')

-- Blend two colors
local blended = colors.blend('#ff0000', '#0000ff', 0.5)

-- Create transparent version
local faded = colors.fade('#ff0000', 0.5)

-- Get colors for a variant
local theme_colors = colors.get_colors('hallownest')
```

## 📝 Requirements

- Neovim 0.8.0+
- True color terminal support
- `termguicolors` enabled in your config

```lua
vim.opt.termguicolors = true
```

## 🎮 Inspiration

This theme draws inspiration from Team Cherry's masterpiece "Hollow Knight" and its atmospheric art style. Colors and naming conventions reflect the game's locations, characters, and mystical elements.

## 📄 License

This theme is created for personal use and educational purposes. Hollow Knight is a trademark of Team Cherry.

---

*"No cost too great. No mind to think. No will to break. No voice to cry suffering."*