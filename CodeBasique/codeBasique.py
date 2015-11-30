#! /usr/bin/python3
# -*- coding: utf-8 -*-
# vim: foldmethod=indent:

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

class PremiereClasse(object):
    """Documentation de la classe"""
    def __init__(self, messageBienvenu):
        """Écrire la documentation de la fonction ici"""
        self.messageBienvenu = messageBienvenu

    def __repr__(self):
        """Explication de l'affichage de print"""
        return self.messageBienvenu

    def __str__(self):
        """Appel à la transformation en chaine"""
        return self.messageBienvenu

    def __unicode__(self):
        """Représentation en unicode ?"""
        return self.messageBienvenu

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

if __name__=="__main__":
    print(155*"#" + "\n" + 70*"#" + "Début des tests" + 70*"#" + "\n" + 155*"#")
    objet = PremiereClasse("Hello World")
    print(objet)

#Pivard Julien
