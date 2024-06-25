return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "mfussenegger/nvim-dap-python",
            keys = {
                {
                    "<leader>dpr",
                    function()
                        require("dap-python").test_method()
                    end,
                    desc = "Test method",
                },
            },
            config = function(_, opts)
                local dap_python = require("dap-python")
                dap_python.setup("~/.pyenv/versions/3.11.3/envs/neovim-dap/bin/python")
                dap_python.test_runner = "pytest"
            end,
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio" },
            config = function(_, opts)
                -- setup dap config by VsCode launch.json file
                -- require("dap.ext.vscode").load_launchjs()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup(opts)
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open({})
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close({})
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close({})
                end
                vim.fn.sign_define(
                    "DapBreakpoint",
                    { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
                )
            end,
        },

        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            config = true,
        },
    },
    keys = {
        {
            "<leader>dbc",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Breakpoint Condition",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Continue",
        },
    },
}
