#!/usr/bin/perl -w
# Pour avoir un meilleur contrôle des règles du langage avant exécution.
use strict;
use warnings;
use utf8;
# Pour pouvoir utiliser decode( 'UTF-8', variable ) ou decode_utf8( variable ) et encode.
#use Encode;
# Pour utiliser say il faut une version minimum.
#use v5.10;
#say();

# Pour que la sortie standard soit bien réglé en utf8 strict
binmode STDOUT, ":encoding(UTF-8)";
# Pour que l'entrée standard soit bien reçus en utf8 strict
binmode STDIN, ":encoding(UTF-8)";

{
    my $i = "\n§" . "(=^.^=)" x 4 . "§\n";
    print( $i );
    print( "§         Hello world        §" );
    print( $i . "\n" );
}
