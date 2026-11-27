# karazuri.nvim

A Neovim colorscheme based on [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim).

[View the palette](https://karazuri.github.io/palette/)

## Variants

| Name | Appearance | Background | Description |
|---|---|---|---|
| `umi` (sea) | Dark (default) | `#1A1A22` | Ink-blue background with warm text. |
| `yoru` (night) | Dark | `#161514` | Darker and warmer than umi, with less saturated colors. |
| `kami` (paper) | Light | `#D2CCBC` | Muted paper background at about 60% brightness. |

### umi

![umi palette preview](https://raw.githubusercontent.com/karazuri/palette/main/assets/umi.svg)

### yoru

![yoru palette preview](https://raw.githubusercontent.com/karazuri/palette/main/assets/yoru.svg)

### kami

![kami palette preview](https://raw.githubusercontent.com/karazuri/palette/main/assets/kami.svg)

## Requirements

Neovim 0.9 or newer, with `termguicolors` (karazuri turns it on).

## How to use

### Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "karazuri/nvim",
    name = "karazuri",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("karazuri")
    end,
}
```

To install without a plugin manager, clone the repository into Neovim's
`pack/karazuri/start/karazuri` directory under `stdpath("data")`. On macOS and Linux
with the default app name, run:

```sh
git clone https://github.com/karazuri/nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/pack/karazuri/start/karazuri"
```

Restart Neovim to load the package.

### Selecting a variant

```lua
vim.cmd.colorscheme("karazuri")
```

`karazuri` follows `vim.o.background`. By default it uses `umi` for `"dark"`
and `kami` for `"light"`. To select a variant directly, use one of these calls.

```lua
vim.cmd.colorscheme("karazuri-umi")
vim.cmd.colorscheme("karazuri-yoru")
vim.cmd.colorscheme("karazuri-kami")
```

### Configuration

You only need `setup` to change the defaults. Call it before `colorscheme`. The defaults are shown below.

```lua
require("karazuri").setup({
    compile = false,             -- cache compiled highlights; run :lua require("karazuri").recompile() after config changes
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
    overrides = function()       -- add or change highlight groups
        return {}
    end,
    theme = "umi",               -- used when 'background' has no mapping
    background = { dark = "umi", light = "kami" },
})
```

`colors.palette` holds the raw hex values in `lua/karazuri/palette.lua`, keyed as variant plus role (`umiKeyword`, `kamiBgP2`). `colors.theme` maps them to roles such as `syn.keyword` or `ui.bg_visual`; see `lua/karazuri/themes.lua` for the full list.

### Overriding colors and highlights

This example changes umi's keyword color and makes keywords bold in every
variant. The highlight overrides use the resolved keyword color for the
active variant.

```lua
require("karazuri").setup({
    colors = {
        palette = { umiKeyword = "#D0B4FF" },
    },
    overrides = function(colors)
        return {
            Keyword = { fg = colors.theme.syn.keyword, bold = true },
            ["@keyword"] = { fg = colors.theme.syn.keyword, bold = true },
        }
    end,
})
vim.cmd.colorscheme("karazuri")
```

If you enable `compile = true`, run `:lua require("karazuri").recompile()` after loading your changed
configuration. It rebuilds the cached highlights for all three variants and
reloads the active variant.

### Reading colors from other plugins

```lua
local colors = require("karazuri.colors").setup() -- for the currently loaded variant
local theme = colors.theme
local palette = colors.palette
```

To use the included lualine theme, set `options = { theme = "karazuri" }`.

## Changing the colors

`palette.json` in the palette repository is the source of truth for the colors and their contrast checks. To update the generated `lua/karazuri/palette.lua`, edit `palette.json` and run the commands below. [karazuri/palette](https://github.com/karazuri/palette)

```sh
python3 ../palette/scripts/check.py
python3 ../palette/scripts/build.py nvim --out .
```

The paths assume both repos are cloned side by side.

## Credits

karazuri.nvim is a fork of [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) by Tommaso Laurenzi, released under the MIT license. The plugin structure and highlight group coverage come from Kanagawa. The palettes are new.
