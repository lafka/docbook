# Notes on clojure

## Collections
+ Lists can be either a linked list or vector
 + Vectors are not seq (seq? _)
 + (range ..) << creates a list
 + [] denotes vectors, '() denotes lists
 + (const E L) adds new head to list/vector
  + (conj V E) append to vector
  + (conj L E) prepend to list
 + (concat A B), concats lists | vector
 + List funs: (map F, C), (filter F, C), (reduce F, C) | (reduce F Acc C)

## Funs

+ (fn [] 'i'm-a-fun)
 + (def f (fn [] 'i'm-a-fun))
 + (defn f [] 'i'm-a-fun)
 + (def f #(str "Hello, " %1)) = (defn f [n] (str "Hello, " n))
+ variadic fun + pattern match: (defn h ([] "You don't exist") ([n] (str "Hello, " n)))
+ 'packed arguments' aka tail deconstruction: (defn cc [h & t] (reduce str t))

## Maps
+ Hash maps vs array maps
 + Hash maps are faster, array maps preserve key order
 + Array maps will be converted to hash maps if they get big
 + Can use any type for key, should use keyword `(class :a)`
+ `(class {:a 1, :b 2})` vs `(class (hash-map :a 1 :b 2))`
+ Maps are funs: `({:a 1, :b 2} :b)` OR `(:b {:a 1, :b 2})`
+ Set/delete values with: `(assoc M :k 'val)` / `(dissoc M k ..)`
+ Nil values exists `({} :k) => nil`

## Sets
+ Create: `#{1 2 3}` or from vector: `(set [1 2 3 4 5])`
 + `(conj #{} 1) => #{1}` `(disj #{1} 1) => #{}`
 + Check existence: `(#{1} 1) => 1` `(#{} 1) => nil`

## Constructs
+ If are macros: `(if false "a" "b") => "b"`, `(if false "a") => b`
+ Temporary bindings: `(let [a 1 b 2] (+ a b)) => 3`
+ Group statements: `(do (print "a") "b")`; funs and let add `(do ..)` implicitly

## Namespace/modules
+ import with `(use 'ns)` or `(use '[ns :only [fun]])` or (require 'ns)`
+ rename on import: `(do (require '[clojure.string :as str]) (str/replace ...))`
+ call with `/`: `(clojure.string/blank? "") => true`
@todo difference betwen require and use
