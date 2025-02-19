module Web.View.Layout (defaultLayout, photoBackgroundLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes
import Application.Helper.View
import Control.Lens (none)

defaultLayout :: Html -> Html
defaultLayout inner = [hsx|
<!DOCTYPE html>
<html lang="en">
    <head>
        {metaTags}
        {stylesheets}
        {scripts}

        <title>{pageTitleOrDefault "App"}</title>
    </head>
    <body>
        <div class="container mt-4">
            {renderFlashMessages}
            {inner}
        </div>
    </body>
</html>
|]

photoBackgroundLayout :: Html -> Html
photoBackgroundLayout inner = [hsx|
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            body {
                background-image: url("/photo_background.webp");
                background-size: cover;
                background-position: center;
            }
        </style>
        {metaTags}
        {stylesheets}
        {scripts}
    </head>
    <body>
        {renderFlashMessages}
        {inner}
        
        <!-- photo_background Caption -->
        <div class="flex gap-5 fixed bottom-4 left-4">
            <a href="https://www.alltrails.com/trail/us/arizona/scholz-lake">
                <span class={captionShadowClasses}></span>
                <span class={captionBorderClasses}>Scholz Lake, Flagstaff</span>
            </a>
        </div> 
    </body>
</html>
|]

-- https://tailwindflex.com/@leon-bachmann/elevated-button
captionShadowClasses :: Text
captionShadowClasses = "absolute top-0 left-0 mt-1 ml-1 h-full w-full rounded bg-black"

captionBorderClasses :: Text
captionBorderClasses = "fold-bold relative inline-block h-full w-full rounded border-2 border-black bg-white px-3 py-1 text-xs font-bold text-black transition duration-100 hover:bg-yellow-400 hover:text-gray-900"

-- The 'assetPath' function used below appends a `?v=SOME_VERSION` to the static assets in production
-- This is useful to avoid users having old CSS and JS files in their browser cache once a new version is deployed
-- See https://ihp.digitallyinduced.com/Guide/assets.html for more details

stylesheets :: Html
stylesheets = [hsx|
        <link rel="stylesheet" href={assetPath "/vendor/flatpickr.min.css"}/>
        <link rel="stylesheet" href={assetPath "/app.css"}/>
    |]

scripts :: Html
scripts = [hsx|
        {when isDevelopment devScripts}
        <script src={assetPath "/vendor/jquery-3.6.0.slim.min.js"}></script>
        <script src={assetPath "/vendor/timeago.js"}></script>
        <script src={assetPath "/vendor/flatpickr.js"}></script>
        <script src={assetPath "/vendor/morphdom-umd.min.js"}></script>
        <script src={assetPath "/vendor/turbolinks.js"}></script>
        <script src={assetPath "/vendor/turbolinksInstantClick.js"}></script>
        <script src={assetPath "/vendor/turbolinksMorphdom.js"}></script>
        <script src={assetPath "/helpers.js"}></script>
        <script src={assetPath "/ihp-auto-refresh.js"}></script>
        <script src={assetPath "/app.js"}></script>
    |]

devScripts :: Html
devScripts = [hsx|
        <script id="livereload-script" src={assetPath "/livereload.js"} data-ws={liveReloadWebsocketUrl}></script>
    |]

metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
    {autoRefreshMeta}
|]
