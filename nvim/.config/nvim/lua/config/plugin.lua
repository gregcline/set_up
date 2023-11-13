local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin.fnl"
local _2amodule_name_2a = "config.plugin"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, nvim, packer, util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer"), autoload("config.util")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["packer"] = packer
_2amodule_locals_2a["util"] = util
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("config.plugin." .. name))
  if not ok_3f then
    return print(("config error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  local pkgs = {...}
  local function _2_(use0)
    for i = 1, a.count(pkgs), 2 do
      local name = pkgs[i]
      local opts = pkgs[(i + 1)]
      do
        local _3_ = opts.mod
        if (nil ~= _3_) then
          safe_require_plugin_config(_3_)
        else
        end
      end
      use0(a.assoc(opts, 1, name))
    end
    return nil
  end
  return packer.startup(_2_)
end
_2amodule_locals_2a["use"] = use
use("wbthomason/packer.nvim", {}, "Olical/aniseed", {branch = "develop"}, "Olical/conjure", {branch = "master", mod = "conjure"}, "mhanberg/elixir.nvim", {requires = {"nvim-lua/plenary.nvim"}, mod = "elixir"}, "nvim-telescope/telescope.nvim", {requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, mod = "telescope"}, "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "williamboman/mason.nvim", {}, "williamboman/mason-lspconfig.nvim", {}, "mhartington/formatter.nvim", {mod = "formatter"}, "mfussenegger/nvim-lint", {mod = "linter"}, "mfussenegger/nvim-dap", {mod = "nvim_dap"}, "theHamsta/nvim-dap-virtual-text", {requires = {"mfussenegger/nvim-dap"}}, "rcarriga/nvim-dap-ui", {requires = {"mfussenegger/nvim-dap"}}, "mxsdev/nvim-dap-vscode-js", {requires = {"mfussenegger/nvim-dap"}}, "microsoft/vscode-js-debug", {opt = true, tag = "v1.75.1", run = "npm install --legacy-peer-deps && npm run compile"}, "neovim/nvim-lspconfig", {mod = "lspconfig"}, "hrsh7th/nvim-cmp", {requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure"}, mod = "cmp"}, "nvim-neotest/neotest", {requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim", "haydenmeade/neotest-jest"}, tag = "v2.6.4", mod = "neotest"}, "marko-cerovac/material.nvim", {mod = "theme"}, "eraserhd/parinfer-rust", {run = "cargo build --release"}, "ggandor/leap.nvim", {mod = "lightspeed"}, "ggandor/flit.nvim", {requires = {"ggandor/leap.nvim"}}, "tpope/vim-surround", {}, "tpope/vim-repeat", {}, "b3nj5m1n/kommentary", {mod = "kommentary"}, "sindrets/diffview.nvim", {}, "lewis6991/gitsigns.nvim", {requires = {"nvim-lua/plenary.nvim"}, mod = "gitsigns"}, "tpope/vim-fugitive", {}, "tpope/vim-rhubarb", {}, "lukas-reineke/indent-blankline.nvim", {mod = "indent_blankline"}, "glepnir/galaxyline.nvim", {requires = {"kyazdani42/nvim-web-devicons"}, config = require("config.plugin.spaceline")}, "glepnir/lspsaga.nvim", {requires = {"neovim/nvim-lspconfig"}, branch = "main"})
return _2amodule_2a