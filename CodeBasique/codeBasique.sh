#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Mercredi 23 août[08] 2017

# Trouver les variables non sécurisé [^"]\$\{?[a-zA-Z0-9?*#][a-zA-Z0-9?*#_]*\}?[^"]?
# Trouver les variables qui ne sont pas entouré d'accolades \$[a-zA-Z0-9?*#][a-zA-Z0-9*?#_]*
# Arrête le script si une variable non initialisé est utilisée
set -u
# Équivalent à set -o errtrace pour s'assurer que les trap sont bien
# hérité dans les sous shell
set -E
# Permet de traiter les erreurs dans les pipeline avec la trap ERR
set -o pipefail
# Activation du mode verbose affiche la commande qui va être exécuté
#set -v
# Activation du mode xtrace affiche le résultat de chaque commande
#set -x
# Gestion des erreurs
trap 'ERREUR="${?}";
printf >&2 "\nErreur dans les définitions préliminaire ligne : ${LINENO}\n";
exit "${ERREUR}"' ERR

###############################################################################
#                   ___                             __                        #
#                  /   |  _________ ___  ____  ____/ /__  ___                 #
#                 / /| | / ___/ __ `__ \/ __ \/ __  / _ \/ _ \                #
#                / ___ |(__  ) / / / / / /_/ / /_/ /  __/  __/                #
#               /_/  |_/____/_/ /_/ /_/\____/\__,_/\___/\___/                 #
#                                                                             #
###############################################################################

#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#
#                                 nomscript.sh                                #
#                          écrit par : PIVARD Julien                          #
#                       contact : pivardjulien@gmail.com                      #
#                                date création                                #
#                                                                             #
#                               résumé vite fait                              #
#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

# Documentation                     #{{{
#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓#
#┃                                                                           ┃#
#┃           Explication sur le fonctionnement du script et son but          ┃#
#┃                    liste de paramètres de l'application                   ┃#
#┃       Option minimal                                                      ┃#
#┃  -    --------------------------------------------------                  ┃#
#┃       Options                                                             ┃#
#┃       -o une option sans arguments                                        ┃#
#┃       --orc                                                               ┃#
#┃       -u une option avec un argument                                      ┃#
#┃       --umbra                                                             ┃#
#┃       -h affiche l'aide                                                   ┃#
#┃       --help                                                              ┃#
#┃  -    --------------------------------------------------                  ┃#
#┃       Exemples d'utilisation :                                            ┃#
#┃           script -o                                                       ┃#
#┃           script --umbra=truc                                             ┃#
#┃                                                                           ┃#
#┃ Codes d'erreurs :                                                         ┃#
#┃     - 80  Erreur « afficher_erreur » nécessite au moins un argument       ┃#
#┃          Erreurs dans les options de la ligne de commande                 ┃#
#┃     - 81  l'option longue ne prend PAS d'argument                         ┃#
#┃     - 82  l'option longue nécessite un argument                           ┃#
#┃     - 83  l'option longue n'existe pas                                    ┃#
#┃     - 84  l'option nécessite un argument                                  ┃#
#┃     - 85  l'option n'existe pas                                           ┃#
#┃     - 86  des options qui sont invalides ont été donnée                   ┃#
#┃          Erreurs lors de l'exécution du code                              ┃#
#┃                                                                           ┃#
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛#

#}}}

# Vérifie la syntaxe : bash -n

#########################################
#{{{ Constante de sortie et d'erreur    #
#########################################
declare -r EXIT_SUCCES=0

declare -r E_ARG_AFF_ERR_M=80

declare -r E_ARG_SUPERFLUS_OPT_LONGUE=81
declare -r E_OPT_LONGUE_NECESSITE_ARG=82
declare -r E_OPT_LONGUE_INCONNUE=83
declare -r E_OPT_NECESSITE_ARG=84
declare -r E_OPT_INCONNUE=85
declare -r E_OPT_NON_TRAITEE=86


#}}}

#####################################
#  Fonction de gestion des signaux  # {{{
#####################################

# Réception d'un signal pour quitter l'app normalement
fin()
{
    exit
}

# Le script à été interrompu par l'utilisateur
interruption()
{
    exit
}

# Une erreur c'est produit durant l'exécution
gestion_erreurs()
{
    printf >&2 "\nLe script à subis une erreur ligne [ ${1} ]\n"
}

# On ferme le script. Cette fonction sera exécutée en dernière
nettoyage_fin_script()
{
    exit
}

# Le terminal qui a lancé le processus à été fermé
fermeture_terminal()
{
    exit
}

# }}}

###########################
# {{{ Attrape erreurs     #
###########################

# Permet de reste le signal d'erreur
trap ERR
trap 'ERREUR="${?}";
gestion_erreurs "${LINENO}";
exit "${ERREUR}"' ERR

# Gestion des interruption CTRL-C
trap 'interruption' INT

# Gestion de la fermeture du terminal
trap 'fermeture_terminal' HUP

# Gestion des autres signaux de fin
trap 'fin' QUIT TERM

# Sera toujours exécuté quand une instruction exit est rencontré
trap 'nettoyage_fin_script' EXIT

# }}}

#############################################
# {{{ Fonctions de gestions généraliste     #
#############################################

declare -i NB_COULEURS=0
declare -i NB_COLONNES=0
declare -i NB_LIGNES=0

which_cmd()
{
    which "${1}" 2>/dev/null || command -v "${1}" 2>/dev/null
}

test_cmd_exist()
{
    which_cmd "${1}" >/dev/null 2>&1 && return 0
    return 1
}

#}}}

######################################################
# {{{ Gestion du redimensionnement de la fenêtre     #
######################################################
maj_taille()
{
    if test_cmd_exist tput
    then
        NB_LIGNES=`tput lines`
        NB_COLONNES=`tput cols`
    else
        NB_LIGNES=-1
        NB_COLONNES=-1
    fi
}

