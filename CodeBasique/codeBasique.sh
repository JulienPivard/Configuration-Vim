#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Vendredi 28 avril[04] 2017

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#
#                                 nomscript.sh                                #
#                          écrit par : PIVARD Julien                          #
#                                date création                                #
#                                                                             #
#                               résumé vite fait                              #
#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓#
#┃                                                                           ┃#
#┃           Explication sur le fonctionnement du script et son but          ┃#
#┃                    liste de paramètres de l'application                   ┃#
#┃                                                                           ┃#
#┃ Codes d'erreurs : 101 l'option nécessite un argument                      ┃#
#┃                   102 l'option n'existe pas                               ┃#
#┃                   103 des options qui invalides ont été donnée            ┃#
#┃                   104 pas d'argument pour l'option longue                 ┃#
#┃                   105 l'option longue nécessite un argument               ┃#
#┃                   106 l'option longue n'existe pas                        ┃#
#┃                   107 Erreur d'utilisation de afficher_erreur             ┃#
#┃                                                                           ┃#
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛#

#########################
#       Debogage        #
#########################
# Vérifie la syntaxe : bash -n

#########################
#  Gestion des signaux  #
#########################

trap 'nettoyage' INT QUIT TERM

# Gestion du redimensionnement de la fenêtre
trap 'maj_taille' WINCH

####################################
# {{{  Définition des couleurs     #
####################################

declare -r NEUTRE=`tput sgr0`

declare -r M_GRAS=`tput bold`

declare -r D_SOUL=`tput smul`
declare -r F_SOUL=`tput rmul`

declare -r INVERS=`tput rev`

# Active la coloration du texte en premier ou en arrière plan
couleur_back_et_front()
{
    [[ -n $1 ]] || exit 111
    [[ -n $2 ]] || exit 112

    [[ $1 =~ ([0-9]+) && $1 -lt 256 ]] && local -r NUM_COULEUR=$1 || exit 113
    [[ $2 == 'b' || $2 == 'f' ]] && local -r PLAN_COULEUR=$2 || exit 114

    declare -r D_COUL='tput seta'

    printf `${D_COUL}${PLAN_COULEUR} $NUM_COULEUR`
}

declare -a COULEURS=()

POSITION=0
for i in f b; do
    for j in `seq 0 15`; do
        COULEURS[$((j + POSITION))]="$(couleur_back_et_front $j $i)"
    done
    POSITION=$((POSITION + 16))
done

# Couleurs normale                          #{{{
declare -r C___NOIR="${COULEURS[0]}"        # Noir
declare -r C__ROUGE="${COULEURS[1]}"        # Rouge
declare -r C___VERT="${COULEURS[2]}"        # Vert
declare -r C__JAUNE="${COULEURS[3]}"        # Jaune
declare -r C___BLEU="${COULEURS[4]}"        # Bleu
declare -r C_VIOLET="${COULEURS[5]}"        # Violet
declare -r C___CYAN="${COULEURS[6]}"        # Cyan
declare -r C__BLANC="${COULEURS[7]}"        # Blanc

#}}}

# Haute intensité                           #{{{
declare -r C___INOIR="${COULEURS[8]}"       # Noir
declare -r C__IROUGE="${COULEURS[9]}"       # Rouge
declare -r C___IVERT="${COULEURS[10]}"      # Vert
declare -r C__IJAUNE="${COULEURS[11]}"      # Jaune
declare -r C___IBLEU="${COULEURS[12]}"      # Bleu
declare -r C_IVIOLET="${COULEURS[13]}"      # Violet
declare -r C___ICYAN="${COULEURS[14]}"      # Cyan
declare -r C__IBLANC="${COULEURS[15]}"      # Blanc

#}}}

