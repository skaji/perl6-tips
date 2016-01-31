#!/usr/bin/env perl6
use v6;

class Foo:ver<0.0.1>:auth<github:shoichikaji> {}

say Foo.^ver;
say Foo.^auth;
