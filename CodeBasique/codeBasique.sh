#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Lundi 28 mai[05] 2018

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

# Documentation                                 #{{{
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

# Options comportementales                      #{{{
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
printf >&2 "\nErreur dans les définitions préliminaire ligne : ${LINENO}\n";
exit "${ERREUR}";' ERR

# On s'assure que l'UID existe bien
[[ -z "${UID}" ]] && UID="$(id -u)"

#}}}

####################################################
#{{{    Fonctions généralistes et configuration    #
####################################################

#{{{        Constante de sortie et d'erreur        #
####################################################

declare -ri EXIT_SUCCES=0

declare -ri E_ARG_AFF_ERR_M=80

declare -ri E_ARG_SUPERFLUS_OPT_LONGUE=81
declare -ri E_OPT_LONGUE_NECESSITE_ARG=82
declare -ri E_OPT_LONGUE_INCONNUE=83
declare -ri E_OPT_NECESSITE_ARG=84
declare -ri E_OPT_INCONNUE=85
declare -ri E_OPT_NON_TRAITEE=86


    #}}}

#{{{       Fonctions de gestions généraliste       #
####################################################

declare -i NB_COULEURS=0 NB_COLONNES=0 NB_LIGNES=0

# which_cmd                         {{{
function which_cmd ()
{
    which "${1}" 2>/dev/null || command -v "${1}" 2>/dev/null
}

        #}}}

# test_cmd_exist                    {{{
function test_cmd_exist ()
{
    which_cmd "${1}" >/dev/null 2>&1 && return 0 || return 1
}

        #}}}

    #}}}

#{{{        Fonction de gestion des signaux        #
####################################################

# Réception d'un signal pour quitter l'app normalement                  {{{
function fin ()
{
    exit;
}

        #}}}

# Le script à été interrompu par l'utilisateur                          {{{
function interruption ()
{
    exit;
}

        #}}}

# Une erreur c'est produit durant l'exécution                           {{{
function gestion_erreurs ()
{
    printf >&2 "\nLe script à subis une erreur ligne [ ${1} ]\n"
}

        #}}}

# On ferme le script. Cette fonction sera exécutée en dernière          {{{
function nettoyage_fin_script ()
{
    # On rend le curseur à nouveau visible
    test_cmd_exist tput && tput cnorm
    exit;
}

        #}}}

# Le terminal qui a lancé le processus à été fermé                      {{{
function fermeture_terminal ()
{
    exit;
}

        #}}}

    #}}}

#{{{                Attrape signaux                #
####################################################

# Permet de reste le signal d'erreur
trap '' ERR
trap 'ERREUR="${?}"; gestion_erreurs "${LINENO}"; exit "${ERREUR}";' ERR

# Gestion des interruption CTRL-C
trap 'interruption' INT

# Gestion de la fermeture du terminal
trap 'fermeture_terminal' HUP

# Gestion des autres signaux de fin
trap 'fin' QUIT TERM

# Sera toujours exécuté quand une instruction exit est rencontré
trap 'nettoyage_fin_script' EXIT

    #}}}

#{{{  Gestion du redimensionnement  de la fenêtre  #
####################################################

# maj_taille                        {{{
function maj_taille ()
{
    if test_cmd_exist tput
    then
        NB_LIGNES=`tput lines` NB_COLONNES=`tput cols`
    else
        NB_LIGNES=-1 NB_COLONNES=-1
    fi
}

        #}}}

maj_taille

trap 'maj_taille' WINCH

    #}}}

#{{{            Définition des couleurs            #
####################################################

NEUTRE="" M_GRAS="" D_SOUL="" F_SOUL="" INVERS="" M__DIM=""

# Vérification de l'existence de la commande tput   {{{
if test_cmd_exist tput
then
    [[ `tput colors 2>/dev/null` -ge 8 ]] &&
        declare -ri NB_COULEURS=`tput colors` || declare -ri NB_COULEURS=0

    declare -r NEUTRE="`tput sgr 0`" M_GRAS="`tput bold`" D_SOUL="`tput smul`"
    declare -r F_SOUL="`tput rmul`"  INVERS="`tput rev`"  M__DIM="`tput dim`"
else
    declare -ri NB_COULEURS=0
fi

        #}}}

# Définition des couleurs                           {{{
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
    declare -r C___NOIR="" C__ROUGE="" C___VERT="" C__JAUNE=""
    declare -r C___BLEU="" C_VIOLET="" C___CYAN="" C__BLANC=""

    declare -r C___INOIR="" C__IROUGE="" C___IVERT="" C__IJAUNE=""
    declare -r C___IBLEU="" C_IVIOLET="" C___ICYAN="" C__IBLANC=""

    declare -r C_SUR___NOIR="" C_SUR__ROUGE="" C_SUR___VERT="" C_SUR__JAUNE=""
    declare -r C_SUR___BLEU="" C_SUR_VIOLET="" C_SUR___CYAN="" C_SUR__BLANC=""

    declare -r C_SUR___INOIR="" C_SUR__IROUGE="" C_SUR___IVERT="" C_SUR__IJAUNE=""
    declare -r C_SUR___IBLEU="" C_SUR_IVIOLET="" C_SUR___ICYAN="" C_SUR__IBLANC=""
fi

        #}}}

    #}}}

#{{{ Fonctions généralistes utilisant des couleurs #
####################################################

# ligne_vide                        {{{
function ligne_vide ()
{
    printf >&2 '\n'
}

        #}}}

# separateur_section                {{{
function separateur_section ()
{
    printf >&2 '%s\n' " --- ${NEUTRE}${M__DIM}${M_GRAS}${*}${NEUTRE} --- "
}

        #}}}

