#!/usr/bin/scripter

(defn trans-power
  [s]
  (let [tx-pwr (->> s
                    (re-find #"(?m)Tx-Power=(.*?)\s")
                    second)]
    (if (= "off" tx-pwr)
      0
      (Integer/parseInt tx-pwr))))

(defn link-quality
  [s]
  (let [[_ n d] (re-find #"Link Quality=(\d+)/(\d+)"
                         s)]
    (if (and n d)
         (* 1.0 (/ (Integer/parseInt n)
                   (Integer/parseInt d)))
         0)))

(defn parse-name
  [s]
  (->> s
       (re-find #"ESSID:\"(.*?)\"")
       second))

(p (let [raw (s iwconfig wlp1s0)
         tx (trans-power raw)
         lq (int (* 10 (link-quality raw)))
         id (parse-name raw)]
     (cond
       (= 0 tx) "wireless off"
       (nil? id) "no connection :("
       :else (format "%s%s %s"
                     (clojure.string/join (repeat lq "|"))
                     (clojure.string/join (repeat (- 10 lq) "\\"))
                     id))))
