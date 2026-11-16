#!/usr/bin/perl -w

use JSON;

my $metadata;
my $stream_id = $ENV{STREAM_ID};

sub ices_get_next {
    my $base_url = $ENV{CLAQRADIO_STREAM_URL} || "http://localhost:3000";
    my $url = "$base_url/private/streams/$stream_id/plays";
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
