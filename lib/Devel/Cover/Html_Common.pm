package Devel::Cover::Html_Common;
BEGIN {require 5.006}
use strict;
use warnings;

# VERSION

use Exporter;

our @ISA       = 'Exporter';
our @EXPORT_OK = qw( launch get_options output_filepath );

sub launch {
    my ($package, $opt) = @_;

    my $outfile = "$opt->{outputdir}/$opt->{option}{outputfile}";
    if (eval { require Browser::Open }) {
        Browser::Open::open_browser($outfile);
    }
    else {
        print STDERR "Devel::Cover: -launch requires Browser::Open\n";
    }
}

sub get_options {
    my ($package, $opt, @option_list) = @_;

    $opthash->{option}{outputfile} = "coverage.html";

    die "Invalid command line options" unless
        GetOptions($opthash->{option},
                   qw(
                       outputfile=s
                     ),
                   @option_list); # allow custom options to override ours
}

sub output_filepath {
    my ($opt) = @_;
    return "$opt->{outputdir}/$opt->{option}{outputfile}";
}

=pod

=head1 NAME

Devel::Cover::Report::Html_Common - Common code for HTML reporters

=head1 DESCRIPTION

This module provides common functionality for HTML reporters.

=head1 Functions

=over 4

=item launch ( $package, $options )

Launch a browser to view the report. HTML reporters just need to import this
function to enable the -launch flag for that report type.

=item get_options ( $package, $options, @option_list )

Common option handling code for HTML reporters.

Reporters can prove their own get_options function and chain onto this, passing
their custom @option_list, or just import this function to get the default
behaviour.

=item output_filepath ( $options )

Construct the path to html output file from the $options hash.

=back

=head1 SEE ALSO

Devel::Cover

=cut
1;
