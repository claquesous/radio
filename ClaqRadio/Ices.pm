package ClaqRadio::Ices;

use URI;
use WWW::Curl::Easy;
use JSON 'decode_json';

use ClaqRadio::Config;

use Exporter qw(import);

our @EXPORT_OK = qw(ices_init ices_get_next);

sub get_next(){
    my $uri = URI->new( ClaqRadio::Config->host . "plays.json"  );
    my $curl = WWW::Curl::Easy->new;
    my $response_body;

    $curl->setopt(CURLOPT_URL, $uri);
    $curl->setopt(CURLOPT_POST, 1);
    $curl->setopt(CURLOPT_WRITEDATA,\$response_body);

    my $retcode = $curl->perform;
    my $rspcode = $curl->getinfo(CURLINFO_HTTP_CODE);

    if ($retcode != 0 || $rspcode < 200 || $rspcode>=400){
	return "";
    }

    return $response_body;
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
