module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <div class="items-center justify-center">
            <div class="w-11/12 max-w-2xl">
                <h1 class="text-4xl font-bold mb-5 text-center">
                    Alexander Eckinger here. Check out my:
                </h1>
                <div class="flex flex-col items-center">
                    <a href={PhotosAction}>Photography</a>
                </div>
            </div>
        </div>
|]
