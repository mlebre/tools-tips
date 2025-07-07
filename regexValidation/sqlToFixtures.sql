CREATE TABLE regex (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    pattern VARCHAR(200) NOT NULL,
    lang INT NOT NULL,
    associated_kv VARCHAR(100) DEFAULT NULL,
    description VARCHAR(500) DEFAULT NULL,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    INDEX IDX_4204F8CA31098462 (lang),
    PRIMARY KEY(id)
) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB;
ALTER TABLE regex ADD CONSTRAINT FK_4204F8CA31098462 FOREIGN KEY (lang) REFERENCES lang (lang_id);
ALTER TABLE regex ADD CONSTRAINT UNIQ_REGEX_NAME_LANG UNIQUE (name, lang);

CREATE TABLE program_regex (
    regex_id INT NOT NULL,
    program_id INT UNSIGNED NOT NULL,
    INDEX IDX_DC6D8B3C21717948 (regex_id),
    INDEX IDX_DC6D8B3C3EB8070A (program_id),
    PRIMARY KEY(regex_id, program_id)
) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB;
ALTER TABLE program_regex ADD CONSTRAINT FK_DC6D8B3C21717948 FOREIGN KEY (regex_id) REFERENCES regex (id);
ALTER TABLE program_regex ADD CONSTRAINT FK_DC6D8B3C3EB8070A FOREIGN KEY (program_id) REFERENCES programs (id);

CREATE TABLE regex_field (
    id INT AUTO_INCREMENT NOT NULL,
    regex_id INT NOT NULL, field VARCHAR(255) NOT NULL,
    INDEX IDX_E586417321717948 (regex_id),
    PRIMARY KEY(id)
) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB;
ALTER TABLE regex_field ADD CONSTRAINT UNIQ_REGEX_FIELD UNIQUE (regex_id, field);
ALTER TABLE regex_field ADD CONSTRAINT FK_E586417321717948 FOREIGN KEY (regex_id) REFERENCES regex (id);

-- Insert regex into DB
-- French
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isName', '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 1, 'validation.isName', 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'lastname'), (@regexId, 'firstname');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCity', '/^.{2,300}$/', 1, 'validation.isCity', 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'city'), (@regexId, 'country');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCountry', '/^.{2,300}$/', 1, 'validation.isCity', 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'city'), (@regexId, 'country');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isAddress', '/^.{2,300}$/', 1, 'validation.isAddress', 'All characters (accentuated and digits included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES (@regexId, 'address');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isEstablishment', '/^[a-zA-Z0-9- ''ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/', 1, 'validation.isEstablishment', 'Only letters, digits, dashes and underscore. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isInteger', '/^[0-9]+$/', 1, 'validation.isInteger', 'Only numeric values', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPhone', '/^(\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14})?$/', 1, 'validation.isPhone', 'Phone number format : 00/00/00/00/00 (separators allowed : ./- and space, phone number begins with a zero).', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'phone');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isZipcode', '/^[0-9]{5}$/', 1, 'validation.isZipcode', 'Five digits', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'zipcode');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isEmail', '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/', 1, 'validation.isEmail', 'Valid email (.extension between 2 and 6 characters)', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'email');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isKeyword', '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', 1, 'validation.isKeyword', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isLocation', '/^[[a-zA-Z0-9 ,\._\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ-]{2,150}$/u', 1, 'validation.isLocation', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPseudo', '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u', 1, 'validation.isPseudo', 'Only letters, digits, dashes and underscore (accentuated letters excluded). Between 2 and 30 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'pseudo');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCivility', '/^[1-2]$/', 1, 'validation.isCivility', '1 = Male, 2 = Female', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'civility');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPassword', '/^[a-zA-Z[0-9\.\/\)\(€§\-_!,;:=+''"#&@ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{8,16}$/', 1, 'validation.password', 'At least 7 letters (accentuated included) and 1 digit. Between 8 and 16 characters. Special characters allowed : ".-_!@".', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'password'), (@regexId, 'new_password');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isDate', '/^(((19)(\d{2})|(20)([01])(\d{1}))-(0?[1-9]|1?[012])-(([012])([0-9])|(3[01])))|((([012])([0-9])|(3[01]))-(0?[1-9]|1?[012])-((19)(\d{2})|(20)([01])(\d{1})))$/', 1, 'validation.isDate', 'Format dd-mm-yyyy', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'birthday');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCard', '/^([0-9a-zA-Z]{8}|[0-9a-zA-Z]{13})$/', 1, 'validation.isCard', '8 characters (letters, digits),  accentuated letters excluded).', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'card');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOauthId', '/^[0-9a-zA-Z]{8,45}$/', 1, 'validation.isOauthId', 'Letters and digits only, from 8 to 45 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'facebook_id'), (@regexId, 'google_id');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOptin', '/^[0-1]{1}$/i', 1, 'validation.isOptin', '0 or 1 (accepted)', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'opt_in'), (@regexId, 'opt_in_client');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isMessage', '/^.{30,400}$/m', 1, 'validation.isMessage', '30 to 400 characters, only letters, numbers, and these special characters : -_/', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isUuid', '/^[a-zA-Z-0-9]{1,400}$/', 1, 'validation.isUuid', 'Letters and digits only, from 1 to 400 characters;', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'uuid');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOtherid', '/^[0-9a-zA-Z\-_ ]{4,256}$/', 1, 'validation.isOtherid', 'Letters, digits, -, _ only, from 4 to 256 characters;', CURRENT_TIMESTAMP, NULL);



