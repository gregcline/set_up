(module config.plugin.spaceline
  {autoload {gl galaxyline
             a aniseed.core
             nvim aniseed.nvim
             condition galaxyline.condition}})

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

(def- left-elements
  [
   {:ViMode
    {:provider (fn []
                 (let [alias {:n   :NORMAL
                              :no  :NORMAL
                              :i   :INSERT
                              :ic  :INSERT
                              :c   :COMMAND
                              :ce  :COMMAND
                              :cv  :COMMAND
                              :v   :VISUAL
                              :V   "VISUAL LINE"
                              "" "VISUAL BLOCK"
                              :R   :REPLACE
                              "r?" :REPLACE
                              :Rv  :REPLACE
                              :r   :REPLACE
                              :rm  :REPLACE
                              :s   :SELECT
                              :S   :SELECT
                              :t   :TERMINAL}]
                   (.. "  " (a.get alias (nvim.fn.mode)) " ")))
     :separator_highlight [colors.purple (fn []
                                           (if (not (condition.buffer_not_empty))
                                             colors.purple
                                             colors.darkblue))]
     :highlight [colors.darkblue colors.purple :bold]}}
   {:FileIcon
    {:provider [(fn [] "  ") :FileIcon]
     :condition condition.buffer_not_empty
     :highlight [(a.get (require :galaxyline.provider_fileinfo) :get_file_icon_color) colors.darkblue]}}
   {:FileName
    {:provider [:FileName]
     :condition condition.buffer_not_empty
     :separator_highlight [colors.purple colors.darkblue]
     :highlight [colors.magenta colors.darkblue]}}
   {:GitIcon
    {:provider (fn [] "   ")
     :condition condition.buffer_not_empty
     :highlight [colors.orange colors.purple]}}
   {:GitBranch
    {:provider [:GitBranch (fn [] " ")]
     :condition condition.buffer_not_empty
     :highlight [colors.grey colors.purple]}}
   {:DiffAdd
    {:provider :DiffAdd
     :condition condition.checkwidth
     :icon "  "
     :highlight [colors.green colors.purple]}}
   {:DiffModified
    {:provider :DiffModified
     :condition condition.checkwidth
     :icon " "
     :highlight [colors.orange colors.purple]}}
   {:DiffRemove
    {:provider :DiffRemove
     :condition condition.checkwidth
     :icon " "
     :highlight [colors.red colors.purple]}}
   {:DiagnosticError
    {:provider :DiagnosticError
     :icon "   "
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
    {:provider [(fn [] " ") :LinePercent]
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
