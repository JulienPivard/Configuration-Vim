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
noir='\e[0;30m'         # Noir
rouge='\e[0;31m'        # Rouge
vert='\e[0;32m'         # Vert
jaune='\e[0;33m'        # Jaune
bleu='\e[0;34m'         # Bleu
violet='\e[0;35m'       # Violet
cyan='\e[0;36m'         # Cyan
blanc='\e[0;37m'        # Blanc

# Gras
gnoir='\e[1;30m'        # Noir
grouge='\e[1;31m'       # Rouge
gvert='\e[1;32m'        # Vert
gjaune='\e[1;33m'       # Jaune
gbleu='\e[1;34m'        # Bleu
gviolet='\e[1;35m'      # Violet
gcyan='\e[1;36m'        # Cyan
gblanc='\e[1;37m'       # Blanc

# souligné
snoir='\e[4;30m'        # Noir
srouge='\e[4;31m'       # Rouge
svert='\e[4;32m'        # Vert
sjaune='\e[4;33m'       # Jaune
sbleu='\e[4;34m'        # Bleu
sviolet='\e[4;35m'      # Violet
scyan='\e[4;36m'        # Cyan
sblanc='\e[4;37m'       # Blanc

# Couleur de fond
sur_noir='\e[40m'       # Noir
sur_rouge='\e[41m'      # Rouge
sur_vert='\e[42m'       # Vert
sur_jaune='\e[43m'      # Jaune
sur_bleu='\e[44m'       # Bleu
sur_violet='\e[45m'     # Violet
sur_cyan='\e[46m'       # Cyan
sur_blanc='\e[47m'      # Blanc

# Haute intensité
inoir='\e[0;90m'        # Noir
irouge='\e[0;91m'       # Rouge
ivert='\e[0;92m'        # Vert
ijaune='\e[0;93m'       # Jaune
ibleu='\e[0;94m'        # Bleu
iviolet='\e[0;95m'      # Violet
icyan='\e[0;96m'        # Cyan
iblanc='\e[0;97m'       # Blanc

# Gras haute intensité
ginoir='\e[1;90m'       # Noir
girouge='\e[1;91m'      # Rouge
givert='\e[1;92m'       # Vert
gijaune='\e[1;93m'      # Jaune
gibleu='\e[1;94m'       # Bleu
giviolet='\e[1;95m'     # Violet
gicyan='\e[1;96m'       # Cyan
giblanc='\e[1;97m'      # Blanc

# Couleur de fond haute intensité
sur_inoir='\e[0;100m'   # Noir
sur_irouge='\e[0;101m'  # Rouge
sur_ivert='\e[0;102m'   # Vert
sur_ijaune='\e[0;103m'  # Jaune
sur_ibleu='\e[0;104m'   # Bleu
sur_iviolet='\e[0;105m' # Violet
sur_icyan='\e[0;106m'   # Cyan
sur_iblanc='\e[0;107m'  # Blanc

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
            echo -e "${rouge}L'option [ ${violet} $OPTARG ${rouge} ] nécessite un argument.${neutre}" >&2
            exit 101
            ;;
        ?)
            echo -e "${rouge}L'option [ ${violet} $OPTARG ${rouge} ] n'existe pas.${neutre}" >&2
            exit 102
            ;;
    esac
done

###################################################
#                   Exécution                     #
###################################################


exit 0;
