(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;plugins managed by packer
(use
  ;plugin Manager
  :wbthomason/packer.nvim {}
  ;nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}
  ;clojure
  :Olical/conjure {:branch :master :mod :conjure}
  ;elixir
  :mhanberg/elixir.nvim {:requires [:nvim-lua/plenary.nvim]
                         :mod :elixir}
  ;file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}
  ;parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  ;lsp
  :williamboman/mason.nvim {}
  :williamboman/mason-lspconfig.nvim {}
  :mhartington/formatter.nvim {:mod :formatter}
  :mfussenegger/nvim-lint {:mod :linter}
  :mfussenegger/nvim-dap {:mod :nvim_dap}
  :theHamsta/nvim-dap-virtual-text {:requires [:mfussenegger/nvim-dap]}
  :rcarriga/nvim-dap-ui {:requires [:mfussenegger/nvim-dap]}
  :mxsdev/nvim-dap-vscode-js {:requires [:mfussenegger/nvim-dap]}
  :microsoft/vscode-js-debug {:opt true
                              :tag :v1.75.1
                              :run "npm install --legacy-peer-deps && npm run compile"}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  ; :williamboman/nvim-lsp-installer {}
  ; :kabouzeid/nvim-lspinstall {:mod :lsp_install}
  ;autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp}

  ; testing
  :nvim-neotest/neotest {:requires [:nvim-lua/plenary.nvim
                                    :nvim-treesitter/nvim-treesitter
                                    :antoinemadec/FixCursorHold.nvim
                                    :haydenmeade/neotest-jest]
                         :tag :v2.6.4
                         :mod :neotest}

  ;theme
  :marko-cerovac/material.nvim {:mod :theme}
  ;parinfer
  :eraserhd/parinfer-rust {:run  "cargo build --release"}
  ;navigation
  ; :phaazon/hop.nvim {:mod :hop}
  ; :ggandor/lightspeed.nvim {:mod :lightspeed}
  :ggandor/leap.nvim {:mod :lightspeed}
  :ggandor/flit.nvim {:requires [:ggandor/leap.nvim]}
  ;util
  :tpope/vim-surround {}
  :tpope/vim-repeat {}
  :b3nj5m1n/kommentary {:mod :kommentary}
  :sindrets/diffview.nvim {}
  ; Currently broken?
  ; :TimUntersberger/neogit {:requires [:nvim-lua/plenary.nvim]
  ;                          :mod :neogit})
  :lewis6991/gitsigns.nvim {:requires [:nvim-lua/plenary.nvim]
                            :mod :gitsigns}
  :tpope/vim-fugitive {}
  :tpope/vim-rhubarb {}
  :lukas-reineke/indent-blankline.nvim {:mod :indent_blankline}
  :glepnir/galaxyline.nvim {:requires [:kyazdani42/nvim-web-devicons]
                            :config (require :config.plugin.spaceline)}
  :glepnir/lspsaga.nvim {:requires [:neovim/nvim-lspconfig]
                         :branch :main})
