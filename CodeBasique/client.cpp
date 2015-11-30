/**
 * @mainpage
 *
 * La classe main qui vas bien pour exécuter, ma gueule !
 *
 * @author PIVARD Julien
 */

#include <cstdlib>
// Pour avoir accès aux entrées sorties des flux.
#include <iostream>
// istringstream pour lire en entrée une chaine.
// ostringstream pour
#include <sstream>

// Si on veut ne pas avoir à taper std::
// peut être mis dans un bloc
//using namespace std;

/*
 * Fonction d'affichage de séparateur de zone,
 * pour faciliter la lecture sur la sortie standard.
 * */
std::string affichageTest( std::string nomZone )
{

    if( nomZone.size() % 2 == 1 )
    {
        nomZone += ' ';
    }

    std::string ligne =  "==========================================================================================";
    int nbEspaceBlanc = ligne.size() - nomZone.size() - 2;
    std::string blanc;

    for( int i = 0; i < nbEspaceBlanc / 2; i++ )
    {
        blanc += ' ';
    }

    return ligne + "\n=" + blanc + nomZone + blanc + "=\n" + ligne;

}

/**
 * Programme principal.
 *
 * @param[in] argc - le nombre d'arguments de la ligne de commande.
 * @param[in] argv - les arguments de la ligne de commandes.
 * @return @c EXIT_FAILURE en cas d'exécution réussie o @c EXIT_FAILURE sinon.
 */
int main( int argc, char* argv[] )
{

    std::cout << "==================================================="
        << std::endl;
    std::cout << "= Lancement du programme "
        << argv[0]
        << " pour tester ="
        << std::endl;
    std::cout << "==================================================="
        << std::endl;
    // Controle du nombre d'argument sur la ligne de commande
    if( argc == 1 )
    {
        std::cout << "Usage "
            << argv[0]
            << " entier"
            << std::endl;
    }
    if( argc != 2 )
    {
        std::cerr << "Trop d'argument, tartine de pus !"
            << std::endl;
        return EXIT_FAILURE;
    }

    // Cast de chaine dans un type précis.
    std::istringstream laChaine( argv[1] );
    int e ;
    laChaine >> e;

    // Vérification de la réussite du cast.
    if( laChaine && laChaine.eof() )
    {
        std::cout << argv[1]
            << std::endl;
        return EXIT_SUCCESS;
    }
    else
    {
        std::cerr << argv[1]
            << " Pas un entier."
            << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}
