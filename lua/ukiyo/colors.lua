-- The raw colors live in palette.lua, generated from ukiyo-theme/palette.
local palette = require("ukiyo.palette")

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to UkiyoConfig.colors.
---   - theme: Use selected theme. Defaults to UkiyoConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("ukiyo").config.colors
    local theme = opts.theme or require("ukiyo")._CURRENT_THEME -- WARN: this fails if called before ukiyo.load()

    if not theme then
        error("ukiyo.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme ukiyo'")
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("ukiyo.themes")[theme](updated_palette_colors)

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
