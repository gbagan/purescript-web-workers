module Web.Worker.GlobalScope
  ( close
  , location
  , navigator
  , onError
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  ) where

import Prelude
import Effect (Effect)
import Web.Worker.Navigator (Navigator)
import Web.Worker.Location (Location)
import Web.Event.Event (Event)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Types (Transferable)

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

foreign import postMessageImpl :: forall msg. msg -> Array Transferable -> Effect Unit

postMessage :: forall msg. msg -> Effect Unit
postMessage msg = postMessageImpl msg []

postMessage' :: forall msg. msg -> Array Transferable -> Effect Unit
postMessage' = postMessageImpl


foreign import close :: Effect Unit

foreign import onMessage :: (MessageEvent -> Effect Unit) -> Effect Unit

foreign import onMessageError :: (MessageEvent -> Effect Unit) -> Effect Unit

foreign import onError :: (Event -> Effect Unit) -> Effect Unit
