local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "eslint-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "tailwindcss-language-server",

    -- java
    "jdtls",

    -- debuggers
    "firefox-debug-adapter",
    "chrome-debug-adapter",
    "node-debug2-adapter",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- devops stuff
    "yamllint",
    "dockerfile-language-server"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
