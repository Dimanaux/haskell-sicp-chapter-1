module Library
    (
      cond
    ) where

{- LISP style function cond
-}
cond :: [(Bool, a)] -> a
cond [] = error "non-exhaustive conditions"
cond (x:xs) = if fst x then snd x else cond xs


