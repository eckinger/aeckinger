module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout, photoBackgroundLayout)

-- Controller Imports
import Web.Controller.Photos
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @PhotosController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout photoBackgroundLayout
        initAutoRefresh
