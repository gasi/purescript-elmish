-- | Extras for `React` module. Recommended usage:
-- |
-- |     import Elmish.React.DOM as R
-- |     import Elmish.React.Extra as R
-- |
module Elmish.React.Extra
    ( if'
    , maybe
    ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Maybe as Maybe
import Elmish.React (ReactElement)
import Elmish.React.DOM as R


-- | Render `element` iff `shouldRender` is true.
-- |
-- | Helps avoid having to write whole `if` expressions in rendering code.
-- |
-- | For example:
-- |
-- |    if isLoggedIn
-- |      then Avatar.view { username: "jane" }
-- |      else R.empty
-- |
-- | can be written as:
-- |
-- |    R.if' isLoggedIn $
-- |      Avatar.view { username: "jane" }
-- |
if' :: Boolean -> ReactElement -> ReactElement
if' shouldRender element
  | shouldRender = element
  | otherwise = R.empty

-- | Render element based on `a` if present.
-- |
-- | Helps to avoid having to write `case` expressions in rendering code for
-- | `Maybe`s.
-- |
-- | For example:
-- |
-- |    case mUser of
-- |      Just user ->
-- |        Profile.view { user }
-- |      Nothing ->
-- |        R.empty
-- |
-- | can shortened to:
-- |
-- |    R.maybe mUser \user ->
-- |      Profile.view { user }
-- |
maybe :: forall a. Maybe a -> (a -> ReactElement) -> ReactElement
maybe a f = Maybe.maybe R.empty f a
