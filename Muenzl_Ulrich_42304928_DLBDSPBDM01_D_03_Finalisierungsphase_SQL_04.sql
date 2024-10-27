--Testfall 1: Ein User möchte sich ein Buch ausleihen
--Die Nutzerin Hildegard Maier leiht sich das Buch "Die Säulen der Erde" aus.
--Ausgabe aller, zur Leihe, verfügbaren Bücher
SELECT Title
		, Author
		, Language
		, Genre
		, ReleaseYear
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Books b ON ubp.BooksID = b.booksid
INNER JOIN dbo.BooksGenre bg ON b.BooksID = bg.BooksID
INNER JOIN dbo.BooksAuthor ba ON b.BooksID = ba.BooksID
INNER JOIN dbo.Genre g ON bg.GenreID = g.GenreID
INNER JOIN dbo.Author a ON ba.AuthorID = a.AuthorID
INNER JOIN dbo.Language l ON b.LanguageID = l.LanguageID
WHERE Available = 1
--Hinterlegen des Leihvorgangs
INSERT INTO dbo.Rental(LenderUserID, BorrowerUserID, UserBooksID, RentalDate, ReturnDate)
SELECT ubp.UserID
		, u.UserID
		, UserBooksPossesionID
		, CAST(GETDATE() AS DATE)
		, DATEADD(DAY, AvailabilityDays, CAST(GETDATE() AS DATE))
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Books b ON ubp.BooksID = b.BooksID
CROSS JOIN (SELECT * FROM dbo.[User] WHERE Name = N'Maier, Hildegard') u
WHERE b.Title = N'Die Säulen der Erde'
--Aktualisieren der Verfügbarkeit
UPDATE ubp
SET ubp.Available = 0
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Rental r ON r.UserBooksID = ubp.UserBooksPossesionID

SELECT RentalID
		, Title
		, u.Name Verleiher
		, u2.Name Ausleiher
		, RentalDate
		, ReturnDate
FROM dbo.Rental r
INNER JOIN dbo.[User] u ON u.UserID = r.LenderUserID
INNER JOIN dbo.[User] u2 ON u2.UserID = r.BorrowerUserID
INNER JOIN dbo.UserBooksPossesion ubp ON ubp.UserBooksPossesionID = r.UserBooksID
INNER JOIN dbo.Books b ON b.BooksID = ubp.BooksID
WHERE UserBooksID = 4