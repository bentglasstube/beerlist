package BeerList::Schema::Result::Brew;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('brews');
__PACKAGE__->add_columns(
  id => {
    data_type         => 'serial',
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  recipe_id => {
    data_type   => 'int',
    is_nullable => 0,
  },
  brewed => {
    data_type   => 'datetime',
    is_nullable => 0,
  },
  measured_og => {
    data_type   => 'int',
    is_nullable => 1,
  },
  measured_fg => {
    data_type   => 'int',
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->belongs_to(
  recipe => 'BeerList::Schema::Result::Recipe',
  'recipe_id',
  { on_update => 'CASCADE' },
);

__PACKAGE__->has_many(
  brew_log_entries => 'BeerList::Schema::Result::BrewLogEntry',
  { 'foreign.brew_id' => 'self.id' },
);

__PACKAGE__->has_many(
  tasting_notes => 'BeerList::Schema::Result::TastingNote',
  { 'foreign.brew_id' => 'self.id' },
);

__PACKAGE__->meta->make_immutable;

1;
