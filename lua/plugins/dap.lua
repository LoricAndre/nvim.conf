return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui"
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
	keys = {
		{"<leader>db", function() require("dap").toggle_breakpoint() end, desc = "[DBG] Toggle Breakpoint"},
		{"<leader>dc", function() require("dap").continue() end, desc = "[DBG] Continue"},
		{"<leader>dd", function() require("dapui").toggle() end, desc = "[DBG] Toggle UI"},
		{"<leader>dx", function() require("dapui").eval() end, {"n", "v"}, desc = "[DBG] Eval Code"}
	}
}
