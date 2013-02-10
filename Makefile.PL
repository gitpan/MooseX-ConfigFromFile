
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "An abstract Moose role for setting attributes from a configfile",
  "AUTHOR" => "Brandon L. Black, <blblack\@gmail.com>, Yuval Kogman <nothingmuch\@woobling.org>, Chris Prather <chris\@prather.org>, Karen Etheridge, <ether\@cpan.org>, Tomas Doran <bobtfish\@bobtfish.net>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Moose" => 0,
    "MooseX::SimpleConfig" => 0,
    "Path::Class" => 0,
    "Path::Tiny" => 0,
    "Scalar::Util" => 0,
    "Test::CheckDeps" => "0.002",
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => "1.04",
    "Test::Requires" => 0,
    "Test::Without::Module" => 0,
    "strict" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-ConfigFromFile",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::ConfigFromFile",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Moose::Role" => 0,
    "MooseX::Getopt" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Path::Tiny" => 0,
    "Try::Tiny" => 0,
    "namespace::autoclean" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.08",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



