module Library
    ( cond
    ) where

-- LISP style function cond
cond :: [(Bool, a)] -> a
cond [] = error "Non-exhaustive conditions. At least 1 condition must be true."
cond (x:xs) = if fst x then snd x else cond xs
