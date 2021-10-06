#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Mercredi 06 octobre[10] 2021

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
#                               Licence : GPLv3                               #
#                                                                             #
#                               résumé vite fait                              #
#(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)(=^.^=)#

# Documentation                                 #{{{1
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
#┃       -m une option qui peut être appelée de multiple fois                ┃#
#┃       --multiple                                                          ┃#
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

#}}}1

# Options comportementales                      #{{{1
# Arrête le script si une variable non initialisé est utilisée
set -u
# Équivalent à set -o errtrace pour s'assurer que les trap sont bien
# hérité dans les sous shell
set -E
# Permet de traiter les erreurs dans les pipeline avec la trap ERR
set -o pipefail
set -o posix
# Activation du mode verbose affiche la commande qui va être exécuté
#set -v
# Activation du mode xtrace affiche le résultat de chaque commande
#set -x
# Gestion des erreurs
trap 'ERREUR="${?}";
printf >&2 "\n%s\n" "Erreur dans les définitions préliminaire ligne : ${LINENO}";
exit "${ERREUR}";' ERR

# On s'assure que l'UID existe bien
[[ -z "${UID}" ]] && UID="$(id -u)"

#}}}1

####################################################
#    Fonctions généralistes et configuration    #{{{1
####################################################

#        Constante de sortie et d'erreur        #{{{2
####################################################

declare -ri EXIT_SUCCES=0

declare -ri E_ARG_AFF_ERR_M=80

declare -ri E_ARG_SUPERFLUS_OPT_LONGUE=81
declare -ri E_OPT_LONGUE_NECESSITE_ARG=82
declare -ri E_OPT_LONGUE_INCONNUE=83
declare -ri E_OPT_NECESSITE_ARG=84
declare -ri E_OPT_INCONNUE=85
declare -ri E_OPT_NON_TRAITEE=86


    #}}}2

#       Fonctions de gestions généraliste       #{{{2
####################################################

declare -i NB_COULEURS=0 NB_COLONNES=0 NB_LIGNES=0

# which_cmd                         #{{{3
function which_cmd ()
{
    which "${1}" 2>/dev/null || command -v "${1}" 2>/dev/null
}

        #}}}3

# test_cmd_exist                    #{{{3
function test_cmd_exist ()
{
    which_cmd "${1}" >/dev/null 2>&1 && return 0 || return 1
}

        #}}}3

    #}}}2

#    Attrape signaux et fonctions de gestion    #{{{2
####################################################

# fin                               #{{{3
function fin ()
{
    exit;
}
# Réception d'un signal pour quitter l'app normalement
# Gestion des autres signaux de fin
trap 'fin' QUIT TERM

        #}}}3

# interruption                      #{{{3
function interruption ()
{
    exit;
}
# Le script à été interrompu par l'utilisateur avec CTRL-C
trap 'interruption' INT

        #}}}3

# gestion_erreurs                   #{{{3
function gestion_erreurs ()
{
    printf >&2 '\n%s\n' "Le script à subis une erreur ligne [ ${1} ]"
}
# Une erreur c'est produit durant l'exécution
trap '' ERR
trap 'ERREUR="${?}";
gestion_erreurs "${LINENO}";
exit "${ERREUR}";' ERR

        #}}}3

# nettoyage_fin_script              #{{{3
declare FICHIER_LOG_EXECUTION='/dev/null'

declare -i ERREUR=0

function nettoyage_fin_script ()
{
    printf >>"${FICHIER_LOG_EXECUTION}" '%s\n\n' "Exit ${?}"
    # On rend le curseur à nouveau visible
    test_cmd_exist tput && tput cnorm
    # Si une erreur survient on affiche l'avortement du script
    if [[ "${ERREUR}" -ne 0 ]]
    then
        test_cmd_exist separateur_section && separateur_section 'Avortement du script'
    fi
    exit;
}
# On ferme le script à la rencontre d'un exit.
# Sera toujours exécutée en dernière
trap 'nettoyage_fin_script' EXIT

        #}}}3

