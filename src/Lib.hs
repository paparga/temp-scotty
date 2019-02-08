module Lib
    ( server
    ) where

import Protolude hiding (get)
import Web.Scotty
import Control.Monad.IO.Class



printReq app req sendReponse = do
    print req
    app req sendReponse

helloByName = do
    name <- param "name"
    liftIO $ putText "Hola"
    html $ "Hola " <> name <> " , cómo estás?"


server = scotty 3000 $ do 
    middleware printReq
    get "/" $ html "Hola, hola!"
    get "/chao" $ html "chao!" 
    get "/:name/saluda" helloByName
