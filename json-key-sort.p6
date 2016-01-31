#!/usr/bin/env perl6
use v6;

# see JSON::Pretty in rakudo core
my class SortedHash does Associative {
    has %.hash;
    method new(*%hash is copy) {
        for %hash.keys -> $k {
            %hash{$k} = self.new(|%(%hash{$k})) if %hash{$k} ~~ Associative;
        }
        self.bless(:%hash);
    }
    method map(&cb) {
        do for %.hash.keys.sort({~$^a cmp ~$^b}) -> $k {
            &cb($k => %.hash{$k});
        }
    }
}

my %h = a => 1, b => 2, c => { a => 10, b => 20, c => 30 };
my $h = SortedHash.new(|%h);

say to-json %h;
say to-json $h;

=begin code

{
  "a" : 1,
  "c" : {
    "a" : 10,
    "c" : 30,
    "b" : 20
  },
  "b" : 2
}
{
  "a" : 1,
  "b" : 2,
  "c" : {
    "a" : 10,
    "b" : 20,
    "c" : 30
  }
}

=end code
