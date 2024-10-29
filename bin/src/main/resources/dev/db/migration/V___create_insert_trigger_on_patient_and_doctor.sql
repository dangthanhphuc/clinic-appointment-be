DELIMITER $$

-- Trigger bắt lỗi trên doctors
CREATE TRIGGER before_insert_doctors
BEFORE INSERT ON doctors
FOR EACH ROW
BEGIN
    -- Kiểm tra có tồn tại id đó trong users không
    IF NOT EXISTS (SELECT 1 FROM users WHERE id = NEW.id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User id does not exist in users table !';
    END IF;

    -- Kiểm tra có tồn tại id đó trong patients không
    IF EXISTS (SELECT 1 FROM patients WHERE id = NEW.id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This user is already a patient !';
    END IF;
END$$


-- Trigger bắt lỗi trên patients
CREATE TRIGGER before_insert_patients
BEFORE INSERT ON patients
FOR EACH ROW
BEGIN
    -- Kiểm tra có tồn tại id đó trong users không
    IF NOT EXISTS (SELECT 1 FROM users WHERE id = NEW.id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User id does not exist in users table !';
    END IF;

    -- Kiểm tra có tồn tại id đó trong doctors không
    IF EXISTS (SELECT 1 FROM doctors WHERE id = NEW.id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This user is already a doctors !';
    END IF;
END$$

DELIMITER ;
