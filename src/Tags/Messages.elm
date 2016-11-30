module Tags.Messages exposing (..)

import Http
import Tags.Models exposing (TagId, Tag)


type Msg
    = OnFetchAll (Result Http.Error (List Tag))
    | ShowTags
    | ShowTag TagId
    | OnSave (Result Http.Error Tag)
