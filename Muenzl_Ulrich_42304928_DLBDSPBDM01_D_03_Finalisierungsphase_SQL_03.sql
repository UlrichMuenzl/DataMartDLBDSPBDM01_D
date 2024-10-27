INSERT INTO dbo.Language (Language)
VALUES (N'Deutsch')
		, (N'Englisch')
		, (N'Spanisch')
		, (N'Italienisch')
		, (N'Franz�sisch')
		, (N'Tschechisch')
		, (N'Polnisch')
		, (N'Russisch')
		, (N'Kroatisch')
		, (N'T�rkisch')

INSERT INTO dbo.City (PostalCode, City)
VALUES (99999, N'Mustermannstadt')
		, (11111, N'Musterfraustadt')
		, (92449, N'Steinberg am See')
		, (92421, N'Wackersdorf')
		, (92442, N'Schwandorf')
		, (92224, N'Amberg')
		, (92439, N'Bodenw�hr')
		, (93444, N'Bad Abbach')
		, (93073, N'Neutraubling')
		, (93059, N'Regensburg')

INSERT INTO dbo.Author (Author)
VALUES (N'J. R. R. Tolkien')
		, (N'J. K. Rowling')
		, (N'Stephan King')
		, (N'Terry Pratchett')
		, (N'Sebastian Fitzek')
		, (N'Ken Follet')
		, (N'Agatha Christie')
		, (N'Dan Brown')
		, (N'Jane Austen')
		, (N'Diana Gabaldon')

INSERT INTO dbo.Genre (Genre)
VALUES (N'Fantasy')
		, (N'Krimi')
		, (N'Thriller')
		, (N'Science Fiction')
		, (N'Horror')
		, (N'Liebesroman')
		, (N'Sachbuch')
		, (N'Ratgeber')
		, (N'Biografie')
		, (N'Historischer Roman')

INSERT INTO dbo.PickUp (PickUp)
VALUES (N'Abholung bei Verleiher')
		, (N'Abholung bei alternativer Adresse')


INSERT INTO dbo.PickUpTime (PickUpTime)
VALUES (N'07:00 Uhr - 10:00 Uhr')
		, (N'10:00 Uhr - 13:00 Uhr')
		, (N'13:00 Uhr - 16:00 Uhr')
		, (N'16:00 Uhr - 19:00 Uhr')
		, (N'19:00 Uhr - 22:00 Uhr')

INSERT INTO dbo.Condition (Condition)
VALUES (N'Leichte Gebrauchsspuren')
		, (N'Neu')
		, (N'Starke Gebrauchsspuren')
		, (N'Rarit�t')

