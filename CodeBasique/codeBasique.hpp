/**
 * @file MANOUVELLECLASSE.hpp
 * @brief header.
 * @author PIVARD Julien
 *
 * Header pour le fichier MANOUVELLECLASSE.cpp.
 * Définit la classe MANOUVELLECLASSE.
 * */


#ifndef VARIABLE_A_CHANGER
#define VARIABLE_A_CHANGER

/**
 * @namespace BIDULE
 * */
namespace BIDULE
{

    /**
     * @class MANOUVELLECLASSE MANOUVELLECLASSE.hpp
     * @brief Un résumé de la classe.
     *
     * Déclaration de la classe MANOUVELLECLASSE.
     * */
    class MANOUVELLECLASSE
    {

        public:

            /**
             * Constructeur logique
             * */
            MANOUVELLECLASSE();

            /**
             * Constructeur logique
             *
             * @param[in] autre
             * Le blabla qui vas bien.
             * */
            MANOUVELLECLASSE( const MANOUVELLECLASSE & autre );

            /**
             * Constructeur via l'opérateur =
             *
             * @param[in] autre
             * L'objet de même classe à partir duquel on veut construire.
             * */
            MANOUVELLECLASSE & operator= ( const MANOUVELLECLASSE & autre );

            /**
             * Destructeur de la MANOUVELLECLASSE.
             * */
            ~MANOUVELLECLASSE();

        protected:

            /**
             * Une variable.
             * */
            int var;

    };

}

#endif
