USE servletex;
CREATE TABLE t_board (
	articleNO INT(100) UNSIGNED NOT NULL,
	parentNO INT(100) DEFAULT 0,
	title VARCHAR(500) NOT NULL,
	content VARCHAR(4000),
	imageFileName VARCHAR(30),
	writeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	id VARCHAR(20),
	FOREIGN KEY(id) REFERENCES t_member(id),
	PRIMARY KEY(`articleNO`));
	
INSERT INTO t_board VALUES(1, 0, '테스트글입니다.', '테스트글입니다.', NULL, DEFAULT, 'hong');
INSERT INTO t_board VALUES(2, 0, '안녕하세요', '상품 후기입니다.', NULL, DEFAULT, 'hong');
INSERT INTO t_board VALUES(3, 2, '답변입니다', '상품 후기에 대한 답변입니다', NULL, DEFAULT, 'hong');
INSERT INTO t_board VALUES(5, 3, '답변입니다.', '상품 좋습니다.', NULL, DEFAULT, 'lee');
INSERT INTO t_board VALUES(4, 0, '김유신입니다', '김유신 테스트글입니다.', NULL, DEFAULT, 'kim');
INSERT INTO t_board VALUES(6, 3, '상품 후기입니다..', '이순신씨의 상품 후기를 올립니다!!', NULL, DEFAULT, 'lee');

USE servletex;
DELIMITER $$
CREATE FUNCTION function_hierarchical() RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE v_articleNO INT;
	DECLARE v_parentNO INT;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @articleNO = NULL;
	SET v_parentNO = @articleNO;
	SET v_articleNO = -1;
	IF @articleNO IS NULL THEN
		RETURN NULL;
	END IF;
	LOOP
	SELECT MIN(articleNO) INTO @articleNO
	FROM t_board
	WHERE parentNO = v_parentNO
			AND articleNO > v_articleNO;
	IF (@articleNO IS NOT NULL) OR (v_parentNO = @start_with) THEN
		SET @level = @level + 1;
		RETURN @articleNO;
	END IF;
	SET @level := @level - 1;
	SELECT articleNO, parentNO INTO v_articleNO, v_parentNO
	FROM t_board
	WHERE articleNO = v_parentNO;
	END LOOP;
END $$
DELIMITER ;
