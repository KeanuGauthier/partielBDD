SELECT 
    a.nom,
    pays.nom AS pays
FROM athlete a
JOIN participation p ON a.id_athlete = p.id_athlete
JOIN pays ON a.id_pays = pays.id_pays
LEFT JOIN run r ON r.id_athlete = a.id_athlete AND r.id_epreuve = p.id_epreuve
WHERE r.id_run IS NULL;
