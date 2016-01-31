#!/usr/bin/env perl6
use v6;

# see https://github.com/tokuhirom/p6-Crust/pull/77
my $inc = "lib";
CompUnit::RepositoryRegistry.use-repository(
    CompUnit::RepositoryRegistry.repository-for-spec($inc)
);

require ExportEx;
