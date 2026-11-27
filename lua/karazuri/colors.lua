-- The raw colors live in palette.lua, generated from karazuri/palette.
local palette = require("karazuri.palette")

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to karazuriConfig.colors.
---   - theme: Use selected theme. Defaults to karazuriConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("karazuri").config.colors
    local theme = opts.theme or require("karazuri")._CURRENT_THEME -- WARN: this fails if called before karazuri.load()

    if not theme then
        error("karazuri.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme karazuri'")
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("karazuri.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {} )
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M
