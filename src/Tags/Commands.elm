module Tags.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Tags.Messages exposing (..)
import Tags.Models exposing (TagId, Tag)

fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl collectionDecoder
        |> Http.send OnFetchAll


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/tags"


saveUrl : TagId -> String
saveUrl tagId =
    "http://localhost:4000/tags/" ++ tagId


saveRequest : Tag -> Http.Request Tag
saveRequest tag =
    Http.request
        { body = memberEncoded tag |> Http.jsonBody
        , expect = Http.expectJson memberDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveUrl tag.id
        , withCredentials = False
        }


save : Tag -> Cmd Msg
save tag =
    saveRequest tag
        |> Http.send OnSave

-- DECODERS

collectionDecoder : Decode.Decoder (List Tag)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Tag
memberDecoder =
    Decode.map Tag
        (field "id" Decode.string)


memberEncoded : Tag -> Encode.Value
memberEncoded tag =
    let
        list =
            [ ( "id", Encode.string tag.id )
            ]
    in
        list
            |> Encode.object
