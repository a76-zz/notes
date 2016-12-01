module Tags.Edit exposing (..)

import Html exposing (Html, div, text)
import Tags.Models exposing (..)
import Tags.Messages exposing (..)

view : Tag -> Html Msg
view model =
    div [] [ text model.id ]
