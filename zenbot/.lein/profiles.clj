{:user {:plugins [[cider/cider-nrepl "0.9.1"]
                  [refactor-nrepl "1.0.5"]]
        :dependencies [[spyscope "0.1.5"]
                       [org.clojure/tools.nrepl "0.2.9"]
                       [com.billpiel.sayid "0.0.1"]]
        :injections [(require 'spyscope.core)]
        :repl-options {:init (do (ns -)
                                 (def p clojure.pprint/pprint))
                       :timeout 120000}}}
