# Zythologue

Brief sur la conception de la base de doonées, avec MCD, MLD, MPD, et le dictionnaire de données des différentes tables.

## Prérequis

Avant de pouvoir lancer ce projet, assurez-vous d'avoir les éléments suivants installés sur votre machine :
- Docker
- Docker Compose
- DBeaver (ou tout autre client SQL pour interagir avec PostgreSQL)

## Lancer le projet avec Docker et se connecter avec DBeaver

### 1. Cloner le repository

Clonez le repository et accédez au répertoire du projet :

```bash
git clone git@github.com:2024-devops-alt-dist/zythologue-ELK.git
cd zythologue-ELK
```


### 2. Construisez et démarrez les conteneurs Docker avec Docker Compose :
```bash
   docker-compose up -d
```

### 3. Configurer DBeaver pour se connecter à PostgreSQLonnées 
Une fois que les conteneurs sont lancés, vous pouvez vous connecter à la base de données PostgreSQL via DBeaver en suivant ces étapes :

Ouvrir DBeaver.

Ouvrir le projet dans DBeaver :

Cliquer sur "Open projet from file system"
Choisissez "Directory" puis allez chercher "zythologue-ELK"

Créer une nouvelle connexion :

Cliquez sur "Database" dans la barre de menu et sélectionnez "New Database Connection".
Choisissez PostgreSQL comme type de base de données, puis cliquez sur Next.

Configurer la connexion :
Host : localhost
Port : 5432 (par défaut pour PostgreSQL)
Database : Postgres
Username : postgresql
Password : postgresql

Tester la connexion :
Cliquez sur "Test Connection" pour vérifier si DBeaver peut se connecter à la base de données. Si la connexion réussit, cliquez sur Finish pour enregistrer la connexion (il y aura peut-être besoin de télécharger des drivers manquants).

### 4. Exécuter les scripts SQL dans DBeaver
Après vous être connecté à la base de données dans DBeaver, vous pouvez maintenant exécuter les scripts SQL pour créer les tables et insérer les données :

Ouvrir le script ddl_creation_script.sql :
Dans DBeaver, soit en faisant F3, soit en faisant un clic droit sur le nom de la database > SQL script > Open SQL script.
Vous pourrez enfin récupérer le script
Cliquez sur le bouton Exécuter la requête (ou appuyez sur Ctrl+Enter) pour créer les tables dans la base de données.

Ouvrir le script ddl_insertion_script.sql de la même manière

Ouvrir le script dml_analytic_script.sql de la même manière
