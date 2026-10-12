
INSERT INTO dbo.Admins
    (FullName, Email, ContactNumber, PasswordHash,
     Role, AccountStatus, CreatedDate)
VALUES
    ('LifeLink Admin',
     'admin@lifelink.com',
     '9876543210',
     'e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7',
     'Admin',
     'Active',
     GETDATE());

