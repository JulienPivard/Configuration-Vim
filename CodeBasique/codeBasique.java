package truc;

/**
 * @author PIVARD Julien
 */
public class NOMFICHIER
{

    /**
     *
     * */
    protected int VAL;

    /**
     *
     * */
    public NOMFICHIER()
    {
        this.VAL = 42;
    }

    /**
     * Les ligaments croisé du gobelin
     */
    public static void main(String[] args)
    {
        String nomfichier = new String("#            NOMFICHIER            #");
        String ligneIntro = new String("####################################");
        System.out.printf("\n%s\n%s\n%s\n\n", ligneIntro, nomfichier, ligneIntro);
        if(args.length==0)
        {
            System.out.printf("Usage java NOMFICHIER argument\n");
            return;
        }
        if(args.length!=nbarguments)
        {
            System.err.printf("Nombres d'arguments incorrect, %d trop d'arguments\n", args.length);
            return;
        }
    }

}

/*
 * Commentaire javadoc pour faciliter la documentation
 * Toujours sur la ligne avant le début de la classe
 * la première lettre du nom du fichier doit être en majuscule
 *
 * Les objets en paramètre et/ou en sortie
 * @param nomparametre
 * petit blabla pour dire ce que c'est
 * @return petit blabla de ce qui est retourné
 *
 * Les exceptions et les erreurs levées pendant le fonctionnement
 * @throws nomexception
 * petit blabla pour expliquer
 *
 * Référence à une autre classe ou méthode (voir aussi)
 * @see nomdutrucavoir
 *
 * Indique la version d'apparition de la méthode, argument, retour, ou classe
 * @since 1.0
 *
 * Indique depuis quand il ne faut plus utiliser une fonction
 * @Deprecated Depuis num version préférez l'utilisation de truc
 *
 * Ajouter devant les fonctions que l'ont veut redéfinir
 * @Override
*/
