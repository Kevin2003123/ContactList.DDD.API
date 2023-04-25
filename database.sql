USE [master]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Cellphone] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[dateOfRegistration] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (1, N'kevin', N'Reyess', N'809-614-4753', N'kevinreyes005@gmail.com', CAST(N'2023-04-20T11:25:41.510' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (2, N'Edward', N'Reyes', N'829-666-5555', N'edd@gmail.com', CAST(N'2023-04-20T11:26:52.213' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (4, N'Jose', N'Perez', N'800 555 4444', N'jose@jahoo.com', CAST(N'2023-04-20T17:21:49.553' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (6, N'Alida', N'Lopez', N'111 222 4444', N'alida@gmail.com', CAST(N'2023-04-20T17:22:42.903' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (7, N'Maria', N'Mercedez', N'000 555 3333', N'Maria@claro.com', CAST(N'2023-04-20T17:23:12.607' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (9, N'Sara', N'Medina', N'111 444 8888', N'sara@gmail.com', CAST(N'2023-04-20T17:24:31.277' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (10, N'Luisa', N'Mejia', N'111 555 6666', N'luisa@gmail.com', CAST(N'2023-04-20T17:24:59.560' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (11, N'Joan', N'Mendez', N'809-588-6999', N'JoanMendez@gmail.com', CAST(N'2023-04-21T07:48:14.587' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (12, N'Pedro', N'Sanchez', N'111 111 1111', N'pedroSanchez@gmail.com', CAST(N'2023-04-21T08:04:47.767' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (13, N'Fangio', N'ssss', N'555 555 5555', N'sss@gmail.com', CAST(N'2023-04-21T17:25:58.947' AS DateTime))
GO
INSERT [dbo].[Contacts] ([Id], [Name], [LastName], [Cellphone], [Email], [dateOfRegistration]) VALUES (14, N'Ludovino', N'Arcidez', N'800-800-8000', N'ludovino@gmail.com', CAST(N'2023-04-21T21:17:29.493' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Contacts__A9D10534EA46E291]    Script Date: 23/4/2023 12:42:47 a. m. ******/
ALTER TABLE [dbo].[Contacts] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getdate()) FOR [dateOfRegistration]
GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE procedure for deleting a contact
CREATE PROCEDURE [dbo].[DeleteContact]
    @Id int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Contacts
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllContacts]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE procedure for retrieving all contacts
CREATE PROCEDURE [dbo].[GetAllContacts]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Contacts;
END
GO
/****** Object:  StoredProcedure [dbo].[GetContactById]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE procedure for retrieving a single contact by Id
CREATE PROCEDURE [dbo].[GetContactById]
    @Id int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Contacts WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetContactsPerPage]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContactsPerPage]
(
    @PageNumber INT,
    @Order VARCHAR(50),
    @OrderBy VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT = (@PageNumber - 1) * 8;

    IF (@Order = 'DESC')
    BEGIN
        IF (@OrderBy = 'Name')
        BEGIN
            SELECT *
            FROM Contacts
            ORDER BY Name DESC
            OFFSET @Offset ROWS
            FETCH NEXT 8 ROWS ONLY;
        END
        ELSE
        BEGIN
            SELECT *
            FROM Contacts
            ORDER BY Id DESC
            OFFSET @Offset ROWS
            FETCH NEXT 8 ROWS ONLY;
        END
    END
    ELSE
    BEGIN
        IF (@OrderBy = 'Name')
        BEGIN
            SELECT *
            FROM Contacts
            ORDER BY Name ASC
            OFFSET @Offset ROWS
            FETCH NEXT 8 ROWS ONLY;
        END
        ELSE
        BEGIN
            SELECT *
            FROM Contacts
            ORDER BY Id ASC
            OFFSET @Offset ROWS
            FETCH NEXT 8 ROWS ONLY;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertContact]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE procedure for inserting a new contact
CREATE PROCEDURE [dbo].[InsertContact]
    @Name varchar(255),
    @LastName varchar(255),
    @Cellphone varchar(255),
    @Email varchar(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Contacts (Name, LastName, Cellphone, Email)
    VALUES (@Name, @LastName, @Cellphone, @Email);
END
GO
/****** Object:  StoredProcedure [dbo].[SearchContactsPerPage]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchContactsPerPage]
(
    @PageNumber INT,
    @SearchTerm VARCHAR(255),
    @Order varchar(50),
    @OrderBy varchar(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT = (@PageNumber - 1) * 8;
	
    IF (@Order = 'DESC' AND @OrderBy = 'Id')
    BEGIN
        SELECT *
        FROM Contacts
        WHERE Name LIKE @SearchTerm + '%' OR LastName LIKE  @SearchTerm + '%'
        ORDER BY Id DESC
        OFFSET @Offset ROWS
        FETCH NEXT 8 ROWS ONLY;
    END
    ELSE IF (@Order = 'ASC' AND @OrderBy = 'Id')
    BEGIN
        SELECT *
        FROM Contacts
        WHERE Name LIKE  @SearchTerm + '%' OR LastName LIKE  @SearchTerm + '%'
        ORDER BY Id ASC
        OFFSET @Offset ROWS
        FETCH NEXT 8 ROWS ONLY;
    END
    ELSE IF (@Order = 'DESC' AND @OrderBy = 'Name')
    BEGIN
        SELECT *
        FROM Contacts
        WHERE Name LIKE @SearchTerm + '%' OR LastName LIKE  @SearchTerm + '%'
        ORDER BY Name DESC
        OFFSET @Offset ROWS
        FETCH NEXT 8 ROWS ONLY;
    END
    ELSE IF (@Order = 'ASC' AND @OrderBy = 'Name')
    BEGIN
        SELECT *
        FROM Contacts
        WHERE Name LIKE  @SearchTerm + '%' OR LastName LIKE  @SearchTerm + '%'
        ORDER BY Name ASC
        OFFSET @Offset ROWS
        FETCH NEXT 8 ROWS ONLY;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateContact]    Script Date: 23/4/2023 12:42:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE procedure for updating an existing contact
CREATE PROCEDURE [dbo].[UpdateContact]
    @Id int,
    @Name varchar(255),
    @LastName varchar(255),
    @Cellphone varchar(255),
    @Email varchar(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Contacts
    SET Name = @Name,
        LastName = @LastName,
        Cellphone = @Cellphone,
        Email = @Email
    WHERE Id = @Id;
END
GO
