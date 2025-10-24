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
- **Git**: GitSigns, vim-fugitive, diff colors
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
    fugitive = true,  -- vim-fugitive Git integration
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

## Colorscheme Design Best Practices

### Core Principles (From Neovim Colorscheme Guidelines)

#### 1. **Semantic Consistency**
- **Related elements use related colors**: Functions, methods, and constructors should share similar colors
- **Distinct categories get distinct hues**: Keywords (purple), strings (green), types (blue), functions (yellow)
- **Avoid arbitrary color choices**: Every color should have semantic meaning
- **Color families indicate relationships**: Built-in vs user-defined, mutable vs immutable

#### 2. **Visual Hierarchy**
- **Importance = Prominence**: More important elements should be more visually prominent
- **Code > UI**: Actual code should be more prominent than UI chrome (line numbers, status bars)
- **Errors > Warnings > Info**: Diagnostic severity reflected in visual weight
- **Primary > Secondary > Tertiary**: Text hierarchy (main text > comments > invisible elements)

#### 3. **Contrast and Accessibility**
- **WCAG Guidelines**: Aim for at least 4.5:1 contrast ratio for normal text, 3:1 for large text
- **Background separation**: Multiple background levels (main bg → secondary bg → highlighted bg)
- **Avoid similar colors**: Adjacent elements should have clearly distinguishable colors
- **Test with colorblindness simulators**: Ensure accessibility for all users

#### 4. **Cognitive Load Reduction**
- **Limit color palette**: Too many colors = visual noise. Stick to 8-12 main colors
- **Muted comments**: Comments should be present but not distracting
- **Subtle UI elements**: Line numbers, indent guides should fade into background
- **Consistent patterns**: Same syntax element = same color across all languages

### Highlight Group Organization

#### Essential Core Groups (Must Define)
```lua
-- Editor fundamentals
Normal, NormalFloat, NormalNC
Visual, VisualNOS
Cursor, CursorLine, CursorColumn, CursorLineNr
LineNr, SignColumn, FoldColumn
StatusLine, StatusLineNC
Pmenu, PmenuSel, PmenuSbar, PmenuThumb
FloatBorder, FloatTitle
VertSplit, WinSeparator

-- Search and matching
Search, IncSearch, CurSearch, Substitute
MatchParen

-- Diff and version control
DiffAdd, DiffChange, DiffDelete, DiffText
DiffAdded, DiffRemoved, DiffChanged

-- Spell checking
SpellBad, SpellCap, SpellLocal, SpellRare

-- Messages and errors
ErrorMsg, WarningMsg, ModeMsg, MoreMsg, Question
```

#### Diagnostic Groups (LSP)
```lua
-- Base diagnostic colors
DiagnosticError, DiagnosticWarn, DiagnosticInfo, DiagnosticHint, DiagnosticOk

-- Underlines (use undercurl for better visibility)
DiagnosticUnderlineError, DiagnosticUnderlineWarn, etc.

-- Virtual text (should be muted to reduce distraction)
DiagnosticVirtualTextError, DiagnosticVirtualTextWarn, etc.

-- Sign column
DiagnosticSignError, DiagnosticSignWarn, etc.

-- Floating windows
DiagnosticFloatingError, DiagnosticFloatingWarn, etc.

-- Special cases
DiagnosticDeprecated (strikethrough)
DiagnosticUnnecessary (faded/muted)
```

#### Treesitter Groups (Modern Syntax)
Organize by category, not by language:
```lua
-- Variables and identifiers
@variable, @variable.builtin, @variable.parameter, @variable.member

-- Functions and methods
@function, @function.builtin, @function.call
@method, @method.call
@constructor

-- Keywords and operators
@keyword, @keyword.function, @keyword.return, @keyword.operator
@operator

-- Types and constants
@type, @type.builtin, @type.definition
@constant, @constant.builtin

-- Literals
@string, @string.escape, @string.regex
@number, @boolean, @float
@character

-- Structure
@punctuation.delimiter, @punctuation.bracket, @punctuation.special
@property, @field
@parameter

-- Markup (for Markdown, etc.)
@markup.heading, @markup.strong, @markup.emphasis
@markup.link, @markup.list, @markup.quote

-- Comments
@comment, @comment.documentation
@comment.error, @comment.warning, @comment.note, @comment.todo
```

