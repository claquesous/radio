#!/usr/bin/perl -w

use URI;
use JSON 'decode_json';

my $metadata;

sub ices_get_next {
    my $uri = URI->new( $ENV{CLAQRADIO_STREAM_URL} . "/plays.json"  );
    my $json_result = `curl -s -X POST $uri`;
    if ( $json_result ){
      my %json = %{decode_json($json_result)};
      my %song = %{$json{'song'}};
      my %artist = %{$json{'artist'}};
      $metadata = $artist{'name'} . " - " . $song{'title'};
      return $song{'path'};
    }
    return "";
}

sub ices_get_metadata {
    return $metadata;
}

return 1;

