package BeerList::Schema::Result::Recipe;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('recipes');
__PACKAGE__->add_columns(
  id => {
    data_type         => 'serial',
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  name => {
    data_type   => 'text',
    is_nullable => 0,
  },
  style_id => {
    data_type    => 'int',
    add_fk_index => 1,
    is_nullable  => 0,
  },
  target_og_thousandths => {
    data_type   => 'int',
    is_nullable => 0,
  },
  target_fg_thousandths => {
    data_type   => 'int',
    is_nullable => 0,
  },
  target_srm => {
    data_type   => 'int',
    is_nullable => 0,
  },
  target_ibu => {
    data_type   => 'int',
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint([qw(name)]);

__PACKAGE__->has_many(
  brews => 'BeerList::Schema::Result::Brew',
  { 'foreign.recipe_id' => 'self.id' },
);

__PACKAGE__->has_many(
  fermentation_stages => 'BeerList::Schema::Result::FermentationStage',
  { 'foreign.recipe_id' => 'self.id' },
);

__PACKAGE__->has_many(
  ingredients => 'BeerList::Schema::Result::Ingredient',
  { 'foreign.recipe_id' => 'self.id' },
);

__PACKAGE__->belongs_to(
  style => 'BeerList::Schema::Result::Style',
  'style_id',
  { on_update => 'CASCADE' },
);

__PACKAGE__->meta->make_immutable;

1;
