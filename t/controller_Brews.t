use strict;
use warnings;
use Test::More;

use Catalyst::Test 'BeerList';
use BeerList::Controller::Brews;

ok(request('/brews')->is_success, 'Request should succeed');
done_testing();
