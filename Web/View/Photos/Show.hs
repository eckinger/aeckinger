module Web.View.Photos.Show where
import Web.View.Prelude

data ShowView = ShowView { photo :: Photo }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Photo</h1>
        <p>{photo}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Photos" PhotosAction
                            , breadcrumbText "Show Photo"
                            ]
