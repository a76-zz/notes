module Routing exposing (..)

import Navigation exposing (Location)
import Tags.Models exposing (TagId)
import UrlParser exposing (..)


type Route
    = TagsRoute
    | TagRoute TagId
    | NewTagRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map TagsRoute top
        , map TagRoute (s "tags" </> string)
        , map TagsRoute (s "tags")
        , map NewTagRoute (s "new-tag")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
