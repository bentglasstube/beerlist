package BeerList::Schema::Result::FermentationStage;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('fermentation_stages');
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
  number => {
    data_type   => 'int',
    is_nullable => 0,
  },
  temperature => {
    data_type   => 'int',
    is_nullable => 0,
  },
  length => {
    data_type   => 'int',
    is_nullable => 0,
  },
  description => {
    data_type   => 'text',
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint([qw(recipe_id number)]);

__PACKAGE__->belongs_to(
  recipe => 'BeerList::Schema::Result::Recipe',
  'recipe_id',
  { on_update => 'CASCADE' },
);

__PACKAGE__->meta->make_immutable;

1;
