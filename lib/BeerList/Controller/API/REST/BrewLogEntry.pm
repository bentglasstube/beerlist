package BeerList::Controller::API::REST::BrewLogEntry;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'brew_log_entries', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::BrewLogEntry',
    # Columns required to create
    create_requires         =>  [qw/brew_id note time/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw/gravity temperature volume/],
    # Columns that update allows
    update_allows           =>  [qw/brew_id note time gravity temperature volume/],
    # Columns that list returns
    list_returns            =>  [qw/id brew_id time note temperature volume gravity/],


    # Every possible prefetch param allowed
    list_prefetch_allows    =>  [
        [qw/brews/], {  'brews' => [qw/brew_log_entries tasting_notes/] },
		[qw/fermentation_stages/], {  'fermentation_stages' => [qw//] },
		[qw/ingredients/], {  'ingredients' => [qw//] },
		
    ],

    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id brew_id time note temperature volume gravity/,
        
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class brew_log_entries

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
