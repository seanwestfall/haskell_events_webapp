{-# LANGUAGE OverloadedStrings #-}
module Handler.Html where

import Import
import Network.Wai           (pathInfo, rawPathInfo, requestMethod, responseLBS)
import Data.Text             (Text)
import Text.Blaze            (preEscapedText)
import qualified Data.Text.IO as T
import qualified Data.Text as S

getHtmlR :: Text -> Handler Html
getHtmlR title = do
    {-req <- waiRequest-}
    let temp = "templates/html/" ++ (S.unpack title) ++ ".html"
    snippet <- liftIO $ T.readFile temp
    defaultLayout [whamlet|#{preEscapedText snippet}|]
