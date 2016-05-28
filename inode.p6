#!/usr/bin/env perl6
use v6;

sub get-inode($entry) {
    use nqp;
    try nqp::stat($entry.Str, nqp::const::STAT_PLATFORM_INODE);
}

say get-inode(".");

