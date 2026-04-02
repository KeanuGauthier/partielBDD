DELIMITER //

CREATE TRIGGER verif_note --on peut mettre "BEFORE UPDATE ON note" si on souhaite le faire pour les modif aussi
BEFORE INSERT ON note
FOR EACH ROW
BEGIN
    IF NEW.valeur < 0 OR NEW.valeur > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La note doit etre comprise entre 0 et 100';
    END IF;
END //

DELIMITER ;
