(declare-fun MAX_PACKET () Int)
(declare-fun PACKET_SIZE () Int)
(declare-fun buffer (Int) Int)

(declare-fun multi_array (Int Int) Int)

(define-fun _max ((x Int) (y Int)) Int (ite (>= x y) x y))

(assert
(exists ( (K_02_1 Int) )
        (and (>= K_02_1 0)
             (forall ( (T_02_1 Int) )
                     (=> (and (>= T_02_1 0)
                              (< T_02_1 K_02_1))
                         (and (< T_02_1 MAX_PACKET)
                              (exists ( (K_05_1 Int) )
                                      (and (>= K_05_1 0)
                                           (forall ( (T_05_1 Int) )
                                                   (=> (and (>= T_05_1 0)
                                                            (< T_05_1 K_05_1))
                                                       (< T_05_1 PACKET_SIZE)))
                                           (>= K_05_1 PACKET_SIZE))))))
             (>= K_02_1 MAX_PACKET)
             (<= (buffer 0) MAX_PACKET)
             (>= (buffer 0) 0)
             (exists ( (K_16_1 Int) )
                     (and (>= K_16_1 0)
                          (forall ( (T_16_1 Int) )
                                  (=> (and (>= T_16_1 0)
                                           (< T_16_1 K_16_1))
                                      (and (< T_16_1 (buffer 0))
                                           (< (buffer (+ (* T_16_1 (+ PACKET_SIZE 1)) 1)) MAX_PACKET)
                                           (>= (buffer (+ (* T_16_1 (+ PACKET_SIZE 1)) 1)) 0)
                                           (exists ( (K_22_1 Int) )
                                                   (and (>= K_22_1 0)
                                                        (forall ( (T_22_1 Int) )
                                                                (=> (and (>= T_22_1 0)
                                                                         (< T_22_1 K_22_1))
                                                                    (< T_22_1 PACKET_SIZE)))
                                                        (>= K_22_1 PACKET_SIZE))))))
                          (>= K_16_1 (buffer 0))
                          (< (buffer 0) MAX_PACKET)
                          (not (=   (ite (exists ( (t1 Int) (t Int) )
                                               (and (= (buffer 0) (buffer (+ (* (+ t 0) (+ PACKET_SIZE 1)) 1)))
                                                    (= 0 t1)
                                                    (<= 0 t1)
                                                    (<= 0 t)
                                                    (<= t1 (_max 0 PACKET_SIZE))
                                                    (<= t K_02_1)
                                                    (< (+ t1 t) (+ (_max 0 PACKET_SIZE) K_02_1))
                                                    (forall ( (tt1 Int) (tt Int) )
                                                            (=> (and (<= t1 tt1)
                                                                     (<= t tt)
                                                                     (< (+ t1 t) (+ tt1 tt))
                                                                     (<= tt1 (_max 0 PACKET_SIZE))
                                                                     (<= tt K_02_1)
                                                                     (< (+ tt1 tt) (+ (_max 0 PACKET_SIZE) K_02_1)))
                                                                (or (not (= (buffer 0) (buffer (+ (* (+ tt 0) (+ PACKET_SIZE 1)) 1))))
                                                                    (not (= 0 tt1)))))))
                                         (buffer (+ (* (buffer 0) (+ PACKET_SIZE 1)) 2))
                                         (multi_array (buffer 0) 0))
                                    0))
                          (> PACKET_SIZE 20))))) )


(check-sat-using (then nnf der minimize_bounded_quantifiers expand_bounded_quantifiers smt))
; (check-sat)
; (get-model)