INSERT INTO dbo.Books (Title, LanguageID, ReleaseYear)
VALUES (N'Das Silmarillion', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Deutsch'), 1977)
		, (N'Harry Potter und der Stein der Weisen', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Englisch'), 1997)
		, (N'Shining ', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Spanisch'), 1977)
		, (N'Die Farben der Magie', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Italienisch'), 1983)
		, (N'Das Paket', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Deutsch'), 2016)
		, (N'Die S�ulen der Erde', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Franz�sisch'), 1989)
		, (N'Mord im Orient-Express', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Tschechisch'), 1934)
		, (N'Sakrileg ', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Russisch'), 2004)
		, (N'Stolz und Vorurteil', (SELECT LanguageID FROM dbo.Language WHERE Language = N'Kroatisch'), 1813)
		, (N'Outlander ', (SELECT LanguageID FROM dbo.Language WHERE Language = N'T�rkisch'), 1991)

INSERT INTO dbo.BooksAuthor (BooksID, AuthorID)
VALUES (1,1)
		, (2,2)
		, (3,3)
		, (4,4)
		, (5,5)
		, (6,6)
		, (7,7)
		, (8,8)
		, (9,9)
		, (10,10)

INSERT INTO dbo.BooksGenre (BooksID, GenreID)
VALUES (1,1)
		, (2,1)
		, (3,3)
		, (4,1)
		, (5,3)
		, (6,10)
		, (7,2)
		, (8,3)
		, (9,6)
		, (10,10)

INSERT INTO dbo.Adress (CityID, Adress)
VALUES (1, N'Mustermannstra�e 8')
		, (2, N'Musterfraustra�e 8')
		, (3, N'Am Loiblweiher 4')
		, (4, N'Am Hang 33')
		, (5, N'Senefelderstra�e 14')
		, (6, N'Regensburger Stra�e 1')
		, (7, N'Ludwigsheide 2')
		, (8, N'Kaiser-Karl-V.-Allee 3')
		, (9, N'B�hmerwaldstra�e 5')
		, (10, N'Weichser Weg 5')

INSERT INTO dbo.[User] (Name, MainAdressID, PhoneNr, MailAdress)
VALUES (N'Mustermann, Max', 1, N'015199999999', N'max@mustermann.de')
		, (N'Musterfrau, Marianne', 2, N'015212345678', N'Marianne@Musterfrau.de')
		, (N'M�nzl, Ulrich', 3, N'015198765432', N'Ulrich@Muenzl.de')
		, (N'Maier, Hildegard', 4, N'015198765431', N'Hildegard@Maier.de')
		, (N'Friedrich, Hans', 5, N'015198765430', N'Hans@Friedrich.de')
		, (N'Huber, Dennis', 6, N'015198765439', N'Dennis@Huber.de')
		, (N'Fischer, Inge', 7, N'015198765438', N'Inge@Fischer.de')
		, (N'Bauer, Torsten', 8, N'015198765437', N'Torsten@Bauer.de')
		, (N'Metzger, Anya', 9, N'015198765436', N'Anya@Metzger.de')
		, (N'Hain, Michael', 10, N'015198765435', N'Michael@Hain.de')

INSERT INTO dbo.UserBooksPossesion (UserID, BooksID, ConditionID, Available, AvailabilityDays, PickUpID, PickUpTimeID, PickUpAdressID, Delivery)
VALUES (1, 1, 1, 0, 14, 1, 1, 1, 0)
		, (3, 2, 2, 1, 8, 1, 5, 3, 0)
		, (3, 3, 3, 1, 4, 2, 5, 5, 1)
		, (3, 6, 1, 0, 21, 1, 5, 3, 0)
		, (6, 4, 1, 1, 15, 1, 2, 6, 0)
		, (6, 7, 3, 1, 16, 2, 2, 8, 1)
		, (7, 5, 1, 0, 18, 1, 3, 7, 1)
		, (9, 9, 4, 1, 7, 1, 4, 9, 0)
		, (10, 8, 1, 0, 12, 2, 3, 1, 0)
		, (10, 10, 2, 1, 11, 1, 3, 10, 0)

INSERT INTO dbo.UserBooksWishlist (UserID, BooksID)
VALUES (2, 1)
		, (2, 3)
		, (4, 2)
		, (4, 5)
		, (4, 7)
		, (5, 8)
		, (5, 9)
		, (8, 1)
		, (8, 4)
		, (8, 10)

INSERT INTO dbo.Rental(LenderUserID, BorrowerUserID, UserBooksID, RentalDate, ReturnDate)
VALUES    (1, 2, 1, CAST('20241013' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 1), CAST('20241013' AS DATE)) AS DATE))
		, (3, 2, 3, CAST('20241012' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 3), CAST('20241012' AS DATE)) AS DATE))
		, (3, 4, 2, CAST('20241011' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 2), CAST('20241011' AS DATE)) AS DATE))
		, (7, 4, 7, CAST('20241008' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 7), CAST('20241008' AS DATE)) AS DATE))
		, (6, 4, 6, CAST('20241007' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 6), CAST('20241007' AS DATE)) AS DATE))
		,(10, 5, 9, CAST('20241006' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 9), CAST('20241006' AS DATE)) AS DATE))
		, (9, 5, 8, CAST('20240928' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 8), CAST('20240928' AS DATE)) AS DATE))
		, (6, 8, 5, CAST('20240929' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 5), CAST('20240929' AS DATE)) AS DATE))
		,(10, 8, 10, CAST('20240928' AS DATE), CAST(DATEADD(DAY, (SELECT AvailabilityDays FROM dbo.UserBooksPossesion WHERE UserBooksPossesionID = 10), CAST('20240928' AS DATE)) AS DATE))

INSERT INTO dbo.BooksReview (UserBooksPossesionID, ReviewerUserID, Rating, Comment)
VALUES (1, 2, 5, N'Ein wahrhaft gro�artiges Buch, das einen immer wieder in den Bann zieht.')
		, (1, 7, 5, N'Ein sehr sch�nes Buch in gutem Zustand.')
		, (1, 3, 5, NULL)
		, (2, 4, 3, NULL)
		, (2, 1, 2, N'Der Zustand des Buches ist nicht wie angegeben.')
		, (2, 2, 4, N'Ein zauberhafte Geschichte und ein sehr netter Buchbesitzer')
		, (10, 8, 4, NULL)
		, (10, 1, 1, NULL)
		, (10, 2, 5, N'Gro�artiges Buch, Perfekter Zustand')
		, (10, 9, 5, NULL)

INSERT INTO dbo.Role(Role)
VALUES (N'Verleiher')
		, (N'Ausleiher')

INSERT INTO dbo.UserRole(UserID, RoleID)
SELECT DISTINCT UserID, 2
FROM dbo.[User]

UPDATE ubp
SET Available = CASE WHEN r.RentalID IS NULL THEN 1 ELSE 0 END
FROM dbo.UserBooksPossesion ubp
LEFT JOIN dbo.Rental r ON r.UserBooksID = ubp.UserBooksPossesionID

INSERT INTO dbo.Overdraw (RentalID, OverdrawDate, Closed)
SELECT r.RentalID, DATEADD(DAY, 1, ReturnDate) OverdrawDate, 0 Closed
FROM dbo.Rental r
LEFT JOIN dbo.Overdraw o ON r.RentalID = o.RentalID
WHERE ReturnDate < CAST(GETDATE() AS DATE)
AND o.RentalID IS NULL

UPDATE dbo.UserRole
SET RoleID = 1
WHERE UserID IN (SELECT DISTINCT UserID FROM dbo.UserBooksPossesion)