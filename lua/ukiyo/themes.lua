local c = require("ukiyo.lib.color")

--TODO:
--PreProc needs its own color
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
    ---@param palette PaletteColors
    ---@return ThemeColors
    umi = function(palette)
        return {
            ui = {
                fg         = palette.umiFg,
                fg_dim     = palette.umiFgDim,
                fg_reverse = palette.umiBg0,

                bg_dim     = palette.umiBgM1,
                bg_gutter  = palette.umiBg,

                bg_m3      = palette.umiBg0,
                bg_m2      = palette.umiBgM2,
                bg_m1      = palette.umiBgM1,
                bg         = palette.umiBg,
                bg_p1      = palette.umiBgP1,
                bg_p2      = palette.umiBgP2,

                special    = palette.umiUiSpecial,
                nontext    = palette.umiNontext,
                whitespace = palette.umiNontext,

                bg_search  = palette.umiSearch,
                bg_visual  = palette.umiVisual,

                pmenu      = {
                    fg       = palette.umiFg,
                    fg_sel   = "none", -- lets the item's own highlight show through
                    bg       = palette.umiBg3,
                    bg_sel   = palette.umiVisual,
                    bg_sbar  = palette.umiBg3,
                    bg_thumb = palette.umiBorder,
                },
                float      = {
                    fg        = palette.umiFgDim,
                    bg        = palette.umiBg0,
                    fg_border = palette.umiBorder,
                    bg_border = palette.umiBg0,
                },
            },
            syn = {
                string     = palette.umiString,
                variable   = "none",
                number     = palette.umiNumber,
                constant   = palette.umiConstant,
                identifier = palette.umiField,
                parameter  = palette.umiParam,
                fun        = palette.umiFunc,
                statement  = palette.umiKeyword,
                keyword    = palette.umiKeyword,
                operator   = palette.umiOperator,
                preproc    = palette.umiBuiltin,
                type       = palette.umiType,
                regex      = palette.umiOperator,
                deprecated = palette.umiComment,
                comment    = palette.umiComment,
                punct      = palette.umiPunct,
                special1   = palette.umiSpecial,
                special2   = palette.umiBuiltin,
                special3   = palette.umiBuiltin,
            },
            vcs = {
                added   = palette.umiGitAdd,
                removed = palette.umiGitDelete,
                changed = palette.umiGitChange,
            },
            diff = {
                add    = palette.umiDiffAdd,
                delete = palette.umiDiffDelete,
                change = palette.umiDiffChange,
                text   = palette.umiDiffText,
            },
            diag = {
                ok      = palette.umiString,
                error   = palette.umiError,
                warning = palette.umiWarn,
                info    = palette.umiInfo,
                hint    = palette.umiHint,
            },
            term = {
                palette.umiBg0, -- black
                palette.umiBuiltin, -- red
                palette.umiString, -- green
                palette.umiOperator, -- yellow
                palette.umiFunc, -- blue
                palette.umiKeyword, -- magenta
                palette.umiType, -- cyan
                palette.umiFgDim, -- white
                palette.umiComment, -- bright black
                palette.umiError, -- bright red
                palette.umiGitAdd, -- bright green
                palette.umiField, -- bright yellow
                palette.umiInfo, -- bright blue
                palette.umiParam, -- bright magenta
                palette.umiSpecial, -- bright cyan
                palette.umiFg, -- bright white
                palette.umiConstant, -- extended color 1
                palette.umiError, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    yoru = function(palette)
        return {
            ui = {
                fg         = palette.yoruFg,
                fg_dim     = palette.yoruFgDim,
                fg_reverse = palette.yoruBg0,

                bg_dim     = palette.yoruBgM1,
                bg_gutter  = palette.yoruBg,

                bg_m3      = palette.yoruBg0,
                bg_m2      = palette.yoruBgM2,
                bg_m1      = palette.yoruBgM1,
                bg         = palette.yoruBg,
                bg_p1      = palette.yoruBgP1,
                bg_p2      = palette.yoruBgP2,

                special    = palette.yoruUiSpecial,
                nontext    = palette.yoruNontext,
                whitespace = palette.yoruNontext,

                bg_search  = palette.yoruSearch,
                bg_visual  = palette.yoruVisual,

                pmenu      = {
                    fg       = palette.yoruFg,
                    fg_sel   = "none", -- lets the item's own highlight show through
                    bg       = palette.yoruBg3,
                    bg_sel   = palette.yoruVisual,
                    bg_sbar  = palette.yoruBg3,
                    bg_thumb = palette.yoruBorder,
                },
                float      = {
                    fg        = palette.yoruFgDim,
                    bg        = palette.yoruBg0,
                    fg_border = palette.yoruBorder,
                    bg_border = palette.yoruBg0,
                },
            },
            syn = {
                string     = palette.yoruString,
                variable   = "none",
                number     = palette.yoruNumber,
                constant   = palette.yoruConstant,
                identifier = palette.yoruField,
                parameter  = palette.yoruParam,
                fun        = palette.yoruFunc,
                statement  = palette.yoruKeyword,
                keyword    = palette.yoruKeyword,
                operator   = palette.yoruOperator,
                preproc    = palette.yoruBuiltin,
                type       = palette.yoruType,
                regex      = palette.yoruOperator,
                deprecated = palette.yoruComment,
                comment    = palette.yoruComment,
                punct      = palette.yoruPunct,
                special1   = palette.yoruSpecial,
                special2   = palette.yoruBuiltin,
                special3   = palette.yoruBuiltin,
            },
            vcs = {
                added   = palette.yoruGitAdd,
                removed = palette.yoruGitDelete,
                changed = palette.yoruGitChange,
            },
            diff = {
                add    = palette.yoruDiffAdd,
                delete = palette.yoruDiffDelete,
                change = palette.yoruDiffChange,
                text   = palette.yoruDiffText,
            },
            diag = {
                ok      = palette.yoruString,
                error   = palette.yoruError,
                warning = palette.yoruWarn,
                info    = palette.yoruInfo,
                hint    = palette.yoruHint,
            },
            term = {
                palette.yoruBg0, -- black
                palette.yoruBuiltin, -- red
                palette.yoruString, -- green
                palette.yoruOperator, -- yellow
                palette.yoruFunc, -- blue
                palette.yoruKeyword, -- magenta
                palette.yoruType, -- cyan
                palette.yoruFgDim, -- white
                palette.yoruComment, -- bright black
                palette.yoruError, -- bright red
                palette.yoruGitAdd, -- bright green
                palette.yoruField, -- bright yellow
                palette.yoruInfo, -- bright blue
                palette.yoruParam, -- bright magenta
                palette.yoruSpecial, -- bright cyan
                palette.yoruFg, -- bright white
                palette.yoruConstant, -- extended color 1
                palette.yoruError, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    kami = function(palette)
        return {
            ui = {
                fg         = palette.kamiFg,
                fg_dim     = palette.kamiFgDim,
                fg_reverse = palette.kamiBg,

                bg_dim     = palette.kamiBgM1,
                bg_gutter  = palette.kamiBg,

                bg_m3      = palette.kamiBg0,
                bg_m2      = palette.kamiBgM2,
                bg_m1      = palette.kamiBgM1,
                bg         = palette.kamiBg,
                bg_p1      = palette.kamiBgP1,
                bg_p2      = palette.kamiBgP2,

                special    = palette.kamiUiSpecial,
                nontext    = palette.kamiNontext,
                whitespace = palette.kamiNontext,

                bg_search  = palette.kamiSearch,
                bg_visual  = palette.kamiVisual,

                pmenu      = {
                    fg       = palette.kamiFg,
                    fg_sel   = "none", -- lets the item's own highlight show through
                    bg       = palette.kamiBg3,
                    bg_sel   = palette.kamiVisual,
                    bg_sbar  = palette.kamiBg3,
                    bg_thumb = palette.kamiBorder,
                },
                float      = {
                    fg        = palette.kamiFgDim,
                    bg        = palette.kamiBg0,
                    fg_border = palette.kamiBorder,
                    bg_border = palette.kamiBg0,
                },
            },
            syn = {
                string     = palette.kamiString,
                variable   = "none",
                number     = palette.kamiNumber,
                constant   = palette.kamiConstant,
                identifier = palette.kamiField,
                parameter  = palette.kamiParam,
                fun        = palette.kamiFunc,
                statement  = palette.kamiKeyword,
                keyword    = palette.kamiKeyword,
                operator   = palette.kamiOperator,
                preproc    = palette.kamiBuiltin,
                type       = palette.kamiType,
                regex      = palette.kamiOperator,
                deprecated = palette.kamiComment,
                comment    = palette.kamiComment,
                punct      = palette.kamiPunct,
                special1   = palette.kamiSpecial,
                special2   = palette.kamiBuiltin,
                special3   = palette.kamiBuiltin,
            },
            vcs = {
                added   = palette.kamiGitAdd,
                removed = palette.kamiGitDelete,
                changed = palette.kamiGitChange,
            },
            diff = {
                add    = palette.kamiDiffAdd,
                delete = palette.kamiDiffDelete,
                change = palette.kamiDiffChange,
                text   = palette.kamiDiffText,
            },
            diag = {
                ok      = palette.kamiString,
                error   = palette.kamiError,
                warning = palette.kamiWarn,
                info    = palette.kamiInfo,
                hint    = palette.kamiHint,
            },
            term = {
                palette.kamiFg, -- black
                palette.kamiBuiltin, -- red
                palette.kamiString, -- green
                palette.kamiOperator, -- yellow
                palette.kamiFunc, -- blue
                palette.kamiKeyword, -- magenta
                palette.kamiType, -- cyan
                palette.kamiBgP2, -- white
                palette.kamiComment, -- bright black
                palette.kamiError, -- bright red
                palette.kamiGitAdd, -- bright green
                palette.kamiField, -- bright yellow
                palette.kamiInfo, -- bright blue
                palette.kamiParam, -- bright magenta
                palette.kamiSpecial, -- bright cyan
                palette.kamiBg0, -- bright white
                palette.kamiConstant, -- extended color 1
                palette.kamiError, -- extended color 2
            },
        }
    end,
}
