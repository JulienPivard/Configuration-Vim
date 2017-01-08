# vim: set nospell:
# docker build -t nomcontainer .

FROM alpine:latest
MAINTAINER PIVARD Julien pivardjulien@gmail.com

# Similaire à la commande cd
WORKDIR /

# Pour lier un fichier ou un dossier de l'hôte à l'arborescence
# du système docker
ADD ./chemin/host /chemin/dans/docker

# Permet d'exécuter une suite de commande shell
RUN commande

# Une commande exécuté au lancement du container
CMD commande
