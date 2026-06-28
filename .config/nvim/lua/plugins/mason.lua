return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.registries = {
      "github:Crashdummyy/mason-registry",
      "github:mason-org/mason-registry",
    }
  end,
}