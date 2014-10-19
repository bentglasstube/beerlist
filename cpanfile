requires 'perl', '5.20.0';

requires 'Catalyst';
requires 'Catalyst::Action';
requires 'Catalyst::Controller';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::ConfigLoader::Environment';
requires 'Catalyst::Runtime';
requires 'Catalyst::View::TT';
requires 'DBD::Pg';
requires 'DBI';
requires 'DBIx::Class';
requires 'DBIx::Class::TimeStamp';
requires 'DBIx::Class::UUIDColumns';
requires 'DateTime';
requires 'Hashids';
requires 'JSON', '2.00';
requires 'Moose';
requires 'Moose::Role';
requires 'namespace::autoclean';

recommends 'JSON::XS', 2.0;

conflicts 'JSON', '< 1.0';

on test => sub {
  requires 'Catalyst::Test';
  requires 'HTTP::Message';
  requires 'Test::More';
};

on develop => sub {
  requires 'Catalyst::Helper::Controller::DBIC::API::REST';
};
