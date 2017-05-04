#! /bin/bash
# vim:foldmethod=marker:foldlevel=0
# Changer les droits avec chmod u+x fichier

# Dernière modification : Jeudi 04 mai[05] 2017

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
#┃ Codes d'erreurs :                                                         ┃#
#┃     - 80 Oubli argument 1 de la fonction couleur_back_et_front            ┃#
#┃     - 81 Oubli argument 2 de la fonction couleur_back_et_front            ┃#
#┃     - 82 La valeur de l'argument 1 n'est pas entre 0 et 255 inclus        ┃#
#┃     - 83 La valeur de l'argument 2 n'est pas f ou b                       ┃#
#┃     - 84  Erreur afficher_erreur nécessite au moins un argument           ┃#
#┃     - 85  pas d'argument pour l'option longue                             ┃#
#┃     - 86  l'option longue nécessite un argument                           ┃#
#┃     - 87  l'option longue n'existe pas                                    ┃#
#┃     - 88  l'option nécessite un argument                                  ┃#
#┃     - 89  l'option n'existe pas                                           ┃#
#┃     - 90  des options qui sont invalides ont été donnée                   ┃#
#┃                                                                           ┃#
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛#

#########################
#       Debogage        #
#########################
# Vérifie la syntaxe : bash -n

#########################
#  Gestion des signaux  #
#########################

# Gestion des signaux de fin de programme
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
    [[ -n "$1" ]] || exit 80
    [[ -n "$2" ]] || exit 81

    [[ "$1" =~ ([0-9]+) && "$1" -lt 256 && "$1" -ge 0 ]] && local -r NUM_COULEUR="$1" || exit 82
    [[ "$2" == 'b' || "$2" == 'f' ]] && local -r PLAN_COULEUR="$2" || exit 83

    declare -r D_COUL='tput seta'

    printf `${D_COUL}${PLAN_COULEUR} $NUM_COULEUR`
}

declare -a COULEURS=()

# Création des couleurs du front et du back
POSITION=0
for i in 'f' 'b'; do
    for j in `seq 0 15`; do
        COULEURS[$((j + POSITION))]=`couleur_back_et_front $j $i`
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
    [[ -n "$1" ]] && local AFFICHAGE="$1" || exit 84
    if [[ -n "$2" ]]; then
        AFFICHAGE="${AFFICHAGE} [ ${C_VIOLET}${M_GRAS}"
        AFFICHAGE="${AFFICHAGE}$2"
        AFFICHAGE="${AFFICHAGE}${NEUTRE}${C__ROUGE} ] "
    fi
    [[ -n "$3" ]] && AFFICHAGE="${AFFICHAGE}$3"
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

traitement_option_o()
{
    echo "Option o"
}

traitement_option_u()
{
    local ARGUMENT="$1"
    echo "Option u = $ARGUMENT"
}

# }}}

####################################################
# {{{            Gestion des options               #
####################################################

#  Affiche l'aide si aucun arguments n'est donné
if [[ $# -eq 0 ]]; then
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
            traitement_option_o
            ;;
        u)
            traitement_option_u "$OPTARG"
            ;;
        -)
            LONG_OPTARG="${OPTARG#*=}"
            case $OPTARG in
                orc )
                    traitement_option_o
                    ;;
                umbra=?* )
                    traitement_option_u "$LONG_OPTARG"
                    ;;
                orc* )
                    afficher_erreur "L'option longue" "--$OPTARG" "ne prend pas d'arguments."
                    afficherAide
                    exit 85
                    ;;
                umbra* )
                    afficher_erreur "L'option longue" "--$OPTARG" "nécessite un argument."
                    afficherAide
                    exit 86
                    ;;
                *)
                    afficher_erreur "L'option longue" "--$OPTARG" "n'existe pas !"
                    afficherAide
                    exit 87
                    ;;
            esac
            ;;
        :)
            afficher_erreur "L'option" "$OPTARG" "nécessite un argument."
            afficherAide
            exit 88
            ;;
        ?)
            afficher_erreur "L'option" "$OPTARG" "n'existe pas."
            afficherAide
            exit 89
            ;;
    esac
done

#  Vérifie que toutes les options ont été traitées
shift $((OPTIND-1))
# Si toutes les options n'ont pas été traitée on affiche une erreur
if [[ $# -ne 0 ]] ; then
    afficher_erreur "Les arguments suivant ne sont pas valide :" "$*"
    afficherAide
    exit 90
fi

# }}}

###################################################
#                   Exécution                     #
###################################################


exit 0;