# fermeture_terminal                #{{{3
function fermeture_terminal ()
{
    exit;
}
# Le terminal qui a lancé le processus à été fermé
trap 'fermeture_terminal' HUP

        #}}}3

    #}}}2

#  Gestion du redimensionnement  de la fenêtre  #{{{2
####################################################

# maj_taille                        #{{{3
function maj_taille ()
{
    if test_cmd_exist tput
    then
        NB_LIGNES=`tput lines` NB_COLONNES=`tput cols`
    else
        NB_LIGNES=-1 NB_COLONNES=-1
    fi
}

        #}}}3

maj_taille
trap 'maj_taille' WINCH

    #}}}2

#            Définition des couleurs            #{{{2
####################################################

NEUTRE='' M_GRAS='' D_SOUL='' F_SOUL='' INVERS='' M__DIM=''

# Vérification de l'existence de la commande tput   #{{{3
if test_cmd_exist tput
then
    [[ `tput colors 2>/dev/null` -ge 8 ]] &&
        declare -ri NB_COULEURS=`tput colors` || declare -ri NB_COULEURS=0

    declare -r NEUTRE="`tput sgr 0`" M_GRAS="`tput bold`" D_SOUL="`tput smul`"
    declare -r F_SOUL="`tput rmul`"  INVERS="`tput rev`"  M__DIM="`tput dim`"
else
    declare -ri NB_COULEURS=0
fi

        #}}}3

# Définition des couleurs                           #{{{3
if [[ "${NB_COULEURS}" -gt 0 ]]
then
    declare -r C___NOIR="`tput setaf 0`" C__ROUGE="`tput setaf 1`"
    declare -r C___VERT="`tput setaf 2`" C__JAUNE="`tput setaf 3`"
    declare -r C___BLEU="`tput setaf 4`" C_VIOLET="`tput setaf 5`"
    declare -r C___CYAN="`tput setaf 6`" C__BLANC="`tput setaf 7`"

    declare -r C___INOIR="`tput setaf 8`"  C__IROUGE="`tput setaf 9`"
    declare -r C___IVERT="`tput setaf 10`" C__IJAUNE="`tput setaf 11`"
    declare -r C___IBLEU="`tput setaf 12`" C_IVIOLET="`tput setaf 13`"
    declare -r C___ICYAN="`tput setaf 14`" C__IBLANC="`tput setaf 15`"

    declare -r C_SUR___NOIR="`tput setab 0`" C_SUR__ROUGE="`tput setab 1`"
    declare -r C_SUR___VERT="`tput setab 2`" C_SUR__JAUNE="`tput setab 3`"
    declare -r C_SUR___BLEU="`tput setab 4`" C_SUR_VIOLET="`tput setab 5`"
    declare -r C_SUR___CYAN="`tput setab 6`" C_SUR__BLANC="`tput setab 7`"

    declare -r C_SUR___INOIR="`tput setab 8`" C_SUR__IROUGE="`tput setab 9`"
    declare -r C_SUR___IVERT="`tput setab 10`" C_SUR__IJAUNE="`tput setab 11`"
    declare -r C_SUR___IBLEU="`tput setab 12`" C_SUR_IVIOLET="`tput setab 13`"
    declare -r C_SUR___ICYAN="`tput setab 14`" C_SUR__IBLANC="`tput setab 15`"
else
    # Les couleurs sont mises à vide si tput n'est pas installé
    declare -r C___NOIR='' C__ROUGE='' C___VERT='' C__JAUNE=''
    declare -r C___BLEU='' C_VIOLET='' C___CYAN='' C__BLANC=''

    declare -r C___INOIR='' C__IROUGE='' C___IVERT='' C__IJAUNE=''
    declare -r C___IBLEU='' C_IVIOLET='' C___ICYAN='' C__IBLANC=''

    declare -r C_SUR___NOIR='' C_SUR__ROUGE='' C_SUR___VERT='' C_SUR__JAUNE=''
    declare -r C_SUR___BLEU='' C_SUR_VIOLET='' C_SUR___CYAN='' C_SUR__BLANC=''

    declare -r C_SUR___INOIR='' C_SUR__IROUGE='' C_SUR___IVERT='' C_SUR__IJAUNE=''
    declare -r C_SUR___IBLEU='' C_SUR_IVIOLET='' C_SUR___ICYAN='' C_SUR__IBLANC=''
