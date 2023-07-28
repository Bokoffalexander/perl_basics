#!/usr/bin/perl
# my first programm
use 5.30.0;
use strict;
use warnings;

print "Hello world!\n";
say "hi";
my $name = "Sasha";
my $age = 31;
print "My name is $name\n";
say "My age is $age";
my $mail = 'a@mail.ru';
print "My mail is $mail\n";

# this would print with 
# a linebreak in the middle
print 
"First line here and
second line here also\n";
my $num = 5;
print "The square of $num is ", $num * $num, "\n";

# $_ which is the "default variable".

# An array represents a list of values: 
my @animals = ("camel", "llama", "owl"); 
my @numbers = (23, 42, 69); 
my @mixed = ("camel", 42, 1.23); 
# Arrays are zero-indexed. 
# Here's how you get at elements in an array: 
say $animals[0]; # prints "camel" 
say $animals[1]; # prints "llama" 
# The special variable $#array tells you 
# the index of the last element of an array:
say $mixed[$#mixed]; # last element, prints 1.23

say "Animals are @animals"; # prints all array
say "Numbers are @numbers"; 
if (@animals == 3) {
	print "\nArray len is ", @animals+0, "\n";
 }

say "Slice: @animals[0,1]"; # gives ("camel", "llama"); 
say "Slice else: @animals[0..2]"; # gives ("camel", "llama", "owl");
say "Slice one more: @animals[1..$#animals]"; # gives all except the first element

my @sorted = sort @animals;
my @backwards = reverse @numbers;

say "Sorted animals: @sorted";
say "Revesed numbers: @backwards";

say "Argumet from command line: @ARGV";

my %fruit_color = ( apple => "red", banana => "yellow", ); # hash 
#To get at hash elements:
say $fruit_color{"apple"}; # gives "red"

my @fruits = keys %fruit_color; # all keys
my @colors = values %fruit_color; # all values

say "Fruits are @fruits";
say "Colors are @colors";

my @key_env = keys %ENV;
my @value_env = values %ENV;
say "Key ENV all: @key_env\n";
say ("Value ENV for USER:", $ENV{"USER"});
say ("Value ENV for SHELL:", $ENV{"SHELL"});
say ("Value ENV for USER-SHELL:", @ENV{"USER", "SHELL"});


# More complex data types can be constructed using references, which allow 
# you to build lists and hashes within lists and hashes.
# A reference is a scalar value and can refer to any other Perl data type.

my $variables = { 
	scalar => { description => "single item", 
		    sigil => '$',
                },
	array => { description => "ordered list of items", 
                   sigil => '@',
                },
	hash => { description => "key/value pairs", 
                  sigil => '%',
                },
};
print "\nScalars begin with a $variables->{'scalar'}->{'sigil'}\n";

# Variable scoping
my $var_local = "value"; # local
# $first_programm $var_global = "value"; # global

#  The variables are scoped to the block 
# (i.e. a bunch of statements surrounded by curly-braces) 
# in which they are defined.

my $x = "foo";
my $some_condition = 1;
if ($some_condition) {
    my $y = "bar";
    say $x;           # prints "foo"
    say $y;           # prints "bar"
}
say $x;               # prints "foo"
# print $y;               # prints nothing; $y has fallen out of scope


# Condition and loop
# Condition
my $a=2;
say ('$a = ', $a);
if ( $a>0 ) {
    say "+";
} elsif ( $a<0 ) {
    say "-";
} else {
    say 0;
}

# There's also a negated version of Condition:

unless ( $a<0 ) { # if (!condition)
    say ("Vot a = $a");
}

my $zippy = 1;
# the traditional way
if ($zippy) {
    say "Traditional condition!";
}

# the Perlish post-condition way
say "Perlish! post-condition" if $zippy;

# Loop
say "\nLoop:";
my $q = 2;
while ( $q > 0 ) {
    say $q;
    $q--;
}

# print "LA LA LA\n" while 1;  # loops forever

say "\nExactly like C:";
my $max = 5;
for (my $i = 0; $i <= $max; $i++) {
    say $i;
}

say "\nforeach(){:";
my @array_cars = ("BMW","Renault","AUDI");
foreach (@array_cars) {
    print "This element is $_ \n";
}

say '****** foreach 0 .. $max:';
my $max=1;
say $array_cars[$_] foreach 0 .. $max;

say 'foreach my $key (keys %fruit_color) {';
foreach my $key (keys %fruit_color) {
    print "The value of $key is $fruit_color{$key}\n\n";
}

# Откроем файл
open(my $in,"<","input.txt") or 
die("Cant open input.txt");
# Reading the whole file <$in>
while (<$in>) {
	print "Read line: $_";
}
