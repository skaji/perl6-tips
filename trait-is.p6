#!/usr/bin/env perl6
use v6;

multi trait_mod:<is>(Routine $code, Str :$with-hoge-env) {
    $code.wrap: {
        temp %*ENV;
        %*ENV<HOGE> = $with-hoge-env;
        callsame();
    };
}

sub test() is with-hoge-env("true") {
    run "env";
}

test();
