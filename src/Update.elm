module Update exposing (..)

import Messages exposing (Msg(..))
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

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
