package BeerList::Controller::API::REST::Style;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'styles', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::Style',
    # Columns required to create
    create_requires         =>  [qw/bjcp_category name/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw//],
    # Columns that update allows
    update_allows           =>  [qw/bjcp_category name/],
    # Columns that list returns
    list_returns            =>  [qw/id name bjcp_category/],


    # Every possible prefetch param allowed
    list_prefetch_allows    =>  [
        [qw/recipes/], {  'recipes' => [qw/brews fermentation_stages ingredients/] },
		
    ],

    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id name bjcp_category/,
        { 'recipes' => [qw/id name style_id target_og_thousandths target_fg_thousandths target_srm target_ibu/] },
		
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class styles

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
