#!/usr/bin/env perl6
use v6;
use Test;

{
    my $done-testing = Test::EXPORT::DEFAULT::<&done-testing>;
    my $done_testing = Test::EXPORT::DEFAULT::<&done_testing>;

    say "done-testing is {$done-testing ?? "defined" !! "not defined"} in Test::EXPORT::DEFAULT";
    say "done_testing is {$done_testing ?? "defined" !! "not defined"} in Test::EXPORT::DEFAULT";
}

{
    my $done-testing = &::("done-testing");
    my $done_testing = &::("done_testing");
    say "done-testing is {$done-testing ?? "defined" !! "not defined"} in current scope";
    say "done_testing is {$done_testing ?? "defined" !! "not defined"} in current scope";
}
