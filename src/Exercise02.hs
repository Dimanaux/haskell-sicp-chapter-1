module Exercise02
    (
      expression
    ) where

{- Translate the following expression into prefix form
-- see it here http://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-10.html#%_sec_1.1.8
-- Exercise 1.2
-}

expression :: Fractional a => a
expression = (/) ((+) 5
                      ((+) 4
                           ((-) 2
                                ((-) 3
                                     ((+) 6
                                          ((/) 4 5))))))
                 ((*) 3
                      ((*) ((-) 6 2)
                           ((-) 2 7)))
