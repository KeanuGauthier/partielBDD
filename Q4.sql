DELIMITER //

CREATE PROCEDURE classement_epreuve(IN p_id_epreuve INT)
BEGIN
    SELECT 
        CONCAT(a.prenom, ' ', UPPER(a.nom)) AS athlete,
        pays.nom AS pays,
        ROUND(MAX(score_run), 2) AS note_finale,
        RANK() OVER (ORDER BY MAX(score_run) DESC) AS classement
    FROM athlete a
    JOIN run r ON r.id_athlete = a.id_athlete AND r.id_epreuve = p_id_epreuve
    JOIN pays ON a.id_pays = pays.id_pays
    JOIN (
        SELECT n.id_run,
               SUM(n.valeur * c.poids) / SUM(c.poids) AS score_run
        FROM note n
        JOIN critere c ON n.id_critere = c.id_critere
        GROUP BY n.id_run
    ) rs ON rs.id_run = r.id_run
    GROUP BY a.id_athlete, a.nom, a.prenom, pays.nom
    ORDER BY classement;
END //

DELIMITER ;
