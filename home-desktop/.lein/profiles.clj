{:user {:plugins [[cider/cider-nrepl "0.9.1"]
                  [refactor-nrepl "1.0.5"]]
        :dependencies [[spyscope "0.1.5"]
                       [org.clojure/tools.nrepl "0.2.9"]
                       [org.clojure/tools.trace "0.7.7-BILL-SNAPSHOT"]]
        :injections [(require 'spyscope.core)]}}
