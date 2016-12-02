module Models exposing (..)

import Tags.Models exposing (Tag, new)
import Routing


type alias Model =
    { tags : List Tag
    , newTag: Tag
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { tags = []
    , newTag = new
    , route = route
    }
