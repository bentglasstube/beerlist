BeerList
========

A Catalyst application for storing my beer recipes and associated information.

Installation
------------

To run the application, you will need to do the following:

    cpanm --installdeps .

If you want to hack on the application, you will likely want to do the
following to ensure that you get the development dependencies as well:

    cpanm --installdeps . --with-develop

You will also need a database backend (I use postgres) available that you can
point `beerlist.yml` to.  To deploy the database schema you can run this:

    perl -Ilin -MBeerList::Model::DB -e BeerList::Model::DB->new->schema->deploy

You will probably want to set up a bunch of styles too.  I might create a
fixture for that or something.

Running
-------

Run the app with your favorite [plack](Plack) server.  For development and testing
you can alternatively run it with the following:

    ./script/beerlist_server.pl -r

Which will additionally set it up to automatically restart the server any time
the files change.

[plack]: https://metacpan.org/pod/Plack

Author & License
----------------

Copyright 2014 Alan Berndt <alan@eatabrick.org>.  All rights reserved.

This software is licensed under the MIT License.
See the LICENSE file for more information.


