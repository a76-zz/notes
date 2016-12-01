module Tags.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Tags.Models exposing (Tag)
import Tags.Messages exposing (..)


view : List Tag -> Html Msg
view tags =
    div []
        [ list tags ]

list : List Tag -> Html Msg
list tags =
    ul []
      ( List.map tag tags )

tag : Tag -> Html Msg
tag item =
    li [] [ a [ href ( "#/tags/" ++ item.id ) ] [ text item.id ] ]
