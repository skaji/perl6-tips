use v6;
unit module ExportEx;

our sub our-func() {
    say "our func";
}

sub exported-func() is export {
    say "exported func";
}
