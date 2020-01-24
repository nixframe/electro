INSERT INTO adres (id, apartment_number, city, house_number, post_code, street)
VALUES (1, 45, 'Warszawa', 54, '02-000', 'prosta');
INSERT INTO adres (id, apartment_number, city, house_number, post_code, street)
VALUES (2, 11, 'Warszawa', 22, '01-000', 'krzywa');

INSERT INTO manufacturer(id, name)
VALUES (1, 'Nintendo');
INSERT INTO manufacturer(id, name)
VALUES (2, 'Sony');
INSERT INTO manufacturer(id, name)
VALUES (3, 'Microsoft');
INSERT INTO manufacturer(id, name)
VALUES (4, 'Sega');

INSERT INTO product(id, created, description, manufacturer_id, name, picture, price, quantity, rating, ratings_number)
VALUES (1, '2020-01-01 01:01:01', 'PS4 gaming console', 2, 'PS4', '/images/PS4.jpg', 1499, 100, 4, 3);
INSERT INTO product(id, created, description, manufacturer_id, name, picture, price, quantity, rating, ratings_number)
VALUES (2, '2020-01-01 01:01:01', 'PS3 gaming console', 2, 'PS3', '/images/ps3.jpg', 779, 30, 5, 60);
INSERT INTO product(id, created, description, manufacturer_id, name, picture, price, quantity, rating, ratings_number)
VALUES (3, '2020-01-01 01:01:01', 'Switch gaming console', 1, 'Switch', '/images/switch.jpg', 1599, 100, 4, 3);
INSERT INTO product(id, created, description, manufacturer_id, name, picture, price, quantity, rating, ratings_number)
VALUES (4, '2020-01-01 01:01:01', 'Xbox One gaming console', 3, 'Xbox', '/images/xbox.jpg', 1699, 100, 4, 3);


INSERT INTO user (id, enabled, email, first_name, password, last_name, adres_id)
VALUES (1, 1, 'user@user', 'Jan', '$2a$10$E63pA4guE51Z5QkAcPrCgeTO1Sk9NEPlAb2EUZ2QJ3NXYBC2kbBCG', 'Kowalski', 1);
INSERT INTO user (id, enabled, email, first_name, password, last_name, adres_id)
VALUES (2, 1, 'admin@admin', 'Jan', '$2a$10$E63pA4guE51Z5QkAcPrCgeTO1Sk9NEPlAb2EUZ2QJ3NXYBC2kbBCG', 'Jabłoński', 2);
INSERT INTO user (id, enabled, email, first_name, password, last_name, adres_id)
VALUES (3, 1, 'asd@asd', 'Jan', '$2a$10$E63pA4guE51Z5QkAcPrCgeTO1Sk9NEPlAb2EUZ2QJ3NXYBC2kbBCG', 'Sztorc', null);


INSERT INTO role(role_id, role)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_ADMIN'),
       (3, 'ROLE_SUPER');

INSERT INTO user_role(user_id, role_id)
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (3, 1),
       (3, 2),
       (3, 3);









