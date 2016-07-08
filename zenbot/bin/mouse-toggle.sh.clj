#!/usr/bin/scripter

(defn mouse-on? []
  (->> (s synclient -l)
       (re-find #"TouchpadOff\s*=\s*(\d)")
       second
       (= "0")))

(defn set-mouse
  [on?]
  (s synclient (str "TouchpadOff="
                    (if on? 0 1))))

(-> (mouse-on?)
    not
    set-mouse)
