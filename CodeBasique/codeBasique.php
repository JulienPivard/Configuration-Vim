<?php
// Dernière modification : Lundi 14 août[08] 2017

/**
 * Petite explication du fichier @TODO
 *
 * @author PIVARD Julien
 * @license GPL-v3
 * @version 0.1
 * */

declare( strict_types = 1 );

/**
 * @package TODO
 * */
class TRUC      // @TODO
{

    /**
     * @var string
     * Variables en php.
     * */
    protected $bidule;

    /**
     * @var int
     * Variables static en php.
     * */
    protected static $compteur = 0;

    /**
     * @var string
     * Constante s'utilise de la meme maniere qu'une static.
     * */
    const ma_constante = "rien";

    /**
     * @TODO
     * */
    public function __construct()
    {
        $this->bidule = 0;
    }

    /**
     * L'affichage pour le debogage.
     *
     * @return string
     * Toutes les données mise en forme.
     * */
    public function __toString() : string
    {

        $debogage = "<p>Débogage de Utilisateur</p>";
        $debogage .= "";
        return $debogage;

    }

    /**
     * Fonction statique que l'on appelle avec truc::foncStatic
     * */
    public static function foncStatic() : void
    {
        self::$compteur++;
    }

    /**
     * Si on veut faire une action précise à la destruction de l'objet.
     * Pas obligatoire.
     * */
    public function __destruct()
    {
    }

}

?>
