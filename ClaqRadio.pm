#!/usr/bin/perl -w

package ClaqRadio;

use File::Copy;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0);

use ClaqRadio::Ices qw(ices_init ices_get_next);

ices_init();

371;
