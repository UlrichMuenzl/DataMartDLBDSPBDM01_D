--Testfall 4: Eine Leihfrist wurde überzogen
--Das System prüft täglich ob eine Leihfrist überzogen wurde und meldet diese entsprechend
INSERT INTO dbo.Overdraw (RentalID, OverdrawDate, Closed)
SELECT r.RentalID, DATEADD(DAY, 1, ReturnDate) OverdrawDate, 0 Closed
FROM dbo.Rental r
LEFT JOIN dbo.Overdraw o ON r.RentalID = o.RentalID
WHERE ReturnDate < CAST(GETDATE() AS DATE)
AND o.RentalID IS NULL
--Die beteiligten Leiher und Verleiher erhalten eine Meldung mit dem Titel des Buches und des eigentlichen Fristtages
--Ausgabe des beschuldigten Leihers, des fehlenden Buches, dem eigentlichen Rückgabedatum und des Verleiher
SELECT ub.Name Leiher
		, b.Title Buchtitel
		, r.ReturnDate Rueckgabedatum
		, ul.Name Verleiher
FROM dbo.Overdraw o
INNER JOIN dbo.Rental r ON r.RentalID = o.RentalID
INNER JOIN dbo.UserBooksPossesion ubp ON ubp.UserBooksPossesionID = r.UserBooksID
INNER JOIN dbo.[User] ul ON ul.UserID = r.LenderUserID
INNER JOIN dbo.[User] ub ON ub.UserID = r.BorrowerUserID
INNER JOIN dbo.Books b ON b.BooksID = ubp.BooksID
--Nachdem die Verleiher Ihr Buch zurückerhalten haben, können Sie den gemeldeten Fall schließen
--Beispiel: Frau Metzger Anya hat ihr Buch von Herrn Hans Friedrich am gleichen Tag zurückerhalten
UPDATE o
SET Closed = 1
FROM dbo.Overdraw o
INNER JOIN dbo.Rental r ON r.RentalID = o.RentalID
INNER JOIN dbo.UserBooksPossesion ubp ON ubp.UserBooksPossesionID = r.UserBooksID
INNER JOIN dbo.[User] ul ON ul.UserID = r.LenderUserID
INNER JOIN dbo.[User] ub ON ub.UserID = r.BorrowerUserID
INNER JOIN dbo.Books b ON b.BooksID = ubp.BooksID
WHERE ub.Name = N'Friedrich, Hans'
	AND ul.Name = N'Metzger, Anya'
	AND b.Title = N'Stolz und Vorurteil'