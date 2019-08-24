module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


onUrlRequest : Browser.UrlRequest -> Msg
onUrlRequest url =
    Increment


onUrlChange : Url.Url -> Msg
onUrlChange url =
    Increment



-- MODEL


type alias Model =
    Int


init : flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement
    | DoubleDecrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        DoubleDecrement ->
            ( model - 2, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "abc"
    , body =
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text <| String.fromInt model ]
        , button [ onClick Decrement ] [ text "-" ]
        , button [ onClick DoubleDecrement ] [ text "-2" ]
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
