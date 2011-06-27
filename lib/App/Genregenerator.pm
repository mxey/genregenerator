package App::Genregenerator;
use Dancer ':syntax';
use Data::Random qw(rand_enum);
use YAML::XS qw(LoadFile);

my $data = LoadFile('genres.yml');

sub chance {
    my ($percent) = @_;
    return int(rand(100 / $percent)) == 0;
}

sub generate_genre {
    my @genre;

    push @genre, rand_enum(set => $data->{cities}) if chance 10;
    push @genre, rand_enum(set => $data->{subgroup}) if chance 70;
    push @genre, rand_enum(set => $data->{subgroup});
    push @genre, rand_enum(set => $data->{group});

    return join ' ', @genre;
}

get '/' => sub {
    template 'index', { genre => generate_genre() };
};

true;
