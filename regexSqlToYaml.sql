CREATE TABLE regex (
    id INT AUTO_INCREMENT NOT NULL,
    lang INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    pattern VARCHAR(200) NOT NULL,
    description VARCHAR(500) DEFAULT NULL,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    INDEX IDX_4204F8CA31098462 (lang),
    PRIMARY KEY(id)
) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB;
ALTER TABLE regex ADD CONSTRAINT FK_4204F8CA31098462 FOREIGN KEY (lang) REFERENCES lang (lang_id);
ALTER TABLE regex ADD CONSTRAINT UNIQ_REGEX_NAME_LANG UNIQUE (name, lang);

-- Catchup regex from back office
-- French
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES 
    (1, 'isName', '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isCity', '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isAddress', '/^[a-zA-Z0-9- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'All characters (accentuated and digits included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isCountry', '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isInteger', '/^[0-9]+$/', 'Only numeric values', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isPhone', '/^0[0-9]([ \.-\/]?[0-9]{2}){4}$/', 'Phone number format : 00/00/00/00/00 (separators allowed : ./- and space, phone number begins with a zero).', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isZipcode', '/^[0-9]{5}$/', 'Five digits', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isEmail', '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-z]{2,6}$/', 'Valid email (.extension between 2 and 6 characters)', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isKeyword', '/^[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isLocation', '/^[[:alpha:]A-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isPseudo', '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u', 'Only letters, digits, dashes and underscore (accentuated letters excluded). Between 2 and 30 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isCivility', '/^[1-2]$/', '1 = Male, 2 = Female', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isPassword', '/^[a-zA-Z0-9\.\-_!@]{8,16}$/', 'At least 7 letters (accentuated included) and 1 digit. Between 8 and 16 characters. Special characters allowed : ".-_!@".', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isDate', '@^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$@', 'Format dd-mm-yyyy', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isCard', '/^[0-9a-zA-Z]{8}$/', '8 characters (letters, digits),  accentuated letters excluded).', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isOptin', '/^[0-1]{1}$/i', 'boolean', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isMessage', '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ\n]{30,400}$/u', 'Not a valid message : 30 to 400 characters, only letters, numbers, and these special characters : -_/', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isOtherid', '/^[0-9a-zA-Z\-_ ]{4,256}$/', 'Only letters, digits, dashes and underscore. Between 4 and 256 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isEstablishment', '/^[a-zA-Z0-9- ''ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/', 'Only letters, digits, dashes and underscore. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isOauthId', '/^[0-9a-zA-Z]{8,45}$/', 'Invalid OAuthId', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (1, 'isUuid', '/^[a-zA-Z-0-9]{1,400}$/', 'Invalid UUID', CURRENT_TIMESTAMP, NULL);



-- Nederlands regex
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isName', '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isCity', '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ'']{2,300}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isAddress', '/^[a-zA-Z0-9- ''ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ%?&$]{2,300}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isCountry', '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/', 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isInteger', '/^[0-9]+$/', 'Alleen ronde getallen (0-9) zijn toegestaan.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isPhone', '/^0[0-9]([ \.-\/]?[0-9]{2}){4}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isZipcode', '/^[0-9]{4,5}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isEmail', '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,63}$/', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isKeyword', '/^[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', 'Het ingevulde wachtwoord dient tussen de 2 en 16 karakters te bevatten. Speciale tekens die toegestaan zijn: \/)(€§\-_!,;:=+\ ', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isLocation', '/^[[a-zA-Z0-9 ,\._\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ-]{2,150}$/u', 'Ongeldig formaat', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isPseudo', '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u', 'De gebruikersnaam mag geen tekens met accenten bevatten en dient tussen de 2 en 30 karakters lang te zijn. ', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isCivility', '/^[1-2]$/', '1 = Man, 2 = Vrouw', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isPassword', '/^[a-zA-Z0-9\.\-_!@]{8,16}$/', 'At least 7 letters (accentuated included) and 1 digit. Between 8 and 16 characters. Special characters allowed : ".-_!@".', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isDate', '/^(([0-3][0-9])|[0-9]{4})[-\/ ]([0-1][0-9])[-\/ ](([0-9]{4})|([0-3][0-9]))$/', 'Voer een geldige datum in (dd/mm/jjjj).', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isCard', '/^[0-9a-zA-Z]{8}$/', 'De activatiecode bestaat uit 8 karakters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isOptin', '/^[0-1]{1}$/i', 'boolean', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isMessage', '/^.{30,400}$/', 'Je bericht dient tussen de 30 en 400 karakters te bevatten.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isOtherid', '/^[0-9a-zA-Z\-_ ]{4,256}$/', 'Klantnummer in ongeldig formaat.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isEstablishment', '/^[a-zA-Z0-9- ''ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/', 'Only letters, digits, dashes and underscore. Between 2 and 300 characters.', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isOauthId', '/^[0-9a-zA-Z]{8,45}$/', 'Ongeldig OAuthId', CURRENT_TIMESTAMP, NULL);
INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES
    (3, 'isUuid', '/^[a-zA-Z-0-9]{1,400}$/', 'Ongeldig UUID', CURRENT_TIMESTAMP, NULL);

