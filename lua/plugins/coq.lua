return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	dependencies = {
		{"ms-jpq/coq.artifacts", branch = "artifacts"},
		{"ms-jpq/coq.thirdparty", branch = "3p"}
	},
	config = function()
		vim.g.coq_settings = {
			auto_start = "shut-up",
		}
		require("coq")
	end,
	build = ":COQdeps",
	event = "VeryLazy",
        cond = false
}
