// Question 1
SELECT * FROM `médecin` WHERE NomSpécialité = 'S1'

// Question 2
SELECT * FROM `spécialité`

// Question 3
SELECT idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né FROM `malade` WHERE sexe='masculin' ORDER BY date_naiss DESC

// Question 4
SELECT idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né FROM `malade` WHERE sexe='féminin' AND addresse LIKE '%p%' ORDER BY nomMalade ASC

// Question 5
SELECT idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né, malade.numChambre AS Numéro_Chambre, type, catégorie 
FROM `malade` INNER JOIN chambre ON chambre.numChambre = malade.numChambre

// Question 6
SELECT idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né, malade.idDépartement AS Numéro_Département, NomDept AS Département 
FROM malade, départelent WHERE malade.idDépartement = départelent.idDépartement AND date_naiss='2012-04-22'

// Question 7
SELECT malade.idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né 
FROM malade, suivre WHERE malade.idMalade = suivre.idMalade AND suivre.idMédecin = 'NM3'

// Question 8
SELECT malade.idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né 
FROM malade, suivre WHERE malade.idMalade = suivre.idMalade AND suivre.idMédecin = 'NM3' AND malade.numLit = '21'

// Question 9
SELECT malade.idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né FROM malade WHERE malade.numLit = '21'

// Question 10
SELECT malade.idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né, numFeuille, date 
FROM malade, evolution WHERE malade.idMalade = '11' AND malade.idMalade = evolution.idMalade

// Question 11
SELECT départelent.Nomdept, COUNT(nomMalade) AS Nombre 
FROM malade, départelent WHERE malade.idDépartement = départelent.idDépartement GROUP BY malade.idDépartement

// Question 12
appartenir.idDépartement = départelent.idDépartement

## Question 13
SELECT malade.idMalade, malade.nomMalade, malade.addresse FROM `malade` WHERE (MONTH(malade.DateInterné)=02 or MONTH(malade.DateInterné)=12)

## Question 14
select chambre.*, COUNT(malade.idMalade) as Nombre 
FROM chambre, malade WHERE chambre.numChambre = malade.numChambre group by chambre.numChambre order by Nombre DESC LIMIT 1

## Question 15
select départelent.*, COUNT(malade.idMalade) as Nombre 
FROM départelent, malade WHERE départelent.idDépartement = malade.idDépartement group by départelent.idDépartement order by Nombre DESC LIMIT 1

## Question 17
select médecin.*, COUNT(malade.idMalade) as Nombre 
FROM médecin, malade, suivre WHERE médecin.idMédecin = suivre.idMédecin AND malade.idMalade = suivre.idMalade group by suivre.idMédecin order by Nombre DESC LIMIT 1

## Question 18
SELECT malade.idMalade AS Numéro, nomMalade AS Nom, date_naiss AS Né, malade.numChambre, malade.numLit 
FROM malade, chambre, lit, suivre, médecin 
WHERE malade.idMalade = suivre.idMalade AND malade.numChambre = chambre.numChambre AND malade.numLit = lit.numLit AND suivre.idMédecin = médecin.idMédecin AND médecin.NomSpécialité = 'S2'

## Question 19
SELECT Note FROM evolution, malade, départelent WHERE malade.idMalade = evolution.idMalade AND départelent.idDépartement= malade.idDépartement AND départelent.NomDept = 'D2' ORDER BY malade.DateInterné ASC LIMIT 1


## Question 20
SELECT DISTINCT lit.numLit FROM lit WHERE lit.numLit 
NOT IN (SELECT lit.numLit FROM lit, malade WHERE lit.numLit = malade.numLit AND MONTH(malade.DateInterné)=3)