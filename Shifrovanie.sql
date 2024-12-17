-- Создание мастер-ключа для базы данных (потребуется пароль)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'UWU';

-- Создание сертификата для симметричного ключа
CREATE CERTIFICATE MyCertificate
    WITH SUBJECT = 'Data Encryption Certificate';

  -- Создание симметричного ключа с алгоритмом AES
CREATE SYMMETRIC KEY DataEncryptionKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE MyCertificate;

  -- Открытие симметричного ключа для использования
OPEN SYMMETRIC KEY DataEncryptionKey
    DECRYPTION BY CERTIFICATE MyCertificate;
	
	CREATE TABLE ED (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Login VARCHAR(50),
    EncryptedPassword VARBINARY(MAX)
);

-- Открытие симметричного ключа для использования
OPEN SYMMETRIC KEY DataEncryptionKey
    DECRYPTION BY CERTIFICATE MyCertificate;

	-- Вставка зашифрованных паролей в таблицу
INSERT INTO ED (Login, EncryptedPassword)
VALUES
    ('Администратор', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'AdminPassword')),
    ('Пользователь', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'UserPassword'));

	-- Закрытие симметричного ключа после использования
CLOSE SYMMETRIC KEY DataEncryptionKey;

SELECT Login, EncryptedPassword
FROM dbo.ED;

-- Вставка зашифрованных паролей в таблицу Users в схеме dbo
INSERT INTO dbo.ED (Login, EncryptedPassword)
VALUES
    ('Администратор', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'AdminPassword')),
    ('Пользователь', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'UserPassword'));