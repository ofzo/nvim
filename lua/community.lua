-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    -- { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.pack.toml" },
    { import = "astrocommunity.pack.docker" },
    -- { import = "astrocommunity.pack.go" },
    -- { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.markdown" },
    -- { import = "astrocommunity.pack.python" },
    -- { import = "astrocommunity.pack.thrift" },
    -- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
    -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
    -- { import = "astrocommunity.diagnostics.error-lens-nvim" },
    -- { import = "astrocommunity.git.diffview-nvim" },
    -- { import = "astrocommunity.git.fugit2-nvim" },
    -- { import = "astrocommunity.completion.tabnine-nvim" },
    -- { import = "astrocommunity.completion.mini-completion" },
    -- { import = "astrocommunity.lsp.lsp-lens-nvim" },
    -- { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
    -- { import = "astrocommunity.lsp.lsp-signature-nvim" },
    -- import/override with your plugins folder
}
