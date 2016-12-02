module Tags.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Tags.Messages exposing (FormMsg(..))
import Html.Events exposing (onInput, onClick)

view : Html FormMsg
view = div []
    [ input [ type_ "text", placeholder "Enter Tag Name", onInput Id ] []
    , button [ onClick Save ] [ text "Save" ] ]
