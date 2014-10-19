package BeerList::Controller::API::REST::TastingNote;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'tasting_notes', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::TastingNote',
    # Columns required to create
    create_requires         =>  [qw/brew_id name notes rating time/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw//],
    # Columns that update allows
    update_allows           =>  [qw/brew_id name notes rating time/],
    # Columns that list returns
    list_returns            =>  [qw/id brew_id time rating notes name/],


    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id brew_id time rating notes name/,
        
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class tasting_notes

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
