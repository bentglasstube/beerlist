use strict;
use warnings;

use BeerList;

my $app = BeerList->apply_default_middlewares(BeerList->psgi_app);
$app;

