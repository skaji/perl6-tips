#!/usr/bin/env perl6
use v6;

use lib "lib";
require ExportEx;

&::("ExportEx::our-func")();
&::("ExportEx::EXPORT::DEFAULT::exported-func")();