#### LSP Semantic Tokens
```lua
-- Type definitions
@lsp.type.class, @lsp.type.interface, @lsp.type.enum
@lsp.type.type, @lsp.type.struct
@lsp.type.typeParameter

-- Functions and methods
@lsp.type.function, @lsp.type.method
@lsp.type.macro, @lsp.type.decorator

-- Variables and properties
@lsp.type.variable, @lsp.type.parameter
@lsp.type.property, @lsp.type.enumMember

-- Modifiers (combine with base types)
@lsp.mod.readonly, @lsp.mod.static, @lsp.mod.deprecated
@lsp.mod.async, @lsp.mod.declaration, @lsp.mod.definition

-- Language-specific combinations
@lsp.typemod.variable.readonly (const in TypeScript)
@lsp.typemod.function.defaultLibrary (built-in functions)
```

### Color Design Guidelines

#### Background Hierarchy
Create clear visual separation with multiple background levels:
1. **Base background**: Main editor background (darkest)
2. **Secondary background**: Inactive windows, folded text
3. **Highlighted background**: Current line, visual selection
4. **UI background**: Status line, popup menus (slightly different tone)
5. **Floating background**: Floating windows, hovers

#### Foreground Hierarchy
Text should have clear importance levels:
1. **Primary text**: Main code, normal text (highest contrast)
2. **Secondary text**: Less important code elements
3. **Tertiary text**: Comments, muted elements (lower contrast)
4. **UI text**: Line numbers, status text (lowest priority)

#### Color Roles and Meaning
Establish semantic meaning for each color family:
- **Blue family**: Types, interfaces, metadata, information
- **Yellow/Gold family**: Functions, methods, important callables
- **Green family**: Strings, success states, additions
- **Red family**: Errors, deletions, danger
- **Orange family**: Warnings, special elements, modifications
- **Purple family**: Keywords, language constructs
- **Gray family**: Comments, disabled elements, UI chrome

### Common Pitfalls to Avoid

1. **Too many colors**: Stick to 8-12 main colors, use variations (lighter/darker) for hierarchy
2. **Inconsistent semantics**: Same color should mean same thing everywhere
3. **Poor contrast**: Test on multiple displays and lighting conditions
4. **Ignoring colorblindness**: Red/green distinction is problematic for ~8% of males
5. **Over-styling**: Not everything needs bold/italic/underline
6. **Forgetting virtual text**: Diagnostics, hints, and inline text should be muted
7. **Neglecting diff colors**: Git diffs should have clear, distinct colors
8. **Uniform comment style**: Doc comments can be slightly different from regular comments
9. **Missing modern groups**: Support both legacy syntax and Treesitter
10. **Inconsistent UI**: Floating windows should match the overall theme aesthetic

### Testing Checklist

When modifying the colorscheme, test:
- [ ] Basic syntax highlighting (keywords, strings, functions, types)
- [ ] Treesitter highlighting (ensure no conflicts with syntax groups)
- [ ] LSP semantic tokens (classes, interfaces, readonly variables)
- [ ] Diagnostics (errors, warnings, info, hints in code and gutter)
- [ ] Virtual text (should be muted and not distracting)
- [ ] Diffs (git diff, merge conflicts, diff mode)
- [ ] Search highlighting (search, incremental search, substitute)
- [ ] Visual selection (should be obvious but not overwhelming)
- [ ] Floating windows (borders, titles, content)
- [ ] Completion menu (selected item, kind icons, extra info)
- [ ] Markdown rendering (headings, bold, italic, links, code blocks)
- [ ] Multiple file types (JS/TS, Python, Rust, Lua, etc.)
- [ ] Light and dark backgrounds (if supporting both)
- [ ] Terminal colors (if supporting terminal integration)

