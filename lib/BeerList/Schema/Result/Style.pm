package BeerList::Schema::Result::Style;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;

extends 'DBIx::Class::Core';

__PACKAGE__->table('styles');
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
  bjcp_category => {
    data_type   => 'varchar(3)',
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint([qw(name)]);
__PACKAGE__->add_unique_constraint([qw(bjcp_category)]);

__PACKAGE__->has_many(
  recipes => 'BeerList::Schema::Result::Recipe',
  { 'foreign.style_id' => 'self.id' },
);

__PACKAGE__->meta->make_immutable;

1;
