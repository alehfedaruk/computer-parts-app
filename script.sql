-- test: table
CREATE TABLE `test`
(
    `id`       int(11)      NOT NULL AUTO_INCREMENT,
    `title`    varchar(255) NOT NULL,
    `required` tinyint(1)   NOT NULL,
    `quantity` int(11)      NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 48
  DEFAULT CHARSET = utf8;

INSERT INTO test.test (id, title, required, quantity) VALUES (1, 'CPU', 1, 6);
INSERT INTO test.test (id, title, required, quantity) VALUES (3, 'MotherBoard', 1, 4);
INSERT INTO test.test (id, title, required, quantity) VALUES (4, 'CD-Drive', 0, 12);
INSERT INTO test.test (id, title, required, quantity) VALUES (5, 'Memory', 1, 10);
INSERT INTO test.test (id, title, required, quantity) VALUES (6, 'HDD', 1, 2);
INSERT INTO test.test (id, title, required, quantity) VALUES (7, 'KeyBoard', 0, 3);
INSERT INTO test.test (id, title, required, quantity) VALUES (22, 'Mouse', 0, 3);
INSERT INTO test.test (id, title, required, quantity) VALUES (23, 'router', 0, 1);
INSERT INTO test.test (id, title, required, quantity) VALUES (24, 'Case', 0, 17);
INSERT INTO test.test (id, title, required, quantity) VALUES (26, 'Network Card', 0, 4);
INSERT INTO test.test (id, title, required, quantity) VALUES (27, 'External Drive', 0, 12);
INSERT INTO test.test (id, title, required, quantity) VALUES (29, 'External Sound Card', 0, 12);
INSERT INTO test.test (id, title, required, quantity) VALUES (31, 'Power Supply', 1, 42);
INSERT INTO test.test (id, title, required, quantity) VALUES (32, 'SSD', 0, 85);
INSERT INTO test.test (id, title, required, quantity) VALUES (33, 'Sound system', 0, 15);
INSERT INTO test.test (id, title, required, quantity) VALUES (34, 'External TV Tuner', 0, 7);
INSERT INTO test.test (id, title, required, quantity) VALUES (35, 'Internal TV Tuner', 0, 11);
INSERT INTO test.test (id, title, required, quantity) VALUES (36, 'Memory Card Reader', 0, 55);
INSERT INTO test.test (id, title, required, quantity) VALUES (42, 'Fan', 1, 36);
INSERT INTO test.test (id, title, required, quantity) VALUES (43, 'Graphics Card', 0, 5);
INSERT INTO test.test (id, title, required, quantity) VALUES (46, 'myNewPart', 0, 34);
