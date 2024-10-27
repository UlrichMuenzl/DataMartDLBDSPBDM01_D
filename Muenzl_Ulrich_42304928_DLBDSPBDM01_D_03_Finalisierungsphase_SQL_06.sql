--Testfall 3: Ein User möchte ein Buch bewerten.
--Der Nutzer Hans Friedrich bewertet das Buch "Stolz und Vorurteil".
--Ausgabe der Bewertungen des Buchs des Besitzers
SELECT Title
		, Name OwnerName
		, br.Rating
		, br.Comment
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Books b ON ubp.BooksID = b.booksid
INNER JOIN dbo.[User] u ON ubp.UserID = u.UserID
LEFT JOIN dbo.BooksReview br ON ubp.UserBooksPossesionID = br.UserBooksPossesionID
WHERE b.Title = 'Stolz und Vorurteil'
	AND u.Name = 'Metzger, Anya'
--Bewertung
INSERT INTO dbo.BooksReview (UserBooksPossesionID, ReviewerUserID, Rating, Comment)
SELECT UserBooksPossesionID
		, ur.UserID
		, 5 Rating
		, N'Eines meiner absoltuen Lieblingsbücher und das in einem so unglaublichen Zustand, wahrlich Spitze.' Comment
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Books b ON ubp.BooksID = b.booksid
INNER JOIN dbo.[User] u ON ubp.UserID = u.UserID
CROSS JOIN dbo.[User] ur
WHERE b.Title = 'Stolz und Vorurteil'
	AND u.Name = 'Metzger, Anya'
	AND ur.Name = 'Friedrich, Hans'
--Erneute Ausgabe der Bewertungen des Buchs des Besitzers
SELECT Title
		, Name OwnerName
		, br.Rating
		, br.Comment
FROM dbo.UserBooksPossesion ubp
INNER JOIN dbo.Books b ON ubp.BooksID = b.booksid
INNER JOIN dbo.[User] u ON ubp.UserID = u.UserID
LEFT JOIN dbo.BooksReview br ON ubp.UserBooksPossesionID = br.UserBooksPossesionID
WHERE b.Title = 'Stolz und Vorurteil'
	AND u.Name = 'Metzger, Anya'