(benchmark max
:logic QF_LIA
:extrafuns ((a Int) (b Int) (max Int Int Int))
:assumption (implies (>= a (+ b 1)) (= (max a b) a))
:assumption (implies (< a (+ b 1)) (= (max a b) b))
:formula (not (and (implies (> a b) (= (max a b) a))
                   (implies (< a b) (= (max a b) b))
                   (implies (= a b) (= (max a b) b))))
)
