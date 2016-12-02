module Update exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Tags.Update
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TagsMsg subMsg ->
            let
                ( updatedTags, cmd ) =
                    Tags.Update.update subMsg model.tags
            in
                ( { model | tags = updatedTags }, Cmd.map TagsMsg cmd )

        TagsFormMsg subMsg ->
            let
                ( updatedTags, updatedTag, cmd ) =
                    Tags.Update.editTag subMsg model.tags model.newTag
            in
                ( { model | tags = updatedTags, newTag = updatedTag }, Cmd.map TagsFormMsg cmd)

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
