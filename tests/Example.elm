module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "first test"
        [ todo "test todo"
        , test "my first case" <|
            \_ -> Expect.equal 2 2
        , fuzz string "test" <|
            \str ->
                case str of
                    "" ->
                        Expect.pass

                    " " ->
                        Expect.pass

                    _ ->
                        Expect.fail "sss"
        ]
