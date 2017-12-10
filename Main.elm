port module Main exposing (main)

import Platform exposing (..)
import Debug exposing (..)
import Json.Decode


type alias Model =
    {}


type Msg
    = StartMsg Json.Decode.Value
    | TestMsg Int
    | NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartMsg text ->
            Debug.log "Started" text
                |> always ( model, Cmd.none )

        TestMsg number ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


port start : (Json.Decode.Value -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    start StartMsg


main : Platform.Program Never Model Msg
main =
    Platform.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        }
