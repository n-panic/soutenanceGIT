# SoutenanceGit


## But du Projet
Réaliser une montée en version de l'application d'un client, avec la mise en place de bonne pratique du code (Installation claire, documentation, duplication de dépôts de code source, etc.).  

## Installation du projet
1. Cloner le repo
    * Avec ssh  
    	git clone git@gitlab.com:francisco.leblanc.sacha/soutenancegit.git 
    * Avec https  
    	git clone https://gitlab.com/francisco.leblanc.sacha/soutenancegit.git
2. Changer le repertoire des hooks
	git config core.hooksPath .githooks
3. Lancer le container docker  
    docker-compose up -d --build

## Contribuer
1. Creer vos branches  
	git checkout -b feature/myBranch  
2. Effectuer des commits signé  
	git commit -S -m "Mon commit signé"  
3. Push sur la branche  
	git push origin feature/myBranch  
  
## Auteur
Nicolas Perradin  
Nikola Panic  
Alexandre Trouvé  
Sacha Francisco-Leblanc  
 

## Licence
[Licence](https://choosealicense.com/licenses/mit/)