fi

        #}}}3

    #}}}2

# Fonctions généralistes utilisant des couleurs #{{{2
####################################################

# ligne_vide                        #{{{3
function ligne_vide ()
{
    printf >&2 '\n'
}

        #}}}3

# separateur_section                #{{{3
function separateur_section ()
{
    printf >&2 '%s\n' " --- ${NEUTRE}${M__DIM}${M_GRAS} ${*} ${NEUTRE} --- "
}

        #}}}3

# message_ok                        #{{{3
function message_ok ()
{
    printf >&2 '%s' "${NEUTRE}${C_SUR___VERT}${C__BLANC}${M_GRAS} OK ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}3

# message_erreur                    #{{{3
function message_erreur ()
{
    printf >&2 '%s' "${NEUTRE}${C_SUR__ROUGE}${C__BLANC}${M_GRAS} ERREUR ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}3

# message_attention                 #{{{3
function message_attention ()
{
    printf >&2 '%s' "${NEUTRE}${C_SUR__JAUNE}${C__BLANC}${M_GRAS} ATTENTION ! ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}3

# message_avertissement             #{{{3
function message_avertissement ()
{
    printf >&2 '%s' "${NEUTRE}${C_SUR___CYAN}${C__BLANC}${M_GRAS} AVERTISSEMENT ! ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}3

# demander_utilisateur              #{{{3
function demander_utilisateur ()
{
    printf >&2 '%s\n%s' "${*}" '(o/n) : '
    printf >>"${FICHIER_LOG_EXECUTION}" '%s\n%s' "${*}" '(o/n) : '
    while IFS= read -r -n 1 -s reponse
    do
        [[ "${reponse}" = [OoYyNn] ]] && printf >&2 '%s\n' "${reponse}"
        [[ "${reponse}" = [OoYyNn] ]] && printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' "${reponse}"
        [[ "${reponse}" = [OoYy] ]] && return 0
        [[ "${reponse}" = [Nn] ]] && return 1
    done
}

        #}}}3

# affichage_echappee                #{{{3
printf '%q ' 'test' >/dev/null 2>&1 && AFFICHAGE_ECHAPPE='printfq' || AFFICHAGE_ECHAPPE=''
declare -r AFFICHAGE_ECHAPPE
function affichage_echappee ()
{
    if [[ "${AFFICHAGE_ECHAPPE}" == 'printfq' ]]
    then
        printf '%q ' "${@}"
    else
        printf '%s' "${*}"
    fi
    return 0
}

        #}}}3

# executer_commande                 #{{{3
function executer_commande ()
{
    local -r user="${USER--}" dir="${PWD}"
    local info info_console

    if [[ "${UID}" -eq 0 ]]
    then
        info="[root ${dir}]# "
        info_console="[${M__DIM}${dir}${NEUTRE}]# "
    else
        info="[${user} ${dir}]$ "
        info_console="[${M__DIM}${dir}${NEUTRE}]$ "
    fi

    # Consigne l'exécution de la commande dans les logs.
    printf >>"${FICHIER_LOG_EXECUTION}" '%s' "${info}"
    affichage_echappee >>"${FICHIER_LOG_EXECUTION}" "${@}"
    printf >>"${FICHIER_LOG_EXECUTION}" '%s' ' ... '

    # Affiche l'exécution de la commande sur la sortie d'erreur standard.
    printf >&2 '%s' "${info_console}${M_GRAS}${C__JAUNE}"
    affichage_echappee >&2 "${@}"
    printf >&2 '%s\n' "${NEUTRE}"

    # Exécute la commande
    "${@}" && local -r Code_Erreur=0 || local -r Code_Erreur="${?}"

    if [[ "${Code_Erreur}" -ne 0 ]]
    then
        message_erreur
        printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' "Erreur avec le code : ${Code_Erreur}"
    else
        message_ok
        printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' 'OK'
    fi

    return "${Code_Erreur}"
}

        #}}}3

# Affichage simplifié des erreurs   #{{{3
# Affichage : Affiche en couleur rouge arg1; en violet gras [arg2];
# arg3 en rouge...
function afficher_erreur ()
{
    [[ -n "${1}" ]] || exit "${E_ARG_AFF_ERR_M}";
    local AFFICHAGE="${1}" LOG="${1}"
    if [[ "${#}" -ge 2 ]]
    then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${2}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
        LOG="${LOG} [ ${2} ] "
    fi
    [[ "${#}" -ge 3 ]] && AFFICHAGE="${AFFICHAGE}${3}" LOG="${LOG}${3}"
    if [[ "${#}" -ge 4 ]]
    then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}${4}"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
        LOG="${LOG} [ ${4} ] "
    fi
    [[ "${#}" -ge 5 ]] && AFFICHAGE="${AFFICHAGE}${5}"
    [[ "${#}" -ge 5 ]] && LOG="${LOG}${5}"
    printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' "${LOG}"
    printf >&2 '%s\n' "${NEUTRE}${C__ROUGE}${AFFICHAGE}${NEUTRE}"
}

        #}}}3

# gestion_erreur_couleur            #{{{3
function gestion_erreur_couleur ()
{
    ligne_vide
    afficher_erreur 'Le script à subis une erreur ligne' "${1}"
}

        #}}}3

trap '' ERR
trap 'ERREUR="${?}";
gestion_erreur_couleur "${LINENO}";
exit "${ERREUR}";' ERR

    #}}}2

#            Informations système               #{{{2
####################################################
# Vérifie si le script à été lancé avec bash
[[ -z "${BASH_VERSION}" ]] && BASH_MAJOR_VERSION='0' || BASH_MAJOR_VERSION="${BASH_VERSINFO[0]}"
declare -r BASH_MAJOR_VERSION

declare -r SYSTEM="$(uname -s)"
[[ "${SYSTEM}" = 'Darwin' ]] && OS='MacOS' || OS="$(uname -o)"
declare -r OS
declare -r MACHINE="$(uname -m)"

if [[ "${HOSTNAME}vide" != 'vide' ]]
then
    declare -r NOM_PC="${HOSTNAME}"
elif test_cmd_exist hostname
then
    declare -r NOM_PC="$(hostname)"
elif [[ -e '/proc/sys/kernel/hostname' ]]
then
    declare -r NOM_PC="$(cat '/proc/sys/kernel/hostname')"
else
    declare -r NOM_PC="Pas de nom détecté"
fi

    #}}}2

#}}}1

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
#                    Code                       #{{{1
####################################################

# fonctions de l'application elle même      #{{{2


    #}}}2

# fonctions des options                     #{{{2

# afficher_aide                     #{{{3
declare -r NOM_SCRIPT=`basename "${0}"`
declare -r USAGE="\
 Usage : ${NOM_SCRIPT}
    ou : ${NOM_SCRIPT} [-h]

Petite explication du rôle du script

Options :
    -h --help
        Affiche l'aide et quitte.
"

function afficher_aide ()
{
    printf >&2 '%s' "${USAGE}"
}

        #}}}3

# traitement_option_o               #{{{3
function traitement_option_o ()
{
    printf '%s\n' 'Option o'
}

        #}}}3

# traitement_option_u               #{{{3
function traitement_option_u ()
{
    local -r ARGUMENT="${1}"
    printf '%s\n' "Option u = ${ARGUMENT}"
}

        #}}}3

# traitement_option_m               #{{{3
# Multiples appels de la même option
declare -a TAB_OPTION_M=()

function traitement_option_m ()
{
    # Ajoute à la fin du tableau
    TAB_OPTION_M["${#TAB_OPTION_M[*]}"]="${1}"
    # Parcours le tableau des options de m pour afficher
    for ((i = 0; i < ${#TAB_OPTION_M[*]}; i++))
    do
        echo "${i}  : ${TAB_OPTION_M[${i}]}"
    done
    echo
}

        #}}}3

    #}}}2

#}}}1

declare -r FICHIER_LOG_EXECUTION="./.log_${NOM_SCRIPT%.*}.log"
cat <<EOF >>"${FICHIER_LOG_EXECUTION}"
---------------------------------- : `date '+%F %T'`
--  Noyau               : ${SYSTEM}
--  Nom PC              : ${NOM_PC}
--  Operating System    : ${OS}
--  Arch. Matériel      : ${MACHINE}
--  BASH major version  : ${BASH_MAJOR_VERSION}
----------------------------------
EOF

####################################################
#             Gestion des options               #{{{1
####################################################

# Si on a des arguments
if [[ "${#}" -gt 0 ]]
then
    printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' 'Script appelé avec les options : '
    affichage_echappee >>"${FICHIER_LOG_EXECUTION}" "${@}"
    printf >>"${FICHIER_LOG_EXECUTION}" '\n'
else
    printf >>"${FICHIER_LOG_EXECUTION}" '%s\n' 'Script appelé sans options'
fi
printf >>"${FICHIER_LOG_EXECUTION}" '\n'

#  Affiche l'aide si aucun arguments n'est donné
if [[ "${#}" -eq 0 ]]
then
    afficher_aide
    exit "${EXIT_SUCCES}";
fi

# option o ne nécessite pas d'arguments en plus u si.
# Le premier : permet de gérer manuellement les erreurs
while getopts ":hou:m:-:" option
do
    case "${option}" in
        o)
            traitement_option_o
            ;;
        u)
            traitement_option_u "${OPTARG}"
            ;;
        m)
            traitement_option_m "${OPTARG}"
            ;;
        h)
            afficher_aide
            exit "${EXIT_SUCCES}";
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
                multiple=?*)
                    traitement_option_m "${LONG_OPTARG}"
                    ;;
                help )
                    afficher_aide
                    exit "${EXIT_SUCCES}";
                    ;;
                orc* | help* )
                    afficher_erreur "L'option longue" "--${OPTARG}" "ne prend pas d'arguments."
                    afficher_aide
                    exit "${E_ARG_SUPERFLUS_OPT_LONGUE}";
                    ;;
                umbra* | multiple* )
                    afficher_erreur "L'option longue" "--${OPTARG}" 'nécessite un argument.'
                    afficher_aide
                    exit "${E_OPT_LONGUE_NECESSITE_ARG}";
                    ;;
                *)
                    afficher_erreur "L'option longue" "--${OPTARG}" "n'existe pas !"
                    afficher_aide
                    exit "${E_OPT_LONGUE_INCONNUE}";
                    ;;
            esac
            ;;
        :)
            afficher_erreur "L'option" "${OPTARG}" 'nécessite un argument.'
            afficher_aide
            exit "${E_OPT_NECESSITE_ARG}";
            ;;
        ?)
            afficher_erreur "L'option" "${OPTARG}" "n'existe pas."
            afficher_aide
            exit "${E_OPT_INCONNUE}";
            ;;
    esac
done

# Vérifie que toutes les options ont été traitées
# OPTIND indique la position de l'argument suivant à traiter par getopt
shift $((OPTIND-1))
# Si toutes les options n'ont pas été traitée on affiche une erreur
if [[ "${#}" -ne 0 ]]
then
    afficher_erreur 'Le ou Les arguments suivant ne sont pas valide :' "${*}"
    afficher_aide
    exit "${E_OPT_NON_TRAITEE}";
fi

#}}}1

####################################################
#                 Exécution                     #{{{1
####################################################


#}}}1

exit "${EXIT_SUCCES}";
