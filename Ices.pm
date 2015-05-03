#!/usr/bin/perl -w

package ClaqRadio::Ices;

use File::Copy;

use URI;
use WWW::Curl::Easy;
use JSON 'decode_json';

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0);

use ClaqRadio::Config;

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
    srand;
}

sub ices_get_next{
    $json_result = get_next();
    if ( $json_result ){
      %json = %{decode_json($json_result)};
      %song = %{$json{'song'}};
      return $song{'path'};
    }
    return "";
}

ices_init();

371;
