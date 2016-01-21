#!/usr/bin/perl -w
# Pour avoir un meilleur contrôle des règles du langage avant exécution.
use strict;
use warnings;
use utf8;
# Pour utiliser say il faut une version minimum.
#use v5.10;
#say();

{
    my $i = "\n§" . "(=^.^=)" x 4 . "§\n";
    print( $i );
    print( "§         Hello world        §" );
    print( $i . "\n" );
}