-- Nederlands regex
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isName', '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 3, 'validation.isName', 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'lastname'), (@regexId, 'firstname');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCity', '/^.{2,300}$/', 3, 'validation.isCity', 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'city'), (@regexId, 'country');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCountry', '/^.{2,300}$/', 3, 'validation.isCity', 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'city'), (@regexId, 'country');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isAddress', '/^.{2,300}$/', 3, 'validation.isAddress', 'All characters (accentuated and digits included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES (@regexId, 'address');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isEstablishment', '/^[a-zA-Z0-9- ''ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/', 3, 'validation.isEstablishment', 'Only letters, digits, dashes and underscore. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isInteger', '/^[0-9]+$/', 3, 'validation.isInteger', 'Only numeric values', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPhone', '/^(\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14})?$/', 3, 'validation.isPhone', 'Phone number format : 00/00/00/00/00 (separators allowed : ./- and space, phone number begins with a zero).', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'phone');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isZipcode', '/^[0-9]{5}$/', 3, 'validation.isZipcode', 'Five digits', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'zipcode');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isEmail', '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/', 3, 'validation.isEmail', 'Valid email (.extension between 2 and 6 characters)', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'email');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isKeyword', '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', 3, 'validation.isKeyword', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isLocation', '/^[[a-zA-Z0-9 ,\._\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ-]{2,150}$/u', 3, 'validation.isLocation', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPseudo', '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u', 3, 'validation.isPseudo', 'Only letters, digits, dashes and underscore (accentuated letters excluded). Between 2 and 30 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'pseudo');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCivility', '/^[1-2]$/', 3, 'validation.isCivility', '1 = Male, 2 = Female', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'civility');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isPassword', '/^[a-zA-Z[0-9\.\/\)\(€§\-_!,;:=+''"#&@ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{8,16}$/', 3, 'validation.password', 'At least 7 letters (accentuated included) and 1 digit. Between 8 and 16 characters. Special characters allowed : ".-_!@".', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'password'), (@regexId, 'new_password');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isDate', '/^(((19)(\d{2})|(20)([01])(\d{1}))-(0?[1-9]|1?[012])-(([012])([0-9])|(3[01])))|((([012])([0-9])|(3[01]))-(0?[1-9]|1?[012])-((19)(\d{2})|(20)([01])(\d{1})))$/', 3, 'validation.isDate', 'Format dd-mm-yyyy', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'birthday');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isCard', '/^([0-9a-zA-Z]{8}|[0-9a-zA-Z]{13})$/', 3, 'validation.isCard', '8 characters (letters, digits),  accentuated letters excluded).', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'card');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOauthId', '/^[0-9a-zA-Z]{8,45}$/', 3, 'validation.isOauthId', 'Letters and digits only, from 8 to 45 characters.', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'facebook_id'), (@regexId, 'google_id');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOptin', '/^[0-1]{1}$/i', 3, 'validation.isOptin', '0 or 1 (accepted)', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'opt_in'), (@regexId, 'opt_in_client');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isMessage', '/^.{30,400}$/m', 3, 'validation.isMessage', '30 to 400 characters, only letters, numbers, and these special characters : -_/', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isUuid', '/^[a-zA-Z-0-9]{1,400}$/', 3, 'validation.isUuid', 'Letters and digits only, from 1 to 400 characters;', CURRENT_TIMESTAMP, NULL);
SET @regexId = LAST_INSERT_ID();
INSERT INTO regex_field (regex_id, field) VALUES
    (@regexId, 'uuid');
INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES
    ('isOtherid', '/^[0-9a-zA-Z\-_ ]{4,256}$/', 3, 'validation.isOtherid', 'Letters, digits, -, _ only, from 4 to 256 characters;', CURRENT_TIMESTAMP, NULL);
