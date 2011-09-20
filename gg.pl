#!/usr/bin/env perl
use Mojolicious::Lite;
use Data::Random qw(rand_enum);

my @genres = (
  'Aggrotech',
  'Ambient',
  'Beat',
  'Bluegrass',
  'Blues',
  'Chiptune',
  'Core',
  'Country',
  'Cumbia',
  'Dance',
  'Dancehall',
  'Drum and Bass',
  'Dub',
  'Dubstep',
  'EBM',
  'Flamenco',
  'Grunge',
  'Goa',
  'Gospel',
  'Hardstyle',
  'Hip-hop',
  'House',
  'Humppa',
  'Industrial',
  'Jazz',
  'Metal',
  'Oi!',
  'Polka',
  'Pop',
  'Punk',
  'Rap',
  'Rave',
  'Reggae',
  'Rockabilly',
  'Samba',
  'Schranz',
  'Ska',
  'Soul',
  'Techhouse',
  'Techno',
  'Tekkno',
  'Trance',
  'Triphop',
  'Twostep',
  'Western',
);

my @subgenres = (
  '30s',
  '40s',
  '50s',
  '60s',
  '70s',
  '80s',
  'Acid',
  'Alternative',
  'Ambient',
  'Anatolian',
  'Arena',
  'Art',
  'Australian',
  'Australian',
  'Avantgarde',
  'Balearic',
  'Balkan',
  'Battle',
  'Black',
  'Body',
  'Bossa nova',
  'Brit',
  'Celtic',
  'Chinese',
  'Christian',
  'Comedy',
  'Conscious',
  'Cow',
  'Crust',
  'Dark',
  'Death',
  'Dirty',
  'Doom',
  'Drone',
  'East Coast',
  'Electroclash',
  'Electronic',
  'Emo',
  'Euro',
  'Experimental',
  'Extreme',
  'Flower',
  'Folk',
  'Free',
  'Freestyle',
  'Fucking',
  'Fun',
  'Funk',
  'Fusion',
  'Future',
  'Gangsta',
  'Garage',
  'Ghetto',
  'Glam',
  'Gospel',
  'Gothic',
  'Grind',
  'Groove',
  'Happy',
  'Hard',
  'Hardcore',
  'Harmonica',
  'Handsup',
  'Heavy',
  'Horror',
  'Indian',
  'Indie',
  'Independent',
  'Industrial',
  'Instrumental',
  'Latin',
  'Lounge',
  'Mainstream',
  'Medieval',
  'Melodic',
  'Minimal',
  'Neo',
  'New age',
  'Ninja',
  'Nintendo',
  'Noise',
  'Nu',
  'Pagan',
  'Pirate',
  'Post',
  'Power',
  'Progressive',
  'Psychedelic',
  'Skate',
  'Sludge',
  'Southern',
  'Space',
  'Speed',
  'Stoner',
  'Street',
  'Sunshine',
  'Surf',
  'Swedish',
  'Swing',
  'Symphonic',
  'Synth',
  'Teutonic',
  'Traditional',
  'Trash',
  'Viking',
  'Vocal',
  'Wave',
  'West Coast',
  'World',
);

my @cities = (
  'Berlin',
  'Bakersfield',
  'Detroit',
  'Frankfurt',
  'Gothenburg',
  'Ibiza',
  'London',
  'New Orleans',
  'Rio',
  'Rotterdam',
  'San Francisco',
);

sub chance {
  my ($percent) = @_;
  return int(rand 101) <= $percent;
}

sub generate {
  my @genre;

  push @genre, rand_enum(set => \@cities) if chance 10;
  push @genre, rand_enum(set => \@subgenres) if chance 70;
  push @genre, rand_enum(set => \@subgenres);
  push @genre, rand_enum(set => \@genres);

  return join ' ', @genre;
}

get '/' => sub {
  my ($self) = @_;
  $self->render('index', genre => generate());
};

get '/plain' => sub {
  my ($self) = @_;
  $self->render(text => generate());
};

app->start;

__DATA__

@@ index.html.ep
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>
      Listen to <%= $genre %>
    </title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/style.css" />
  </head>
  <body>
    <div id="title"> Listen to </div>

    <div id="genre"> <a href="/"><%= $genre %></a> </div>

    <div id="twitter">
      <a href="http://twitter.com/share" class="twitter-share-button"
       data-text="I listen to <%= $genre %> data-count="horizontal">
        Tweet
      </a>
      <script type="text/javascript"
       src="http://platform.twitter.com/widgets.js"> </script>
      <br />
    </div>

    <div id="impressum">
      Created by
      <a href="http://www.thehappy.de/~xeno/"> xeno </a>
      and
      <a href="http://mxey.net"> mxey </a>
      |
      <a href="htts://github.com/mxey/genregenerator"> fork me on github </a>
    </div>

  </body>
</html>

@@ style.css

* {
  margin: 0px;
  padding: 0px;
}

body, html {
  font-family: sans-serif;
  text-align: center;
}

#title {
  margin-top: 50px;
  font-size: 50px;
}

#genre {
  margin-top: 50px;
  font-size: 50px;
  font-weight: bold;
  color: #666;
}

#twitter {
  margin-top: 80px;
  margin-left: 18px;
}

#impressum {
  margin-top: 5px;
  font-size: 10px;
  color: #999;
}

a {
  color: #666;
  text-decoration: none;
}
