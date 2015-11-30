# Version de cmake demandée.
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Chemin des répertoires contenant les fichiers entêtes.
INCLUDE_DIRECTORIES(
    src/include
    )

# Chemin du répertoire contenant les binaires.
SET ( EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE} )

# Option du compilateur pour supporter C++ 2011.
SET( CMAKE_CXX_FLAGS "-std=c++11")

# Création des exécutables.
ADD_EXECUTABLE( client
    src/client.cpp
    )

# Faire parler le make.
set( CMAKE_VERBOSE_MAKEFILE off )
