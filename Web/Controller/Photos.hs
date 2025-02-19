module Web.Controller.Photos where

import Web.Controller.Prelude
import Web.View.Photos.Index
import Web.View.Photos.New
import Web.View.Photos.Edit
import Web.View.Photos.Show
import Web.View.Layout

instance Controller PhotosController where
    beforeAction = do
        setLayout defaultLayout

    action PhotosAction = do
        photos <- query @Photo |> fetch
        render IndexView { .. }

    action NewPhotoAction = do
        let photo = newRecord
        render NewView { .. }

    action ShowPhotoAction { photoId } = do
        photo <- fetch photoId
        render ShowView { .. }

    action EditPhotoAction { photoId } = do
        photo <- fetch photoId
        render EditView { .. }

    action UpdatePhotoAction { photoId } = do
        photo <- fetch photoId
        photo
            |> buildPhoto
            |> ifValid \case
                Left photo -> render EditView { .. }
                Right photo -> do
                    photo <- photo |> updateRecord
                    setSuccessMessage "Photo updated"
                    redirectTo EditPhotoAction { .. }

    action CreatePhotoAction = do
        let photo = newRecord @Photo
        photo
            |> buildPhoto
            |> ifValid \case
                Left photo -> render NewView { .. } 
                Right photo -> do
                    photo <- photo |> createRecord
                    setSuccessMessage "Photo created"
                    redirectTo PhotosAction

    action DeletePhotoAction { photoId } = do
        photo <- fetch photoId
        deleteRecord photo
        setSuccessMessage "Photo deleted"
        redirectTo PhotosAction

buildPhoto photo = photo
    |> fill @'["image", "caption"]
