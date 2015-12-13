(benchmark max
:logic QF_BV
:extrafuns ((a BitVec[32]) (b BitVec[32])
            (max BitVec[32] BitVec[32] BitVec[32]))
:assumption (implies (bvsge a (bvadd b (zero_extend[31] bit1)))
                     (= (max a b) a))
:assumption (implies (bvslt a (bvadd b (zero_extend[31] bit1)))
                     (= (max a b) b))
:formula (not (and (implies (bvsgt a b) (= (max a b) a))
                   (implies (bvslt a b) (= (max a b) b))
                   (implies (= a b) (= (max a b) b))))
)
