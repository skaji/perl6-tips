#!/usr/bin/env perl6
use v6;

module Foo {
    our sub touch-topic() {
        my $v = CALLERS::<$_>;
        say "touch $v";
    }
}

for 1..10 {
    Foo::touch-topic;
}
