return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        require("luasnip/loaders/from_vscode").lazy_load()

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local select_opts = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                -- Overriden by my input source switch shortcut
                -- ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    -- behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<C-f>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-b>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp_signature_help" },
                { name = "path" },
                { name = "nvim_lsp", keyword_length = 1 },
                { name = "buffer", keyword_length = 3 },
                { name = "luasnip", keyword_length = 2 },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { "menu", "abbr", "kind" },
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = "lsp",
                        luasnip = "snip",
                        buffer = "buf",
                        path = "path",
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
        })
    end,
}
