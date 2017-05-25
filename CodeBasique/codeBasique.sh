#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Samedi 20 mai[05] 2017

# Arrête le script si une variable non initialisé est utilisée
set -u
# Équivalent à set -o errtrace pour s'assurer que les trap sont bien
# hérité dans les sous shell
set -E
# Permet de traiter les erreurs dans les pipeline avec la trap ERR
set -o pipefail

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
#┃  -    --------------------------------------------------                  ┃#
#┃       Exemples d'utilisation :                                            ┃#
#┃           script -o                                                       ┃#
#┃           script --umbra=truc                                             ┃#
#┃                                                                           ┃#
#┃ Codes d'erreurs :                                                         ┃#
#┃          Erreur de la fonction « couleur_back_et_front »                  ┃#
#┃     - 80 Oubli argument 1 de la fonction couleur_back_et_front            ┃#
#┃     - 81 Oubli argument 2 de la fonction couleur_back_et_front            ┃#
#┃     - 82 La valeur de l'argument 1 n'est pas entre 0 et 255 inclus        ┃#
#┃     - 83 La valeur de l'argument 2 n'est pas f ou b                       ┃#
#┃          Fin des erreurs de la fonction                                   ┃#
#┃     - 84  Erreur afficher_erreur nécessite au moins un argument           ┃#
#┃          Erreurs dans les options de la ligne de commande                 ┃#
#┃     - 85  l'option longue ne prend PAS d'argument                         ┃#
#┃     - 86  l'option longue nécessite un argument                           ┃#
#┃     - 87  l'option longue n'existe pas                                    ┃#
#┃     - 88  l'option nécessite un argument                                  ┃#
#┃     - 89  l'option n'existe pas                                           ┃#
#┃     - 90  des options qui sont invalides ont été donnée                   ┃#
#┃          Erreurs lors de l'exécution du code                              ┃#
#┃                                                                           ┃#
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛#

#}}}

# Vérifie la syntaxe : bash -n

#########################################
#{{{ Constante de sortie et d'erreur    #
#########################################
declare -r EXIT_SUCCES=0
declare -r E_ARG1_MANQUANT=80
declare -r E_ARG2_MANQUANT=81
declare -r E_ARG1_INTERVAL=82
declare -r E_ARG2_INTERVAL=83

declare -r E_ARG_AFF_ERR_M=84

declare -r E_ARG_SUPERFLUS_OPT_LONGUE=85
declare -r E_OPT_LONGUE_NECESSITE_ARG=86
declare -r E_OPT_LONGUE_INCONNUE=87
declare -r E_OPT_NECESSITE_ARG=88
declare -r E_OPT_INCONNUE=89
declare -r E_OPT_NON_TRAITEE=90


#}}}

###########################
# {{{ Attrape erreurs     #
###########################

# Gestion des interruption CTRL-C
trap 'interruption' INT

# Gestion de la fermeture du terminal
trap 'fermeture_terminal' HUP

# Gestion des autres signaux de fin
trap 'fin' QUIT TERM

# Gestion des erreurs
trap 'ERREUR="${?}"; gestion_erreurs "${LINENO}"; exit "${ERREUR}"' ERR

# Sera toujours exécuté quand une instruction exit est rencontré
trap 'nettoyage_fin_script' EXIT

# }}}

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
    printf >&2 "Le script à subis une erreur ligne [ ${1} ]\n"
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

#############################################
# {{{ Fonctions de gestions généraliste     #
#############################################

declare -i NB_COULEURS=0
declare -i NB_COLONE=0
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
trap 'maj_taille' WINCH

maj_taille()
{
    if test_cmd_exist tput; then
        NB_LIGNES=`tput lines`
        NB_COLONE=`tput cols`
    else
        NB_LIGNES=-1
        NB_COLONE=-1
    fi
}

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

# Active la coloration du texte en premier ou en arrière plan
couleur_back_et_front()
{
    [[ -n "${1}" ]] || exit "${E_ARG1_MANQUANT}"
    [[ -n "${2}" ]] || exit "${E_ARG2_MANQUANT}"

    [[ "${1}" =~ ([0-9]+) && "${1}" -ge 0 ]] && local -r NUM_COULEUR="${1}" || exit "${E_ARG1_INTERVAL}"
    [[ "${2}" == 'b' || "${2}" == 'f' ]] && local -r PLAN_COULEUR="${2}" || exit "${E_ARG2_INTERVAL}"

    declare -r D_COUL='tput seta'

    if [[ "${1}" -lt "${NB_COULEURS}" ]]; then
        printf "`${D_COUL}${PLAN_COULEUR} ${NUM_COULEUR}`"
    else
        printf ""
    fi
}

# Vérification de l'existence de la commande tput           #{{{
if test_cmd_exist tput; then

    if [[ `tput colors 2>/dev/null` -ge 8 ]]; then
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

fi

#}}}

# Création des couleurs du front et du back
declare -i POSITION=0
declare -a COULEURS=()
for i in 'f' 'b'; do
    for j in `seq 0 15`; do
        COULEURS[$((j + POSITION))]="`couleur_back_et_front $j $i`"
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
# L'argument 1 affiche le texte en rouge
# L'argument 2 est fait pour afficher le contenu d'une variable
# L'argument 3 affiche le texte en rouge à la suite de l'argument 2
afficher_erreur()
{
    [[ -n "${1}" ]] && local AFFICHAGE="${1}" || exit "${E_ARG_AFF_ERR_M}"
    if [[ "${#}" -ge 2 ]]; then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${2}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ "${#}" -ge 3 ]] && AFFICHAGE="${AFFICHAGE}${3}"
    if [[ "${#}" -ge 4 ]]; then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${4}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ "${#}" -ge 5 ]] && AFFICHAGE="${AFFICHAGE}${5}"
    printf >&2 "${NEUTRE}${C__ROUGE}${AFFICHAGE}${NEUTRE} ${*}\n"
}

#}}}

# }}}

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
# {{{                   Code                       #
####################################################

afficher_aide()
{
    printf "Liste des commandes et des exemples\n"
}

traitement_option_o()
{
    echo "Option o"
}

traitement_option_u()
{
    local ARGUMENT="${1}"
    echo "Option u = ${ARGUMENT}"
}

# }}}

####################################################
# {{{            Gestion des options               #
####################################################

#  Affiche l'aide si aucun arguments n'est donné
if [[ "${#}" -eq 0 ]]; then
    printf "${C_SUR__JAUNE} ${C___NOIR}Afficher l'aide ${NEUTRE}\n"
    afficher_aide
    exit "${EXIT_SUCCES}";
fi

# option o ne nécessite pas d'arguments en plus u si.
# Le premier : permet de gérer manuellement les erreurs
while getopts ":ou:-:" option
do
    case ${option} in
        o)
            traitement_option_o
            ;;
        u)
            traitement_option_u "${OPTARG}"
            ;;
        -)
            LONG_OPTARG="${OPTARG#*=}"
            case ${OPTARG} in
                orc )
                    traitement_option_o
                    ;;
                umbra=?* )
                    traitement_option_u "${LONG_OPTARG}"
                    ;;
                orc* )
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
if [[ "${#}" -ne 0 ]] ; then
    afficher_erreur "Les arguments suivant ne sont pas valide :" "${*}"
    afficher_aide
    exit "${E_OPT_NON_TRAITEE}"
fi

# }}}

###################################################
#                   Exécution                     #
###################################################


exit "${EXIT_SUCCES}";
