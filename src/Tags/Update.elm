module Tags.Update exposing (..)

import Tags.Messages exposing (Msg(..), FormMsg(..))
import Tags.Models exposing (..)
-- import Tags.Commands exposing (save)
import Navigation


updateTag : Tag -> List Tag -> List Tag
updateTag updatedTag tags =
    let
        select existingTag =
            if existingTag.id == updatedTag.id then
                updatedTag
            else
                existingTag
    in
        List.map select tags


addTag : Tag -> List Tag -> List Tag
addTag newTag tags = newTag :: tags

update : Msg -> List Tag -> ( List Tag, Cmd Msg )
update message tags =
    case message of
        OnFetchAll (Ok newTags) ->
            ( newTags, Cmd.none )

        OnFetchAll (Err error) ->
            ( tags, Cmd.none )

        ShowTags ->
            ( tags, Navigation.newUrl "#tags" )

        ShowTag id ->
            ( tags, Navigation.newUrl ("#tags/" ++ id) )

        OnSave (Ok updatedTag) ->
            ( updateTag updatedTag tags, Cmd.none )

        OnSave (Err error) ->
            ( tags, Cmd.none )

editTag : FormMsg -> List Tag -> Tag -> ( List Tag, Tag, Cmd FormMsg )
editTag message tags tag =
    case message of
        Id value ->
            ( tags, { tag | id = value }, Cmd.none )

        Save ->
            ( tag :: tags, new, Navigation.newUrl "#/tags")
