local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local utils = require "lspconfig/util"

local lspconfig = require "lspconfig"

local home_dir = os.getenv "HOME"
local fn = vim.fn

local is_file_exist = function(path)
  local f = io.open(path, "r")
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  local lombok_dir = home_dir .. "/.m2/repository/org/projectlombok/lombok/"
  local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
  if lombok_versions ~= nil then
    local lb_i, lb_versions = 0, {}
    for lb_version in lombok_versions:lines() do
      lb_i = lb_i + 1
      lb_versions[lb_i] = lb_version
    end
    lombok_versions:close()
    if next(lb_versions) ~= nil then
      local lombok_jar = fn.expand(string.format("%s%s/*.jar", lombok_dir, lb_versions[1]))
      if is_file_exist(lombok_jar) then
        return string.format("--jvm-arg=-javaagent:%s", lombok_jar)
      end
    end
  end
  return ""
end

local lombok_jar_path = get_lombok_javaagent()

-- if y u just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "jdtls", "pylsp", "gopls" }

for _, lsp in ipairs(servers) do
  if lsp == "jdtls" then
    -- Special configuration for jdtls
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "jdtls", lombok_jar_path },
    }
  elseif lsp == "pylsp" then
    lspconfig[lsp].setup {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 200,
            },
            flake8 = {
              maxLineLength = 200,
            },
          },
        },
      },
    }
  else
    -- Default configuration for other LSP servers
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
