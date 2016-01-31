#!/usr/bin/env perl6
use v6;

use ExportEx;    # compile time + import func
need ExportEx;   # compile time + not import func
require ExporEx; # runtime
