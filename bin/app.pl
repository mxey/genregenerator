#!/usr/bin/env perl
use Dancer;
use FindBin;

chdir "$FindBin::Bin/..";
require App::Genregenerator;

dance;
