package ClaqRadio::Ices;

use URI;
use JSON 'decode_json';

use Exporter qw(import);

our @EXPORT_OK = qw(ices_init ices_get_next);

sub get_next(){
    my $uri = URI->new( $ENV{CLAQRADIO_STREAM_URL} . "/plays.json"  );
    my $curlcmd = `curl -s -X POST $uri`;

    return $curlcmd;
}

sub ices_init{
}

sub ices_get_next{
    my $json_result = get_next();
    if ( $json_result ){
      my %json = %{decode_json($json_result)};
      my %song = %{$json{'song'}};
      return $song{'path'};
    }
    return "";
}

371;
