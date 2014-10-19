package BeerList::Controller::API::REST::Brew;

use strict;
use warnings;
use JSON::XS;

use parent qw/BeerList::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'brews', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::Brew',
    # Columns required to create
    create_requires         =>  [qw/brewed recipe_id/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw/measured_fg measured_og/],
    # Columns that update allows
    update_allows           =>  [qw/brewed recipe_id measured_fg measured_og/],
    # Columns that list returns
    list_returns            =>  [qw/id recipe_id brewed measured_og measured_fg/],


    # Every possible prefetch param allowed
    list_prefetch_allows    =>  [
        [qw/brew_log_entries/], {  'brew_log_entries' => [qw//] },
		[qw/tasting_notes/], {  'tasting_notes' => [qw//] },
		
    ],

    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id recipe_id brewed measured_og measured_fg/,
        { 'brew_log_entries' => [qw/id brew_id time note temperature volume gravity/] },
		{ 'tasting_notes' => [qw/id brew_id time rating notes name/] },
		
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class brews

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