# message_ok                        {{{
function message_ok ()
{
    printf >&2 "${NEUTRE}${C_SUR___VERT}${C__BLANC}${M_GRAS} OK ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}

# message_erreur                    {{{
function message_erreur ()
{
    printf >&2 "${NEUTRE}${C_SUR__ROUGE}${C__BLANC}${M_GRAS} ERREUR ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}

# message_attention                 {{{
function message_attention ()
{
    printf >&2 "${NEUTRE}${C_SUR__JAUNE}${C__BLANC}${M_GRAS} ATTENTION ! ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}

# message_avertissement             {{{
function message_avertissement ()
{
    printf >&2 "${NEUTRE}${C_SUR___CYAN}${C__BLANC}${M_GRAS} AVERTISSEMENT ! ${NEUTRE} "
    [[ "${#}" -gt 0 ]] && echo >&2 "${*}" || ligne_vide
    ligne_vide
}

        #}}}

# demander_utilisateur              {{{
function demander_utilisateur ()
{
    printf >&2 '%s\n%s' "${*}" '(o/n) : '
    while IFS= read -r -n 1 -s reponse
    do
        [[ "${reponse}" = [OoYyNn] ]] && printf >&2 '%s\n' "${reponse}"
        [[ "${reponse}" = [OoYy] ]] && return 0
        [[ "${reponse}" = [Nn] ]] && return 1
    done
}

        #}}}

# affichage_echappee                {{{
printf '%q ' test >/dev/null 2>&1
[[ "${?}" -eq 0 ]] && declare -r AFFICHAGE_ECHAPPE='printfq'
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

        #}}}

# executer_commande                 {{{
declare FICHIER_LOG_EXECUTION='/dev/null'
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
    printf >>"${FICHIER_LOG_EXECUTION}" "${info}"
    affichage_echappee >>"${FICHIER_LOG_EXECUTION}" "${@}"
    printf >>"${FICHIER_LOG_EXECUTION}" " ... "

    # Affiche l'exécution de la commande sur la sortie d'erreur standard.
    printf >&2 "${info_console}${M_GRAS}${C__JAUNE}"
    affichage_echappee >&2 "${@}"
    printf >&2 "${NEUTRE}\n"

    # Exécute la commande
    if "${@}"
    then
        local -r Code_Erreur=0
    else
        local -r Code_Erreur="${?}"
    fi

    if [[ "${Code_Erreur}" -ne 0 ]]
    then
        message_erreur
        printf >>"${FICHIER_LOG_EXECUTION}" "Erreur avec le code d'erreur : ${Code_Erreur}\n"
    else
        message_ok
        printf >>"${FICHIER_LOG_EXECUTION}" "OK\n"
    fi

    return "${Code_Erreur}"
}

        #}}}

# Affichage simplifié des erreurs   {{{
# L'argument 1 affiche le texte en rouge
# L'argument 2 est fait pour afficher le contenu d'une variable
# L'argument 3 affiche le texte en rouge à la suite de l'argument 2
function afficher_erreur ()
{
    [[ -n "${1}" ]] && local AFFICHAGE="${1}" || exit "${E_ARG_AFF_ERR_M}";
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
    printf >&2 '%s\n' "${NEUTRE}${C__ROUGE}${AFFICHAGE}${NEUTRE}"
}

        #}}}

# gestion_erreur_couleur            {{{
function gestion_erreur_couleur ()
{
    ligne_vide
    separateur_section 'Avortement du script'
    afficher_erreur 'Le script à subis une erreur ligne' "${1}"
}

        #}}}

trap '' ERR
trap 'ERREUR="${?}";
gestion_erreur_couleur "${LINENO}";
exit "${ERREUR}";' ERR

    #}}}

#}}}

# Retirer l'extension %.* un % par extension à retirer.
# Ne garder que l'extension avec #*. Voila.
####################################################
#{{{                    Code                       #
####################################################

# fonctions de l'application elle même       {{{


    #}}}

# fonctions des options                      {{{

# afficher_aide                     {{{
declare -r NOM_SCRIPT=`basename "${0}"`
declare -r USAGE="\
Usage : ${NOM_SCRIPT} [-h]

Petite explication du rôle du script

Options :
    -h --help
        Affiche l'aide et quitte.
"

function afficher_aide ()
{
    printf >&2 '%s' "${USAGE}"
}

        #}}}

# traitement_option_o               {{{
function traitement_option_o ()
{
    printf "Option o\n"
}

        #}}}

# traitement_option_u               {{{
function traitement_option_u ()
{
    local -r ARGUMENT="${1}"
    printf "Option u = ${ARGUMENT}\n"
}

        #}}}

    #}}}

#}}}

####################################################
#{{{             Gestion des options               #
####################################################

#  Affiche l'aide si aucun arguments n'est donné
if [[ "${#}" -eq 0 ]]
then
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
                help )
                    afficher_aide
                    exit "${EXIT_SUCCES}";
                    ;;
                orc* | help* )
                    afficher_erreur "L'option longue" "--${OPTARG}" "ne prend pas d'arguments."
                    afficher_aide
                    exit "${E_ARG_SUPERFLUS_OPT_LONGUE}";
                    ;;
                umbra* )
                    afficher_erreur "L'option longue" "--${OPTARG}" "nécessite un argument."
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
            afficher_erreur "L'option" "${OPTARG}" "nécessite un argument."
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
    afficher_erreur "Le ou Les arguments suivant ne sont pas valide :" "${*}"
    afficher_aide
    exit "${E_OPT_NON_TRAITEE}";
fi

#}}}

####################################################
#{{{                 Exécution                     #
####################################################


#}}}

exit "${EXIT_SUCCES}";
