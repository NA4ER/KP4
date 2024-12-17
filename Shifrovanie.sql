-- �������� ������-����� ��� ���� ������ (����������� ������)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'UWU';

-- �������� ����������� ��� ������������� �����
CREATE CERTIFICATE MyCertificate
    WITH SUBJECT = 'Data Encryption Certificate';

  -- �������� ������������� ����� � ���������� AES
CREATE SYMMETRIC KEY DataEncryptionKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE MyCertificate;

  -- �������� ������������� ����� ��� �������������
OPEN SYMMETRIC KEY DataEncryptionKey
    DECRYPTION BY CERTIFICATE MyCertificate;
	
	CREATE TABLE ED (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Login VARCHAR(50),
    EncryptedPassword VARBINARY(MAX)
);

-- �������� ������������� ����� ��� �������������
OPEN SYMMETRIC KEY DataEncryptionKey
    DECRYPTION BY CERTIFICATE MyCertificate;

	-- ������� ������������� ������� � �������
INSERT INTO ED (Login, EncryptedPassword)
VALUES
    ('�������������', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'AdminPassword')),
    ('������������', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'UserPassword'));

	-- �������� ������������� ����� ����� �������������
CLOSE SYMMETRIC KEY DataEncryptionKey;

SELECT Login, EncryptedPassword
FROM dbo.ED;

-- ������� ������������� ������� � ������� Users � ����� dbo
INSERT INTO dbo.ED (Login, EncryptedPassword)
VALUES
    ('�������������', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'AdminPassword')),
    ('������������', ENCRYPTBYKEY(KEY_GUID('DataEncryptionKey'), 'UserPassword'));