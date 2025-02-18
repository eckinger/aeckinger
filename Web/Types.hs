module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data PhotosController
    = PhotosAction
    | NewPhotoAction
    | ShowPhotoAction { photoId :: !(Id Photo) }
    | CreatePhotoAction
    | EditPhotoAction { photoId :: !(Id Photo) }
    | UpdatePhotoAction { photoId :: !(Id Photo) }
    | DeletePhotoAction { photoId :: !(Id Photo) }
    deriving (Eq, Show, Data)
