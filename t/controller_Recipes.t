use strict;
use warnings;
use Test::More;

use Catalyst::Test 'BeerList';
use BeerList::Controller::Recipes;

ok(request('/recipes')->is_success, 'Request should succeed');
done_testing();
