#!/usr/bin/env perl
use Dancer;
use autodie qw(chdir);
use Cwd qw(abs_path);

chdir abs_path(dirname(__FILE__) . '/..');
require App::Genregenerator;

dance;
