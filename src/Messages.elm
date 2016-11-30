module Messages exposing (..)

import Navigation exposing (Location)
import Tags.Messages

type Msg
    = TagsMsg Tags.Messages.Msg
    | OnLocationChange Location
