{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -Wall #-}

module MF where

import Data.Functor.Identity (Identity)

pattern P :: a -> a
pattern P x = x
{-# complete P :: () #-}

-- GHC doesn't compile my code complaining about a missing MonadFail instance
-- for Identity
foo :: Identity ()
foo = do
  P  _ <- pure ()
  pure ()

-- No warning in here as instructed
bar :: ()
bar = case () of
  P _ -> ()
