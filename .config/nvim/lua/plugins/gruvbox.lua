return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local gruvbox = require("gruvbox")

        gruvbox.setup({
            undercurl = true,
            underline = true,
            bold = false,
            --[[ 
            italic = {
                strings = true,
                comments = true,
                operators = false,
                folds = true,
            },
            ]]
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "hard",
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            -- transparent_mode = true,
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
