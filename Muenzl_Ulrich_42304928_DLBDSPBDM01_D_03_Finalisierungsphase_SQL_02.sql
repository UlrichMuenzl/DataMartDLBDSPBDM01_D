USE [IUDataMart]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlage der Tabelle dbo.Adress
--Hier sollen die Straßen und Hausnummern der Nutzer gespeichert werden.
--Die zugehörige Stadt wird per Fremdschlüssel in der Tabelle dbo.City gefunden.
CREATE TABLE [dbo].[Adress](
	[AdressID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[Adress] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[AdressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlage der Tabelle dbo.Author
--Hier werden die Namen aller benötigten Autoren gespeichert.
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Books
--Hier werden alle buchrelevanten Informationen, wie der Titel oder das Erscheinungsjahr gespeichert.
--Die Sprache wird per Fremdschlüssel in der Tabelle dbo.Language gefunden.
CREATE TABLE [dbo].[Books](
	[BooksID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](400) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ReleaseYear] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BooksID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksAuthor]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.BooksAuthor
--Diese Tabelle dient als Verbindung zwischen den Tabellen dbo.Books und dbo.Author
--Nachdem ein Buch mehrere Autoren besitzen kann und nicht für jede mögliche Konstellation ein eigener Eintrag in der Tabelle dbo.Author erzeugt werden soll wird über diese Tabelle diese N:M Beziehung aufgelöst.
CREATE TABLE [dbo].[BooksAuthor](
	[BooksAuthorID] [int] IDENTITY(1,1) NOT NULL,
	[BooksID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_BooksAuthor] PRIMARY KEY CLUSTERED 
(
	[BooksAuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksGenre]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.BooksGenre
--Diese Tabelle dient als Verbindung zwischen den Tabellen dbo.Books und dbo.Genre
--Nachdem ein Buch mehrere Genres besitzen kann und nicht für jede mögliche Konstellation ein eigener Eintrag in der Tabelle dbo.Genre erzeugt werden soll wird über diese Tabelle diese N:M Beziehung aufgelöst.
CREATE TABLE [dbo].[BooksGenre](
	[BooksGenreID] [int] IDENTITY(1,1) NOT NULL,
	[BooksID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
 CONSTRAINT [PK_BooksGenre] PRIMARY KEY CLUSTERED 
(
	[BooksGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksReview]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.BooksReview
--In dieser Tabelle sollen alle Bewertung die ein User für sein Buch erhalten kann gespeichert werden
--Das Buch und der Besitzer der bewertet wurden, können über den Fremdschlüssel in der Tabelle dbo.UserBooksPossesion gefunden werden.
--Der bewertende User kann über den Fremdschlüssel ReviewerUserID in der Tabelle dbo.User gefunden werden
CREATE TABLE [dbo].[BooksReview](
	[BooksReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserBooksPossesionID] [int] NOT NULL,
	[ReviewerUserID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_BooksReview] PRIMARY KEY CLUSTERED 
(
	[BooksReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.City
--In dieser Tabelle sollen alle benötigten Städte und deren Postleitzahlen gespeichert werden.
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[City] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Condition
--In dieser Tabelle sollen alle möglichen Buchzustände gespeichert werden.
CREATE TABLE [dbo].[Condition](
	[ConditionID] [int] IDENTITY(1,1) NOT NULL,
	[Condition] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Condition] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Genre
--In dieser Tabelle sollen alle Buchgenres gespeichert werden.
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Language
--In dieser Tabelle sollen alle Buchsprachen gespeichert werden.
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Overdraw]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Overdraw
--In dieser Tabelle werden alle Leihvorgänge gespeichert, bei denen die Leihfrist überzogen wurde.
--Der zugehörige Leihvorgang wird per Fremdschlüssel in der dbo.Rental gefunden
CREATE TABLE [dbo].[Overdraw](
	[OverdrawID] [int] IDENTITY(1,1) NOT NULL,
	[RentalID] [int] NOT NULL,
	[OverdrawDate] [date] NOT NULL,
	[Closed] [bit] NULL,
 CONSTRAINT [PK_Overdraw] PRIMARY KEY CLUSTERED 
(
	[OverdrawID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUp]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.PickUp
--In dieser Tabelle sollen alle Abhol- bzw. Lieferarten gespeichert werden.
CREATE TABLE [dbo].[PickUp](
	[PickUpID] [int] IDENTITY(1,1) NOT NULL,
	[PickUp] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_PickUp] PRIMARY KEY CLUSTERED 
(
	[PickUpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpTime]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.PickUpTime
--In dieser Tabelle sollen alle Zeitslots, die ein User für die Abholung auswählen kann, gespeichert werden.
CREATE TABLE [dbo].[PickUpTime](
	[PickUpTimeID] [int] IDENTITY(1,1) NOT NULL,
	[PickUpTime] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_PickUpTime] PRIMARY KEY CLUSTERED 
(
	[PickUpTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Rental.
--In dieser Tabelle sollen alle Leihvorgänge gespeichert werden.
--Der Verleihende User wird über die LenderUserID per Fremdschlüssel in der Tabelle dbo.User gefunden.
--Der Leihende User wird über die BorrowerUserID per Fremdschlüssel in der Tabelle dbo.User gefunden.
--Das relevante Buch wird über die UserBooksID per Fremdschlüssel in der Tabelle dbo.UserBooksPossesion gefunden.
CREATE TABLE [dbo].[Rental](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[LenderUserID] [int] NOT NULL,
	[BorrowerUserID] [int] NOT NULL,
	[UserBooksID] [int] NOT NULL,
	[RentalDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.Role.
--In dieser Tabelle sollen alle Rollen, die ein Benutzer besitzen kann, gespeichert werden.
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.User.
--In dieser Tabelle sollen alle Nutzerinfos gespeichert werden.
--Die Wohnadresse wird über die MainAdressID per Fremdschlüssel in der dbo.Adress gefunden.
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[MainAdressID] [int] NOT NULL,
	[PhoneNr] [nvarchar](400) NOT NULL,
	[MailAdress] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBooksPossesion]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.UserBooksPossesion.
--In dieser Tabelle sollen alle zugehörigkeiten von Nutzern und deren Büchern gespeichert werden.
--Zusätzlich wird hier alles relevante, für die Verleihung, wie z.B. die Verleihdauer gespeichert.
--Der Besitzer wird über die UserID per Fremdschlüssel in der dbo.User gefunden.
--Das Buch wird über die BooksID per Fremdschlüssel in der dbo.Books gefunden.
--Der Buchzustand wird über die ConditionID per Fremdschlüssel in der dbo.Condition gefunden.
--Die Zustellungsart wird über die PickUpID per Fremdschlüssel in der dbo.PickUp gefunden.
--Der Abholzeitslot wird über die PickUpTimeID per Fremdschlüssel in der dbo.PickUpTime gefunden.
--Die Abholadresse wird über die PickUpAdressID per Fremdschlüssel in der dbo.Adress gefunden.
CREATE TABLE [dbo].[UserBooksPossesion](
	[UserBooksPossesionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BooksID] [int] NOT NULL,
	[ConditionID] [int] NOT NULL,
	[Available] [bit] NOT NULL,
	[AvailabilityDays] [int] NOT NULL,
	[PickUpID] [int] NOT NULL,
	[PickUpTimeID] [int] NOT NULL,
	[PickUpAdressID] [int] NOT NULL,
	[Delivery] [bit] NOT NULL,
 CONSTRAINT [PK_UserBooksPossesion] PRIMARY KEY CLUSTERED 
(
	[UserBooksPossesionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBooksWishlist]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.UserBooksWishlist.
--In dieser Tabelle sollen alle Nutzer Ihre gewünschten Büchern speichern.
--Der Wünschende wird über die UserID per Fremdschlüssel in der dbo.User gefunden.
--Das gewünschte Buch wird über die BooksID per Fremdschlüssel in der dbo.Books gefunden.
CREATE TABLE [dbo].[UserBooksWishlist](
	[UserBooksWishlistID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BooksID] [int] NOT NULL,
 CONSTRAINT [PK_UserBooksWishlist] PRIMARY KEY CLUSTERED 
(
	[UserBooksWishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 26.10.2024 16:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Anlegen der Tabelle dbo.UserRole.
--In dieser Tabelle sollen die Rollen der Nutzer hinterlegt werden.
--Der Nutzer wird über die UserID per Fremdschlüssel in der dbo.User gefunden.
--Die Rolle des Nutzers wird über die RoleID per Fremdschlüssel in der dbo.Role gefunden.
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--
--
--
--
--Trennung zwischen Tabellenerstellungen und Indexerstellung
--
--
--
--
/****** Object:  Index [nccix_Adress]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Adress 
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Adress] ON [dbo].[Adress]
(
	[AdressID],
	[CityID],
	[Adress]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Authro]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Author
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Authro] ON [dbo].[Author]
(
	[AuthorID],
	[Author]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Books]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Books
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Books] ON [dbo].[Books]
(
	[BooksID],
	[Title],
	[LanguageID],
	[ReleaseYear]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_BooksAuthor]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.BooksAuthor
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_BooksAuthor] ON [dbo].[BooksAuthor]
(
	[BooksAuthorID],
	[BooksID],
	[AuthorID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_BooksGenre]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.BooksGenre
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_BooksGenre] ON [dbo].[BooksGenre]
(
	[BooksGenreID],
	[BooksID],
	[GenreID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_BooksReview]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.BooksReview
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_BooksReview] ON [dbo].[BooksReview]
(
	[BooksReviewID],
	[UserBooksPossesionID],
	[ReviewerUserID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_City]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.City
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_City] ON [dbo].[City]
(
	[CityID],
	[PostalCode],
	[City]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Condition]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Condition
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Condition] ON [dbo].[Condition]
(
	[ConditionID],
	[Condition]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Genre]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Genre
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Genre] ON [dbo].[Genre]
(
	[GenreID],
	[Genre]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Language]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Language
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Language] ON [dbo].[Language]
(
	[LanguageID],
	[Language]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Overdraw]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Overdraw
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Overdraw] ON [dbo].[Overdraw]
(
	[OverdrawID],
	[RentalID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_PickUp]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.PickUp
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_PickUp] ON [dbo].[PickUp]
(
	[PickUpID],
	[PickUp]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_PickUpTime]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.PickUpTime
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_PickUpTime] ON [dbo].[PickUpTime]
(
	[PickUpTimeID],
	[PickUpTime]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Rental]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Rental
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Rental] ON [dbo].[Rental]
(
	[RentalID],
	[LenderUserID],
	[BorrowerUserID],
	[UserBooksID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_Role]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.Role
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_Role] ON [dbo].[Role]
(
	[RoleID],
	[Role]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_User]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.User
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_User] ON [dbo].[User]
(
	[UserID],
	[Name],
	[MainAdressID],
	[MailAdress]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_UserBooksPossesion]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.UserBooksPossesion
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_UserBooksPossesion] ON [dbo].[UserBooksPossesion]
(
	[UserBooksPossesionID],
	[UserID],
	[BooksID],
	[ConditionID],
	[PickUpID],
	[PickUpTimeID],
	[PickUpAdressID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_UserBooksWishlist]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.UserBooksWishlist
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_UserBooksWishlist] ON [dbo].[UserBooksWishlist]
(
	[UserBooksWishlistID],
	[UserID],
	[BooksID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
/****** Object:  Index [nccix_UserRole]    Script Date: 26.10.2024 16:07:10 ******/
--Index für die Tabelle dbo.UserRole
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccix_UserRole] ON [dbo].[UserRole]
(
	[UserRoleID],
	[UserID],
	[RoleID]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ON [PRIMARY]
GO
--
--
--
--
--Trennung zwischen Indexerstellung und Fremdschlüsselerstellung
--
--
--
--
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Adress und dbo.City über die die CityID
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_City]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Books und dbo.Language über die LanguageID
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Language]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksAuthor und dbo.Author über die AuthorID
ALTER TABLE [dbo].[BooksAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BooksAuthor_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[BooksAuthor] CHECK CONSTRAINT [FK_BooksAuthor_Author]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksAuthor und dbo.Books über die BooksID
ALTER TABLE [dbo].[BooksAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BooksAuthor_Books] FOREIGN KEY([BooksID])
REFERENCES [dbo].[Books] ([BooksID])
GO
ALTER TABLE [dbo].[BooksAuthor] CHECK CONSTRAINT [FK_BooksAuthor_Books]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksGenre und dbo.Books über die BooksID
ALTER TABLE [dbo].[BooksGenre]  WITH CHECK ADD  CONSTRAINT [FK_BooksGenre_Books] FOREIGN KEY([BooksID])
REFERENCES [dbo].[Books] ([BooksID])
GO
ALTER TABLE [dbo].[BooksGenre] CHECK CONSTRAINT [FK_BooksGenre_Books]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksGenre und dbo.Genre über die GenreID
ALTER TABLE [dbo].[BooksGenre]  WITH CHECK ADD  CONSTRAINT [FK_BooksGenre_Genre] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[BooksGenre] CHECK CONSTRAINT [FK_BooksGenre_Genre]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksReview und dbo.User über die ReviewerUserID (UserID)
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD  CONSTRAINT [FK_BooksReview_User] FOREIGN KEY([ReviewerUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BooksReview] CHECK CONSTRAINT [FK_BooksReview_User]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.BooksReview und dbo.UserBooksPossesion über die UserBooksPossesionID
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD  CONSTRAINT [FK_BooksReview_UserBooksPossesion] FOREIGN KEY([UserBooksPossesionID])
REFERENCES [dbo].[UserBooksPossesion] ([UserBooksPossesionID])
GO
ALTER TABLE [dbo].[BooksReview] CHECK CONSTRAINT [FK_BooksReview_UserBooksPossesion]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Overdraw und dbo.Rental über die RentalID
ALTER TABLE [dbo].[Overdraw]  WITH CHECK ADD  CONSTRAINT [FK_Overdraw_Rental] FOREIGN KEY([RentalID])
REFERENCES [dbo].[Rental] ([RentalID])
GO
ALTER TABLE [dbo].[Overdraw] CHECK CONSTRAINT [FK_Overdraw_Rental]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Rental und dbo.User über die BorrowerUserID (UserID)
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_BorrowerUser] FOREIGN KEY([BorrowerUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_BorrowerUser]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Rental und dbo.User über die LenderUserID (UserID)
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_LendalUser] FOREIGN KEY([LenderUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_LendalUser]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.Rental und dbo.UserBooksPossesion über die UserBooksID (UserBooksPossesionID)
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_UserBooksPossesion] FOREIGN KEY([UserBooksID])
REFERENCES [dbo].[UserBooksPossesion] ([UserBooksPossesionID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_UserBooksPossesion]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.User und dbo.Adress über die MainAdressID (AdressID)
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Adress] FOREIGN KEY([MainAdressID])
REFERENCES [dbo].[Adress] ([AdressID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Adress]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.Adress über die PickUpAdressID (AdressID)
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_Adress] FOREIGN KEY([PickUpAdressID])
REFERENCES [dbo].[Adress] ([AdressID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_Adress]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.Books über die BooksID
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_Books] FOREIGN KEY([BooksID])
REFERENCES [dbo].[Books] ([BooksID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_Books]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.Condition über die ConditionID
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_Condition] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[Condition] ([ConditionID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_Condition]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.PickUp über die PickUpID
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_PickUp] FOREIGN KEY([PickUpID])
REFERENCES [dbo].[PickUp] ([PickUpID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_PickUp]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.PickUpTime über die PickUpTimeID
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_PickUpTime] FOREIGN KEY([PickUpTimeID])
REFERENCES [dbo].[PickUpTime] ([PickUpTimeID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_PickUpTime]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksPossesion und dbo.User über die UserID
ALTER TABLE [dbo].[UserBooksPossesion]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksPossesion_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserBooksPossesion] CHECK CONSTRAINT [FK_UserBooksPossesion_User]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksWishlist und dbo.Books über die BooksID
ALTER TABLE [dbo].[UserBooksWishlist]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksWishlist_Books] FOREIGN KEY([BooksID])
REFERENCES [dbo].[Books] ([BooksID])
GO
ALTER TABLE [dbo].[UserBooksWishlist] CHECK CONSTRAINT [FK_UserBooksWishlist_Books]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserBooksWishlist und dbo.User über die UserID
ALTER TABLE [dbo].[UserBooksWishlist]  WITH CHECK ADD  CONSTRAINT [FK_UserBooksWishlist_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserBooksWishlist] CHECK CONSTRAINT [FK_UserBooksWishlist_User]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserRole und dbo.Role über die RoleID
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
--Fremdschlüsselbeziehung zwischen den beiden Tabellen dbo.UserRole und dbo.User über die UserID
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
--
--
--
--
--Trennung zwischen Fremdschlüsselerstellung und Prüfung
--
--
--
--
--Die Spalte Rating in der dbo.BooksReview darf nur Werte zwischen 0 und 5 erhalten dürfen
ALTER TABLE [dbo].[BooksReview]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
