# ukiyo.nvim

A Neovim colorscheme based on [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim), rebuilt around readability. Every color is checked for WCAG contrast against its background.

It has three variants:

| Variant | Background | Style |
|---|---|---|
| `umi` (sea) | `#1A1A22` | The default dark theme. Ink-blue background, warm text. |
| `yoru` (night) | `#161514` | Darker and warmer, with less saturated colors. |
| `kami` (paper) | `#D2CCBC` | Light theme at about 60% brightness, between a dark and a light theme. |

## Differences from Kanagawa

- Comments are readable. They are at least 4.5:1 in every variant, compared with 3.3:1 in Kanagawa Wave.
- Syntax colors are at least 5:1 in every variant. Kanagawa's keyword violet is 4.7:1.
- Keywords are a lighter lilac (`#C4A8F5` in umi), so they don't blend into the background or into function names. They aren't italic by default.
- The light variant isn't white or yellow. Its background is a muted paper tone at about 60% brightness, dim enough for people who prefer dark themes.
- The hue order is the same in all three variants. Switching between dark and light keeps keywords violet, functions blue and strings green.

Run `python3 scripts/contrast.py` to print the contrast table for every variant.

## Requirements

Neovim 0.9 or newer, with `termguicolors` (ukiyo turns it on).

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "rishitxyz/ukiyo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("ukiyo")
    end,
}
```

## Usage

```vim
colorscheme ukiyo        " follows 'background': umi when dark, kami when light
colorscheme ukiyo-umi
colorscheme ukiyo-yoru
colorscheme ukiyo-kami
```

## Configuration

You only need `setup` to change the defaults. Call it before `colorscheme`.

```lua
require("ukiyo").setup({
    compile = false,             -- cache compiled highlights; run :UkiyoCompile after config changes
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = {},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- leave the background unset
    dimInactive = false,         -- dim inactive windows, see :h hl-NormalNC
    terminalColors = true,       -- set vim.g.terminal_color_0 to _17
    colors = {
        palette = {},            -- override raw colors, e.g. { umiKeyword = "#D0B4FF" }
        theme = { umi = {}, yoru = {}, kami = {}, all = {} },
    },
    overrides = function(colors) -- add or change highlight groups
        return {}
    end,
    theme = "umi",               -- used when 'background' has no mapping
    background = { dark = "umi", light = "kami" },
})
```

`colors.palette` holds the raw hex values in `lua/ukiyo/colors.lua`. `colors.theme` maps them to roles such as `syn.keyword` or `ui.bg_visual`; see `lua/ukiyo/themes.lua` for the full list.

### Examples

Make keywords bold:

```lua
overrides = function(colors)
    return {
        Keyword = { fg = colors.theme.syn.keyword, bold = true },
        ["@keyword"] = { fg = colors.theme.syn.keyword, bold = true },
    }
end
```

Color `return` and `throw` like other keywords instead of red:

```lua
overrides = function(colors)
    return {
        ["@keyword.return"] = { fg = colors.theme.syn.keyword },
        ["@keyword.exception"] = { fg = colors.theme.syn.keyword, bold = true },
    }
end
```

### Reading colors from other plugins

```lua
local colors = require("ukiyo.colors").setup() -- for the currently loaded variant
local theme = colors.theme
local palette = colors.palette
```

A lualine theme is included: `options = { theme = "ukiyo" }`.

## Credits

ukiyo.nvim is a fork of [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) by Tommaso Laurenzi, released under the MIT license. The plugin structure and highlight group coverage come from Kanagawa. The palettes are new.
