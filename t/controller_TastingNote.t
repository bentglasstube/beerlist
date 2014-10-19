use strict;
use warnings;
use Test::More;


use Catalyst::Test 'BeerList';
use BeerList::Controller::API::REST::TastingNote;

ok( request('/api/rest')->is_success, 'Request should succeed' );
done_testing();