# Couleur de fond                           #{{{
declare -r C_SUR___NOIR="${COULEURS[16]}"   # Noir
declare -r C_SUR__ROUGE="${COULEURS[17]}"   # Rouge
declare -r C_SUR___VERT="${COULEURS[18]}"   # Vert
declare -r C_SUR__JAUNE="${COULEURS[19]}"   # Jaune
declare -r C_SUR___BLEU="${COULEURS[20]}"   # Bleu
declare -r C_SUR_VIOLET="${COULEURS[21]}"   # Violet
declare -r C_SUR___CYAN="${COULEURS[22]}"   # Cyan
declare -r C_SUR__BLANC="${COULEURS[23]}"   # Blanc

#}}}

# Couleur de fond haute intensité           #{{{
declare -r C_SUR___INOIR="${COULEURS[24]}"  # Noir
declare -r C_SUR__IROUGE="${COULEURS[25]}"  # Rouge
declare -r C_SUR___IVERT="${COULEURS[26]}"  # Vert
declare -r C_SUR__IJAUNE="${COULEURS[27]}"  # Jaune
declare -r C_SUR___IBLEU="${COULEURS[28]}"  # Bleu
declare -r C_SUR_IVIOLET="${COULEURS[29]}"  # Violet
declare -r C_SUR___ICYAN="${COULEURS[30]}"  # Cyan
declare -r C_SUR__IBLANC="${COULEURS[31]}"  # Blanc

#}}}

# Affichage simplifié des erreurs           #{{{
afficher_erreur()
{
    [[ -n $1 ]] && local AFFICHAGE=$1 || exit 107
    if [[ -n $2 ]]; then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}$2"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ -n $3 ]] && AFFICHAGE="${AFFICHAGE}$3"
    printf "${NEUTRE}${C__ROUGE}${AFFICHAGE}${NEUTRE}\n" >&2
}

#}}}

# }}}

#####################################
#  Fonction de gestion des signaux  # {{{
#####################################

nettoyage()
{
    afficher_erreur "Le script à subi une interruption."
    exit $?
}

maj_taille()
{
    NB_LIGNES=`tput lines`
    NB_COLONE=`tput cols`
}

# }}}

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
# {{{                   Code                       #
####################################################


afficherAide()
{
    printf "Liste des commandes et des exemples\n"
}

# }}}

####################################################
# {{{            Gestion des options               #
####################################################

#  Affiche l'aide si aucun arguments de donné
if [[ $# -eq 0 ]] ; then
    printf "${C_SUR__JAUNE} ${C___NOIR}Afficher l'aide ${NEUTRE}\n"
    afficherAide
    exit 0;
fi

# option o ne nécessite pas d'arguments en plus u si.
# Le premier : permet de gérer manuellement les erreurs
while getopts ":ou:-:" option
do
    case $option in
        o)
            echo "Option o"
            ;;
        u)
            echo "Option u = $OPTARG"
            ;;
        -)
            LONG_OPTARG="${OPTARG#*=}"
            case $OPTARG in
                orc )
                    echo "Option orc"
                    ;;
                umbra=?* )
                    echo "Option umbra = $LONG_OPTARG"
                    ;;
                orc* )
                    afficher_erreur "L'option longue" "--$OPTARG" "ne prend pas d'arguments."
                    afficherAide
                    exit 104
                    ;;
                umbra* )
                    afficher_erreur "L'option longue" "--$OPTARG" "nécessite un argument."
                    afficherAide
                    exit 105
                    ;;
                *)
                    afficher_erreur "L'option longue" "--$OPTARG" "n'existe pas !"
                    afficherAide
                    exit 106
                    ;;
            esac
            ;;
        :)
            afficher_erreur "L'option" "$OPTARG" "nécessite un argument."
            afficherAide
            exit 101
            ;;
        ?)
            afficher_erreur "L'option" "$OPTARG" "n'existe pas."
            afficherAide
            exit 102
            ;;
    esac
done

#  Vérifie que toutes les options ont été traitées
shift $((OPTIND-1))
if [[ $# -ne 0 ]] ; then
    afficher_erreur "Les arguments suivant ne sont pas valide :" "$*"
    afficherAide
    exit 103
fi

# }}}

###################################################
#                   Exécution                     #
###################################################


exit 0;
