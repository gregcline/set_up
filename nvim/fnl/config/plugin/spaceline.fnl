(module config.plugin.spaceline
  {autoload {gl galaxyline
             a aniseed.core
             nvim aniseed.nvim}})

(def- gls gl.section)

(def- colors
  {:bg :#282c34
   :yellow :#fabd2f
   :cyan :#008080
   :darkblue :#081633
   :green :#afd700
   :orange :#FF8800
   :purple :#5d4d7a
   :magenta :#d16d9e
   :grey :#c0c0c0
   :blue :#0087d7
   :red :#ec5f67})

(defn- buffer-not-empty []
  (= 1 (nvim.fn.empty (nvim.fn.expand "%:t"))))

(defn- checkwidth []
  (let [squeeze-width (/ (nvim.fn.winwidth 0) 2)]
    (> squeeze-width 40)))

(def- left-elements
  [{:FirstElement
    {:provider (fn [] "▋")
     :highlight [colors.blue colors.yellow]}}
   {:ViMode
    {:provider (fn []
                 (let [alias {:n :NORMAL
                              :i :INSERT
                              :c :COMMAND
                              :v :VISUAL
                              :V "VISUAL LINE"
                              "" "VISUAL BLOCK"}]
                   (a.get alias (nvim.fn.mode))))
     :separator ""
     :separator_highlight [colors.purple (fn []
                                           (if (not (buffer-not-empty))
                                             colors.purple
                                             colors.darkblue))]
     :highlight [colors.darkblue colors.purple :bold]}}
   {:FileIcon
    {:provider :FileIcon
     :condition buffer-not-empty
     :highlight [(a.get (require :galaxyline.provider_fileinfo) :get_file_icon_color colors.darkblue)]}}
   {:FileName
    {:provider [:FileName :FileSize]
     :condition buffer-not-empty
     :separator ""
     :separator_highlight [colors.purple colors.darkblue]
     :highlight [colors.magenta colors.darkblue]}}
   {:GitIcon
    {:provider (fn [] "  ")
     :condition buffer-not-empty
     :highlight [colors.orange colors.purple]}}
   {:GitBranch
    {:provider :GitBranch
     :condition buffer-not-empty
     :highlight [colors.grey colors.purple]}}
   {:DiffAdd
    {:provider :DiffAdd
     :condition checkwidth
     :icon " "
     :highlight [colors.green colors.purple]}}
   {:DiffModified
    {:provider :DiffModified
     :condition checkwidth
     :icon " "
     :highlight [colors.orange colors.purple]}}
   {:DiffRemove
    {:provider :DiffRemove
     :condition checkwidth
     :icon " "
     :highlight [colors.red colors.purple]}}
   {:LeftEnd
    {:provider (fn [] "")
     :separator ""
     :separator_highlight [colors.purple colors.bg]
     :highlight [colors.purple colors.purple]}}
   {:DiagnosticError
    {:provider :DiagnosticError
     :icon "  "
     :highlight [colors.red colors.bg]}}
   {:Space {:provider (fn [] " ")}}
   {:DiagnosticWarn
    {:provider :DiagnosticWarn
     :icon "  "
     :highlight [colors.blue colors.bg]}}])

(def- right-elements
  [{:FileFormat
    {:provider :FileFormat
     :separator ""
     :separator_highlight [colors.bg colors.purple]
     :highlight [colors.grey colors.purple]}}
   {:LineInfo
    {:provider :LineColumn
     :separator " | "
     :separator_highlight [colors.darkblue colors.purple]
     :highlight [colors.grey colors.purple]}}
   {:PerCent
    {:provider :LinePercent
     :separator ""
     :separator_highlight [colors.darkblue colors.purple]
     :highlight [colors.grey colors.darkblue]}}
   {:ScrollBar
    {:provider :ScrollBar
     :highlight [colors.yellow colors.purple]}}])


(defn- add-elements [section elements]
  "Loops through a set of elements and adds them to the section"
  (each [i element (pairs elements)]
    (a.assoc section i element)))

(add-elements gls.left left-elements)
(add-elements gls.right right-elements)
