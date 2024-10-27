--Testfall 2: Ein User hinterlegt ein Buch auf seiner Wunschliste
--Der Nutzer Ulrich Münzl wünscht sich das Buch Sakrileg.
--Ausgabe des Buchs Sakrileg mit allen Infos
SELECT Title
		, Author
		, Language
		, Genre
		, ReleaseYear
FROM dbo.Books b
INNER JOIN dbo.BooksGenre bg ON b.BooksID = bg.BooksID
INNER JOIN dbo.BooksAuthor ba ON b.BooksID = ba.BooksID
INNER JOIN dbo.Genre g ON bg.GenreID = g.GenreID
INNER JOIN dbo.Author a ON ba.AuthorID = a.AuthorID
INNER JOIN dbo.Language l ON b.LanguageID = l.LanguageID
WHERE Title = N'Sakrileg'
--Hinterlegen des Leihvorgangs
INSERT INTO dbo.UserBooksWishlist(UserID, BooksID)
SELECT u.UserID
		, b.BooksID
FROM dbo.Books b
CROSS JOIN (SELECT * FROM dbo.[User] WHERE Name = N'Münzl, Ulrich') u
WHERE b.Title = N'Sakrileg'
--Ausgabe der Wunschliste
SELECT ubw.UserBooksWishlistID
		, u.Name
		, b.Title
FROM dbo.UserBooksWishlist ubw
INNER JOIN dbo.[User] u ON ubw.UserID = u.UserID
INNER JOIN dbo.Books b ON ubw.BooksID = b.BooksID
WHERE u.Name = N'Münzl, Ulrich'
