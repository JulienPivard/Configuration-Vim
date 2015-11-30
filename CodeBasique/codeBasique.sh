#! /bin/bash
# Changer les droits avec chmod u+x fichier

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#
#                                   #
#     AUTEUR : PIVARD Julien        #
#                                   #
#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

#########################
#       Debogage        #
#########################
# Dit tout : bash -V
# Vérifie la syntaxe : bash -n

#########################
#  Gestion des signaux  #
#########################

trap 'nettoyage' 2 3 15

####################################
#      Définition des couleurs     #
####################################

noir='\e[0;30m'
gris='\e[1;30m'
rouge='\e[0;31m'
rose='\e[1;31m'
vert='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleu='\e[0;34m'
bleuclair='\e[1;34m'
violet='\e[0;35m'
magenta='\e[1;35m'
cyan='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'

neutre='\e[0;m'

#####################################
#  Fonction de gestion des signaux  #
#####################################

nettoyage()
{
    echo -e "\n${rouge}Le script à subi une interruption.${neutre}" >&2
    exit $?
}

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
#                       Code                       #
####################################################



####################################################
#                Gestion des options               #
####################################################

# option o ne nécessite pas d'arguments en plus u si.
# Le premier : permet de gérer manuellement les erreurs
while getopts ":ou:" option
do
    case $option in
        o)
            echo "option o"
            ;;
        u)
            echo "$OPTARG"
            ;;
        :)
            echo -e "${rouge}L'option [ ${magenta} $OPTARG ${rouge} ] nécessite un argument.${neutre}" >&2
            exit 101
            ;;
        ?)
            echo -e "${rouge}L'option [ ${magenta} $OPTARG ${rouge} ] n'existe pas.${neutre}" >&2
            exit 102
            ;;
    esac
done

###################################################
#                   Exécution                     #
###################################################


exit 0;
