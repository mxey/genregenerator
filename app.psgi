#!/usr/bin/env perl
# Copyright 2011 Maximilian Gaß <mxey@ghosthacking.net>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use strict;
use warnings;

use Data::Random qw(rand_enum);
use Plack::App::File;
use Plack::Builder;
use YAML::XS qw(LoadFile);
use Template;

chdir ('/srv/www/de.genregenerator');
my $data = LoadFile('genres.yaml');

my $template = Template->new({
  INCLUDE_PATH => '.',
});

sub chance {
  my ($percent) = @_;
  return int(rand(100 / $percent)) == 0;
}

sub generate_genre {
  my @genre;

  if (chance(10)) {
    push @genre, rand_enum(set => $data->{cities});
  }

  if (chance(70)) {
    push @genre, rand_enum(set => $data->{subgroup});
  }


  push @genre, rand_enum(set => $data->{subgroup});
  push @genre, rand_enum(set => $data->{group});

  return join ' ', @genre;
}

builder {
  mount '/static' => Plack::App::File->new(root => 'static')->to_app(),
  mount '/' => sub {
    my $genre = generate_genre();
    my $out = '';
    $template->process('index.tt', { genre => $genre }, \$out);
    return [
      200,
      [ 'Content-Type' => 'text/html' ],
      [ $out ]
    ];
  },
}
