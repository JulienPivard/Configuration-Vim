# vim: set nospell:
# docker build -t nomcontainer .

FROM alpine:latest
MAINTAINER PIVARD Julien <pivardjulien@gmail.com>

# Similaire à la commande cd
WORKDIR /

# Pour lier un fichier ou un dossier de l'hôte à l'arborescence
# du système docker
ADD ./chemin/host /chemin/dans/docker

# Pour ouvrir un port vers l'exterieur de docker
EXPOSE 8080

# Pour pouvoir exposer un volume vers l'extérieur.
#VOLUME ["/chemin/dans/docker"]

# Permet d'exécuter une suite de commande shell
#RUN commande
#RUN ["commande", "arguments"]

# Permet d'exécuter une commande à chaque lancement
# quelque soit la manière dont il est lancé
#ENTRYPOINT commande
#ENTRYPOINT ["commande", "arguments"]

# Une commande exécuté au lancement du container
#CMD ["commande", "arguments"]
#CMD commande
