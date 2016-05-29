#!/usr/bin/env perl6
use v6;
use HTTP::Tinyish;
use JSON::Tiny;

# perl6 version of
# https://gist.github.com/staltz/868e7e9bc2a7b8c1f754
# http://ninjinkun.hatenablog.com/entry/introrxja (ja translation)

my $interval = supply {
    whenever Supply.interval(5, 10).share {
        my $random-offset = (^500).pick;
        emit "https://api.github.com/users?since=" ~ $random-offset;
    }
};
my $startup  = supply { emit "https://api.github.com/users" };

my $request-supply = Supply.merge($startup, $interval);

my $response-supply = supply {
    whenever $request-supply -> $url {
        my $value = await HTTP::Tinyish.new(:async).get($url).then: -> $p {
            my $res = await $p;
            from-json $res<content>;
        };
        emit $value;
    };
};

react {
    whenever $response-supply -> $v {
        say $v.map(*<login>).pick(3);
    };
};
