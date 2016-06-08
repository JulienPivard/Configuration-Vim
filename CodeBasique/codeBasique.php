<?php
// Dernière modification : mercredi 08 juin[06] 2016

/**
 * @author PIVARD Julien
 * @package TODO
 * */
class truc
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
     * @return string
     * @TODO
     * */
    public function __toString()
    {

        $debogage = "<p>Débogage de Utilisateur</p>";
        $debogage .= "";
        return $debogage;

    }

    /**
     * Fonction statique que l'on appelle avec truc::foncStatic
     * */
    public static function foncStatic()
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
