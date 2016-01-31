use v6;
unit class ExportEx;

our sub our-func() {
    say "our func";
}

sub exported-func() is export {
    say "exported func";
}
