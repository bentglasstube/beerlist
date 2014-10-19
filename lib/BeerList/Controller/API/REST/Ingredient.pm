package BeerList::Controller::API::REST::Ingredient;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'ingredients', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::Ingredient',
    # Columns required to create
    create_requires         =>  [qw/amount name recipe_id type unit/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw//],
    # Columns that update allows
    update_allows           =>  [qw/amount name recipe_id type unit/],
    # Columns that list returns
    list_returns            =>  [qw/id recipe_id amount unit type name/],


    # Every possible prefetch param allowed
    list_prefetch_allows    =>  [
        [qw/recipes/], {  'recipes' => [qw/brews fermentation_stages ingredients/] },
		
    ],

    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id recipe_id amount unit type name/,
        
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class ingredients

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
