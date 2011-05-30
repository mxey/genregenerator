#!/usr/bin/env perl

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

  return join ' ', map { ucfirst } @genre;
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
