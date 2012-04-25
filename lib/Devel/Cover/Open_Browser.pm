package Devel::Cover::Open_Browser;
BEGIN {require 5.006}
use strict;
use warnings;
use Browser::Open ();

# VERSION

use Exporter;

our @ISA       = 'Exporter';
our @EXPORT_OK = 'open_browser';

sub open_browser {
    my ($package, $opt) = @_;

    my $outfile = "$opt->{outputdir}/$opt->{option}{outputfile}";
    Browser::Open::open_browser($outfile);
}

=pod

=head1 NAME

Devel::Cover::Report::Open_Browser - Browser open code for HTML report formats

=head1 SYNOPSIS

 In a HTML reporter module:

    use Devel::Cover::Open_Browser qw( open_browser );

 This will add support for the open command-line flag.

    cover -open

=head1 DESCRIPTION

This module provides common browser opening code for HTML reporters.

=head1 OPTIONS

Options are specified by adding the appropriate flags to the C<cover> program.
This module supports the following:

=over 4

=item open

Open the coverage report in a browser.

=back

=head1 SEE ALSO

Devel::Cover

=cut
1;
