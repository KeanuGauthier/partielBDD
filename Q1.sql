SELECT 
    a.nom,
    a.prenom,
    e.nom AS epreuve,
    MAX(score_run) AS note_finale
FROM athlete a
JOIN participation p ON a.id_athlete = p.id_athlete
JOIN epreuve e ON p.id_epreuve = e.id_epreuve
JOIN run r ON r.id_athlete = a.id_athlete AND r.id_epreuve = e.id_epreuve
JOIN (
    SELECT n.id_run,
           SUM(n.valeur * c.poids) / SUM(c.poids) AS score_run
    FROM note n
    JOIN critere c ON n.id_critere = c.id_critere
    GROUP BY n.id_run
) rs ON rs.id_run = r.id_run
GROUP BY a.id_athlete, e.id_epreuve, a.nom, a.prenom, e.nom
ORDER BY e.nom, note_finale DESC;
