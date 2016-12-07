#!/usr/bin/env perl6
use v6;

sub info($msg) { note "Thread#{$*THREAD.id} $msg" }

class StoppableSuppiler {
    has $!supplier = Supplier.new;
    has $!stop = Channel.new;

    method stop {
        $!stop.send(Nil);
    }
    method Supply {
        start {
            info "start";
            my $tap = Supply.interval(1).tap: { $!supplier.emit($_) };
            $!stop.receive;
            $tap.close;
            info "done";
        }
        $!supplier.Supply;
    }
}


my $s = StoppableSuppiler.new;

info "Start";
react {
    whenever $s.Supply {
        info "got $_";
        if $_ > 5 {
            $s.stop;
            done;
        }
    }
}
info "Done";