### Performance Considerations

- **Lazy load plugin highlights**: Only load highlights for detected plugins
- **Avoid excessive blending**: Pre-calculate blended colors when possible
- **Use link when appropriate**: Link related groups instead of duplicating
- **Minimize conditional logic**: Pre-compute color variations
- **Test startup time**: Colorscheme should load quickly (<10ms)

### Maintenance Guidelines

- **Document color meanings**: Keep a color map with semantic meanings
- **Version control**: Track changes to ensure consistency
- **User feedback**: Listen to accessibility and readability concerns
- **Regular updates**: Keep up with new Treesitter and LSP token types
- **Backward compatibility**: Support both old and new highlight group names

## Hollow Knight Specific Implementation

### Color Semantic Mapping

Our theme follows these semantic mappings based on Hollow Knight lore:

| Color Family | Hollow Knight Name | Semantic Meaning | Usage |
|-------------|-------------------|------------------|-------|
| **Purple** | Void | Keywords, language constructs | `void_purple`, `deep_purple` |
| **Yellow/Gold** | City of Tears (Geo) | Functions, methods, callables | `geo_yellow`, `pale_gold` |
| **Blue** | Soul/Dream | Types, interfaces, information | `soul_blue`, `crystal_blue`, `dream_blue` |
| **Green** | Greenpath | Strings, success, additions | `lumafly_green`, `moss_green` |
| **Red** | Combat | Errors, deletions, danger | `nail_red`, `blood_red`, `crimson_red` |
| **Orange** | Infection | Warnings, special elements | `infection_orange`, `radiance_gold` |
| **Gray** | UI/Mask | Comments, UI chrome | `mask_gray`, `stone_gray` |
| **White** | White Palace | Text, foreground | `soul_white`, `pale_white`, `ghost_white` |
| **Black** | Abyss | Backgrounds | `void_black`, `shadow_black`, `pale_black` |

### Visual Hierarchy Implementation

1. **Most Prominent** (Yellow/Gold): JSX component names, functions, class names
   - These are the "callable" elements, the actions in code
   - Example: `<Component>`, `function name()`, `class ClassName`

2. **Secondary** (Blue): Types, interfaces, built-in elements
   - Metadata about code, structure definitions
   - Example: `interface Props`, `type User`, `this`, `self`

3. **Tertiary** (Green): String data, properties
   - Data and values
   - Example: `"string value"`, `propertyName`

4. **Control Flow** (Purple): Keywords that control program flow
   - Language constructs
   - Example: `if`, `for`, `return`, `async`

5. **Muted** (Gray): Comments, less important UI
   - Information that supports but doesn't define code
   - Example: `// comment`, line numbers

### Recent Improvements (Based on PDF Guidelines)

1. **Enhanced Contrast**: Improved background hierarchy with distinct levels
2. **JSX Readability**: Component names (yellow) now clearly distinct from props (blue)
3. **Diagnostic Virtual Text**: Muted and italic to reduce distraction
4. **LSP Semantic Tokens**: Comprehensive support for TypeScript/JavaScript
5. **Diff Support**: Clear visual distinction for additions, deletions, changes
6. **Accessibility**: Better contrast ratios throughout the theme
7. **Reduced Redundancy**: Cleaned up Treesitter groups, removed duplicates
8. **Comment Annotations**: Support for TODO, NOTE, WARNING in comments

### When Making Changes

Always consider:
1. **Does it maintain semantic consistency?** Same meaning = same color
2. **Does it respect visual hierarchy?** More important = more prominent
3. **Is contrast sufficient?** Test with color contrast checker
4. **Does it work with colorblindness?** Avoid relying only on red/green
5. **Is it consistent with Hollow Knight aesthetic?** Maintain the dark, atmospheric feel
6. **Does it reduce cognitive load?** Fewer colors is often better than more