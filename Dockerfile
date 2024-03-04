FROM debian:bullseye-slim

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y git curl unzip xz-utils libglu1-mesa && rm -rf /var/lib/apt/lists/*

# Cloner le dépôt Flutter dans /usr/local/flutter en utilisant la branche stable
RUN git clone -b stable https://github.com/flutter/flutter.git /usr/local/flutter

# Ajouter le binaire Flutter au PATH
ENV PATH="/usr/local/flutter/bin:${PATH}"

# Pré-télécharger les dépendances de développement de Flutter et les artefacts Dart pour réduire les temps de build ultérieurs
RUN flutter precache

# Exécuter flutter doctor pour vérifier l'installation (optionnel, mais recommandé pour vérifier l'environnement)
RUN flutter doctor

# Afficher la version de Flutter
RUN flutter --version

# Définir le répertoire de travail (peut être modifié selon les besoins du projet)
WORKDIR /app

# Conserver le conteneur en cours d'exécution (Cette ligne peut être modifiée pour exécuter votre application)
CMD ["bash"]