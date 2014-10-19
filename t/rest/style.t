#!/usr/bin/env perl

use strict;
use warnings;

use HTTP::Request::Common;
use JSON;
use Test::BeerList;
use Test::More;

subtest 'styles empty' => sub {
  my $response = json_get('/api/rest/styles');

  is($response->{success},          'true', 'Response successful');
  is(scalar @{ $response->{list} }, 0,      'No styles yet');
};

subtest 'post new style' => sub {
  my $style = {
    name          => 'Lite American Lager',
    bjcp_category => '1A',
  };

  my $response = json_post('/api/rest/styles', $style);

  use Data::Dump 'ddx';
  ddx $response;

  is($response->{success},          'true', 'Response successful');

  $response = json_get('/api/rest/styles');

  is($response->{success},          'true', 'Response successful');
  is(scalar @{ $response->{list} }, 1,      'One style in database');
};

done_testing;
