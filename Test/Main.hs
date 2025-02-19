module Main where

import Test.Hspec
import IHP.Prelude

import Test.Controller.PhotosSpec

main :: IO ()
main = hspec do
    Test.Controller.PhotosSpec.tests
