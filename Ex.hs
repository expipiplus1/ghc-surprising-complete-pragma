{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -Wall #-}

module Ex where

-- A pattern without a complete pragma
pattern P :: a -> a
pattern P x = x

foo :: ()
foo = case () of -- GHC warns: Pattern match(es) are non-exhaustive...
  P _ -> ()

bar :: ()
bar = case ((), "") of -- No warning here when Q has the complete pragma
  P ((), "hello") -> ()
  -- Yikes!

pattern Q :: a -> a
pattern Q x = x
{-# complete Q :: (,) #-} -- What does (,) mean here?

baz :: ()
baz = case ((), "") of -- As instructed, this is not warned
  Q ((), "hello") -> ()

