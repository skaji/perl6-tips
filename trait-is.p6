#!/usr/bin/env perl6
use v6;

multi trait_mod:<is>(Routine $code, :$with-hoge-env) {
    $code.wrap: {
        temp %*ENV;
        %*ENV<HOGE> = ~1;
        callsame();
    };
}

sub test() is with-hoge-env {
    run "env";
}

test();
