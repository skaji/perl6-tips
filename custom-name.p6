#!/usr/bin/env perl6
use v6;
use lib "lib";
need ExportEX;

my &custom-name = &ExportEx::EXPORT::DEFAULT::exported-func;

custom-name;
