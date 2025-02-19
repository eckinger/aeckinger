module Web.View.Static.Welcome where

import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <div class="min-h-screen flex flex-col items-center">

            <h1 class="text-4xl font-bold mb-5 mt-40 text-center">
                <span class="text-highlight">Alexander Eckinger</span> here. Check out my
            </h1>

            <div class="flex flex-col items-center space-y-5">

                <a class="relative" href={PhotosAction}>
                    <span class={buttonShadowClasses}></span>
                    <span class={buttonBorderClasses}>Photography</span>
                </a>

                <a class="relative" href="https://www.goodreads.com/eckinger">
                    <span class={buttonShadowClasses}></span>
                    <span class={buttonBorderClasses}>Reading</span>
                </a>

                <a class="relative" href={PhotosAction}>
                    <span class={buttonShadowClasses}></span>
                    <span class={buttonBorderClasses}>Writing</span>
                </a>

                <a class="relative" href={PhotosAction}>
                    <span class={buttonShadowClasses}></span>
                    <span class={buttonBorderClasses}>Work</span>
                </a>
            </div>

        </div>
|]

-- https://tailwindflex.com/@leon-bachmann/elevated-button
buttonShadowClasses :: Text
buttonShadowClasses = "absolute top-0 left-0 mt-1 ml-1 h-full w-full rounded bg-black"

buttonBorderClasses :: Text
buttonBorderClasses = "fold-bold relative inline-block h-full w-full rounded border-2 border-black bg-white px-3 py-1 text-base font-bold text-black transition duration-100 hover:bg-yellow-400 hover:text-gray-900"
