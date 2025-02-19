module Web.View.Photos.Index where
import Web.View.Prelude

data IndexView = IndexView { photos :: [Photo] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewPhotoAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach photos renderPhoto}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Photos" PhotosAction
                ]

renderPhoto :: Photo -> Html
renderPhoto photo = [hsx|
    <tr>
        <td>{photo}</td>
        <td><a href={ShowPhotoAction photo.id}>Show</a></td>
        <td><a href={EditPhotoAction photo.id} class="text-muted">Edit</a></td>
        <td><a href={DeletePhotoAction photo.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]