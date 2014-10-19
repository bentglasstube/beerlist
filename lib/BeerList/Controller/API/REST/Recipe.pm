package BeerList::Controller::API::REST::Recipe;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'recipes', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::Recipe',
    # Columns required to create
    create_requires         =>  [qw/name style_id target_fg_thousandths target_ibu target_og_thousandths target_srm/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw//],
    # Columns that update allows
    update_allows           =>  [qw/name style_id target_fg_thousandths target_ibu target_og_thousandths target_srm/],
    # Columns that list returns
    list_returns            =>  [qw/id name style_id target_og_thousandths target_fg_thousandths target_srm target_ibu/],


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
        qw/id name style_id target_og_thousandths target_fg_thousandths target_srm target_ibu/,
        { 'brews' => [qw/id recipe_id brewed measured_og measured_fg/] },
		{ 'fermentation_stages' => [qw/id recipe_id number temperature length description/] },
		{ 'ingredients' => [qw/id recipe_id amount unit type name/] },
		
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class recipes

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
