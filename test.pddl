(   define (problem BLOCKS-4-2)
    (:STATE (clear d) (ontable c) (on b c) (holding a) (on d b))
    (:STATE (clear b) (on a d) (handempty) (ontable c) (clear a) (ontable b) (ontable d) (clear c))
    (:STATE (ontable a) (on d a) (clear b) (handempty) (ontable c) (clear c) (on b d))

)