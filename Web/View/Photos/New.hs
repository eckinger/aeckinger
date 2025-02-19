module Web.View.Photos.New where
import Web.View.Prelude

data NewView = NewView { photo :: Photo }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Photo</h1>
        {renderForm photo}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Photos" PhotosAction
                , breadcrumbText "New Photo"
                ]

renderForm :: Photo -> Html
renderForm photo = formFor photo [hsx|
    {(textField #image)}
    {(textField #caption)}
    {submitButton}

|]