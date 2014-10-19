package BeerList;

use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
  -Debug
  ConfigLoader
  ConfigLoader::Environment
  Static::Simple
  /;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
  name                                        => 'BeerList',
  disable_component_resolution_regex_fallback => 1,
  enable_catalyst_header                      => 1,
  'View::HTML'                                => {
    ANYCASE => 1,
  },
);

# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

BeerList - A database for my beer recipes

=head1 SYNOPSIS

    script/beerlist_server.pl

=head1 DESCRIPTION

A simple database to keep track of my beer recipes and all the related
information that goes along with them.

=head1 SEE ALSO

L<BeerList::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Alan Berndt <alan@eatabrick.org>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