maj_taille

trap 'maj_taille' WINCH

#}}}

####################################
# {{{  Définition des couleurs     #
####################################

NEUTRE=""
M_GRAS=""
D_SOUL=""
F_SOUL=""
INVERS=""
M__DIM=""

# Création des couleurs du front et du back
declare -a COULEURS=()
# Vérification de l'existence de la commande tput           #{{{
if test_cmd_exist tput
then

    if [[ `tput colors 2>/dev/null` -ge 8 ]]
    then
        declare -r NB_COULEURS=`tput colors`
    else
        declare -r NB_COULEURS=0
    fi

    declare -r NEUTRE="`tput sgr 0`"

    declare -r M_GRAS="`tput bold`"

    declare -r D_SOUL="`tput smul`"
    declare -r F_SOUL="`tput rmul`"

    declare -r INVERS="`tput rev`"

    declare -r M__DIM="`tput dim`"

    declare -i POSITION=0
    for i in 'f' 'b'
    do
        COMM="tput seta${i}"
        for j in `seq 0 15`
        do
            COULEURS[$((j + POSITION))]="`${COMM} ${j}`"
        done
        POSITION=$((POSITION + 16))
    done

else

    for i in `seq 0 31`
    do
        COULEURS[${i}]=""
    done

fi

#}}}

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
# L'argument 1 affiche le texte en rouge
# L'argument 2 est fait pour afficher le contenu d'une variable
# L'argument 3 affiche le texte en rouge à la suite de l'argument 2
afficher_erreur()
{
    [[ -n "${1}" ]] && local AFFICHAGE="${1}" || exit "${E_ARG_AFF_ERR_M}"
    if [[ "${#}" -ge 2 ]]
    then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${2}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ "${#}" -ge 3 ]] && AFFICHAGE="${AFFICHAGE}${3}"
    if [[ "${#}" -ge 4 ]]
    then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${4}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ "${#}" -ge 5 ]] && AFFICHAGE="${AFFICHAGE}${5}"
    printf >&2 "${NEUTRE}${C__ROUGE}${AFFICHAGE}${NEUTRE}\n"
}

#}}}

# Une erreur c'est produit durant l'exécution
gestion_err_couleur()
{
    afficher_erreur "\nLe script à subis une erreur ligne" "${1}"
}

trap ERR
trap 'ERREUR="${?}";
gestion_err_couleur "${LINENO}";
exit "${ERREUR}"' ERR

# }}}

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
# {{{                   Code                       #
####################################################

afficher_aide()
{
    declare -r NOM_SCRIPT=`basename "${0}"`
    printf "${NOM_SCRIPT} [-h]\n"
    printf "    -h --help\n        Affiche l'aide et quitte\n"
}

traitement_option_o()
{
    printf "Option o\n"
}

traitement_option_u()
{
    local ARGUMENT="${1}"
    printf "Option u = ${ARGUMENT}\n"
}

# }}}

####################################################
# {{{            Gestion des options               #
####################################################

#  Affiche l'aide si aucun arguments n'est donné
if [[ "${#}" -eq 0 ]]
then
    printf "${C_SUR__JAUNE} ${C___NOIR}Afficher l'aide ${NEUTRE}\n"
    afficher_aide
    exit "${EXIT_SUCCES}";
fi

# option o ne nécessite pas d'arguments en plus u si.
# Le premier : permet de gérer manuellement les erreurs
while getopts ":hou:-:" option
do
    case "${option}" in
        o)
            traitement_option_o
            ;;
        u)
            traitement_option_u "${OPTARG}"
            ;;
        h)
            afficher_aide
            exit "${EXIT_SUCCES}"
            ;;
        -)
            LONG_OPTARG="${OPTARG#*=}"
            case "${OPTARG}" in
                orc )
                    traitement_option_o
                    ;;
                umbra=?* )
                    traitement_option_u "${LONG_OPTARG}"
                    ;;
                help )
                    afficher_aide
                    exit "${EXIT_SUCCES}"
                    ;;
                orc* | help* )
                    afficher_erreur "L'option longue" "--${OPTARG}" "ne prend pas d'arguments."
                    afficher_aide
                    exit "${E_ARG_SUPERFLUS_OPT_LONGUE}"
                    ;;
                umbra* )
                    afficher_erreur "L'option longue" "--${OPTARG}" "nécessite un argument."
                    afficher_aide
                    exit "${E_OPT_LONGUE_NECESSITE_ARG}"
                    ;;
                *)
                    afficher_erreur "L'option longue" "--${OPTARG}" "n'existe pas !"
                    afficher_aide
                    exit "${E_OPT_LONGUE_INCONNUE}"
                    ;;
            esac
            ;;
        :)
            afficher_erreur "L'option" "${OPTARG}" "nécessite un argument."
            afficher_aide
            exit "${E_OPT_NECESSITE_ARG}"
            ;;
        ?)
            afficher_erreur "L'option" "${OPTARG}" "n'existe pas."
            afficher_aide
            exit "${E_OPT_INCONNUE}"
            ;;
    esac
done

# Vérifie que toutes les options ont été traitées
# OPTIND indique la position de l'argument suivant à traiter par getopt
shift $((OPTIND-1))
# Si toutes les options n'ont pas été traitée on affiche une erreur
if [[ "${#}" -ne 0 ]]
then
    afficher_erreur "Le ou Les arguments suivant ne sont pas valide :" "${*}"
    afficher_aide
    exit "${E_OPT_NON_TRAITEE}"
fi

# }}}

###################################################
#                   Exécution                     #
###################################################


exit "${EXIT_SUCCES}";
