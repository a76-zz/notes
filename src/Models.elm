module Models exposing (..)

import Tags.Models exposing (Tag)
import Routing


type alias Model =
    { tags : List Tag
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { tags = []
    , route = route
    }
