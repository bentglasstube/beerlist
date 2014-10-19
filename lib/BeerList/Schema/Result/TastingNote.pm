package BeerList::Schema::Result::TastingNote;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('tasting_notes');
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
  rating => {
    data_type => 'int',
    is_nullable => 0,
  },
  notes => {
    data_type => 'text',
    is_nullable => 0,
  },
  name => {
    data_type => 'text',
    is_nullable => 0,
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
