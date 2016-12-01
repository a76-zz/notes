module Tags.Update exposing (..)

import Tags.Messages exposing (Msg(..))
import Tags.Models exposing (Tag, TagId)
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

        AddTag newTag ->
            ( addTag newTag tags, Cmd.none )

        OnSave (Ok updatedTag) ->
            ( updateTag updatedTag tags, Cmd.none )

        OnSave (Err error) ->
            ( tags, Cmd.none )
