module Web.View.Photos.Edit where
import Web.View.Prelude

data EditView = EditView { photo :: Photo }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Photo</h1>
        {renderForm photo}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Photos" PhotosAction
                , breadcrumbText "Edit Photo"
                ]

renderForm :: Photo -> Html
renderForm photo = formFor photo [hsx|
    {(textField #image)}
    {(textField #caption)}
    {submitButton}

|]