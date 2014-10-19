package BeerList::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
  TEMPLATE_EXTENSION => '.tt',
  WRAPPER            => 'layout.tt',
  render_die         => 1,
);

=head1 NAME

BeerList::View::HTML - TT View for BeerList

=head1 DESCRIPTION

TT View for BeerList.

=head1 SEE ALSO

L<BeerList>

=head1 AUTHOR

Alan Berndt <alan@eatabrick.org>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
