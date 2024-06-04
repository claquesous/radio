#!/usr/bin/perl -w

use JSON;

my $metadata;

sub ices_get_next {
    my $url = $ENV{CLAQRADIO_STREAM_URL} . "/plays.json";
    my $json_result = `curl -s -X POST $url`;
    if ( $json_result ){
      my %json = %{decode_json($json_result)};
      my $path = delete $json{'song'}{'path'};
      $metadata = encode_json(\%json);
      return $path;
    }
    return "";
}

sub ices_get_metadata {
    return $metadata;
}

return 1;

