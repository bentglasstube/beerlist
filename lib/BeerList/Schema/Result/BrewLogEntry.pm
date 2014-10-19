package BeerList::Schema::Result::BrewLogEntry;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('brew_log_entries');
__PACKAGE__->add_columns(
  id => {
    data_type         => 'serial',
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  brew_id => {
    data_type => 'int',
    is_nullable => 0,
  },
  time => {
    data_type => 'datetime',
    is_nullable => 0,
  },
  note => {
    data_type => 'text',
    is_nullable => 0,
  },
  temperature => {
    data_type => 'int',
    is_nullable => 1,
  },
  volume => {
    data_type => 'int',
    is_nullable => 1,
  },
  gravity => {
    data_type => 'int',
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->belongs_to(
  brew => 'BeerList::Schema::Result::Brew',
  'brew_id',
  { on_update => 'CASCADE' },
);

__PACKAGE__->meta->make_immutable;

1;
