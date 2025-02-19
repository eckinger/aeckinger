module Test.Controller.PhotosSpec where

import Network.HTTP.Types.Status

import IHP.Prelude
import IHP.QueryBuilder (query)
import IHP.Test.Mocking
import IHP.Fetch

import IHP.FrameworkConfig
import IHP.HaskellSupport
import Test.Hspec
import Config

import Generated.Types
import Web.Routes
import Web.Types
import Web.Controller.Photos ()
import Web.FrontController ()
import Network.Wai
import IHP.ControllerPrelude

tests :: Spec
tests = undefined -- aroundAll (withIHPApp WebApplication config) do

