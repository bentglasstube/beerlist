package Test::BeerList;

use base 'Exporter';

use Catalyst::Test 'BeerList';
use HTTP::Request;
use JSON;

our @EXPORT = qw(json_get json_put json_post json_delete);

sub _request {
  my ($type, $path, $object) = @_;

  my $content = $object ? to_json($object) : '';

  my $request = HTTP::Request->new(
    $type => $path,
    HTTP::Headers->new(Content_Type => 'application/json'),
    $content,
  );

  print STDERR $request->content;

  my $response = request($request);

  print STDERR $response->content;

  return from_json($response->decoded_content);
}

sub json_get    { _request('GET',    @_); }
sub json_post   { _request('POST',   @_); }
sub json_put    { _request('PUT',    @_); }
sub json_delete { _request('DELETE', @_); }

1;
