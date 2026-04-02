SELECT 
    CONCAT(a.prenom, ' ', UPPER(a.nom)) AS "Prénom NOM"
FROM athlete a
JOIN participation p ON a.id_athlete = p.id_athlete
GROUP BY a.id_athlete, a.nom, a.prenom
HAVING COUNT(DISTINCT p.id_epreuve) >= 2;
