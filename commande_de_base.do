

// Fichier .do : suite d'instruction en stata


// c'est mieux de commencer un fichier do par clear pour retirer ce qui a déjà été7
// fait

clear

// import du fichier data.txt avec un infile ( comme sas )

infile str20 (id) montant str20(sexe) age using "C:\Users\lud\Desktop\stata\data.txt",clear

// Pour importer une table stata ( .dta ), pas besoin de spécifier les variables

use "C:\Users\lud\Desktop\stata\data.dta",clear

// browse : pour afficher la table

browse

// edit : affiche la table ais autorise des modifications dessus

edit

// help : pour l'aide

help browse

// pour supprimer une variable

drop id

// on fait des statistiques descriptifs sur la variable montant

summarize montant // ou sum montant

// pour choisir ses statistiques descriptifs

tabstat montant, statistics(mean sd min max skewness kurtosis count)

// pour choisir ses statistiques descriptifs

tabstat montant, by(sex)

// fréquence de la variable

tabulate sex

// pour tracer un graphique : y en premier, x en second

scatter montant age

// on remarque qu'il existe une valeur abbérante => on la supprime

drop if montant>100000

scatter montant age

// on veut une droite de régression linéaire en plus du graphique

twoway (scatter montant age) (lfit montant age)

// droite linéaire + droite quadratique

twoway (scatter montant age) (qfit montant age) (lfit montant age)

// création d'une variable 

gen montant_2 = montant * 2
gen montant_cond = montant if age >60

// correlation de age et montant

corr age montant

// trier la table par ordre croissant en focntion de la variable montant

sort montant

// on créé une nouvelle variable en classe coupé en 2
// on utilise egen quand on utilise des calculs complexes pour créer une variable

egen classe_montant = cut(montant),group(2)

// faire un chi2

tabulate sex classe_montant,chi2

// Pour sauvegarder les données sous format stata

save C:\Users\lud\Desktop\stata\data.dta
