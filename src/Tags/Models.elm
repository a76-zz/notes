module Tags.Models exposing (..)


type alias TagId =
    String


type alias Tag =
    { id : TagId
    }


new : Tag
new =
    { id = ""
    }
