#!/usr/bin/perl -w
# Pour avoir un meilleur contrôle des règles du langage avant exécution.
use strict;
use warnings;

{
    my $i = "\n§" . "(=^.^=)" x 4 . "§\n";
    print($i);
    print("§         Hello world        §");
    print($i . "\n");
}
