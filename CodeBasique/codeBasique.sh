#! /bin/bash
# Changer les droits avec chmod u+x fichier

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#
#                                   #
#     AUTEUR : PIVARD Julien        #
#                                   #
#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

# Dernière modification : mercredi 08 juin[06] 2016

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

# Couleurs normale
declare -r noir='\e[0;30m'         # Noir
declare -r rouge='\e[0;31m'        # Rouge
declare -r vert='\e[0;32m'         # Vert
declare -r jaune='\e[0;33m'        # Jaune
declare -r bleu='\e[0;34m'         # Bleu
declare -r violet='\e[0;35m'       # Violet
declare -r cyan='\e[0;36m'         # Cyan
declare -r blanc='\e[0;37m'        # Blanc

# Gras
declare -r gnoir='\e[1;30m'        # Noir
declare -r grouge='\e[1;31m'       # Rouge
declare -r gvert='\e[1;32m'        # Vert
declare -r gjaune='\e[1;33m'       # Jaune
declare -r gbleu='\e[1;34m'        # Bleu
declare -r gviolet='\e[1;35m'      # Violet
declare -r gcyan='\e[1;36m'        # Cyan
declare -r gblanc='\e[1;37m'       # Blanc

# souligné
declare -r snoir='\e[4;30m'        # Noir
declare -r srouge='\e[4;31m'       # Rouge
declare -r svert='\e[4;32m'        # Vert
declare -r sjaune='\e[4;33m'       # Jaune
declare -r sbleu='\e[4;34m'        # Bleu
declare -r sviolet='\e[4;35m'      # Violet
declare -r scyan='\e[4;36m'        # Cyan
declare -r sblanc='\e[4;37m'       # Blanc

# Couleur de fond
declare -r sur_noir='\e[40m'       # Noir
declare -r sur_rouge='\e[41m'      # Rouge
declare -r sur_vert='\e[42m'       # Vert
declare -r sur_jaune='\e[43m'      # Jaune
declare -r sur_bleu='\e[44m'       # Bleu
declare -r sur_violet='\e[45m'     # Violet
declare -r sur_cyan='\e[46m'       # Cyan
declare -r sur_blanc='\e[47m'      # Blanc

# Haute intensité
declare -r inoir='\e[0;90m'        # Noir
declare -r irouge='\e[0;91m'       # Rouge
declare -r ivert='\e[0;92m'        # Vert
declare -r ijaune='\e[0;93m'       # Jaune
declare -r ibleu='\e[0;94m'        # Bleu
declare -r iviolet='\e[0;95m'      # Violet
declare -r icyan='\e[0;96m'        # Cyan
declare -r iblanc='\e[0;97m'       # Blanc

# Gras haute intensité
declare -r ginoir='\e[1;90m'       # Noir
declare -r girouge='\e[1;91m'      # Rouge
declare -r givert='\e[1;92m'       # Vert
declare -r gijaune='\e[1;93m'      # Jaune
declare -r gibleu='\e[1;94m'       # Bleu
declare -r giviolet='\e[1;95m'     # Violet
declare -r gicyan='\e[1;96m'       # Cyan
declare -r giblanc='\e[1;97m'      # Blanc

# Couleur de fond haute intensité
declare -r sur_inoir='\e[0;100m'   # Noir
declare -r sur_irouge='\e[0;101m'  # Rouge
declare -r sur_ivert='\e[0;102m'   # Vert
declare -r sur_ijaune='\e[0;103m'  # Jaune
declare -r sur_ibleu='\e[0;104m'   # Bleu
declare -r sur_iviolet='\e[0;105m' # Violet
declare -r sur_icyan='\e[0;106m'   # Cyan
declare -r sur_iblanc='\e[0;107m'  # Blanc

declare -r neutre='\e[0;m'

#####################################
#  Fonction de gestion des signaux  #
#####################################

nettoyage()
{
    printf "\n${rouge}Le script à subi une interruption.${neutre}\n" >&2
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
            printf "${rouge}L'option [ ${gviolet} $OPTARG ${rouge} ] nécessite un argument.${neutre}\n" >&2
            exit 101
            ;;
        ?)
            printf "${rouge}L'option [ ${gviolet} $OPTARG ${rouge} ] n'existe pas.${neutre}\n" >&2
            exit 102
            ;;
    esac
done

###################################################
#                   Exécution                     #
###################################################


exit 0;
