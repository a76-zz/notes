module Tags.Models exposing (..)


type alias TagId =
    String


type alias Tag =
    { id : TagId
    , name : String
    , level : Int
    }


new : Tag
new =
    { id = "0"
    , name = ""
    , level = 1
    }
