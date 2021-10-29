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
  ;file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}
  ;parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  ;lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :kabouzeid/nvim-lspinstall {:mod :lsp_install}
  ;autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  ;theme
  :marko-cerovac/material.nvim {:mod :theme}
  ;parinfer
  :eraserhd/parinfer-rust {:run "cargo build --release"}
  ;navigation
  :phaazon/hop.nvim {:mod :hop}
  ;util
  :tpope/vim-surround {}
  :b3nj5m1n/kommentary {:mod :kommentary}
  ; Currently broken?
  ; :TimUntersberger/neogit {:requires [:nvim-lua/plenary.nvim]
  ;                          :mod :neogit})
  :lewis6991/gitsigns.nvim {:requires [:nvim-lua/plenary.nvim]
                            :mod :gitsigns}
  :lukas-reineke/indent-blankline.nvim {:mod :indent_blankline}
  :glepnir/galaxyline.nvim {:requires [:kyazdani42/nvim-web-devicons]
                            :config (require :config.plugin.spaceline)}
  ; TS
  :jose-elias-alvarez/nvim-lsp-ts-utils {:requires [:neovim/nvim-lspconfig
                                                    :nvim-lua/plenary.nvim
                                                    :jose-elias-alvarez/null-ls.nvim]}) ; Configure as part of LSP
