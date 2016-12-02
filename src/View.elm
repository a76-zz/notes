module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Tags.Edit
import Tags.List
import Tags.New
import Tags.Models exposing (TagId)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        TagsRoute ->
            Html.map TagsMsg (Tags.List.view model.tags)

        NewTagRoute ->
            Html.map TagsFormMsg (Tags.New.view)

        TagRoute id ->
            tagEditPage model id

        NotFoundRoute ->
            notFoundView


tagEditPage : Model -> TagId -> Html Msg
tagEditPage model tagId =
    let
        maybeTag =
            model.tags
                |> List.filter (\tag -> tag.id == tagId)
                |> List.head
    in
        case maybeTag of
            Just tag ->
                Html.map TagsMsg (Tags.Edit.view tag)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
