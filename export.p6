#!/usr/bin/env perl6
use v6;
use lib "lib";

# unlike perl5,
# functions are not exported to package namespace,
# but scope
{
    use ExportEx;
    exported-func(); # ok
    ExportEx::our-func(); # ok
}
{
    # exported-func(); # can't call
    ExportEx::EXPORT::DEFAULT::exported-func(); # ok
    ExportEx::our-func(); # ok
}
