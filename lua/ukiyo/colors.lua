---@class PaletteColors
local palette = {
    -- umi (海, sea): the default dark variant
    umiBg0 = "#14141B", umiBgM2 = "#16161D", umiBgM1 = "#18181F",
    umiBg = "#1A1A22", umiBgP1 = "#1E1E27", umiBgP2 = "#22222C", umiBg3 = "#2A2A37",
    umiVisual = "#2D3F5C", umiSearch = "#3D5378", umiBorder = "#54546D", umiSpecial = "#938FB0",
    umiFg = "#E2DCC5", umiFgDim = "#C8C093", umiComment = "#8A8980",
    umiKeyword = "#C4A8F5", umiFunc = "#82A8E8", umiString = "#A3C97A", umiType = "#7FC4B4",
    umiNumber = "#E08AA6", umiConstant = "#F2A36B", umiField = "#E8C88A", umiOperator = "#D6B77A",
    umiBuiltin = "#E8707E", umiPunct = "#9DAACC", umiParam = "#B8B4D0", umiEscape = "#9ED6D8",
    umiError = "#F2616E", umiWarn = "#F0A35E", umiInfo = "#6FB5D6", umiHint = "#7FC4B4",
    umiDiffAdd = "#24352A", umiDiffChange = "#252F45", umiDiffDelete = "#3A2228", umiDiffText = "#3A4A6A",
    umiGitAdd = "#8FB573", umiGitChange = "#D6B77A", umiGitDelete = "#E8707E",

    -- yoru (夜, night): darker, warmer and more muted
    yoruBg0 = "#0F0F0E", yoruBgM2 = "#121211", yoruBgM1 = "#141312",
    yoruBg = "#161514", yoruBgP1 = "#1A1918", yoruBgP2 = "#1E1D1B", yoruBg3 = "#262523",
    yoruVisual = "#2B3240", yoruSearch = "#3B4659", yoruBorder = "#4A4744", yoruSpecial = "#9A958A",
    yoruFg = "#D2CDBF", yoruFgDim = "#B5B0A3", yoruComment = "#8C8578",
    yoruKeyword = "#B8A3D6", yoruFunc = "#8BA4C7", yoruString = "#A3B58A", yoruType = "#8FB8AA",
    yoruNumber = "#D49BA9", yoruConstant = "#D9A273", yoruField = "#D9BE8C", yoruOperator = "#C4AE84",
    yoruBuiltin = "#D9787F", yoruPunct = "#A3A9B8", yoruParam = "#BDB3C6", yoruEscape = "#9EC3C2",
    yoruError = "#E0616A", yoruWarn = "#E09B5E", yoruInfo = "#79A8C6", yoruHint = "#8FB8AA",
    yoruDiffAdd = "#1F2A1F", yoruDiffChange = "#1F2533", yoruDiffDelete = "#2F1C1E", yoruDiffText = "#32405A",
    yoruGitAdd = "#94AD7E", yoruGitChange = "#C4AE84", yoruGitDelete = "#D9787F",

    -- kami (紙, paper): the light variant, a mid-brightness paper between dark and light
    kamiBg0 = "#C8C2B0", kamiBgM2 = "#CBC5B4", kamiBgM1 = "#CEC8B8",
    kamiBg = "#D2CCBC", kamiBgP1 = "#CDC7B6", kamiBgP2 = "#CAC3B1", kamiBg3 = "#C2BBA8",
    kamiVisual = "#B2BAC8", kamiSearch = "#A2B0C6", kamiBorder = "#989280", kamiNontext = "#8D8777",
    kamiSpecial = "#5A5463",
    kamiFg = "#292830", kamiFgDim = "#3F3E49", kamiComment = "#595750",
    kamiKeyword = "#523B83", kamiFunc = "#2B497A", kamiString = "#36561D", kamiType = "#22564D",
    kamiNumber = "#7F3451", kamiConstant = "#7B4116", kamiField = "#674B0F", kamiOperator = "#604E22",
    kamiBuiltin = "#892D38", kamiPunct = "#485064", kamiParam = "#514967", kamiEscape = "#235367",
    kamiError = "#981F2E", kamiWarn = "#82450B", kamiInfo = "#20547A", kamiHint = "#23594F",
    kamiDiffAdd = "#BFC9AD", kamiDiffChange = "#BEC4CD", kamiDiffDelete = "#D5BAB8", kamiDiffText = "#A7B4C6",
    kamiGitAdd = "#34611E", kamiGitChange = "#705210", kamiGitDelete = "#9D2F3B",
}

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
