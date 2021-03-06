USE [Tag4s]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[LinkApplicationUser] [bit] NOT NULL,
	[TemplateUserRegistered] [nvarchar](max) NULL,
	[TemplateUserForgotPassword] [nvarchar](max) NULL,
	[TemplateProductOrdered] [nvarchar](max) NULL,
	[SystemEmailAddress] [nvarchar](255) NULL,
	[TemplateUserRegisteredSubject] [nvarchar](max) NULL,
	[TemplateUserForgotPasswordSubject] [nvarchar](max) NULL,
	[TemplateProductOrderedSubject] [nvarchar](max) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Application] ([Id], [Name], [Description], [LinkApplicationUser], [TemplateUserRegistered], [TemplateUserForgotPassword], [TemplateProductOrdered], [SystemEmailAddress], [TemplateUserRegisteredSubject], [TemplateUserForgotPasswordSubject], [TemplateProductOrderedSubject]) VALUES (N'f250b040-265e-49ec-acaf-5c051fdbcbff', N'Tag4S', N'EN', 1, N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],</p><p>Er is een account aangemaakt zodat u gebruik kunt maken van het Tag4S systeem.</p><p></p><p>Met de volgende gegevens kunt u inloggen:</p><p>Url: www.tag4s.com<br>Gebruikersnaam: [Gebruikersnaam] <br>Wachtwoord: [Wachtwoord]</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],</p><p>U heeft een aanvraag ingediend voor het opnieuw instellen van uw wachtwoord.<br>Uw tijdelijke wachtwoord is: [wachtwoord]</p><p>Nadat u de eerste keer bent ingelogd kunt u een eigen wachtwoord aanmaken waarmee u in het vervolg kunt inloggen.</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],<br>Bedankt voor het aanschaffen van ons product [Productnaam].</p><p></p><p>U ontvangt, binnen een aantal werkdagen van ons uw factuur.<br>We gaan er vanuit u hiermee voldoende te hebben geïnformeerd.</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'support@tag4s.com', N'AccountInfoSubject', N'ForgotPasswordSubject', N'PaymentInfoSubject')
INSERT [dbo].[Application] ([Id], [Name], [Description], [LinkApplicationUser], [TemplateUserRegistered], [TemplateUserForgotPassword], [TemplateProductOrdered], [SystemEmailAddress], [TemplateUserRegisteredSubject], [TemplateUserForgotPasswordSubject], [TemplateProductOrderedSubject]) VALUES (N'7e4fbc6c-359c-48f0-8929-9dd7ae4a966e', N'Tag4S', N'NL', 1, N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],</p><p>Er is een account aangemaakt zodat u gebruik kunt maken van het Tag4S systeem.</p><p></p><p>Met de volgende gegevens kunt u inloggen:</p><p>Url: www.tag4s.com<br>Gebruikersnaam: [Gebruikersnaam] <br>Wachtwoord: [Wachtwoord]</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],</p><p>U heeft een aanvraag ingediend voor het opnieuw instellen van uw wachtwoord.<br>Uw tijdelijke wachtwoord is: [wachtwoord]</p><p>Nadat u de eerste keer bent ingelogd kunt u een eigen wachtwoord aanmaken waarmee u in het vervolg kunt inloggen.</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'<html><head><meta content=\"text/html;charset=utf-8\"/></head><body><p>Beste [volledige naam],<br>Bedankt voor het aanschaffen van ons product [Productnaam].</p><p></p><p>U ontvangt, binnen een aantal werkdagen van ons uw factuur.<br>We gaan er vanuit u hiermee voldoende te hebben geïnformeerd.</p><p>Met vriendelijke groet,<br>Team [Bedrijfsnaam]<br>[Emailadres]</p><p></p><p><em>De informatie verzonden met dit email bericht is vertrouwelijk en uitsluitend bestemd voor de geadresseerde(n). Gebruik van informatie door anderen dan de geadresseerde(n) is verboden. Openbaarmaking, vermenigvuldiging, verspreiding en/of verstrekking van deze informatie aan derden is niet toegestaan.</em></p></body></html>', N'support@tag4s.com', N'AccountInfoSubject', N'ForgotPasswordSubject', N'PaymentInfoSubject')
/****** Object:  Table [dbo].[Weekday]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekday](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Weekday] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (1, N'Monday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (2, N'Tuesday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (3, N'Wednesday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (4, N'Thursday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (5, N'Friday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (6, N'Saturday')
INSERT [dbo].[Weekday] ([Id], [Name]) VALUES (7, N'Sunday')
/****** Object:  Table [dbo].[Nationality]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RedirectType]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedirectType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[FriendlyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_RedirectType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'ec3969f0-23c9-4fc7-b60e-2b117b5cd788', N'IsMobileDevice', N'Mobile device')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'53ab2d8e-bc92-40ee-a9d4-56f560064867', N'MobileDeviceModel', N'MobileDeviceModel')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'Version', N'BrowserVersion')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'Browser', N'Browser')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'cfe37745-702d-49b7-b8e4-86bfa4b8420e', N'ScreenPixelsHeight', N'ScreenPixelsHeight')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'f556441b-0702-4297-b138-8df83b2a437c', N'MobileDeviceManufacturer', N'MobileDeviceManufacturer')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'fe34c146-23c2-44a8-9d6e-cf1fc9a5de41', N'ScreenPixelsWidth', N'ScreenPixelsWidth')
INSERT [dbo].[RedirectType] ([Id], [Name], [FriendlyName]) VALUES (N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Type', N'Type')
/****** Object:  Table [dbo].[RuleParameter]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleParameter](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RuleParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RuleParameter] ([Id], [Name]) VALUES (N'ff236e23-324a-4b32-9cf8-14b95695456e', N'Alex mood')
INSERT [dbo].[RuleParameter] ([Id], [Name]) VALUES (N'609978c3-9207-4aff-b042-4c1143f0b1f4', N'AEX index')
INSERT [dbo].[RuleParameter] ([Id], [Name]) VALUES (N'23f1a89e-2672-44cf-8f29-8b8d038d6f4d', N'Weather')
/****** Object:  Table [dbo].[Role]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayAs] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role] ([Id], [Name], [DisplayAs]) VALUES (N'1ed980dc-50b6-4f70-8224-1825de63c95e', N'Administrator', N'Administrator')
/****** Object:  Table [dbo].[Gender]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ContractType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ContractType] ([Id], [Name]) VALUES (N'eba32a33-0f5e-4dfd-b979-0018ab7254e0', N'Gratis contract')
INSERT [dbo].[ContractType] ([Id], [Name]) VALUES (N'2e492e5e-0ff8-451b-bcad-1c053af6eb4d', N'Commercieel contract')
INSERT [dbo].[ContractType] ([Id], [Name]) VALUES (N'3f044858-84f1-4bd9-8fe7-6d98f5148d07', N'abc')
INSERT [dbo].[ContractType] ([Id], [Name]) VALUES (N'e0de1166-93ea-46bb-be13-70206b0f1075', N'x')
/****** Object:  Table [dbo].[Menu]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Entity] [nvarchar](255) NULL,
	[View] [nvarchar](255) NULL,
	[IsFirstParent] [bit] NOT NULL,
	[ParentMenuId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (N'5bb450d1-5beb-4a4c-9101-8195eb48c8a3', N'Klant')
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (N'825f66a9-46d5-4d01-82ac-859b554c847e', N'Reseller')
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (N'ad7d7648-367e-4ca5-802e-ba65a88bf2f4', N'Administrator')
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (N'8247cfea-4ae6-4908-910a-cdafc383775b', N'Afdeling')
/****** Object:  Table [dbo].[TranslationType]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranslationType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_TranslationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[TranslationType] ([Id], [Name], [Description]) VALUES (N'a7ebd5b2-622a-48f9-bbe2-0a41e0d8d01a', N'View', N'View')
INSERT [dbo].[TranslationType] ([Id], [Name], [Description]) VALUES (N'309d354c-869d-4433-a35c-28a43aea0402', N'Generic', N'Generic')
INSERT [dbo].[TranslationType] ([Id], [Name], [Description]) VALUES (N'28658495-10b9-4e9e-a535-413630a202af', N'MenuItem', N'MenuItem')
INSERT [dbo].[TranslationType] ([Id], [Name], [Description]) VALUES (N'89ec93c7-5c63-4206-a82d-5c8a4d174603', N'MenuGroup', N'MenuGroup')
INSERT [dbo].[TranslationType] ([Id], [Name], [Description]) VALUES (N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Entity', N'Entity')
/****** Object:  Table [dbo].[RuleParameterValue]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleParameterValue](
	[Id] [uniqueidentifier] NOT NULL,
	[RuleParameterId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RuleParameterValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'8cb7c45d-4953-42b9-9239-3838e82ade84', N'23f1a89e-2672-44cf-8f29-8b8d038d6f4d', N'Sunny', 0)
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'e80676eb-cd33-414a-a050-5d84957d08b3', N'609978c3-9207-4aff-b042-4c1143f0b1f4', N'Medium', 0)
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'81ba6e73-a1ee-40c8-b4af-a567a3e5f331', N'609978c3-9207-4aff-b042-4c1143f0b1f4', N'High', 0)
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'017802bb-82d0-4cd4-8206-cc2dad0038f1', N'609978c3-9207-4aff-b042-4c1143f0b1f4', N'Low', 0)
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'3919d355-2905-49d6-acac-e66979b97f1d', N'ff236e23-324a-4b32-9cf8-14b95695456e', N'Happy', 1)
INSERT [dbo].[RuleParameterValue] ([Id], [RuleParameterId], [Name], [IsActive]) VALUES (N'44511c1e-fd22-4273-91bb-eea8977d469e', N'ff236e23-324a-4b32-9cf8-14b95695456e', N'Angry', 1)
/****** Object:  Table [dbo].[Tooltip]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tooltip](
	[Id] [uniqueidentifier] NOT NULL,
	[TranslationTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Entity] [nvarchar](255) NULL,
	[View] [nvarchar](255) NULL,
	[EN] [ntext] NULL,
	[NL] [ntext] NULL,
	[DE] [ntext] NULL,
 CONSTRAINT [PK_Tooltip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b87431d4-c819-4491-8a62-06d6610bc5ae', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserRegisteredSubject', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5da5ff1e-8ad8-435a-b38c-08fd36e49f82', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'Contract', NULL, N'english', N'Vul in http://gewenste URL    ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'45e0b837-ec20-4f4a-876c-0d8710906f4e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EmailAddress', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2d7a8ade-b464-4b09-a9e0-0dd1f4c065a8', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Organisation', N'User', NULL, N'english', N'Vul uw afdelingsnaam in', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'aefa169f-7dca-436b-843c-0f9223bd2c4b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDatum', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c50f49fa-9e9d-4036-ab00-11244a1b8860', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dfe229ba-53f8-432f-b40a-117727cf5739', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Confirm Password', N'UserPassword', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'333e67bf-16f9-4bb8-8053-12bc654efe57', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Firstname', N'User', NULL, N'Firstname', N'Vul uw voornaam in', N'Vorname')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9fa90581-4b41-4d33-8825-12d796676180', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'KVK', N'User', NULL, N'Chamber of Commerce entering numbers', N'Kamer van koophandel nummer invoeren. ', N'Handelskammernummer bitte')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ecec67e2-6124-46d7-8eae-187677aaec56', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanQr', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'20e95eac-593e-4f5e-af18-1a02c5f904ec', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'Contract', NULL, N'english', N'Ingangsdatum', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'68bf5d56-5b47-4db5-9b86-1ac51905233d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RedirectTypeValue', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'62d18184-c476-4698-883b-1bcc38457044', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractTypeId', N'Price', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ed295480-f247-470d-a661-1d2f19748d12', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EmailAddress', N'User', NULL, N'Please fill in your valid emailaddress', N'Vul uw geldige emailadres in.', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'433b0c0f-fc1a-48b6-8218-1f26560b3052', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'User', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'928822b2-2ed3-4e5e-b733-1f92af531a43', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8489452a-3214-4131-904f-1fc71b76c659', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'SystemEmailAddress', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c2f360e4-7461-4be9-a79c-1ffc9ff28966', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Password', N'UserPassword', NULL, N'english', N'Vul uw wachtwoord in ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'faa394a4-43fe-4c64-950a-205a48cbe1d3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RedirectTypeId', N'RedirectTypeValue', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ea1c542b-3b15-4c2f-b6c5-241babf1a2ae', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'HouseNumber', N'User', NULL, N'english', N'Vul hier uw (huis)nummer in', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'be4bba8b-ca68-4d3a-ab76-2a562f27de04', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractRecipe', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b06c459f-5375-478b-9caa-2b5d58b4d5d7', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd7e2e0ef-1eff-48c4-a587-2f8511f2c889', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserForgotPasswordSubject', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'060ec7f8-9703-462b-98ab-2fdb60d5b057', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateProductOrdered', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'803546d9-d500-4b36-be17-396f397e35dc', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'DisableEditOwner', N'User', NULL, N'english', N'UItschakelen wijzigingen ''Owner''', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'263b0260-a9a7-4504-a70d-3b171fc2f46b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'UserContract', NULL, N'english', N'Vul hier de door u gewenste  naam in van de QR code. Zo kunt u deze makkelijker terug vinden, sorteren enz.', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c45bb7ac-caf0-486a-8415-3c2d2e3a286e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsAccountAdmin', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8c457dc0-8751-48f6-9f29-4041c1f3659a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CountFrom', N'VolumDiscount', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7658c5a1-0e45-4e24-a2de-440d3f431a97', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RandomFunction', N'ContractUri', NULL, N'english', N'Beschrijving hoe deze random functie kan worden gebruikt een paar voorbeelden', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'21dfd2dc-fd4b-400e-8815-49db340ba05e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1fa04229-d4ed-4365-9eb0-4abf566ce6ff', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TransactionId', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cbaf0754-9feb-49ee-862b-4eebd5ccab4a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserContract', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2d9b6be7-c8d2-4712-ad65-5735c292102c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'Contract', NULL, N'english', N'Dit is de gebruiker ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'32b15aa3-be6d-443b-8c4a-58e34d8a3477', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'VAT', N'User', NULL, N'Fill in your VAT (Value-Added Tax) number', N'SVP vul Uw BTW nummer indien van toepassing ant', N'dit is de duitse belaastin')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7c792107-9ca1-40d5-ae78-59ce39417765', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Prefix', N'User', NULL, N'english', N'Vul uw tussenvoegsel(s) in', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c00c8520-ea8d-423e-bd0c-6053299d4946', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractId', N'VolumDiscount', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cae3eff4-8e0b-4581-9508-616569d2ba10', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'UserContract', NULL, N'english', N'Door aanvinken is de code geactiveerd en door verwijdering van de vink gedeactiveerd. U kunt altijd op ieder gewenst moment weer opnieuw inschakelen of uitschakelen. De QR code blijft voor u beschikbaar in onze database. ', N'dutch Door aanvinken is de code geactiveerd en door verwijdering van de vink gedeactiveerd. U kunt altijd op ieder gewenst moment weer opnieuw inschakelen of uitschakelen. De QR code blijft voor u beschikbaar in onze database. ')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c86c564d-32ba-4507-8536-646c657c575d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'MaxUris', N'Price', NULL, N'english', N'Maximum aantal verschillende Urls', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'74a74d6e-b0e4-4773-abcb-6a34c4874a85', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractRecipe', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd700c896-b732-4516-8b8e-6addb4dee028', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Date', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'490298c9-b2a6-40a1-b176-6d6c23807171', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RuleParameter', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9bb4761c-288d-4121-8eba-6dd3f5f55e11', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'FullName', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f30454aa-e17d-4596-94b5-6e8f880181e8', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'ContractUri', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b2ec5f9a-7147-446d-9226-731d2e0090c2', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserContract', N'ContractUri', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7dd63700-1e4c-45e8-8154-7f4b7107bfbd', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7338d6e8-409f-4887-8019-807abb61d57d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RuleParameterValue', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c9bea9a3-3d9f-477c-b735-81ae66dd05f3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Price', N'VolumDiscount', NULL, N'english', N'Staffelprijs invullen voor een hoeveelheid Qredits vanaf een bepaald aantal tot en met een bepaald aantal.', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'645df7d5-c2ab-4ed5-9a9c-828c03e9c2eb', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Contract', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f7e2a4a5-ad6e-4f43-9e97-83eade80b54b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Credit', N'User', NULL, N'english', N'Hoeveelheid QRedits', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'675406f9-1e1e-4690-a1d7-857a6b1ca572', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ReselerId', N'User', NULL, N'english', N'Klant / afdeling van', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4cddd6d1-8a83-4e08-b3ed-8656cdc2f50a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Disabled', N'User', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ab85284b-7107-4599-8702-865d570012fb', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'VAT', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'375e1929-d326-4d9b-91b5-8bf699c14f92', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RedirectType', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'616f3013-ecb7-40a6-aaa3-8f2f46d5d0fd', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'Statistics', NULL, N'english', N'Vul in de startdatum en tijd door selectie van de knoppen', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2f0fab28-430f-4810-b366-8fc9e42a9e2c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Title', N'User', NULL, N'english', N'Titel', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0ab57c55-1240-45fb-97d7-94a5f80cbeee', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e112f4e6-510b-4db8-9415-95759e83db1d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Contract', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2ef10b8d-8bd5-454b-b1c0-969fb4346af1', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'ContractUri', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3652e925-d4dd-4212-8127-971739b2d181', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Advertisement', N'Price', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'88892b74-cb23-4684-a11a-99d1c75a8eb9', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Street', N'User', NULL, N'Street in your', N'Vul hier uw straatnaam in.', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fec94dcb-3a09-44de-8cb4-99d9ef06a33d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsActive', N'RuleParameterValue', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'522e49d9-a3d3-4717-82de-9de98ddbe29a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'Contract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ffce7bd6-e11d-46b8-a6c4-9f046d12ef69', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'City', N'User', NULL, N'english', N'Vul in Plaats', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'263d7b33-d900-4458-b3a5-9fd8e61814b2', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'098564b3-227b-436e-ad70-a3363a9a5f1b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanFinance', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'45c01c7b-958f-475e-973c-a33bc3a6043d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Country', N'User', NULL, N'Fill in Country', N'Vul in Land', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'318d46cd-49a3-4fb2-81e1-a6b28653d930', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserForgotPassword', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7f075262-9b0b-4264-9913-a96dfc030409', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'Statistics', NULL, N'english', N'Vul in de einddatum en de tijd op de einddatum door selectie van de knoppen', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'333cd805-36b2-412d-9575-aaa11f835aa6', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ZipCode', N'User', NULL, N'Fill in your Zipcode ', N'Vul hier uw volledige Postcode in ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f3793a3f-911b-4818-b4b3-aadf07d355a3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'MaxRedirectsPerUri', N'Price', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4258d269-ea4c-4bc4-a590-ad9d7407a62a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'Contract', NULL, N'english', N'Door aanvinken is de code geactiveerd en door verwijdering van de vink gedeactiveerd. U kunt altijd op ieder gewenst moment weer opnieuw inschakelen of uitschakelen. De QR code blijft voor u beschikbaar in onze database. ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'de32f571-90ee-4967-a156-ae1c2d4f126b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserRegistered', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5d8e3647-8d61-4d9a-84f6-b22d7d9bdf31', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Price', N'Price', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5615e237-123c-4774-b252-b59bbe4adae7', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserName', N'UserPassword', NULL, N'english', N'Vul uw gebruikersnaam in ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b0780f07-ade1-42b7-9122-b6af03a0b3f7', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'Price', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ec3ea4bb-ba5e-42fa-b7ba-b744a7ff75c0', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CountTo', N'VolumDiscount', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f5370c5b-c52e-40e3-b915-b7a85dab617b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'ContractUri', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e9f97d7c-5878-46a2-b35f-b80d4c3fd4d5', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TransactionId', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e9708786-68aa-4f01-ba07-c32d7cda7858', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'FriendlyName', N'RedirectType', NULL, N'Name ', N'Naam', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'48670282-6be5-40ce-b137-c4873b2fdc99', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'UserContract', NULL, N'english', N'Vul hier de startdatum in', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9fec6f1a-b258-4bc5-b103-cc7e15ec2026', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'ContractUri', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'96506a82-9340-4304-8ece-ccf8c0807588', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateProductOrderedSubject', N'Application', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'99b91e5e-8d5e-42bd-8728-cf4e5698980d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanStatistics', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f49afe7e-3466-4431-a7c5-d14c702a90dc', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsDisabled', N'UserPassword', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ed77f4e5-dd4e-486c-a73b-d31104cbb007', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserRole', N'User', NULL, N'english', N'Vul hier uw afdeling in. ', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4d46285d-b66f-4394-90ff-d42d5661d6ca', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'UserContract', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c4ace44b-17c9-41db-8ffa-d5bbaec0208a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Number', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'af3440c5-8f63-4488-ba2d-dcd3d3b87322', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Amount', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e16c4ed6-3f02-45a7-ac0d-e576c0b223fd', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserRoleId', N'User', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'acd48028-cc95-4e7c-bc25-eab03fc518ee', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Quantity', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'990acf65-9899-4f7c-818e-eb7641ed4618', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RandomParameter', N'RandomUri', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ba258a68-f24c-4340-8339-ec5db4eae2ca', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Lastname', N'User', NULL, N'english', N'Vul uw achternaam in', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'55e28226-645f-4000-87a2-edc400c9aef6', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RuleParameterId', N'RuleParameterValue', NULL, N'english', N'dutch', N'german')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'429b3941-b441-4eb2-b094-f0c97d1b3973', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'Invoice', NULL, N'', N'', N'')
INSERT [dbo].[Tooltip] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'36b4e3a2-2da5-4265-ba88-fd879baba6b0', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'RandomUri', NULL, N'', N'', N'')
/****** Object:  Table [dbo].[User]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Firstname] [nvarchar](255) NOT NULL,
	[Prefix] [nvarchar](50) NULL,
	[Lastname] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[UserRoleId] [uniqueidentifier] NOT NULL,
	[ReselerId] [uniqueidentifier] NULL,
	[eId] [nvarchar](255) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[HouseNumber] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CountryId] [uniqueidentifier] NULL,
	[Organisation] [nvarchar](255) NULL,
	[VAT] [nvarchar](50) NULL,
	[KVK] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Credit] [int] NULL,
	[DisableEditOwner] [bit] NULL,
	[Disabled] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([Id], [Title], [Firstname], [Prefix], [Lastname], [EmailAddress], [UserRoleId], [ReselerId], [eId], [Street], [HouseNumber], [City], [ZipCode], [CountryId], [Organisation], [VAT], [KVK], [Company], [Credit], [DisableEditOwner], [Disabled]) VALUES (N'962e5913-14b6-4be0-b781-20fd88e54d76', NULL, N'j', NULL, N'j', N'kl@b.com', N'8247cfea-4ae6-4908-910a-cdafc383775b', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', N'1KoeU', NULL, NULL, NULL, NULL, NULL, N'local kl', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Title], [Firstname], [Prefix], [Lastname], [EmailAddress], [UserRoleId], [ReselerId], [eId], [Street], [HouseNumber], [City], [ZipCode], [CountryId], [Organisation], [VAT], [KVK], [Company], [Credit], [DisableEditOwner], [Disabled]) VALUES (N'e08482de-3e05-4f76-a202-2fe05e2bb98b', NULL, N'Guido', N'van', N'Ipenburg', N'gwipenburg@andoburg.com', N'ad7d7648-367e-4ca5-802e-ba65a88bf2f4', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', N'BLFjC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Title], [Firstname], [Prefix], [Lastname], [EmailAddress], [UserRoleId], [ReselerId], [eId], [Street], [HouseNumber], [City], [ZipCode], [CountryId], [Organisation], [VAT], [KVK], [Company], [Credit], [DisableEditOwner], [Disabled]) VALUES (N'7dcd88b9-d68f-412a-a451-6b823ffb99de', N'Mr', N'Tag4S', NULL, N'beheer', N'info@qrcodetegel.nl', N'ad7d7648-367e-4ca5-802e-ba65a88bf2f4', NULL, N'5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62348, NULL, NULL)
INSERT [dbo].[User] ([Id], [Title], [Firstname], [Prefix], [Lastname], [EmailAddress], [UserRoleId], [ReselerId], [eId], [Street], [HouseNumber], [City], [ZipCode], [CountryId], [Organisation], [VAT], [KVK], [Company], [Credit], [DisableEditOwner], [Disabled]) VALUES (N'c054c125-51c9-4414-9771-e39e0bdcb2fd', NULL, N'Marie', N'de', N'Bruin', N'tiberiu.lupascu@euroitc.com', N'5bb450d1-5beb-4a4c-9101-8195eb48c8a3', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', N'OWHXp', N'Voorstraat', N'33', N'Woudenberg', N'3931HB', NULL, N'Boekhandel van Lunteren', N'1234', N'1234', NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[Translation]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[Id] [uniqueidentifier] NOT NULL,
	[TranslationTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Entity] [nvarchar](255) NULL,
	[View] [nvarchar](255) NULL,
	[EN] [ntext] NULL,
	[NL] [ntext] NULL,
	[DE] [ntext] NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'50626282-9c9a-4d71-b755-010163c1d215', N'309d354c-869d-4433-a35c-28a43aea0402', N'New Recipe', NULL, NULL, N'Create new QR code', N'Nieuwe QR code maken', N'Neues Rezept')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ecf8a45e-9121-4a1a-9bab-02d1bf413f1e', N'309d354c-869d-4433-a35c-28a43aea0402', N'Afdeling', NULL, NULL, N'Department', N'Afdeling', N'!!!.Afdeling')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2e19895e-20c5-4e18-a630-03526a105aaf', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CountFrom', N'VolumDiscount', NULL, N'Count from', N'Aantal vanaf', N'Anzahl von')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4051a778-3ee3-4a23-ab54-05b897266803', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} administrators', NULL, NULL, N'{0} administrators', N'{0} administrators', N'{0} administrators')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd1f71f91-1e84-45e0-91f8-05df8a637c65', N'309d354c-869d-4433-a35c-28a43aea0402', N'Own recipe', NULL, NULL, N'!!!.Own recipe', N'!!!.Own recipe', N'!!!.Own recipe')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'03c5403a-38a2-4c4e-95d2-0744c4a7df8f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Settings', NULL, NULL, N'Settings', N'Instellingen', N'Einstellungen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'310e39fc-7ae8-433d-b88a-0b2b8391db61', N'309d354c-869d-4433-a35c-28a43aea0402', N'Administrator', NULL, NULL, N'Administrator', N'Administrator', N'Administrator')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fe770714-7d07-4d8f-b5c4-0b2d0eab7db8', N'309d354c-869d-4433-a35c-28a43aea0402', N'ZipCode', NULL, NULL, N'Zipcode', N'Postcode', N'PLZ')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5d916895-527a-4f10-b4dc-0c1528c9564f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van loting4', NULL, NULL, N'Based on lotery 4', N'Op basis van loting4', N'!!!.Op basis van loting4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'43e7c277-b58f-454b-ad53-0cf4ee1cd5e7', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsAccountAdmin', N'UserPassword', NULL, N'Is Account Administrator', N'Is beheer account', N' Is management account')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c7b7b843-2d16-4ce9-86c7-0db807f9a0aa', N'309d354c-869d-4433-a35c-28a43aea0402', N'IsMobileDevice', NULL, NULL, N'Mobile Device', N'Mobiel apparaat', N'Mobile Device')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'28fda29e-ae94-49a7-be76-0e4ae0683e6a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'VAT', N'User', NULL, N'VAT nbr.', N'BTW nr.', N'MwSt. nr.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'72699767-586a-4669-8b86-11d98a1293f3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'UserContract', NULL, N'User', N'Gebruiker', N'Benutzer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2bf5a052-2d59-46e7-bd03-11ee80392b36', N'309d354c-869d-4433-a35c-28a43aea0402', N'Slimme URL omleidingsdiensten', NULL, NULL, N'Smart QR and URL redirect services', N'Slimme QR en URL omleidingsdienst ', N'!!!.Slimme URL omleidingsdiensten')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7387cabc-3df0-4187-b28c-11ff2a3f3dd1', N'309d354c-869d-4433-a35c-28a43aea0402', N'Browser', NULL, NULL, N'Browser', N'Browser', N'Browser')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7907126f-591f-45fb-9312-12156458e9a1', N'309d354c-869d-4433-a35c-28a43aea0402', N'Advertisement', NULL, NULL, N'Advertisement', N'Advertentie', N'Werbung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'06e97ef4-f2fe-4d5d-ae75-12a9c00521be', N'309d354c-869d-4433-a35c-28a43aea0402', N'Log info', NULL, NULL, N'Log info', N'Log info', N'Anmeldungs info')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6e222ecf-58b3-40e2-9305-12ebf211545d', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserPassword', NULL, NULL, N'User Password', N'Wachtwoord gebruiker', N'User Passwort')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e67a1835-1fe1-4e14-a18f-130acbfc65c3', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_5', NULL, NULL, N'ContractRecipe_5', N'ContractRecipe_5', N'!!!.ContractRecipe_5')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3debf9f8-d95b-4e7f-869d-139f040970f8', N'309d354c-869d-4433-a35c-28a43aea0402', N'RandomParameter', NULL, NULL, N'Random Parameter', N'Random Parameter', N'!!!.RandomParameter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0aa565b6-9511-429c-b9c2-1495f556900a', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de dag van de week Pro', NULL, NULL, N'Based on day of the week PRO', N'Op basis van de dag van de week Pro', N'!!!.Op basis van de dag van de week Pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3dc32863-0521-4d03-9076-14db8e7ee6ba', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EmailAddress', N'User', NULL, N'email address', N'emailadres', N'E-Mailadresse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cb47b71b-0cf9-495e-96cf-156a18f10211', N'309d354c-869d-4433-a35c-28a43aea0402', N'Bel +31 33 760 10 60', NULL, NULL, N'Call +31 33 760 10 60', N'Bel +31 33 760 10 60', N'Ruf an +31 33 760 10 60')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'66aa6ca1-bfec-40ea-888b-158db9dd8a61', N'309d354c-869d-4433-a35c-28a43aea0402', N'MaxUris', NULL, NULL, N'Maximum Urls', N'Maximum Urls', N'Maximum Urls')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1a4811e6-f276-48a5-8a96-1594d94dd608', N'309d354c-869d-4433-a35c-28a43aea0402', N'Application', NULL, NULL, N'Application', N'Applicatie', N'!!!.Application')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b61a453e-81f1-48da-8947-1598a0d20fff', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'KVK', N'User', NULL, N'Chamber Commerce nbr.', N'Kvk nr.', N'Handelskammer nr.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f3b71883-dc23-40f7-9100-15a16b17b870', N'309d354c-869d-4433-a35c-28a43aea0402', N'Time pro', NULL, NULL, N'!!!.Time pro', N'!!!.Time pro', N'!!!.Time pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5416e3c9-e046-40f2-bc05-16eafb35dea7', N'309d354c-869d-4433-a35c-28a43aea0402', N'RedirectTypeValues', NULL, NULL, N'Redirect Type Values', N'Redirect Type Waarden ', N'!!!.RedirectTypeValues')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9111e24a-1006-4a84-946c-1763eaaa4e6c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractId', N'VolumDiscount', NULL, N'Contract ID', N'Contract ID', N'!!!.ContractId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dd87c748-41b1-49c4-bb49-179cff25a078', N'309d354c-869d-4433-a35c-28a43aea0402', N'Customers', NULL, NULL, N'Customers', N'Klanten', N'Kunden')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a2e0ed6e-7832-4f5d-b60b-18275caf53dd', N'309d354c-869d-4433-a35c-28a43aea0402', N'Submit', NULL, NULL, N'Submit', N'Doorgaan', N'Einsenden')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'61741948-dac9-4acb-bdf3-18861464a1b3', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByRule', NULL, NULL, N'Contract Edit By Rule', N'Contract Wijzigen Edit By Rule', N'!!!.ContractEditByRule')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1e3e5203-ac42-4b9f-a0f0-190942532639', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'ContractUri', NULL, N'!!!.Enabled', N'!!!.Enabled', N'!!!.Enabled')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'342e885e-7d2e-4a04-a014-192cb10d1ef3', N'309d354c-869d-4433-a35c-28a43aea0402', N'VolumDiscounts', NULL, NULL, N'Volume Discounts', N'Kwantumkorting', N'Mengenrabatt')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3ac56ffb-7fae-42f0-a91d-1a46d9129348', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'UserContractUri', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f8f0b650-9e28-46df-af7a-1a603a792bef', N'309d354c-869d-4433-a35c-28a43aea0402', N'Entity', NULL, NULL, N'Entity', N'Entity', N'!!!.Entity')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ec078140-aa0e-4614-8385-1b6a390cc36e', N'309d354c-869d-4433-a35c-28a43aea0402', N'StopDatum', NULL, NULL, N'Stop Date', N'Eind datum', N'Datum Ende')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3f175c63-93ef-48f9-954f-1c4d583e0129', N'309d354c-869d-4433-a35c-28a43aea0402', N'Role', NULL, NULL, N'Role', N'Rol', N'!!!.Role')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f47bd454-8476-4370-9954-1c677c279672', N'309d354c-869d-4433-a35c-28a43aea0402', N'Enabled', NULL, NULL, N'Enabled', N'Ingeschakeld', N'Aktiviert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bc1df06b-67df-4dd2-af78-1c6e49437572', N'309d354c-869d-4433-a35c-28a43aea0402', N'Uw Profiel', NULL, NULL, N'My Profile', N'Mijn Profiel', N'Mein Profil')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ad6036eb-af2c-4f17-9a7a-1c7d8b20fb51', N'309d354c-869d-4433-a35c-28a43aea0402', N'Redirect Url', NULL, NULL, N'Redirect Url', N'Redirect Url', N'Umleiten Url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5c61ff27-889b-4284-9555-1c8a4e5d740f', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe', NULL, NULL, N'Contract Recipe', N'Contract Recept', N'!!!.ContractRecipe')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c843753b-8497-4b68-a75d-1ce681bc66aa', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van loting', NULL, NULL, N'Based on lotery', N'Op basis van loting', N'Auf der Grundlage eines Lotterie')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4fe309da-90ce-4655-9c12-1e3a4bcdde4e', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractLog', NULL, NULL, N'User Contract Log', N'Gebruiker Contract Log', N'Benutzer Kontrakt Log')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'480c7b01-341c-45dc-9971-1e59d6df1be5', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Street', N'User', NULL, N'Street', N'Straat', N'Strasse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9e8f0353-5a65-4eff-933b-1ed18fe58dce', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TransactionId', N'Contract', NULL, N'!!!.TransactionId', N'Transactie nummer', N'!!!.TransactionId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd12e5280-c090-46ac-9ced-1f7c1800bbae', N'309d354c-869d-4433-a35c-28a43aea0402', N'Email Address', NULL, NULL, N'Email Address', N'emailadres', N'Email Addresse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'35c1d86a-c09e-487d-bac6-20261bda8da9', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsDisabled', N'UserPassword', NULL, N'Is Disabled', N'Is Uitgeschakeld', N'!!!.IsDisabled')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'96a4af11-6c9d-4e68-ae97-20377d1179e3', N'309d354c-869d-4433-a35c-28a43aea0402', N'Address', NULL, NULL, N'Address', N'Adres', N'Adresse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'032cb094-0957-408a-89c4-204556e3c93c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Name', NULL, NULL, N'Name QR Code', N'Naam QR code', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'77e70bee-745b-4c13-93a4-21456654aeb7', N'309d354c-869d-4433-a35c-28a43aea0402', N'Stock excchange pro', NULL, NULL, N'!!!.Stock excchange pro', N'!!!.Stock excchange pro', N'!!!.Stock excchange pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'60675c51-16f5-454d-af14-227e783a667e', N'309d354c-869d-4433-a35c-28a43aea0402', N'MobileDeviceModel', NULL, NULL, N'Mobile Device Model', N'Model mobiel apparaat ', N'Mobile Device Modell')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5a0a8e3f-300f-4347-854f-235e89609927', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRandom1', NULL, NULL, N'Contract Recipe By Random1', N'Recept d.m.v. Random1', N'!!!.ContractRecipeByRandom1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'30661ce2-26ee-4e9f-a102-2467b8d28371', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByRandom3', NULL, NULL, N'Contract Edit By Random3', N'Wijzig door Random3', N'!!!.ContractEditByRandom3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'36ab6c62-6b0e-49bf-9e6a-259628259dea', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} own customers', NULL, NULL, N'{0} own customers', N'{0} Directe klanten', N'{0} own customers')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0e5e186a-1fb1-4b37-9c8a-25b1e3d465ab', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RandomFunction', N'UserContractUri', NULL, N'Random Function', N'Random Functie', N'Zufalls-Funktion')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'936802bf-40e6-49e5-a115-25be41ff23e7', N'309d354c-869d-4433-a35c-28a43aea0402', N'Create', NULL, NULL, N'Create', N'Nieuw', N'Erschaffen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b66bed79-e2d3-4151-a811-27848827deaf', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RedirectTypeValue', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'04ed3ab9-0b7f-4eaa-8078-28d3c43e0656', N'309d354c-869d-4433-a35c-28a43aea0402', N'Home page', NULL, NULL, N'Home page', N'Home page', N'Startseite')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8024d1f0-f8df-43db-b59b-296466d8a80e', N'309d354c-869d-4433-a35c-28a43aea0402', N'RandomUris', NULL, NULL, N'Random Urls', N'Random Urls', N'!!!.RandomUris')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9a7d16fe-1640-47f5-92d7-297e24c90854', N'309d354c-869d-4433-a35c-28a43aea0402', N'StopTijd', NULL, NULL, N'Stop Time ', N'Stop tijd', N'Stop Uhrzeit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'54986532-f906-487e-8c2f-2a82fb08cc37', N'309d354c-869d-4433-a35c-28a43aea0402', N'Amount', NULL, NULL, N'Amount', N'Aantal', N'Menge')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'840051ef-a758-4219-8b12-2ab80235458b', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByDate', NULL, NULL, N'Contract Recipe By Date', N'Recept op datum', N'Vertrags Rezept Nach Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4136ab70-3c8e-4abb-a2c6-2b66a9b5eb63', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanQr', N'UserPassword', NULL, N'May create Qr ', N'Mag Qr aanmaken', N'!!!.CanQr')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ef0d422e-8133-4b55-87f9-2bc29a410370', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserPasswords', NULL, NULL, N'User Passwords', N'Wachtwoorden', N'Benutzer Passwörter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ca07533c-fd49-449f-82a8-2c05ce5fb706', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateProductOrdered', N'Application', NULL, N'!!!.TemplateProductOrdered', N'Sjabloon Product besteld', N'!!!.TemplateProductOrdered')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8849c442-4c0f-4e7b-97c9-2c1026b001c2', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContract cannot be deleted', NULL, NULL, N'User Contract cannot be deleted', N'Contract gebruiker kan niet worden verwijderd', N'!!!.UserContract cannot be deleted')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'75696005-e744-4628-8b87-2cb7c31218a9', N'309d354c-869d-4433-a35c-28a43aea0402', N'Basic info', NULL, NULL, N'Basic info', N'Basis informatie', N'Grundlegende Informationen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'069da905-0858-4919-9814-2cd791d1caec', N'309d354c-869d-4433-a35c-28a43aea0402', N'Probeer direct gratis uit!', NULL, NULL, N'Try for free now !', N'Probeer direct gratis uit!', N'Versuchen Sie jetzt, kostenlos !')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9eafd388-843f-47a6-80bf-2d0ac6d94620', N'309d354c-869d-4433-a35c-28a43aea0402', N'RuleParameterValue', NULL, NULL, N'Rule Parameter Value', N'Rule Parameter Value', N'!!!.RuleParameterValue')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e06fda30-af72-4080-ab00-2dc34c4b1c7e', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractUrl', NULL, NULL, N'Contract Url', N'Algemene Url', N'!!!.ContractUrl')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7170d373-93cf-4238-9599-2f04c4cf303c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Volg ons', NULL, NULL, N'Follow us', N'Volg ons', N'Folgen Sie uns')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'39b3c2dc-9e2e-4d22-8d11-2f7c5b53da3c', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRandom4', NULL, NULL, N'Contract Recipe By Random4', N'Contract Recept door Random4', N'!!!.ContractRecipeByRandom4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'661b3c8c-b60a-4ece-881e-2ff9133ffe83', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Advertisement', N'Price', NULL, N'Advertisement', N'Advertenties ', N'Werbungen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3004829c-c932-4008-8b62-30212a97ac13', N'309d354c-869d-4433-a35c-28a43aea0402', N'FriendlyName', NULL, NULL, N'FriendlyName', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dbe6586b-d536-4e92-9942-304451bebf51', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_11', NULL, NULL, N'Contract Recipe_11', N'Contract Recept _11', N'Kontrakt Rezept _11')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8243d911-05ff-4c15-aa64-30fbce83d188', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RuleParameter', NULL, N'Name', N'Naam', N'!!!.Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'10a8127d-0888-4609-8a58-317243381a87', N'309d354c-869d-4433-a35c-28a43aea0402', N'Random 3', NULL, NULL, N'!!!.Random 3', N'!!!.Random 3', N'!!!.Random 3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a6da3ed6-b549-47de-aedf-31f9eafa665b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'Invoice', NULL, N'!!!.User', N'!!!.User', N'!!!.User')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'404fc5c2-eedd-494d-9bd9-3268d9344090', N'309d354c-869d-4433-a35c-28a43aea0402', N'Password', NULL, NULL, N'Password', N'Wachtwoord', N'Passwort')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1e95bf1f-9473-43bf-b924-334ceb357ee8', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'Price', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1206a76e-ff1b-4710-a483-340ce0ad33d4', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractRedirect', NULL, NULL, N'User Contract Redirect', N'Gebruiker Contract Redirect', N'!!!.UserContractRedirect')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3d4893e6-f15f-44c2-ae4d-34dbe25dc70f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Pay', NULL, NULL, N'Pay', N'Betaal', N'Zahlung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7374d216-3665-43c3-93a1-3514729d379b', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_2', NULL, NULL, N'Contract Recipe_2', N'Contract Recipe_2', N'!!!.ContractRecipe_2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'052ad43e-c789-4e96-ac90-3529981e9b8a', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByWeekDay', NULL, NULL, N'Recipe By Day of the week', N'Recept per dag van de week', N'Rezept von Tag der Woche')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5ae45723-c330-4d4a-ab39-355816b27b1c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contracts', NULL, NULL, N'Contracts', N'Eigen QR Recepten ', N'QR Rezepten')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4cc9f623-2f3e-491c-997e-35dd79d066ce', N'309d354c-869d-4433-a35c-28a43aea0402', N'BrowserData', NULL, NULL, N'Browser Data', N'Browser Data', N'Browser-Daten')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'955f4f30-614c-4c95-bc2c-36295b9e8a44', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van loting2', NULL, NULL, N'Based on lotery 2', N'Op basis van loting2', N'!!!.Op basis van loting2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e43ebcea-a599-4009-8c28-37129784fb71', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByRandom4', NULL, NULL, N'Recipe By Random4', N'Recept Random4', N'!!!.RecipeByRandom4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'532e014f-ff9e-40c9-bf27-374579d8bb52', N'309d354c-869d-4433-a35c-28a43aea0402', N'Hits', NULL, NULL, N'Hits', N'Hits', N'Hits')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0fc0c983-571f-4726-b23b-3798ef69494d', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByRandom1', NULL, NULL, N'Contract Edit By Random1', N'Contract EditByRandom1', N'!!!.ContractEditByRandom1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'40c8df5f-3a7a-4138-b28b-37e5fc7c12db', N'309d354c-869d-4433-a35c-28a43aea0402', N'MaxRedirectsPerUri', NULL, NULL, N'Max Redirects Per Url', N'Max Redirects Per Url', N'!!!.MaxRedirectsPerUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0a3c1f1f-e5e0-4713-b05c-38204c6f9fe7', N'309d354c-869d-4433-a35c-28a43aea0402', N'ScreenPixelsHeight', NULL, NULL, N'Screen Pixels Height', N'Scherm Pixels Hoogte', N'Bildschirm Pixel Höhe')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1bca41ca-7dbc-4fff-863b-3827199235e5', N'309d354c-869d-4433-a35c-28a43aea0402', N'CountFrom', NULL, NULL, N'Qredits From', N'Qredits vanaf', N'!!!.CountFrom')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'108faae5-663e-4a42-b533-383f6e85f26e', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByRandom3', NULL, NULL, N'Recipe By Random3', N'Recept door Random3', N'!!!.RecipeByRandom3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'566d8bf4-fdaf-4626-8d20-38e3359a9f80', N'309d354c-869d-4433-a35c-28a43aea0402', N'Save', NULL, NULL, N'Save', N'Opslaan', N'Speichern')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'392deaeb-6027-48f5-9e68-3930829c2e41', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'Contract', NULL, N'End Date', N'Einddatum', N'Datum Ende')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'13ac988d-783b-43ba-8c91-39a127d17d32', N'309d354c-869d-4433-a35c-28a43aea0402', N'Continue', NULL, NULL, N'Continue', N'Doorgaan', N'Weiter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'52bef257-ebda-443f-8677-3a1eb05ee870', N'309d354c-869d-4433-a35c-28a43aea0402', N'StartDatum', NULL, NULL, N'Start Date', N'Startdatum', N'Start Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c81aafc4-7835-4112-87f0-3ba97c5165ad', N'309d354c-869d-4433-a35c-28a43aea0402', N'QRedits for {0}', NULL, NULL, N'QRedits for {0}', N'Qredits voor {0}', N'QRedits for {0}')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b890842a-f227-4d74-9401-3d0562e1056a', N'309d354c-869d-4433-a35c-28a43aea0402', N'One in x clicks with different url', NULL, NULL, N'One in x clicks with different url. ', N'iedere keer na x clicks doorverwijzing naar andere url', N'!!!.One in x clicks with different url')
GO
print 'Processed 100 total records'
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bcfbec6c-a09c-417f-90ac-3f22c4d7dadc', N'309d354c-869d-4433-a35c-28a43aea0402', N'eId', NULL, NULL, N'!!!.eId', N'Identificatie nummer', N'!!!.eId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'af80810e-88c5-4b3b-a750-3f9c3e1e889a', N'309d354c-869d-4433-a35c-28a43aea0402', N'ScreenPixelsWidth', NULL, NULL, N'Screen Pixels Width', N'Scherm Pixels Breedte ', N'Bildschirm-Pixel Breite')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c73b2cb8-8b61-419b-8788-3ff526e2be17', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'Statistics', NULL, N'Start Date', N'Startdatum', N'Startdatum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'66d597f4-bf95-40d8-b395-408c146ed02c', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRandom1Pro', NULL, NULL, N'ContractRecipeByRandom1Pro', N'Contract Recept Random1 Pro', N'!!!.ContractRecipeByRandom1Pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0048923c-07b8-46e4-abd6-40b433a906cc', N'309d354c-869d-4433-a35c-28a43aea0402', N'isValue', NULL, NULL, N'is Value', N'is Waarde', N'!!!.isValue')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2773500b-bc76-43a8-badc-413424c06352', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserName', N'UserPassword', NULL, N'UserName', N'Gebruikersnaam', N'Benutzername')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f5317afa-c573-4b93-a96a-434611e47edf', N'309d354c-869d-4433-a35c-28a43aea0402', N'Reset', NULL, NULL, N'Reset', N'Reset', N'Zurückstellen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ccd3a185-048b-4c91-a615-44022136fd17', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractUri', NULL, NULL, N'ContractUri', N'Algemene Url', N'!!!.ContractUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'62aa5cf5-edd3-48d0-bcc9-4426224ab7ea', N'309d354c-869d-4433-a35c-28a43aea0402', N'Confirm Password', NULL, NULL, N'Confirm Password', N'Herhaal Wachtwoord', N'Passwort bestätigen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8734252b-65fc-4787-b375-450ec897b9ea', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByWeekDay', NULL, NULL, N'Contract Recipe By Week Day', N'Contract Recept Dag van de week', N'!!!.ContractRecipeByWeekDay')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1a5f728b-3f54-45f2-bb88-45ba3fe85868', N'309d354c-869d-4433-a35c-28a43aea0402', N'RedirectTypeValue', NULL, NULL, N'Redirect Type Value', N'Redirect Type Value', N'!!!.RedirectTypeValue')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c2bf4111-f9cb-435a-a871-45f1453c5d9c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de tijd', NULL, NULL, N'Based on time', N'Op basis van de tijd', N'!!!.Op basis van de tijd')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'514f2240-62c0-4900-9c1c-466cdd28665d', N'309d354c-869d-4433-a35c-28a43aea0402', N'HowItWorks?', NULL, NULL, N'How does It Works?', N'Hoe werkt het ?', N'!!!.HowItWorks?')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8487a62b-1f2d-4988-9209-46fd1f918f48', N'309d354c-869d-4433-a35c-28a43aea0402', N'Uri', NULL, NULL, N'Url', N'URL', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e259f4c7-5adc-4a5b-b139-473881dfa887', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserAgent', NULL, NULL, N'!!!.UserAgent', N'!!!.UserAgent', N'!!!.UserAgent')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'21859562-dc6a-4855-aa30-4762af258446', N'309d354c-869d-4433-a35c-28a43aea0402', N'Generic random', NULL, NULL, N'Generic random', N'Generieke random', N'!!!.Generic random')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4f70f6bb-6a40-40ae-98a5-4a0960059315', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Price', N'VolumDiscount', NULL, N'Price', N'Prijs', N'Preis')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b10dba7c-75c0-4344-a11a-4a58fd157095', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanFinance', N'UserPassword', NULL, N'Can do Finances', N'Mag financien afhandelen', N'!!!.CanFinance')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'748818d5-955f-40e8-b9f4-4b00dd6d88b1', N'309d354c-869d-4433-a35c-28a43aea0402', N'DateTime', NULL, NULL, N'Date and Time', N'Datum en tijd', N'Datum und Uhrzeit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'de49000d-8d42-432a-9611-4c5bb67c491b', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByRandom4', NULL, NULL, N'Contract Edit By Random4', N'Contract Edit By Random4', N'!!!.ContractEditByRandom4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e0ca228e-3f3b-4117-8bfa-4dfa3e9d34de', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TransactionId', N'UserContract', NULL, N'!!!.TransactionId', N'Transactie ID', N'!!!.TransactionId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2729b5e4-a1d1-44b6-9c0b-4f472ad0c244', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'ContractUri', NULL, N'Active', N'Actief', N'Aktiv')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1ef50d7e-7b3d-48e6-86e6-4fc843c4bf94', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RandomParameter', N'RandomUri', NULL, N'Random Parameter', N'Random Parameter', N'Zufällige Parameter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3d9e0396-8af1-4f05-878c-4fd25a3f17db', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'UserContract', NULL, N'Start Date', N'Startdatum', N'Start Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'70ce60ee-92c7-447a-9e2e-517f431d96ad', N'309d354c-869d-4433-a35c-28a43aea0402', N'Alex mood', NULL, NULL, N'Alex mood', N'Alex tendens', N'!!!.Alex mood')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f4ebc78f-c042-45e4-9841-5194b1bf437a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Price', N'Price', NULL, N'Price', N'Prijs', N'Preis')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'780cec93-e3df-487a-9c0d-5248ca3ea099', N'309d354c-869d-4433-a35c-28a43aea0402', N'AlternateUrl', NULL, NULL, N'Alternate Url', N'Alternatieve Url', N'!!!.AlternateUrl')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'493b1c4d-904d-48b4-b693-540622ebc9b4', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractId', N'UserContract', NULL, N'ContractId', N'Contract ID', N'Kontrakt ID')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a80f8d80-e4e8-4b5a-b3eb-5450defdbf80', N'309d354c-869d-4433-a35c-28a43aea0402', N'Username', NULL, NULL, N'Username', N'Gebruikersnaam', N'Benutzername')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1ad11676-f327-487f-a922-5996350d693f', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_8', NULL, NULL, N'ContractRecipe_8', N'ContractRecipe_8', N'!!!.ContractRecipe_8')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1d88825f-24c5-441a-8e51-5a1e7b2cdd4b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'Contract', NULL, N'Enabled', N'Geactiveerd', N'Aktiviert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'66f63d2a-76a3-451d-a3b9-5a83e2844bfc', N'309d354c-869d-4433-a35c-28a43aea0402', N'Price', NULL, NULL, N'Price', N'Prijs', N'Preis')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dbeefcb8-8528-48f3-aa40-5b6e9ac56823', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RedirectTypeId', N'RedirectTypeValue', NULL, N'!!!.RedirectTypeId', N'!!!.RedirectTypeId', N'!!!.RedirectTypeId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9bad3bb2-c557-4910-b2e4-5bd03077433c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Credit', NULL, NULL, N'!!!.Credit', N'!!!.Credit', N'!!!.Credit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'80af66bb-00c5-48a1-9948-5ca15fa93117', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserRole', NULL, NULL, N'User Role', N'Gebruiker rol', N'!!!.UserRole')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0eca5657-ff2f-4685-911d-5ccde380e14f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Street', NULL, NULL, N'Street', N'Straat', N'Strasse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7e34c665-9446-46dd-bf92-5d9308b16902', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByWeekDay', NULL, NULL, N'Contract Edit By Day of the Week', N'Wijzig contract per dag van de week', N'!!!.ContractEditByWeekDay')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dac70bbe-cafd-448b-9eee-5d98f999e8e1', N'309d354c-869d-4433-a35c-28a43aea0402', N'Edit', NULL, NULL, N'Edit', N'Bewerk', N'Bearbeiten')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8786a709-2c3a-4d34-9a7f-5e1d799851bc', N'309d354c-869d-4433-a35c-28a43aea0402', N'HouseNumber', NULL, NULL, N'(House)Number', N'(Huis)Nummer', N'Hausnummer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'768452a4-461e-4da6-b3e2-5e4a386f1bd1', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Credit', N'User', NULL, N'Credit', N'Tegoed aantal QRedits', N'Kredit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'280775d9-b511-4a5a-b5da-5eb5455defbb', N'309d354c-869d-4433-a35c-28a43aea0402', N'City', NULL, NULL, N'City', N'Stad', N'Ort')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'079159fb-3d25-41d1-be10-6083ca21214c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CountTo', N'VolumDiscount', NULL, N'Count To', N'Tellen tot', N'!!!.CountTo')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'76b16df9-f306-46b2-8221-60f3e418e8fe', N'309d354c-869d-4433-a35c-28a43aea0402', N'Reseler', NULL, NULL, N'Reseller', N'Agent', N'Wiederverkäufer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'41189615-452d-4773-a00c-61f049b796de', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Date', N'Invoice', NULL, N'!!!.Date', N'!!!.Date', N'!!!.Date')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c090c67d-14cd-4786-ac18-61fd2cc0ab5e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractRecipeId', N'UserContract', NULL, N'!!!.ContractRecipeId', N'Recipe', N'!!!.ContractRecipeId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0203c265-4d73-4126-94c0-6249cda211e3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserContractId', N'UserContractUri', NULL, N'User Contract Id', N'Contract', N'!!!.UserContractId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'98cc7e62-4d92-45cc-a7e7-63dfc6bc576f', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractUri', NULL, NULL, N'!!!.UserContractUri', N'Contract Uri', N'!!!.UserContractUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'506d4406-4e9b-45f1-b50b-64081cc7c6da', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contract Type', NULL, NULL, N'Contract Type', N'Contract type', N'Kontrakt Type')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'06ea6f54-6cdf-4e67-9395-64c41c30b502', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByTimePro', NULL, NULL, N'Contract Edit By TimePro', N'Wijzig contract bij time pro', N'!!!.ContractEditByTimePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9c70c3d6-8b67-4847-b173-660034e8bdae', N'309d354c-869d-4433-a35c-28a43aea0402', N'Dashboard', NULL, NULL, N'Dashboard', N'Dashboard', N'Dashboard')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8b6d2cc7-cbef-4798-b957-663210cbf212', N'309d354c-869d-4433-a35c-28a43aea0402', N'Actief', NULL, NULL, N'Active', N'Actief', N'Aktiv')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd9dc3d33-6402-459c-870f-664e57072e88', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateProductOrderedSubject', N'Application', NULL, N'!!!.TemplateProductOrderedSubject', N'Sjabloon ProductOrderedSubject', N'!!!.TemplateProductOrderedSubject')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ff6106dd-c906-44a3-941a-66b9fdfd2f70', N'309d354c-869d-4433-a35c-28a43aea0402', N'StartDate', NULL, NULL, N'StartDate', N'Startdatum', N'Start Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'44fed8ab-5d9e-4d76-bb77-67d0b3f1a5c2', N'309d354c-869d-4433-a35c-28a43aea0402', N'Departments', NULL, NULL, N'Departments', N'Afdelingen', N'!!!.Departments')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f8010e52-44d1-4b6c-ac3f-67e65cae12af', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByDatePro', NULL, NULL, N'Recipe By Date Pro', N'Recipe bij datum pro', N'!!!.RecipeByDatePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bd15f122-c2a1-4d00-aaa1-6895c3941767', N'309d354c-869d-4433-a35c-28a43aea0402', N'Country', NULL, NULL, N'Country', N'Land', N'Land')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f7010568-f73a-4c95-be76-6a1dfb30c539', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RuleParameterId', N'RuleParameterValue', NULL, N'!!!.RuleParameterId', N'Rule Parameter Id', N'!!!.RuleParameterId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b8cfe88f-1a2e-4abb-b08b-6a3feaf9963e', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de beurskoers Pro', NULL, NULL, N'Based on Stock exchange', N'Op basis van de beurskoers Pro', N'!!!.Op basis van de beurskoers Pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd38e1c54-913d-4d7b-b0ab-6a4684d6d775', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByDate', NULL, NULL, N'Contract Edit By Date', N'Wijzig contract bij datum', N'!!!.ContractEditByDate')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a64d1b73-4c06-4d43-a0e9-6a4f859e4b6c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Default Url', NULL, NULL, N'Default Url', N'Standaard Url', N'!!!.Default Url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'66053d31-5c1c-46f0-b1dc-6b2d2a32abca', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CanStatistics', N'UserPassword', NULL, N'Statistics information', N'Statistieken bekijkencs', N'!!!.CanStatistics')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'898bad89-253c-431c-a9c2-6b8b04b28db0', N'309d354c-869d-4433-a35c-28a43aea0402', N'No random', NULL, NULL, N'No random', N'Geen random', N'Kein Zufalls-Funktion')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a6c6bcbc-127a-4741-9ee2-6bee3c9d1c90', N'309d354c-869d-4433-a35c-28a43aea0402', N'Day of the week pro', NULL, NULL, N'!!!.Day of the week pro', N'!!!.Day of the week pro', N'!!!.Day of the week pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'00e0426a-f114-49d4-a81b-6c27a4aa81c0', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'UserContract', NULL, N'EndDate', N'Einddatum', N'Datum Ende')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'677958a7-4f42-4af3-bbec-6d1e7eb9a684', N'309d354c-869d-4433-a35c-28a43aea0402', N'UnsavedChanges', NULL, NULL, N'Unsaved Changes', N'Wijzigingen NIET opgeslagen', N'Änderungen NICHT gespeichert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'58a09660-9272-424d-be5a-6f752d5c1056', N'309d354c-869d-4433-a35c-28a43aea0402', N'Reseller', NULL, NULL, N'Reseller', N'Agent', N'Wiederverkäufer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7d14bf4a-6a9d-4a75-968c-711f0877750e', N'309d354c-869d-4433-a35c-28a43aea0402', N'RedirectType', NULL, NULL, N'Redirect Type', N'RedirectType', N'!!!.RedirectType')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c946804f-8ed8-4923-8269-7182f321e0ae', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} departments', NULL, NULL, N'{0} departments', N'{0} afdelingen', N'!!!.{0} departments')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cb4d9479-dc29-4117-87c9-71856ebcef07', N'309d354c-869d-4433-a35c-28a43aea0402', N'Index', NULL, NULL, N'Index', N'Lijst', N'Index')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'176decf9-03da-49d6-8b1e-7397f5b6420c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Stuur ons een e-mail', NULL, NULL, N'Send us a email', N'Stuur ons een e-mail', N'Senden Sie uns eine E-Mail')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'455ad277-d4fe-4efe-a9ff-73fbd224e431', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractRecipe', N'Contract', NULL, N'Contract Recipe', N'Contract Recept', N'!!!.ContractRecipe')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'91eb5f45-63cd-491c-a0e8-7400d1d8d48f', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByDatePro', NULL, NULL, N'Contract RecipeByDatePro', N'Recept door datum pro', N'!!!.ContractRecipeByDatePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'62b1a3c6-3a5e-4cc2-8a7e-75402fb8d287', N'309d354c-869d-4433-a35c-28a43aea0402', N'BaseUrl', NULL, NULL, N'Base Url', N'Basis / Standaard Url', N'!!!.BaseUrl')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'163d9e46-a113-4331-a1c6-75ba0719596c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Organisation', NULL, NULL, N'Organisation/Department', N'Organisatie/Afdeling', N'Organisation Betrieb')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9da555a9-a668-42c0-8ffa-760e93388f3e', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByDatePro', NULL, NULL, N'Contract Edit By Date Pro', N'Wijzig contract bij datum pro', N'!!!.ContractEditByDatePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'475afe95-5ec3-4a51-aedc-76e85ce55fb6', N'309d354c-869d-4433-a35c-28a43aea0402', N'Random 4', NULL, NULL, N'!!!.Random 4', N'!!!.Random 4', N'!!!.Random 4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ba322cb7-6f0e-498e-8d9b-770f722b0314', N'309d354c-869d-4433-a35c-28a43aea0402', N'Uitloggen', NULL, NULL, N'Log out ', N'Uitloggen', N'Logout')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3db6f984-5539-4f1c-bba1-77694c5b6b0c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Translations', NULL, NULL, N'Translations', N'Vertalingen', N'Übersetzungen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2cf0256f-f445-4d93-a5eb-78230101a4dc', N'309d354c-869d-4433-a35c-28a43aea0402', N'Invoices', NULL, NULL, N'Invoices', N'Fakturen', N'Rechnungen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'002caa45-5d2d-401e-ad6c-7af49969c014', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserRegisteredSubject', N'Application', NULL, N'!!!.TemplateUserRegisteredSubject', N'!!!.TemplateUserRegisteredSubject', N'!!!.TemplateUserRegisteredSubject')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5a16c894-8180-4e2a-ada9-7baa52f62525', N'309d354c-869d-4433-a35c-28a43aea0402', N'AEX index', NULL, NULL, N'AEX index', N'AEX index', N'AEX index')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'81a28578-baee-4ae8-aeb1-7c6579384273', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_14', NULL, NULL, N'ContractRecipe_14', N'Contract Recept_14', N'!!!.ContractRecipe_14')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1a891775-0f51-43f0-91f0-7c7005bc6fdc', N'309d354c-869d-4433-a35c-28a43aea0402', N'Url', NULL, NULL, N'Url', N'URL', N'!!!.Url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'32b2efa8-893c-4baa-85fe-7ca85dbc477a', N'309d354c-869d-4433-a35c-28a43aea0402', N'Hoe werkt het', NULL, NULL, N'How does it work ', N'Hoe werkt het', N'Wie es funktioniert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'18ccb756-fa95-4b82-951a-7e5e1affc6df', N'309d354c-869d-4433-a35c-28a43aea0402', N'Still choose to delete', NULL, NULL, N'QRedits back to the owner, QR codes will be deleted', N'QRedits terug naar bovenstaande afdeling, alle QR codes zullen verwijderd worden', N'!!!.Still choose to delete')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3c90823d-21c3-4069-8122-8050e1548121', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'CountryId', N'User', NULL, N'Country', N'Land', N'Land')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'218f7dac-dfd0-4d8c-a693-809cb9750a72', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserForgotPassword', N'Application', NULL, N'!!!.TemplateUserForgotPassword', N'Sjabloon voor vergeten Wachtwoord', N'!!!.TemplateUserForgotPassword')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9a3a28da-496d-40cc-9509-80aa12bcead3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'UserContractUri', NULL, N'Enabled', N'Ingeschakeld', N'Aktiviert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'edcab090-cb92-4fa2-8de7-810fdeaee2fa', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserContract', N'UserContract', NULL, N'User Contract', N'QR URL van gebruiker', N'Vertrags Benutzer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'025e5845-9c36-4911-b2da-814e5f4ae633', N'309d354c-869d-4433-a35c-28a43aea0402', N'Yes', NULL, NULL, N'Yes', N'Ja', N'Ja')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a58cdecf-bab4-4bf2-91f3-816717f84fdb', N'309d354c-869d-4433-a35c-28a43aea0402', N'FullName', NULL, NULL, N'Full Name', N'Volledige Naam', N'!!!.FullName')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'17e213b2-ef16-4948-8cea-81ce367f9bfa', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractActive', NULL, NULL, N'Contract Active', N'QR recepten Actief', N'!!!.ContractActive')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b96f6920-529f-4fdf-85bd-821131c0589c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractTypeId', N'Price', NULL, N'Contract Type Id', N'ContractTypeId', N'!!!.ContractTypeId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'59ac8f03-d491-4ef3-930c-82f0abf60984', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'UserContract', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4d0049c5-1719-4ea8-a0e7-83a2736e6ac7', N'309d354c-869d-4433-a35c-28a43aea0402', N'StartTijd', NULL, NULL, N'Start Time ', N'Start tijd', N'Startzeit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5e56469c-70cd-4b21-8972-83d695832a69', N'309d354c-869d-4433-a35c-28a43aea0402', N'Blijf op de hoogte van de laatste ontwikkelingen via social media.', NULL, NULL, N'Stay informed of the latest developments via social media', N'Blijf op de hoogte van de laatste ontwikkelingen via social media.', N'Bleiben Sie über die neuesten Entwicklungen informiert über Social Media.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bb1a38b3-2910-44c3-9c23-83e17bdba011', N'309d354c-869d-4433-a35c-28a43aea0402', N'Weather', NULL, NULL, N'Weather', N'Weer', N'Wetter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'18712dcf-5cad-4689-87b7-84e0e4221b40', N'309d354c-869d-4433-a35c-28a43aea0402', N'Over ons', NULL, NULL, N'About us', N'Over ons', N'Uber uns')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9e4de1e3-ccc5-4d0e-8857-850be957083d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Password', N'UserPassword', NULL, N'Password', N'Wachtwoord', N'Passwort')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd1e2e694-970f-4cb9-859e-851c9dcc2479', N'309d354c-869d-4433-a35c-28a43aea0402', N'Number', NULL, NULL, N'Number', N'Nummer', N'Number')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a5d9e7b1-3811-4662-a794-857901eb83cf', N'309d354c-869d-4433-a35c-28a43aea0402', N'ForgotPasswordDescription', NULL, NULL, N'Forgot Password Description', N'Wachtwoord reset', N'!!!.ForgotPasswordDescription')
GO
print 'Processed 200 total records'
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a07c011d-f194-45f4-aff9-85b8d244b9ee', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserContract', N'ContractUri', NULL, N'User Contract', N'Contract gebruiker', N'!!!.UserContract')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'07aeeadd-2c2e-483d-9af5-85ba58003bf7', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contact', NULL, NULL, N'Contact', N'Contact', N'Kontakt')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'048fd125-afeb-4322-a712-85c9eea8d93b', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EndDate', N'Statistics', NULL, N'End  Date', N'Einddatum', N'Datum Ende')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3ce6b444-d11f-4357-b98b-86b88d6fa602', N'309d354c-869d-4433-a35c-28a43aea0402', N'Invalid user name or email address!', NULL, NULL, N'Invalid user name or email address!', N'Gebruikersnaam of emailadres niet geldig', N'Benutzername oder E-Mail-Adresse ist ungültig')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a25c420d-4fcc-4a5b-81c6-86e34d9ac31f', N'309d354c-869d-4433-a35c-28a43aea0402', N'ClickPrice', NULL, NULL, N'Price per click', N'Prijs per klik', N'Preis pro Klick')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'43083b6b-45d5-4f84-bf5a-87ac4697cbed', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van loting1', NULL, NULL, N'Based on lotery 1', N'Op basis van loting1', N'!!!.Op basis van loting1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'160b7e85-6a53-43c0-aa27-88680b4f6441', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserId', N'UserContract', NULL, N'User ID', N'Gebruiker', N'!!!.UserId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'73b9e9af-bdf6-4faf-86aa-898cf25623e9', N'309d354c-869d-4433-a35c-28a43aea0402', N'DefaultRedirectUri', NULL, NULL, N'Default Redirect Uri', N'Standaard redirect Url', N'!!!.DefaultRedirectUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b010c975-7b32-4ecd-a4ba-8b4aead563cf', N'309d354c-869d-4433-a35c-28a43aea0402', N'1', NULL, NULL, N'1', N'1', N'1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c3a43710-5107-414c-9d61-8bb68098b706', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de tijd Pro', NULL, NULL, N'Based on time PRO', N'Op basis van de tijd PRO', N'!!!.Op basis van de tijd Pro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b7c14d1b-0169-4993-9b5e-8c1379cb7dae', N'309d354c-869d-4433-a35c-28a43aea0402', N'SendEmail', NULL, NULL, N'Send Email', N'Verstuur Email', N'!!!.SendEmail')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4385492b-ff4b-4c3b-8393-8cdcefc9ef17', N'309d354c-869d-4433-a35c-28a43aea0402', N'RuleParameter', NULL, NULL, N'Rule Parameter', N'Rule Parameter', N'!!!.RuleParameter')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'07915b76-9443-49f9-8534-8dbee992804f', N'309d354c-869d-4433-a35c-28a43aea0402', N'VolumDiscount', NULL, NULL, N'Volume Discount', N'Kwantumkorting', N'Mengenrabatt')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'158c494f-8596-42fd-841b-8de0d3355ce7', N'309d354c-869d-4433-a35c-28a43aea0402', N'Relation', NULL, NULL, N'Relation', N'Relatie', N'!!!.Relation')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'de16bd93-bfea-41a6-a7ff-8f1da5c4d835', N'309d354c-869d-4433-a35c-28a43aea0402', N'DE', NULL, NULL, N'DE', N'DE', N'DE')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ea6713e8-3c79-4c40-977f-8f1e08501cd2', N'309d354c-869d-4433-a35c-28a43aea0402', N'Language', NULL, NULL, N'Language', N'Taal', N'Sprache')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'91d7203a-6186-4b20-9fe4-8f4d3eae3f04', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_7', NULL, NULL, N'ContractRecipe_7', N'ContractRecipe_7', N'!!!.ContractRecipe_7')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8b8fdda7-239c-475b-b37d-902eb26bef3d', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByTime', NULL, NULL, N'Contract Recipe ByTime', N'Recept bij tijd', N'!!!.ContractRecipeByTime')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'641e5043-100c-4f19-bf9d-90c818f190bb', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe.Name', NULL, NULL, N'Contract Recipe.Name', N'Recipe', N'!!!.ContractRecipe.Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'982d8aa2-458b-49f8-a47c-92717472c954', N'309d354c-869d-4433-a35c-28a43aea0402', N'View', NULL, NULL, N'View', N'Overzicht', N'Ubersicht')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cb1600fa-f7c7-4354-b97e-92be3842b237', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RedirectType', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'559c7236-f740-47dd-a6e0-92d32d4eb0ed', N'309d354c-869d-4433-a35c-28a43aea0402', N'IsActive', NULL, NULL, N'Is Active', N'Is Aktief', N'Ist Aktiv')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'69c72ce0-8fa3-4969-b15f-937bfbe22a1f', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'MaxRedirectsPerUri', N'Price', NULL, N'Max Redirects Per Url', N'Max Redirects Per Url', N'!!!.MaxRedirectsPerUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8a03208c-1d78-48cf-91a8-939365a71c8d', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_10', NULL, NULL, N'ContractRecipe_10', N'Contract Recept_10', N'!!!.ContractRecipe_10')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'47f35730-e346-4e9d-b09b-93cb1c213215', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Contract', N'UserContract', NULL, N'Contract', N'Overeenkomst', N'Vereinbarung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4fdc5456-45fb-4aa9-8654-969355e8c623', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'User', N'Contract', NULL, N'User', N'Gebruiker', N'Benutzer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'04549d2c-7416-4a73-ad50-96991ed85c1f', N'309d354c-869d-4433-a35c-28a43aea0402', N'EndDate', NULL, NULL, N'End Date', N'Einddatum', N'Datum Ende')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ba92020b-bdea-4ec5-a4db-96b158abf2fd', N'309d354c-869d-4433-a35c-28a43aea0402', N'Bank', NULL, NULL, N'Bank', N'Bank', N'Bank')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'83ca6889-bd60-48a7-a68e-973eb929e203', N'309d354c-869d-4433-a35c-28a43aea0402', N'Search', NULL, NULL, N'Search', N'Zoek', N'Suchen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7f88d8ee-baba-47b5-b130-983adc792b12', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} resellers', NULL, NULL, N'{0} agents', N'{0} agenten', N'{0} resellers')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6b74ae32-3c33-4601-9787-98c8382971a5', N'309d354c-869d-4433-a35c-28a43aea0402', N'Customer', NULL, NULL, N'Customer', N'Klant', N'Kunde')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2716083c-f172-41dd-b936-99577f477e97', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'ContractUri', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cf32d438-ac99-412c-8290-995f2e731888', N'309d354c-869d-4433-a35c-28a43aea0402', N'x% with different url', NULL, NULL, N'x% with different url', N'x% doorverwijzing naar een andere Url', N'!!!.x% with different url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6dc5cbe7-e719-4feb-a8bd-99d86901c82b', N'309d354c-869d-4433-a35c-28a43aea0402', N'Free', NULL, NULL, N'!!!.Free', N'!!!.Free', N'!!!.Free')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2be5eb71-5c0d-4224-b122-9a9fe1adb2d0', N'309d354c-869d-4433-a35c-28a43aea0402', N'Register', NULL, NULL, N'Register', N'Inschrijven', N'Registrieren')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9b671b78-1735-4101-88fc-9ba9b2d59034', N'309d354c-869d-4433-a35c-28a43aea0402', N'QRedits', NULL, NULL, N'!!!.QRedits', N'!!!.QRedits', N'!!!.QRedits')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f6e89045-3319-4d45-bd86-9be777c9b014', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Disabled', N'User', NULL, N'!!!.Disabled', N'!!!.Disabled', N'!!!.Disabled')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'88783444-5f9e-4090-905a-9ca17660f222', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'HouseNumber', N'User', NULL, N'HouseNumber', N'Huisnummer', N'Haus Number')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ce22aa31-45d5-4833-bea4-9d7f8bc819cc', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContract', NULL, NULL, N'User Contract', N'Contract', N'!!!.UserContract')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0c97249f-b363-422f-88c3-9e4617123871', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ReselerId', N'User', NULL, N'Reseler Id', N'Afdeling / klant van', N'!!!.ReselerId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'31df0e12-5b50-4a24-b73b-9e4b87739dc1', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByTimePro', NULL, NULL, N'Contract Recipe ByTimePro', N'Wijzig contract bij tijd pro', N'!!!.ContractRecipeByTimePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd5439326-44d2-4102-b4ae-9e57eec88967', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserRoleId', N'User', NULL, N'User Role Id', N'Rol', N'!!!.UserRoleId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0548609d-1288-4f24-81ba-a01cafdfc532', N'309d354c-869d-4433-a35c-28a43aea0402', N'NL', NULL, NULL, N'NL', N'NL', N'NL')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'872fa882-3636-414e-a300-a158f1db4d8f', N'309d354c-869d-4433-a35c-28a43aea0402', N'QRs', NULL, NULL, N'QRs', N'QRs', N'!!!.QRs')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e2916851-313a-4126-8b92-a1c4f696cecd', N'309d354c-869d-4433-a35c-28a43aea0402', N'Weather expectation', NULL, NULL, N'!!!.Weather expectation', N'!!!.Weather expectation', N'!!!.Weather expectation')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'03ca2be8-333f-44c1-8097-a2a4d59ac0ad', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Number', N'Invoice', NULL, N'!!!.Number', N'!!!.Number', N'!!!.Number')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'931975e4-6633-430b-814d-a2e7047517b5', N'309d354c-869d-4433-a35c-28a43aea0402', N'Voer uw gebruikersnaam en wachtwoord in om in te loggen.', NULL, NULL, N' Enter your username and password to login.', N'Voer uw gebruikersnaam en wachtwoord in om in te loggen.', N'Geben Sie Ihren Benutzernamen und Ihr Passwort ein, um sich anzumelden.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3ae5f75d-0fdf-4e4f-ab9c-a3f53efb0ee1', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'UserContract', NULL, N'URL', N'URL', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'08bb5ee4-e76c-40dc-a1e1-a45e6fb0c4cf', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByDate', NULL, NULL, N'Recipe By Date', N'Recept op datum', N'!!!.RecipeByDate')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'faf90e65-90b5-42de-9f89-a526ac01eef6', N'309d354c-869d-4433-a35c-28a43aea0402', N'Inloggen', NULL, NULL, N'Login', N'Inloggen', N'Anmelden')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8eabe12c-cee0-470f-bd6a-a52d220b9130', N'309d354c-869d-4433-a35c-28a43aea0402', N'All departments', NULL, NULL, N'All departments', N'Alle afdelingen', N'!!!.All departments')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e41a144a-9035-4756-bcff-a607bfde81ef', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'UserContract', NULL, N'!!!.eId', N'Identificatie nummer', N'!!!.eId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4b43e441-a5f7-405f-baf7-a768767b10b2', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByRandom2', NULL, NULL, N'Recipe By Random2', N'Recept door Random2', N'!!!.RecipeByRandom2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd9a05934-017a-4a9b-9a20-a7bf60d8aa14', N'309d354c-869d-4433-a35c-28a43aea0402', N'ifRule', NULL, NULL, N'if Rule(s) is ', N'Als Rules zijn', N'!!!.ifRule')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a6474ea0-3a90-4392-9100-a81a92bb35c0', N'309d354c-869d-4433-a35c-28a43aea0402', N'TermsOfService', NULL, NULL, N'Terms of Service', N'Terms of Service', N'!!!.TermsOfService')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'681f9638-7a1f-4b72-b29e-a8dba64b75c2', N'309d354c-869d-4433-a35c-28a43aea0402', N'Bel', NULL, NULL, N'Call', N'Bel', N'Ruf an')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'18c60762-9b2f-48d2-a82f-a8eb2b59dd0e', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByRandom1', NULL, NULL, N'Recipe By Random1', N'Recept door Random1', N'!!!.RecipeByRandom1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c6cc362a-9387-4555-b43f-a966d25db0bb', N'309d354c-869d-4433-a35c-28a43aea0402', N'EndTime', NULL, NULL, N'EndTime', N'Eind tijd', N'!!!.EndTime')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1f066167-721d-497a-8f2b-ad2b8c674922', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserRegistered', N'Application', NULL, N'!!!.TemplateUserRegistered', N'!!!.TemplateUserRegistered', N'!!!.TemplateUserRegistered')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c2335df7-5e57-4962-b28d-ae29fb574708', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByWeekDayPro', NULL, NULL, N'Recipe By Week Day Pro', N'Recipe bij weekdag pro', N'!!!.RecipeByWeekDayPro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2bd48fb3-cc8b-4ee2-9e15-ae3d7660c9d9', N'309d354c-869d-4433-a35c-28a43aea0402', N'About', NULL, NULL, N'About', N'Over ', N'!!!.About')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4c886061-d3b6-46a8-b4fc-aea5b0789379', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByWeekDayPro', NULL, NULL, N'Contract Recipe By Week DayPro', N'Wijzig contract by weekdag pro', N'!!!.ContractRecipeByWeekDayPro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f709c1b7-8e3e-49fd-931e-aea65964e0c0', N'309d354c-869d-4433-a35c-28a43aea0402', N'TargetPay', NULL, NULL, N'Target Pay', N'Target Pay', N'Target Pay')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7d03d9a0-1765-45a6-a137-af275ccdfeb6', N'309d354c-869d-4433-a35c-28a43aea0402', N'Translation', NULL, NULL, N'Translation', N'Vertaling', N'Übersetzung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4483d67c-f680-408d-9636-af371067262f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Parameters', NULL, NULL, N'Parameters', N'Parameters', N'Parameters')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd367e9bc-ddf3-4efa-acdd-aff71b00642e', N'309d354c-869d-4433-a35c-28a43aea0402', N'LogIn', NULL, NULL, N'Login', N'Inloggen', N'Anmelden')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fc5650c7-861a-44d6-b7e6-b012c88244d8', N'309d354c-869d-4433-a35c-28a43aea0402', N'Delete', NULL, NULL, N'Delete', N'Verwijder', N' Entfernen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a33514a1-0a39-4b49-943b-b019d441e19e', N'309d354c-869d-4433-a35c-28a43aea0402', N'User already exists', NULL, NULL, N'User already exists', N'Gebruiker bestaat al', N'Benutzer bereits vorhanden')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bb2983e2-14f6-4ecb-8e71-b057e56403a3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'IsActive', N'RuleParameterValue', NULL, N'Is Active', N'Is Geactiveerd ', N'!!!.IsActive')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5e458158-a4fa-40b5-bf82-b0d24aa9009d', N'309d354c-869d-4433-a35c-28a43aea0402', N'EN', NULL, NULL, N'EN', N'EN', N'EN')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9321d472-811f-4fc4-b0b6-b2116a038df2', N'309d354c-869d-4433-a35c-28a43aea0402', N'Betaald', NULL, NULL, N'Payed', N'Betaald', N'Bezahlt')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c209c2e5-225f-4e9a-b08b-b278dcfa2a80', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRandom3', NULL, NULL, N'ContractRecipeByRandom3', N'Contract Recept Random 3', N'!!!.ContractRecipeByRandom3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'44de8fdd-fb5b-44cd-9100-b3fe832a2c86', N'309d354c-869d-4433-a35c-28a43aea0402', N'% goes to', NULL, NULL, N'X  % goes to', N'X  % van de doorverwijzingen naar UR :', N'!!!.% goes to')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'60a44630-4bac-41ca-ac54-b479d0be903b', N'309d354c-869d-4433-a35c-28a43aea0402', N'Buy credit', NULL, NULL, N'!!!.Buy credit', N'!!!.Buy credit', N'!!!.Buy credit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3605609a-5336-46c0-af7e-b4b662c33652', N'309d354c-869d-4433-a35c-28a43aea0402', N'MobileDeviceManufacturer', NULL, NULL, N'Mobile Device Manufacturer', N'Fabrikant Mobiel apparaat', N'Mobile Device Hersteller')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c7c9f3bf-082c-4ddb-a531-b50f28f1f496', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ContractRecipe', N'UserContract', NULL, N'!!!.ContractRecipe', N'Recipe', N'!!!.ContractRecipe')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dcf9f681-7bd9-47ab-acf5-b5bdf9e66ab2', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Prefix', N'User', NULL, N'Prefix', N'Tussenvoegsel', N'!!!.Prefix')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'72866ee9-9df9-4a67-a51b-b689d26354bd', N'309d354c-869d-4433-a35c-28a43aea0402', N'To', NULL, NULL, N'To', N'Naar', N'Zu')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f7776369-8d90-49d5-a531-b7668e000391', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'UserContractUri', NULL, N'URL', N'URL', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ce95f7bc-3009-4553-b356-b93f3e111eaa', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDatum', N'UserContract', NULL, N'StartDate', N'Startdatum', N'Anfang Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'25ceaf53-7f3e-41e7-8bfd-ba09c32c153f', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByTimePro', NULL, NULL, N'Recipe By Time Pro', N'Recipe bij tijd pro', N'!!!.RecipeByTimePro')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'02ed6c81-9e7c-4fe2-8600-ba4036f91c0c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Enabled', N'UserContract', NULL, N'Enabled', N'Geactiveerd', N'Aktiviert')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4c6ed922-51b4-4550-bcf5-ba80e8bacac5', N'309d354c-869d-4433-a35c-28a43aea0402', N'Templates', NULL, NULL, N'Templates', N'Sjablonen', N'!!!.Templates')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6acaec75-acc4-451b-a2ed-bae773303441', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_4', NULL, NULL, N'ContractRecipe_4', N'ContractRecipe_4', N'!!!.ContractRecipe_4')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3d794977-08b0-4710-9796-bb15a9122d7b', N'309d354c-869d-4433-a35c-28a43aea0402', N'th goes to', NULL, NULL, N'than goes to URL', N'Dan wordt er doorverwezen naar ', N'!!!.th goes to')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f9b73479-972e-42dc-81d4-bbb0e270ed00', N'309d354c-869d-4433-a35c-28a43aea0402', N'Ondersteuning', NULL, NULL, N'Support', N'Support', N'Unterstützung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a4ef9f55-d84f-4f02-a50c-bc60a40e0141', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractLogs', NULL, NULL, N'User Contract Logs', N'Logs', N'!!!.UserContractLogs')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'25f8f8e1-aac7-4e9d-905b-bc8d42f97dd4', N'309d354c-869d-4433-a35c-28a43aea0402', N'TransferCredit', NULL, NULL, N'Transfer QRedits', N'Verplaats QRredits', N'!!!.TransferCredit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8ca23943-7e07-4669-8861-bd970c3373e1', N'309d354c-869d-4433-a35c-28a43aea0402', N'Details', NULL, NULL, N'Details', N'Details', N'Details')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'bd414154-335a-474f-bda7-be5329148f4a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Organisation', N'User', NULL, N'Organisation/Department', N'Organisatie/Afdeling', N'!!!.Organisation')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e4fe4412-a6d4-46f2-a3b5-be9c8ebdc1cc', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByRandom2', NULL, NULL, N'Contract Edit By Random2', N'Contract door EditByRandom2', N'!!!.ContractEditByRandom2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'edee94b9-1d55-41b9-86b7-bf098bf797b0', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRandom2', NULL, NULL, N'ContractRecipeByRandom2', N'ContractRecipeByRandom2', N'!!!.ContractRecipeByRandom2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7db8d2f0-2f6a-4af3-9a47-c0204b007885', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_1', NULL, NULL, N'Contract Recipe_1', N'Contract Recept_1', N'!!!.ContractRecipe_1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c28f4864-cc5b-4eca-b761-c064216f6e4e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'EmailAddress', N'UserPassword', NULL, N'EmailAddress', N'Emailadres', N'!!!.EmailAddress')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6a58b00f-9695-4e9a-a4ea-c077f4eb80da', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Quantity', N'Invoice', NULL, N'!!!.Quantity', N'!!!.Quantity', N'!!!.Quantity')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'55507d25-82e9-493b-bdf6-c08b5eb3b699', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'FullName', N'UserPassword', NULL, N'Full Name', N'Volledige naam', N'!!!.FullName')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4e7ba285-5170-4bb9-9dbd-c1edb0819d48', N'309d354c-869d-4433-a35c-28a43aea0402', N'Weigthed ratios', NULL, NULL, N'Weigthed ratios', N'!!!.Weigthed ratios', N'!!!.Weigthed ratios')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'14d7d376-f3e6-49bf-ab20-c2d0a67cdfa3', N'309d354c-869d-4433-a35c-28a43aea0402', N'Klant', NULL, NULL, N'Customer', N'Klant', N'Kunde')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5510a7a0-45ae-4f8c-8eb7-c44f2b04419c', N'309d354c-869d-4433-a35c-28a43aea0402', N'VAT', NULL, NULL, N'VAT', N'BTW', N'Mw.St.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'284cd331-88d1-4cd3-a5f2-c476eb1d48ce', N'309d354c-869d-4433-a35c-28a43aea0402', N'andCombine', NULL, NULL, N'and Combine', N'en gecombineerd met ', N'!!!.andCombine')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ffd2e9b7-42fb-4269-9684-c478621718a9', N'309d354c-869d-4433-a35c-28a43aea0402', N'WeekdayActive', NULL, NULL, N'Weekday Active', N'Dag van de week actief', N'!!!.WeekdayActive')
GO
print 'Processed 300 total records'
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6b2732a9-04fa-4d2e-bfe7-c663dcb3ec41', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'UserContract', NULL, N'Active ', N'Actief', N'Activ')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c5c8420f-852b-4962-8e73-c68b79f668b0', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Firstname', N'User', NULL, N'Firstname', N'Voornaam', N'Vorname')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c220deee-b076-4e35-a3f4-c7c2f44c8453', N'309d354c-869d-4433-a35c-28a43aea0402', N'and randomized with', NULL, NULL, N'and randomized with', N'en random met ', N'!!!.and randomized with')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'02c4e38b-6946-441d-851c-c7cc739f8c8e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Actief', N'Contract', NULL, N'Active', N'Actief', N'Aktiv')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0fdbfe95-5ea0-4f72-b2f0-c874a1fe0632', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractName', NULL, NULL, N'Contract Name', N'Contractnaam', N'!!!.ContractName')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4347bfd9-dd03-427f-8217-c898a7f024f7', N'309d354c-869d-4433-a35c-28a43aea0402', N'Random 2', NULL, NULL, N'!!!.Random 2', N'!!!.Random 2', N'!!!.Random 2')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7515e240-3a91-4d52-8153-c9b20a15bc75', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contract types', NULL, NULL, N'Contract types', N'Contract typen', N'Kontrakt types')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e0f82998-b21f-497c-b859-cb91dd0c231e', N'309d354c-869d-4433-a35c-28a43aea0402', N'back to {0}', NULL, NULL, N'back to {0}', N'Terug naar {0}', N'Zuruck nach {0}')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'db5febd9-d9a4-40bd-8b17-cbad28492f18', N'309d354c-869d-4433-a35c-28a43aea0402', N'RandomFunction', NULL, NULL, N'Random Function', N'Random Functie', N'!!!.RandomFunction')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4dd7913d-e7f8-4f14-9e5f-cd7c924b4e9e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Country', N'User', NULL, N'Country', N'Land', N'Land')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a49a3bb1-8db6-4653-87d5-cd9546c8b119', N'309d354c-869d-4433-a35c-28a43aea0402', N'Version', NULL, NULL, N'Version', N'Versie', N'Version')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0355cde3-8684-4fba-95bb-cd97cc758a5b', N'309d354c-869d-4433-a35c-28a43aea0402', N'Adresgegevens', NULL, NULL, N'Address ', N'Adres', N'Adresse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'87acd911-da30-4f8b-b3f6-ce3da87a28d0', N'309d354c-869d-4433-a35c-28a43aea0402', N'CountTo', NULL, NULL, N'Qredits until', N'Qredits tot', N'!!!.CountTo')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'96a74826-4223-44c5-af1f-ce5af29374ff', N'309d354c-869d-4433-a35c-28a43aea0402', N'DefaultUri', NULL, NULL, N'Default Uri', N'Standaard Url', N'!!!.DefaultUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ced098f2-c55a-4524-9d03-ce78bd5a082c', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'StartDate', N'Contract', NULL, N'Start Date', N'Startdatum', N'Start Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fb88020e-b30a-47a7-b485-ceff9b1432dc', N'309d354c-869d-4433-a35c-28a43aea0402', N'Title', NULL, NULL, N'Title', N'Titel', N'Titel')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b4ba05e2-8af4-4c4e-8f81-cf67eca09d75', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByRule', NULL, NULL, N'Recipe By Rule', N'Recipe bij regels', N'!!!.RecipeByRule')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'71fc18a4-49bb-4174-b7a8-cfa1d0ccdd83', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractUris', NULL, NULL, N'!!!.UserContractUris', N'Contract Urls', N'!!!.UserContractUris')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0169861b-c76e-4d26-ab56-cfcc1c2bbc48', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'MaxUris', N'Price', NULL, N'Max Urls', N'Max Uris', N'!!!.MaxUris')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c27046d4-91dd-4a53-8f52-d00895f4a66f', N'309d354c-869d-4433-a35c-28a43aea0402', N'RuleActive', NULL, NULL, N'Rule Active', N'Regel actief', N'!!!.RuleActive')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9c3488d0-c192-4e5b-a3f1-d08cfc11450b', N'309d354c-869d-4433-a35c-28a43aea0402', N'Betaal', NULL, NULL, N'Pay', N'Betaal', N'Zahlen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c3ac73f8-768c-40fa-bbf8-d171ff5c9a4d', N'309d354c-869d-4433-a35c-28a43aea0402', N'Type', NULL, NULL, N'Type', N'Type', N'Type')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'51ccff0c-97f7-4468-85ee-d1790854de58', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipeByRule', NULL, NULL, N'ContractRecipeByRule.Name', N'Recept by regel', N'!!!.ContractRecipeByRule.Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b333e720-2235-4d26-bd4b-d1ce0230bc1c', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_3', NULL, NULL, N'Contract Recipe_3', N'Contract Recept_3', N'!!!.ContractRecipe_3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'78bc22d7-06da-4b6b-855b-d1e54a0eba0f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Qr-Code', NULL, NULL, N'Qr-Code', N'Qr code', N'Qr-Code')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fff2e9a9-1901-4959-8a7c-d1e629de2691', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_12', NULL, NULL, N'ContractRecipe_12', N'Contract Recept_12', N'!!!.ContractRecipe_12')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e8c45fd4-0c3b-4cfa-8a3f-d2e34f5d199f', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'RuleParameterValue', NULL, N'Name', N'Naam ', N'!!!.Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7f0a9629-2f4b-44e8-8f6e-d3f4108a48dd', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'Contract', NULL, N'!!!.Uri', N'Url', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'690d6629-f867-43ec-abf9-d67ac172d402', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'Contract', NULL, N'!!!.eId', N'Kenmerk', N'!!!.eId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'39a60c5b-ecc1-4797-ab68-d799ac71cd83', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contract', NULL, NULL, N'Contract', N'Overeenkomst', N'Vereinbarung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd0169ab1-0e24-49bf-8eed-d7ad6fe39034', N'309d354c-869d-4433-a35c-28a43aea0402', N'KVK', NULL, NULL, N'Chamber of Commerce nbr', N'Kvk nr.', N'Handelskammer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'883466b3-0751-4f39-8b05-d7e7e51b6c31', N'309d354c-869d-4433-a35c-28a43aea0402', N'Random 1', NULL, NULL, N'!!!.Random 1', N'!!!.Random 1', N'!!!.Random 1')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'261d12fd-b17a-4417-aba7-d8f5ad4ae03c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Accounts', NULL, NULL, N'Users', N'Gebruikers', N'Benutzers')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'637a5130-9d08-4fab-8af6-d9174b7d1354', N'309d354c-869d-4433-a35c-28a43aea0402', N'Schrijf u in en probeer het uit!', NULL, NULL, N'Subscribe and try it out !', N'Schrijf u in en probeer het uit !!', N'Registrieren Sie sich und probieren Sie es aus!')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2dcb776d-e2de-4021-b47e-d91d3114ebe2', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Lastname', N'User', NULL, N'Lastname', N'Achternaam', N'Nachname')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'98b74fe4-2182-46ba-b4be-d9420d588bed', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'RandomUri', NULL, N'!!!.Uri', N'Url', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a03c9a96-c273-458e-a538-d953f4f7bb6f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Zo kunt u bepaalde processen met minimale inspanning automatiseren.', NULL, NULL, N'So you can automate certain processes with minimal effort', N'Zo kunt u bepaalde processen met minimale inspanning automatiseren.', N'!!!.Zo kunt u bepaalde processen met minimale inspanning automatiseren.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'47701e47-3e94-4ba8-a8ae-d99e6a15c467', N'309d354c-869d-4433-a35c-28a43aea0402', N'PrivacyStatement', NULL, NULL, N'Privacy Statement', N'Privacy Statement', N'PrivacyStatement')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1a6ca12d-6eda-437b-874d-d9c2888191dc', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Uri', N'ContractUri', NULL, N'!!!.Uri', N'!!!.Uri', N'!!!.Uri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7ac54c25-9751-4d88-87e2-d9c773512300', N'309d354c-869d-4433-a35c-28a43aea0402', N'Time', NULL, NULL, N'!!!.Time', N'!!!.Time', N'!!!.Time')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'87fd724b-e1ae-4c26-847d-da36f0dd5d6b', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractRedirects', NULL, NULL, N'User Contract Redirects', N'Redirects', N'!!!.UserContractRedirects')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'dc553844-720c-4158-a4bb-dad0d8d0b266', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'eId', N'User', NULL, N'!!!.eId', N'Identificatie nummer', N'!!!.eId')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9478ae37-d915-4a24-a17c-dbb4b28ea730', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} QRedits per day', NULL, NULL, N'!!!.{0} QRedits per day', N'!!!.{0} QRedits per day', N'!!!.{0} QRedits per day')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7bda35fa-36f9-492e-93c0-dbf31cfec663', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractType', NULL, NULL, N'Contract Type', N'Contract Type', N'!!!.ContractType')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd88a9b19-d18a-4ed7-8f57-dd7430a685f2', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Contract', N'Contract', NULL, N'Contract', N'Contract', N'!!!.Contract')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9e6e226b-9eca-441f-b40c-dd9e24bb2f65', N'309d354c-869d-4433-a35c-28a43aea0402', N'Nieuwe omleiding maken', NULL, NULL, N'Create New Dynamic QR ', N'Nieuwe Dynamisch QR code maken', N'Neue dynamische QR machen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9c8e83c3-85ff-4c30-81b6-dde7ab05896e', N'309d354c-869d-4433-a35c-28a43aea0402', N'redirect', NULL, NULL, N'Redirect', N'Redirect', N'Umleiten Url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'7d93c957-9df2-4bef-a8fc-de4e6817d95a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'SystemEmailAddress', N'Application', NULL, N'System Email Address', N'Systeem Email Adres', N'!!!.SystemEmailAddress')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'388efa2a-3d6a-4788-9227-df8c1fc3e726', N'309d354c-869d-4433-a35c-28a43aea0402', N'From', NULL, NULL, N'From', N'Van', N'Von')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fc046531-bd13-40c6-bd70-df9594f4045b', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContractDisplay', NULL, NULL, N'!!!.UserContractDisplay', N'User Contract Display', N'!!!.UserContractDisplay')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'85d24a87-09b8-41da-a65a-e04b6b7cc6a3', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Name', N'Contract', NULL, N'Name', N'Naam', N'Name')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9a8358a4-4f2d-43db-ac9d-e06c76d9f232', N'309d354c-869d-4433-a35c-28a43aea0402', N'No', NULL, NULL, N'No', N'Nee', N'Nein')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e184803f-bd01-4b51-8979-e06ebb452a5e', N'309d354c-869d-4433-a35c-28a43aea0402', N'Customer {0}', NULL, NULL, N'Customer {0}', N'Klanten {0}', N'Kunden {0}')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd31bfa9e-057f-42db-9007-e0bcec141510', N'309d354c-869d-4433-a35c-28a43aea0402', N'User cannot be deleted', NULL, NULL, N'User cannot be deleted', N'Gebruiker kan niet worden verwijderd omdat deze nog data bevat', N'!!!.User cannot be deleted')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'5abddcf0-38dc-4ef9-bbc9-e12f75d0a066', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'VAT', N'Invoice', NULL, N'!!!.VAT', N'!!!.VAT', N'!!!.VAT')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'de8c3850-5910-4763-8a68-e1ab283a5bbb', N'309d354c-869d-4433-a35c-28a43aea0402', N'RedirectTypes', NULL, NULL, N'Redirect Types', N'Redirect typen', N'!!!.RedirectTypes')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9a750eed-6e94-4850-b0ce-e1fa8f21b472', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'TemplateUserForgotPasswordSubject', N'Application', NULL, N'!!!.TemplateUserForgotPasswordSubject', N'!!!.TemplateUserForgotPasswordSubject', N'!!!.TemplateUserForgotPasswordSubject')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0ad1a6f6-cca5-4c72-a43a-e247296341d4', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de beurskoers', NULL, NULL, N'Based on level stock-exchangerskoers', N'Op basis van de beurskoers', N'!!!.Op basis van de beurskoers')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0d2cd2d8-2a17-4ece-a2ec-e2b87c8f1064', N'309d354c-869d-4433-a35c-28a43aea0402', N'FirstName', NULL, NULL, N'FirstName', N'Voornaam', N'!!!.FirstName')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd6579094-7f82-423f-8f1c-e2ceaab83bcd', N'309d354c-869d-4433-a35c-28a43aea0402', N'RecipeByTime', NULL, NULL, N'Recipe By Time', N'Recipe bij tijd', N'!!!.RecipeByTime')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd67e6e42-e96d-431f-ba98-e2f082ed77ad', N'309d354c-869d-4433-a35c-28a43aea0402', N'then with rule data', NULL, NULL, N'then with rule data', N'dan met ''rule data''', N'!!!.then with rule data')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'87bc397c-25ce-496f-9cda-e323a60c0f13', N'309d354c-869d-4433-a35c-28a43aea0402', N'PRO Account', NULL, NULL, N'PRO Account', N'PRO Account', N'PRO Account')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0a6b32d6-b07c-451c-bd9d-e3badd4c71c2', N'309d354c-869d-4433-a35c-28a43aea0402', N'Tooltip', NULL, NULL, N'Tooltip', N'Aanwijzer', N'!!!.Tooltip')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'acc4577c-f3a1-49ee-9263-e48da7ba91a9', N'309d354c-869d-4433-a35c-28a43aea0402', N'Tooltips', NULL, NULL, N'Tooltips', N'Aanwijzingen', N'!!!.Tooltips')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'65fa4f1e-7b7c-4ded-a301-e52889b99b24', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de dag van de week', NULL, NULL, N'Based on day of the week', N'Op basis van de dag van de week', N'!!!.Op basis van de dag van de week')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'2ac2bc84-2dc2-4f49-a95e-e536c657a126', N'309d354c-869d-4433-a35c-28a43aea0402', N'Welcome {0} as {1}', NULL, NULL, N'Welcome {0} as {1}', N'Welkom {0} als {1}', N'Willkommen {0} wie {1}')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8d159a5d-ee91-4154-a22d-e5900d4d0276', N'309d354c-869d-4433-a35c-28a43aea0402', N'Interesse? Neem contact met ons op.', NULL, NULL, N'Interested? Please contact us.', N'Interesse? Neem contact met ons op.', N'Interessiert? Bitte kontaktieren Sie uns.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3f984318-de72-4c1d-b56d-e5de144b3366', N'309d354c-869d-4433-a35c-28a43aea0402', N'DagVanDeWeek', NULL, NULL, N'Day of the Week', N'Dag van de week', N'Tag von der Woche')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b2a4654f-916a-4a74-939b-e648a2bd01e9', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Amount', N'Invoice', NULL, N'!!!.Amount', N'!!!.Amount', N'!!!.Amount')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a9a385d4-d4dc-4545-beac-e73e19d45516', N'309d354c-869d-4433-a35c-28a43aea0402', N'', NULL, NULL, N'.', N'.', N'.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a253388c-1013-4577-812f-e76c4d656a0c', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipe_6', NULL, NULL, N'ContractRecipe_6', N'ContractRecipe_6', N'!!!.ContractRecipe_6')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'3e4d5e0d-6255-45f1-9710-e86ee4623a5e', N'309d354c-869d-4433-a35c-28a43aea0402', N'Met Tag4S maakt u zonder poespas een omleiding van het ene website adres naar het andere.', NULL, NULL, N'With Tag4S you make easily a redirect from one website to another address.', N'Met Tag4S maakt u zonder poespas een omleiding van het ene website adres naar het andere.', N'Mit Tag4S machen Sie einfach eine Umleitung von einer Website zu einer anderen Adresse.')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0c20349c-c0b2-4260-9f4b-e90f91a058ad', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRedirect', NULL, NULL, N'ContractRedirect', N'Contract redirect', N'!!!.ContractRedirect')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4e0960d9-db47-489a-9e81-e97e3487b0fb', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Title', N'User', NULL, N'Title', N'Titel', N'!!!.Title')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'281f187d-f622-423b-8688-eb4ac840d38a', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'FriendlyName', N'RedirectType', NULL, N'Friendly Name', N'Naam URL', N'!!!.FriendlyName')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd51137b6-1092-49c2-887a-eb84f8871b6f', N'309d354c-869d-4433-a35c-28a43aea0402', N'Statistics', NULL, NULL, N'Statistics', N'Statistieken', N'Statistiken')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e1fd2f41-9912-43ad-b0ee-ec44f839afae', N'309d354c-869d-4433-a35c-28a43aea0402', N'GoTo', NULL, NULL, N'Go To', N'Ga Naar', N'!!!.GoTo')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e0fa0a1f-d161-4f8c-a078-ec5745706021', N'309d354c-869d-4433-a35c-28a43aea0402', N'Date', NULL, NULL, N'Date', N'Datum', N'Datum')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'092a26f3-0c81-4946-915b-ec579b9a8c0d', N'309d354c-869d-4433-a35c-28a43aea0402', N'Lastname', NULL, NULL, N'Lastname', N'Achternaam', N'Nachname')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'1b1add8b-595a-445e-9838-ecb4d846d458', N'309d354c-869d-4433-a35c-28a43aea0402', N'BeginTime', NULL, NULL, N'Start Time', N'Begin tijd', N'Zeit anfang')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cfcce681-2545-43ef-8825-ecd747372511', N'309d354c-869d-4433-a35c-28a43aea0402', N'Pro Account: eigen recept bedenken', NULL, NULL, N'Pro Account: create your own recipe', N'Pro Account: eigen recept bedenken', N'!!!.Pro Account: eigen recept bedenken')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd7ca7dee-70df-4db0-bb05-ecf5cd4d9a82', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} customers', NULL, NULL, N'{0} customers', N'{0} Alle klanten', N'{0} customers')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'86a834a0-4810-45e2-b07f-ed1afe5f4b97', N'309d354c-869d-4433-a35c-28a43aea0402', N'{0} QR codes', NULL, NULL, N'{0} QR codes', N'{0} QR codes', N'{0} QR codes')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'6953214d-68ee-440c-8511-ed2070f5a20d', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'UserRole', N'User', NULL, N'UserRole', N'Gebruikersrol', N'!!!.UserRole')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'712f69a2-c3b7-49ee-962f-ed7545b26575', N'309d354c-869d-4433-a35c-28a43aea0402', N'Home', NULL, NULL, N'Home', N'Home', N'!!!.Home')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'8c295cc6-3238-4b93-bff2-edae7cdc3347', N'309d354c-869d-4433-a35c-28a43aea0402', N'Invoice', NULL, NULL, N'Invoice', N'Faktuur', N'Rechnung')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4ecab599-7f09-4354-99ff-eeb0239efc20', N'309d354c-869d-4433-a35c-28a43aea0402', N'ResultUri', NULL, NULL, N'Result Url', N'Result Url', N'!!!.ResultUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'cd1417a8-37b0-487e-8c4a-eeb3645e78d3', N'309d354c-869d-4433-a35c-28a43aea0402', N'RuleParameterValues', NULL, NULL, N'Rule ParameterValues', N'Rule Parameter Values', N'!!!.RuleParameterValues')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'79056571-f90c-4947-9233-eeb6b2ae2054', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'DisableEditOwner', N'User', NULL, N'Disable edit by owner', N'Uitschakelen beheer eigenaar ?', N'!!!.DisableEditOwner')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'313d1ab5-f53b-4de2-92e6-efd9282d5a25', N'309d354c-869d-4433-a35c-28a43aea0402', N'Users', NULL, NULL, N'Users', N'Gebruikers', N'Benutzer')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'25e4106f-1328-40a5-a516-f0cc3d090fde', N'309d354c-869d-4433-a35c-28a43aea0402', N'Add', NULL, NULL, N'Add', N'Toevoegen', N'!!!.Add')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'99c5e188-929c-4226-b09a-f10e2e2c03b7', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'City', N'User', NULL, N'City', N'Stad', N'Ort')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fe31003e-906a-4e3d-ba61-f11486b87450', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractEditByTime', NULL, NULL, N'Contract Edit By Time', N'Wijzig contract bij tijd', N'!!!.ContractEditByTime')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'04104a26-8e73-456e-8238-f1c82161451b', N'309d354c-869d-4433-a35c-28a43aea0402', N'Weekday', NULL, NULL, N'Day of the week', N'Dag van de week ', N'Tag von der Woche')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'84b7a279-a1fb-4f93-9bce-f2a485f974a7', N'309d354c-869d-4433-a35c-28a43aea0402', N'ContractRecipes', NULL, NULL, N'Contract Recipes', N'Recipes', N'!!!.ContractRecipes')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'0484f110-ab9f-40a2-be1d-f32b2a321cdc', N'309d354c-869d-4433-a35c-28a43aea0402', N'You are here:', NULL, NULL, N'You are here:', N'U bent nu hier:', N'Sie sind hier:')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'aa3776a9-2d9e-4c7c-9694-f36e2993187e', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'ZipCode', N'User', NULL, N'ZipCode', N'Postcode', N'PLZ')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'36b2529e-1e4d-425f-b8f5-f434db014648', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van de weersverwachting', NULL, NULL, N'Based on the weather forecast', N'Op basis van de weersverwachting', N'!!!.Op basis van de weersverwachting')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'652c8719-ab57-4bf0-9540-f4ec32d25b4c', N'309d354c-869d-4433-a35c-28a43aea0402', N'Forgot Password', NULL, NULL, N'Forgot Password', N'Wachtwoord vergeten', N'Passwort vergessen')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a5b7a390-df83-4812-ab41-f5313dd48d32', N'309d354c-869d-4433-a35c-28a43aea0402', N'Host', NULL, NULL, N'Host', N'Host', N'!!!.Host')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd1be2052-cf76-42e5-9267-f54a09fe52ff', N'309d354c-869d-4433-a35c-28a43aea0402', N'Day of the week', NULL, NULL, N'!!!.Day of the week', N'!!!.Day of the week', N'!!!.Day of the week')
GO
print 'Processed 400 total records'
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'a73add8c-44cc-40f1-80ad-f599647f5ef2', N'309d354c-869d-4433-a35c-28a43aea0402', N'UserContracts', NULL, NULL, N'User Contracts', N'QR code gebruiker', N'!!!.UserContracts')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'98bc48aa-c72f-46f8-bb52-f5ac54f3081d', N'309d354c-869d-4433-a35c-28a43aea0402', N'then with browser data', NULL, NULL, N'then with browser data', N'Dan met browser data', N'!!!.then with browser data')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'b57680a4-01e5-40bb-a820-f611123c0c49', N'309d354c-869d-4433-a35c-28a43aea0402', N'RandomUri', NULL, NULL, N'Random Url', N'Random Url', N'!!!.RandomUri')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'd8c57054-28cd-4999-ba9f-f6185e1b8199', N'309d354c-869d-4433-a35c-28a43aea0402', N'Prefix', NULL, NULL, N'Prefix', N'Tussenvoegsel naam', N'Präfix')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'fa150cc1-e15c-4c04-a102-f619467d8dd5', N'309d354c-869d-4433-a35c-28a43aea0402', N'MyCredit', NULL, NULL, N'My QRedits', N'Mijn QRedits', N'!!!.MyCredit')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'9a5adc66-813a-4d50-b93c-f6bea4c0e3de', N'309d354c-869d-4433-a35c-28a43aea0402', N'EmailAddress', NULL, NULL, N'Email Address', N'emailadres', N'Email Addresse')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'ca8da3e4-da2c-4f0a-a511-f76d50a513a6', N'309d354c-869d-4433-a35c-28a43aea0402', N'Stock exchange', NULL, NULL, N'!!!.Stock exchange', N'!!!.Stock exchange', N'!!!.Stock exchange')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'c41a35d1-ec79-47c2-8e42-f7ad8bfe7091', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'RandomFunction', N'ContractUri', NULL, N'Random Function', N'Random Function', N'!!!.RandomFunction')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'eeee944d-c11e-4d7e-86c4-fa4e6bb4fe09', N'309d354c-869d-4433-a35c-28a43aea0402', N'Contract Url', NULL, NULL, N'Contract Url', N'Algemene Url', N'!!!.Contract Url')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'73b057b4-0435-4439-8dcb-fa6cd4e773f5', N'309d354c-869d-4433-a35c-28a43aea0402', N'Inschrijven', NULL, NULL, N'Register', N'Inschrijven', N'Registrieren')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'4574579f-a09f-4400-8aa8-fa88259fd1d8', N'3304a3e6-51ca-4e7d-a77b-b895b740d2c2', N'Confirm Password', N'UserPassword', NULL, N'!!!.Confirm Password', N'!!!.Confirm Password', N'!!!.Confirm Password')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'eb9628a7-7977-4cec-af54-fcd71c68a825', N'309d354c-869d-4433-a35c-28a43aea0402', N'Op basis van loting3', NULL, NULL, N'Based on lotery 3', N'Op basis van loting3', N'!!!.Op basis van loting3')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'38e07907-b324-4df6-8d71-fce1e319cf05', N'309d354c-869d-4433-a35c-28a43aea0402', N'Onze support-afdeling zit voor u klaar.', NULL, NULL, N'Our support department is waiting for you.', N'Onze support-afdeling zit voor u klaar.', N'Unsere Support-Abteilung wartet auf Sie')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'f4e279f6-86dc-4ca0-a19a-fd1a9f9dffaa', N'309d354c-869d-4433-a35c-28a43aea0402', N'ClickAmounts', NULL, NULL, N'Click Amounts', N'Aantal Clicks', N'Anzahl Klicks')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'e217081c-af5f-41cd-af4e-ff0922dd8b56', N'309d354c-869d-4433-a35c-28a43aea0402', N'User', NULL, NULL, N'User', N'Gebruiker', N'!!!.User')
INSERT [dbo].[Translation] ([Id], [TranslationTypeId], [Name], [Entity], [View], [EN], [NL], [DE]) VALUES (N'214fc150-0429-47e1-9a8f-ff14eba6b075', N'309d354c-869d-4433-a35c-28a43aea0402', N'Are you sure you want to delete this?', NULL, NULL, N'Are you sure you want to delete this?', N'Weet u zeker dat u deze wil verwijderen ?', N'Sind Sie sicher, dass Sie diese löschen wollen ?')
/****** Object:  Table [dbo].[Contract]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [uniqueidentifier] NOT NULL,
	[ContractTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Advertisement] [bit] NOT NULL,
	[MaxUris] [int] NOT NULL,
	[MaxRedirectsPerUri] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Contract] ([Id], [ContractTypeId], [Name], [Advertisement], [MaxUris], [MaxRedirectsPerUri], [Price]) VALUES (N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'2e492e5e-0ff8-451b-bcad-1c053af6eb4d', N'Pro', 0, 2, 500, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Contract] ([Id], [ContractTypeId], [Name], [Advertisement], [MaxUris], [MaxRedirectsPerUri], [Price]) VALUES (N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'2e492e5e-0ff8-451b-bcad-1c053af6eb4d', N'Standard', 0, 1, 10, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Contract] ([Id], [ContractTypeId], [Name], [Advertisement], [MaxUris], [MaxRedirectsPerUri], [Price]) VALUES (N'e0823a5d-d51b-4e10-91b2-dbf40d47e20e', N'eba32a33-0f5e-4dfd-b979-0018ab7254e0', N'Free', 0, 2, 5, CAST(0.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[RedirectTypeValue]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedirectTypeValue](
	[Id] [uniqueidentifier] NOT NULL,
	[RedirectTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RedirectTypeValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'06afa484-9874-41ee-8de3-0bacf02178db', N'ec3969f0-23c9-4fc7-b60e-2b117b5cd788', N'False')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'fd037fc2-c841-491f-b584-1fd714fafe91', N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'Safari')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'090e7c50-2768-4818-a8f2-27ebefd4472b', N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'33.0')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'33f25462-5af3-4a84-9458-2f8797bf12d6', N'fe34c146-23c2-44a8-9d6e-cf1fc9a5de41', N'640')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'38edcfa5-6a29-47e3-b33a-30f0a6984993', N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'0.0')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'3c70945d-3a96-4448-a080-42a564cd0221', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'InternetExplorer11')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'139ce334-c4f1-489e-a1df-45f7a99899dc', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Mozilla')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'de6e7bc3-b2eb-4b41-a393-537de026ecd5', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Firefox19')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'0315a519-75fb-41a8-ab6e-545af51f320c', N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'19.0')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'ace6a46f-af12-46b3-b65d-59ce69a6238d', N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'Firefox')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'b7344dea-037c-484d-b19c-5a95186afcb5', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Chrome35')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'71a430b2-f2ce-406d-9599-656d9ac86270', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Safari')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'f60fb3f5-ae1d-4aab-9489-6c7c7bffaf5e', N'ec3969f0-23c9-4fc7-b60e-2b117b5cd788', N'True')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'53c5a486-13e9-40c0-ac82-7522a8d80a62', N'f556441b-0702-4297-b138-8df83b2a437c', N'Unknown')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'c854a045-7f0b-4407-9b80-79c80ce3b6e6', N'53ab2d8e-bc92-40ee-a9d4-56f560064867', N'Unknown')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'1f163087-2966-495d-b056-8122ab15f966', N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'InternetExplorer')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'b3cfa44a-2f3c-454b-9da7-8eea1ff7c06f', N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'Chrome')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'ca9d5fb9-bb51-4ff4-a268-9a069d0384e7', N'816d8e45-6287-4c5b-88c3-72f609bf02f7', N'Mozilla')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'312aa977-3427-4e86-8e74-a714bc1acac8', N'cfe37745-702d-49b7-b8e4-86bfa4b8420e', N'480')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'9a98d7ab-fc5f-4e9a-b8a1-bdeba632081e', N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'11.0')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'd3f62f18-fab2-4d91-9ee7-cf1afc184c47', N'b4a253f8-fcee-4c46-aeb4-70d1ed652381', N'35.0')
INSERT [dbo].[RedirectTypeValue] ([Id], [RedirectTypeId], [Name]) VALUES (N'71c2e8ae-48b7-4e52-8ced-cf5c0a34bed5', N'525364c3-d404-4666-aa8a-ea8e6c3dc8c0', N'Chrome33')
/****** Object:  View [dbo].[MenuParent]    Script Date: 10/28/2014 18:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MenuParent]
AS
SELECT        Id, Name, Entity, [View]
FROM            dbo.Menu
WHERE        (IsFirstParent = 1)
GO
/****** Object:  View [dbo].[MenuChild]    Script Date: 10/28/2014 18:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MenuChild]
AS
SELECT        Id, Name, Entity, [View], ParentMenuId
FROM            dbo.Menu
WHERE        (IsFirstParent = 0) AND (NOT (ParentMenuId IS NULL))
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [uniqueidentifier] NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[Street] [nvarchar](50) NULL,
	[HouseNumber] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[CountryId] [uniqueidentifier] NULL,
	[NationalityId] [uniqueidentifier] NULL,
	[GenderId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumDiscount]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumDiscount](
	[Id] [uniqueidentifier] NOT NULL,
	[ContractId] [uniqueidentifier] NOT NULL,
	[CountFrom] [int] NOT NULL,
	[CountTo] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_VolumDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[VolumDiscount] ([Id], [ContractId], [CountFrom], [CountTo], [Price]) VALUES (N'2ba912d6-cc3e-4aa8-b091-5674984a1e2c', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', 0, 5, 1.99)
INSERT [dbo].[VolumDiscount] ([Id], [ContractId], [CountFrom], [CountTo], [Price]) VALUES (N'341b2f35-4362-4099-9a96-63d2eff82250', N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', 0, 5, 2.49)
INSERT [dbo].[VolumDiscount] ([Id], [ContractId], [CountFrom], [CountTo], [Price]) VALUES (N'7d9a2381-805a-4f8b-a7e7-a52bb0e789e5', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', 8, 51, 1.49)
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Date] [date] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[VAT] [decimal](18, 2) NOT NULL,
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](50) NULL,
	[Paid] [bit] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON
INSERT [dbo].[Invoice] ([Id], [UserId], [Date], [Amount], [VAT], [Number], [TransactionId], [Paid], [Quantity]) VALUES (N'41111548-f4aa-488a-a4fa-2897f7a0e61c', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0xEA380B00 AS Date), CAST(5.00 AS Decimal(18, 2)), CAST(0.86 AS Decimal(18, 2)), 4, N'0030000911627178', 1, 500)
INSERT [dbo].[Invoice] ([Id], [UserId], [Date], [Amount], [VAT], [Number], [TransactionId], [Paid], [Quantity]) VALUES (N'e865b3f9-2e18-4401-85a9-72922692ac23', N'c054c125-51c9-4414-9771-e39e0bdcb2fd', CAST(0x2D390B00 AS Date), CAST(5.00 AS Decimal(18, 2)), CAST(0.86 AS Decimal(18, 2)), 5, N'0030000970292618', NULL, 500)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
/****** Object:  Table [dbo].[PersonSetting]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemKey] [nvarchar](255) NOT NULL,
	[ItemValue] [nvarchar](max) NULL,
	[PersonId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PersonSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonRole]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonRole](
	[PersonId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PersonRole] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractRecipe]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractRecipe](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
	[ContractId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
	[Position] [int] NOT NULL,
	[CssClass] [nvarchar](255) NULL,
 CONSTRAINT [PK_ContractRecipe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'3c979d01-8840-4542-9d0e-0e958a4e9ceb', N'CR_5', 5, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Random 2', 1, 8, N'picturebutton4')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'd4cb1d9b-2a99-4dba-a03a-15b2e9667cf1', N'CR_Pro_3', 11, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Day of the week pro', 1, 2, N'picturebutton1')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'80cf96e6-2cfc-4161-829e-1b030cfb27c7', N'CR_2', 2, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Stock exchange', 1, 11, N'picturebutton3')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'a5038eb6-5841-4698-bec4-55778919f48c', N'CR_4', 4, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Random 1', 1, 7, N'picturebutton4')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'79719c03-f431-4794-b344-67ac497e9e03', N'CR_Pro_1', 9, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', NULL, 0, 0, NULL)
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'c771ddf4-d91a-4777-8f86-68b5fee21d30', N'CR_Pro_5', 13, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', NULL, 0, 0, NULL)
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'160226fb-df3a-452a-9ab5-72fa35972fe8', N'CR_Pro_7', 15, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', NULL, 0, 0, NULL)
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'9d8c4d63-d307-4360-84b7-99c606c4b794', N'CR_3', 3, N'e0823a5d-d51b-4e10-91b2-dbf40d47e20e', N'Day of the week', 1, 1, N'picturebutton1')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'e6eacb56-70ef-44c7-81cf-a2aafba3fd7d', N'CR_6', 6, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Time', 1, 3, N'picturebutton1')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'8a21b93a-2ca6-4ef7-afca-ac91feadbed6', N'CR_1', 1, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Weather expectation', 1, 5, N'picturebutton2')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'816d6686-ae8e-4905-a428-cfb57fcc5902', N'CR_Pro_8', 16, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', NULL, 0, 0, NULL)
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'4cbb7336-3289-4b2c-aeac-e18823409b84', N'CR_8', 8, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Random 4', 1, 10, N'picturebutton4')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'fe092bf6-467c-4bb9-8d0b-e6d6f3e4c9bf', N'CR_Own', 0, N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'Own recipe', 1, 6, N'picturebutton5')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'8ad6f14c-73b2-49d2-92fb-f1e750803b92', N'CR_Pro_4', 12, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', NULL, 0, 0, NULL)
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'e031f6a7-53b5-4f83-8372-f8f9a78eecfc', N'CR_Pro_2', 10, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Stock excchange pro', 1, 12, N'picturebutton3')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'7672a9b5-6b25-4689-bb92-fd3f7525b73b', N'CR_7', 7, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Random 3', 1, 9, N'picturebutton4')
INSERT [dbo].[ContractRecipe] ([Id], [Name], [Code], [ContractId], [Description], [Active], [Position], [CssClass]) VALUES (N'047753e9-8b96-4a98-8389-ff11af84dedb', N'CR_Pro_6', 14, N'662277e4-d87a-45b6-9ba1-c40123e7b9aa', N'Time pro', 1, 4, N'picturebutton1')
/****** Object:  View [dbo].[TooltipWithType]    Script Date: 10/28/2014 18:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TooltipWithType]
AS
SELECT        dbo.Tooltip.Name, dbo.Tooltip.Entity, dbo.Tooltip.[View], dbo.Tooltip.EN, dbo.Tooltip.NL, dbo.Tooltip.DE, 
                         dbo.TranslationType.Name AS Type, dbo.TranslationType.Name + '.' + dbo.Tooltip.Name AS KeyName
FROM            dbo.Tooltip INNER JOIN
                         dbo.TranslationType ON dbo.Tooltip.TranslationTypeId = dbo.TranslationType.Id
GO
/****** Object:  View [dbo].[TranslationWithType]    Script Date: 10/28/2014 18:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TranslationWithType]
AS
SELECT        dbo.Translation.Name, dbo.Translation.Entity, dbo.Translation.[View], dbo.Translation.EN, dbo.Translation.NL, dbo.Translation.DE, 
                         dbo.TranslationType.Name AS Type, dbo.TranslationType.Name + '.' + dbo.Translation.Name AS KeyName
FROM            dbo.Translation INNER JOIN
                         dbo.TranslationType ON dbo.Translation.TranslationTypeId = dbo.TranslationType.Id
GO
/****** Object:  Table [dbo].[UserPassword]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPassword](
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[IsAccountAdmin] [bit] NOT NULL,
	[IsReset] [bit] NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[CanStatistics] [bit] NULL,
	[CanQr] [bit] NULL,
	[CanFinance] [bit] NULL,
	[IsDisabled] [bit] NULL,
 CONSTRAINT [PK_UserPassword_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserPassword] ([UserId], [Password], [UserName], [Id], [IsAccountAdmin], [IsReset], [EmailAddress], [FullName], [CanStatistics], [CanQr], [CanFinance], [IsDisabled]) VALUES (N'7dcd88b9-d68f-412a-a451-6b823ffb99de', N'test123!', N'Tag4S', N'52f8d28f-d965-4d93-b605-7532f386e380', 0, NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserPassword] ([UserId], [Password], [UserName], [Id], [IsAccountAdmin], [IsReset], [EmailAddress], [FullName], [CanStatistics], [CanQr], [CanFinance], [IsDisabled]) VALUES (N'c054c125-51c9-4414-9771-e39e0bdcb2fd', N'Test123!', N'tiberiu.lupascu@euroitc.com', N'141546da-17af-418b-a7c4-9630aff3ef64', 1, 0, N'tiberiu.lupascu@euroitc.com', NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[UserContract]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContract](
	[Id] [uniqueidentifier] NOT NULL,
	[ContractId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Uri] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Enabled] [bit] NULL,
	[TransactionId] [nvarchar](50) NULL,
	[eId] [nvarchar](255) NOT NULL,
	[ContractRecipeId] [uniqueidentifier] NULL,
	[LastPaid] [date] NULL,
	[Created] [date] NULL,
 CONSTRAINT [PK_UserContract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'fbc312d8-c384-4a1c-8876-2c4eb9f8670f', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A34600DB0207 AS DateTime), CAST(0x0000A4B300DB0207 AS DateTime), N'http://www.contoso.com', NULL, 0, NULL, N'PnLX8', N'8a21b93a-2ca6-4ef7-afca-ac91feadbed6', CAST(0x2D390B00 AS Date), CAST(0x9E380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'ff3fc430-e3af-45f4-b4e1-384bc2648391', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A35A00C7F380 AS DateTime), CAST(0x0000A4C700C7F380 AS DateTime), N'http://www.contoso.com', N'bibi4', 1, NULL, N'wd4Pr', N'4cbb7336-3289-4b2c-aeac-e18823409b84', CAST(0x2D390B00 AS Date), CAST(0x2D390B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'45dd08f8-873f-4d77-a2ad-6c936681ff51', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A36A00000000 AS DateTime), CAST(0x0000A36B00000000 AS DateTime), N'http://www.euroitc.com', N'test pro', 1, NULL, N'YBDl5', NULL, CAST(0x2D390B00 AS Date), CAST(0xC5380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'f685e059-4459-4695-aa56-6caef017111d', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A35A00C6DA40 AS DateTime), CAST(0x0000A4C700C6DA40 AS DateTime), N'http://www.nl.com', N'tyu marcel', 1, NULL, N'WhmFA', N'e6eacb56-70ef-44c7-81cf-a2aafba3fd7d', CAST(0x2D390B00 AS Date), CAST(0xB5380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'29a2f682-8fe1-438a-b98f-8207fa509a6c', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A34F00FB9640 AS DateTime), CAST(0x0000A4BC00FB9640 AS DateTime), N'http://www.msn.com', N'test random 1', 1, NULL, N'h9IqL', N'a5038eb6-5841-4698-bec4-55778919f48c', CAST(0x2D390B00 AS Date), CAST(0xAA380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'59212c29-00e1-4b5e-995f-a8fb93d9b992', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A34F00000000 AS DateTime), CAST(0x0000A35000000000 AS DateTime), N'http://www.euroitc.com', N'test pro', 1, NULL, N'qsnvd', NULL, CAST(0x2D390B00 AS Date), CAST(0x9E380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'e0823a5d-d51b-4e10-91b2-dbf40d47e20e', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A38F01022DC0 AS DateTime), CAST(0x0000A4FC01022DC0 AS DateTime), N'http://www.tag4s.com', N'yo', 1, NULL, N'WKrxU', N'9d8c4d63-d307-4360-84b7-99c606c4b794', CAST(0x2D390B00 AS Date), CAST(0xEA380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A38A00F765F5 AS DateTime), CAST(0x0000A4F700F765F5 AS DateTime), N'http://www.contoso.com', NULL, 0, NULL, N'8um32', N'9d8c4d63-d307-4360-84b7-99c606c4b794', CAST(0x2D390B00 AS Date), CAST(0xE5380B00 AS Date))
INSERT [dbo].[UserContract] ([Id], [ContractId], [UserId], [StartDate], [EndDate], [Uri], [Name], [Enabled], [TransactionId], [eId], [ContractRecipeId], [LastPaid], [Created]) VALUES (N'0a05822d-7141-4dcb-a3ca-f2362a206bcc', N'18a77083-3b99-4ef9-8fbc-93a3e64009d0', N'7dcd88b9-d68f-412a-a451-6b823ffb99de', CAST(0x0000A33200B24AA5 AS DateTime), CAST(0x0000A49F00B24AA5 AS DateTime), N'http://www.rule.com', NULL, 0, NULL, N'BqXzx', N'8a21b93a-2ca6-4ef7-afca-ac91feadbed6', CAST(0x2D390B00 AS Date), CAST(0x9E380B00 AS Date))
/****** Object:  Table [dbo].[ShoppingBasket]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingBasket](
	[Id] [uniqueidentifier] NOT NULL,
	[UserContractId] [uniqueidentifier] NOT NULL,
	[Price] [float] NOT NULL,
	[TransactionId] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShoppingBasket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserContractUri]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContractUri](
	[Id] [uniqueidentifier] NOT NULL,
	[UserContractId] [uniqueidentifier] NOT NULL,
	[Uri] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Enabled] [bit] NOT NULL,
	[RandomFunction] [int] NOT NULL,
 CONSTRAINT [PK_UserContractUri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'17de49ec-dd47-410e-acd0-1da4679a03a1', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'83e94b8a-d3e6-485b-91f9-1fd623bbe77f', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'c7c00b7b-3ce0-442a-bd88-291d2f91d643', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'5479af3e-9c6c-4bc4-8abc-395246592a2b', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'6e8e19d1-f0f3-4d79-aba4-456aeabb8aae', N'ff3fc430-e3af-45f4-b4e1-384bc2648391', N'http://www.contoso.com', N'noname', 1, 3)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'649f80b5-1455-401a-b885-491823bfb386', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'3e781685-5712-4446-add7-64d2ab9e03f8', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'6c214093-2349-423c-bd82-696ae27bb85d', N'59212c29-00e1-4b5e-995f-a8fb93d9b992', N'http://www.nu.nl', NULL, 1, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'14be57d5-17cc-4a66-a06a-697720dcebac', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'e52f09af-3763-4b17-8cd7-7800b23f3754', N'f685e059-4459-4695-aa56-6caef017111d', N'http://www.contoso.com', N'noname', 1, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'073c37ca-b5e8-4214-8fbb-7dde382d5245', N'29a2f682-8fe1-438a-b98f-8207fa509a6c', N'http://www.nu.nl', N'noname', 1, 1)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'a8e5022f-3144-4de2-8df9-97178d3f5c81', N'45dd08f8-873f-4d77-a2ad-6c936681ff51', N'http://www.msn.com', NULL, 1, 1)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'c9a2e32a-be9c-415d-938f-acf9c4a8b407', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'b1678c43-8bcc-44a4-ae90-b195a9052321', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'52581631-607d-4ce4-a2ae-bb43202ef6a6', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'a3faab23-f186-4904-bbcb-c281dac610fd', N'0a05822d-7141-4dcb-a3ca-f2362a206bcc', N'http://www.rule1.com', N'noname', 1, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'b6caac67-3b2f-426c-8f82-c522dcccbbe4', N'fbc312d8-c384-4a1c-8876-2c4eb9f8670f', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'942a0ea8-6a31-4d01-adc5-cc6dee4a0218', N'0a05822d-7141-4dcb-a3ca-f2362a206bcc', N'http://www.rule2.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'e94ec583-ba29-40f6-9a9c-d4904dbbd083', N'45dd08f8-873f-4d77-a2ad-6c936681ff51', N'http://www.ancastanescu.com', NULL, 0, 3)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'02fd1f05-5076-4395-88f6-d908bf490fe2', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'879196a1-4d48-4aee-acab-dabfc12b4b47', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'95985743-6ab2-4fc7-84be-f4e586c5d2f1', N'34a7dcb3-4cd3-4980-aede-c904ba1123b9', N'http://www.contoso.com', N'noname', 0, 0)
INSERT [dbo].[UserContractUri] ([Id], [UserContractId], [Uri], [Name], [Enabled], [RandomFunction]) VALUES (N'c4af77d2-5c32-4f0b-9d94-f7eba5eab57d', N'a7b4ada0-7ea3-42ac-864b-b08cb37fa967', N'http://www.tag4s.com', N'noname', 0, 0)
/****** Object:  Table [dbo].[InvoiceLine]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLine](
	[Id] [uniqueidentifier] NOT NULL,
	[InvoiceId] [uniqueidentifier] NOT NULL,
	[UserContractId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[VAT] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_InvoiceLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RandomUri]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandomUri](
	[Id] [uniqueidentifier] NOT NULL,
	[Uri] [nvarchar](max) NOT NULL,
	[RandomParameter] [decimal](18, 2) NOT NULL,
	[UserContractUriId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RandomUri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[RandomUri] ([Id], [Uri], [RandomParameter], [UserContractUriId]) VALUES (N'a5cdb085-647b-4049-aff3-0dcb5c860470', N'http://www.almostall.nl', CAST(80.00 AS Decimal(18, 2)), N'e94ec583-ba29-40f6-9a9c-d4904dbbd083')
INSERT [dbo].[RandomUri] ([Id], [Uri], [RandomParameter], [UserContractUriId]) VALUES (N'4c878d00-0e12-4472-9468-887c8d92c372', N'http://www.euroitc.com', CAST(50.00 AS Decimal(18, 2)), N'073c37ca-b5e8-4214-8fbb-7dde382d5245')
INSERT [dbo].[RandomUri] ([Id], [Uri], [RandomParameter], [UserContractUriId]) VALUES (N'eac36f61-11dd-42ee-926f-dcc445a58d29', N'http://www.dor.nl', CAST(20.00 AS Decimal(18, 2)), N'e94ec583-ba29-40f6-9a9c-d4904dbbd083')
INSERT [dbo].[RandomUri] ([Id], [Uri], [RandomParameter], [UserContractUriId]) VALUES (N'62edc8b6-8fa6-4f4b-b338-dd729a6fbadf', N'http://www.contoso.com', CAST(1.00 AS Decimal(18, 2)), N'6e8e19d1-f0f3-4d79-aba4-456aeabb8aae')
INSERT [dbo].[RandomUri] ([Id], [Uri], [RandomParameter], [UserContractUriId]) VALUES (N'3c95541b-44e2-427e-8a6d-e80c4596ff1d', N'http://www.google.com', CAST(30.00 AS Decimal(18, 2)), N'a8e5022f-3144-4de2-8df9-97178d3f5c81')
/****** Object:  Table [dbo].[UserContractRedirect]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContractRedirect](
	[Id] [uniqueidentifier] NOT NULL,
	[UserContractUri] [uniqueidentifier] NOT NULL,
	[DateTimeValueStart] [datetime] NULL,
	[DateTimeValueStop] [datetime] NULL,
	[DayOfTheWeekValue] [int] NULL,
	[TimeOfDayHourStart] [int] NULL,
	[TimeOfDayHourEnd] [int] NULL,
	[TimeOfDayMinuteStart] [int] NULL,
	[TimeOfDayMinuteEnd] [int] NULL,
	[Counter] [int] NULL,
	[UserAgent] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Enabled] [bit] NULL,
	[UniqueIP] [bit] NULL,
 CONSTRAINT [PK_UserContractRedirect] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'033753fc-4091-487c-9f9c-10a8d18643a5', N'c9a2e32a-be9c-415d-938f-acf9c4a8b407', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'919d5258-b2cf-4c63-9ef8-150af9cf6f4a', N'649f80b5-1455-401a-b885-491823bfb386', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'94ff6177-e67a-4452-88aa-22be50bcc995', N'e94ec583-ba29-40f6-9a9c-d4904dbbd083', NULL, NULL, NULL, 22, 23, 0, 30, NULL, N'', N'nachtclub', 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'4a4c226f-65f9-424a-9953-2d18c9dedf29', N'879196a1-4d48-4aee-acab-dabfc12b4b47', NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'45fd7594-12f2-45b6-8706-3e0426449e0d', N'02fd1f05-5076-4395-88f6-d908bf490fe2', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'7766cba3-0df4-4a5d-878a-424af08bfc88', N'3e781685-5712-4446-add7-64d2ab9e03f8', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'a4839ea0-8136-45ed-b049-4fa06d7d7bb4', N'83e94b8a-d3e6-485b-91f9-1fd623bbe77f', NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'b40a29d9-9cbf-4fbf-8e3a-56109e559aa7', N'a3faab23-f186-4904-bbcb-c281dac610fd', CAST(0x0000A33200B24AAA AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'd5eaa6c6-5fa9-44a7-ab3b-5d5733f6dff1', N'b1678c43-8bcc-44a4-ae90-b195a9052321', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'd35aaf1f-85b8-4dd9-9790-67180f36261f', N'c4af77d2-5c32-4f0b-9d94-f7eba5eab57d', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'15491ab6-e609-44f3-bd85-6a0963653a73', N'6e8e19d1-f0f3-4d79-aba4-456aeabb8aae', CAST(0x0000A35A00C83539 AS DateTime), CAST(0x0000A4C700C83539 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'38b5f17d-1812-487e-a396-8af454224700', N'17de49ec-dd47-410e-acd0-1da4679a03a1', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'83cf96aa-dcc5-44f2-a66d-911d0f43d3a9', N'073c37ca-b5e8-4214-8fbb-7dde382d5245', CAST(0x0000A34F00FBD0C6 AS DateTime), CAST(0x0000A4BC00FBD0C7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'dfe1ee04-88fc-4990-a1e7-95a8e0bdb686', N'b6caac67-3b2f-426c-8f82-c522dcccbbe4', CAST(0x0000A34600DB020A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'cbe06146-c93b-4826-9f5b-aa77264e7a32', N'c7c00b7b-3ce0-442a-bd88-291d2f91d643', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'4e4d800a-b298-4d4a-9d0f-aaaf159f362c', N'5479af3e-9c6c-4bc4-8abc-395246592a2b', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'1f8b7adc-0e11-494e-a650-b79d092c3ae9', N'52581631-607d-4ce4-a2ae-bb43202ef6a6', NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'7f8e3409-f062-4e87-bfbf-c9dc87aeaca6', N'a8e5022f-3144-4de2-8df9-97178d3f5c81', NULL, CAST(0x0000A37100000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'', N'before 23 juli', 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'9a5699cb-d775-45fd-8d00-d635c4727524', N'a8e5022f-3144-4de2-8df9-97178d3f5c81', CAST(0x0000A36A00000000 AS DateTime), CAST(0x0000A36B00000000 AS DateTime), 3, 3, 3, 0, 30, NULL, N'', N'wednesday tussen 3 en 4', 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'3b427d18-2b61-4b3d-9f76-dc038282f59f', N'95985743-6ab2-4fc7-84be-f4e586c5d2f1', NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'82b17467-2ea2-42f6-a5c0-dceb9a4cd47e', N'14be57d5-17cc-4a66-a06a-697720dcebac', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'5db55867-d767-4521-b5c5-dda62e84c01d', N'e52f09af-3763-4b17-8cd7-7800b23f3754', CAST(0x0000A35A002932E0 AS DateTime), CAST(0x0000A35A00317040 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[UserContractRedirect] ([Id], [UserContractUri], [DateTimeValueStart], [DateTimeValueStop], [DayOfTheWeekValue], [TimeOfDayHourStart], [TimeOfDayHourEnd], [TimeOfDayMinuteStart], [TimeOfDayMinuteEnd], [Counter], [UserAgent], [Name], [Enabled], [UniqueIP]) VALUES (N'd30ec98c-801f-4da7-a031-df9f7e46dfa5', N'942a0ea8-6a31-4d01-adc5-cc6dee4a0218', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
/****** Object:  Table [dbo].[UserContractRedirectRuleParameterValue]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContractRedirectRuleParameterValue](
	[RuleParameterValueId] [uniqueidentifier] NOT NULL,
	[UserContractRedirectId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserContractRedirectRuleParameterValue] PRIMARY KEY CLUSTERED 
(
	[RuleParameterValueId] ASC,
	[UserContractRedirectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'e80676eb-cd33-414a-a050-5d84957d08b3', N'7f8e3409-f062-4e87-bfbf-c9dc87aeaca6')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'e80676eb-cd33-414a-a050-5d84957d08b3', N'd30ec98c-801f-4da7-a031-df9f7e46dfa5')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'81ba6e73-a1ee-40c8-b4af-a567a3e5f331', N'9a5699cb-d775-45fd-8d00-d635c4727524')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'017802bb-82d0-4cd4-8206-cc2dad0038f1', N'b40a29d9-9cbf-4fbf-8e3a-56109e559aa7')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'3919d355-2905-49d6-acac-e66979b97f1d', N'b40a29d9-9cbf-4fbf-8e3a-56109e559aa7')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'3919d355-2905-49d6-acac-e66979b97f1d', N'9a5699cb-d775-45fd-8d00-d635c4727524')
INSERT [dbo].[UserContractRedirectRuleParameterValue] ([RuleParameterValueId], [UserContractRedirectId]) VALUES (N'44511c1e-fd22-4273-91bb-eea8977d469e', N'd30ec98c-801f-4da7-a031-df9f7e46dfa5')
/****** Object:  Table [dbo].[UserContractRedirectRedirectTypeValue]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContractRedirectRedirectTypeValue](
	[RedirectTypeValueId] [uniqueidentifier] NOT NULL,
	[UserContractRedirectId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserContractRedirectRedirectTypeValue] PRIMARY KEY CLUSTERED 
(
	[RedirectTypeValueId] ASC,
	[UserContractRedirectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserContractRedirectRedirectTypeValue] ([RedirectTypeValueId], [UserContractRedirectId]) VALUES (N'33f25462-5af3-4a84-9458-2f8797bf12d6', N'7f8e3409-f062-4e87-bfbf-c9dc87aeaca6')
INSERT [dbo].[UserContractRedirectRedirectTypeValue] ([RedirectTypeValueId], [UserContractRedirectId]) VALUES (N'33f25462-5af3-4a84-9458-2f8797bf12d6', N'd30ec98c-801f-4da7-a031-df9f7e46dfa5')
INSERT [dbo].[UserContractRedirectRedirectTypeValue] ([RedirectTypeValueId], [UserContractRedirectId]) VALUES (N'3c70945d-3a96-4448-a080-42a564cd0221', N'9a5699cb-d775-45fd-8d00-d635c4727524')
INSERT [dbo].[UserContractRedirectRedirectTypeValue] ([RedirectTypeValueId], [UserContractRedirectId]) VALUES (N'f60fb3f5-ae1d-4aab-9489-6c7c7bffaf5e', N'b40a29d9-9cbf-4fbf-8e3a-56109e559aa7')
INSERT [dbo].[UserContractRedirectRedirectTypeValue] ([RedirectTypeValueId], [UserContractRedirectId]) VALUES (N'f60fb3f5-ae1d-4aab-9489-6c7c7bffaf5e', N'9a5699cb-d775-45fd-8d00-d635c4727524')
/****** Object:  Table [dbo].[UserContractLog]    Script Date: 10/28/2014 18:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContractLog](
	[Id] [uniqueidentifier] NOT NULL,
	[UserContractId] [uniqueidentifier] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserAgent] [nvarchar](max) NULL,
	[Host] [nvarchar](50) NULL,
	[ResultUri] [nvarchar](max) NULL,
	[UserContractUri] [uniqueidentifier] NULL,
	[UserContractRedirect] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserContractLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[UserContractLog] ([Id], [UserContractId], [DateTime], [UserAgent], [Host], [ResultUri], [UserContractUri], [UserContractRedirect]) VALUES (N'a8900d5b-3456-42b7-b588-13ad5297a0a6', N'29a2f682-8fe1-438a-b98f-8207fa509a6c', CAST(0x0000A34F010342CD AS DateTime), N'IsMobileDevice:False;MobileDeviceModel:Unknown;Version:35.0;Browser:Chrome;ScreenPixelsHeight:480;MobileDeviceManufacturer:Unknown;ScreenPixelsWidth:640;Type:Chrome35;', N'::1', N'http://www.euroitc.com', N'073c37ca-b5e8-4214-8fbb-7dde382d5245', N'83cf96aa-dcc5-44f2-a66d-911d0f43d3a9')
INSERT [dbo].[UserContractLog] ([Id], [UserContractId], [DateTime], [UserAgent], [Host], [ResultUri], [UserContractUri], [UserContractRedirect]) VALUES (N'dd237c6d-b1d9-4150-87a4-1871641cf031', N'45dd08f8-873f-4d77-a2ad-6c936681ff51', CAST(0x0000A36A00DD4C8C AS DateTime), N'IsMobileDevice:False;MobileDeviceModel:Unknown;Version:11.0;Browser:InternetExplorer;ScreenPixelsHeight:480;MobileDeviceManufacturer:Unknown;ScreenPixelsWidth:640;Type:InternetExplorer11;', N'::1', N'http://www.euroitc.com', NULL, NULL)
INSERT [dbo].[UserContractLog] ([Id], [UserContractId], [DateTime], [UserAgent], [Host], [ResultUri], [UserContractUri], [UserContractRedirect]) VALUES (N'e15e6d0a-0074-4e82-af4f-1d93e99b9987', N'59212c29-00e1-4b5e-995f-a8fb93d9b992', CAST(0x0000A34F00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserContractLog] ([Id], [UserContractId], [DateTime], [UserAgent], [Host], [ResultUri], [UserContractUri], [UserContractRedirect]) VALUES (N'f5574bee-c354-41b8-b2fd-86a2f8da11e8', N'29a2f682-8fe1-438a-b98f-8207fa509a6c', CAST(0x0000A34F0102B966 AS DateTime), N'IsMobileDevice:False;MobileDeviceModel:Unknown;Version:35.0;Browser:Chrome;ScreenPixelsHeight:480;MobileDeviceManufacturer:Unknown;ScreenPixelsWidth:640;Type:Chrome35;', N'::1', N'http://www.nu.nl', N'073c37ca-b5e8-4214-8fbb-7dde382d5245', N'83cf96aa-dcc5-44f2-a66d-911d0f43d3a9')
INSERT [dbo].[UserContractLog] ([Id], [UserContractId], [DateTime], [UserAgent], [Host], [ResultUri], [UserContractUri], [UserContractRedirect]) VALUES (N'7d6bc82c-bdb0-4bb6-9fe1-cfecdcf79f71', N'45dd08f8-873f-4d77-a2ad-6c936681ff51', CAST(0x0000A36A00DE3074 AS DateTime), N'IsMobileDevice:False;MobileDeviceModel:Unknown;Version:11.0;Browser:InternetExplorer;ScreenPixelsHeight:480;MobileDeviceManufacturer:Unknown;ScreenPixelsWidth:640;Type:InternetExplorer11;', N'::1', N'http://www.euroitc.com', NULL, NULL)
/****** Object:  Default [DF_Application_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Contracts_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contracts_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_ContractRecipe_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ContractRecipe] ADD  CONSTRAINT [DF_ContractRecipe_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_ContractRecipe_Active]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ContractRecipe] ADD  CONSTRAINT [DF_ContractRecipe_Active]  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  Default [DF_ContractRecipe_Position]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ContractRecipe] ADD  CONSTRAINT [DF_ContractRecipe_Position]  DEFAULT ((0)) FOR [Position]
GO
/****** Object:  Default [DF_ContractType_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ContractType] ADD  CONSTRAINT [DF_ContractType_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Country_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Gender_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Gender] ADD  CONSTRAINT [DF_Gender_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Invoice_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_InvoiceLine_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[InvoiceLine] ADD  CONSTRAINT [DF_InvoiceLine_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Menu_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Nationality_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF_Nationality_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Person_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_PersonSetting_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[PersonSetting] ADD  CONSTRAINT [DF_PersonSetting_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RandomUri_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RandomUri] ADD  CONSTRAINT [DF_RandomUri_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RedirectType_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RedirectType] ADD  CONSTRAINT [DF_RedirectType_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RedirectType_FriendlyName]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RedirectType] ADD  CONSTRAINT [DF_RedirectType_FriendlyName]  DEFAULT ('') FOR [FriendlyName]
GO
/****** Object:  Default [DF_RedirectTypeValue_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RedirectTypeValue] ADD  CONSTRAINT [DF_RedirectTypeValue_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Role_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Role_DisplayAs]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DisplayAs]  DEFAULT ('') FOR [DisplayAs]
GO
/****** Object:  Default [DF_RuleParameter_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RuleParameter] ADD  CONSTRAINT [DF_RuleParameter_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RuleParameterValue_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RuleParameterValue] ADD  CONSTRAINT [DF_RuleParameterValue_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RuleParameterValue_IsActive]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RuleParameterValue] ADD  CONSTRAINT [DF_RuleParameterValue_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  Default [DF_ShoppingBasket_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ShoppingBasket] ADD  CONSTRAINT [DF_ShoppingBasket_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Tooltip_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Tooltip] ADD  CONSTRAINT [DF_Tooltip_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Translation_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Translation] ADD  CONSTRAINT [DF_Translation_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_TranslationType_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[TranslationType] ADD  CONSTRAINT [DF_TranslationType_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_User_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_UserContract_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContract] ADD  CONSTRAINT [DF_UserContract_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_UserContract_Created]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContract] ADD  CONSTRAINT [DF_UserContract_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_UserContractLog_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractLog] ADD  CONSTRAINT [DF_UserContractLog_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_UserContractRedirect_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirect] ADD  CONSTRAINT [DF_UserContractRedirect_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_UserContractUri_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractUri] ADD  CONSTRAINT [DF_UserContractUri_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_UserContractUri_RandomFunction]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractUri] ADD  CONSTRAINT [DF_UserContractUri_RandomFunction]  DEFAULT ((0)) FOR [RandomFunction]
GO
/****** Object:  Default [DF_UserPassword_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserPassword] ADD  CONSTRAINT [DF_UserPassword_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__UserPassw__IsAcc__74AE54BC]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserPassword] ADD  DEFAULT ((0)) FOR [IsAccountAdmin]
GO
/****** Object:  Default [DF__UserPassw__Email__75A278F5]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserPassword] ADD  DEFAULT ('') FOR [EmailAddress]
GO
/****** Object:  Default [DF_UserRole_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_VolumDiscount_Id]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[VolumDiscount] ADD  CONSTRAINT [DF_VolumDiscount_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  ForeignKey [FK_Contract_ContractType]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractType] FOREIGN KEY([ContractTypeId])
REFERENCES [dbo].[ContractType] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractType]
GO
/****** Object:  ForeignKey [FK_ContractRecipe_Contract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ContractRecipe]  WITH CHECK ADD  CONSTRAINT [FK_ContractRecipe_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[ContractRecipe] CHECK CONSTRAINT [FK_ContractRecipe_Contract]
GO
/****** Object:  ForeignKey [FK_Invoice_User]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User]
GO
/****** Object:  ForeignKey [FK_InvoiceLine_Invoice]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoiceLine_UserContract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_UserContract] FOREIGN KEY([UserContractId])
REFERENCES [dbo].[UserContract] ([Id])
GO
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_UserContract]
GO
/****** Object:  ForeignKey [FK_Menu_Menu]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([ParentMenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
/****** Object:  ForeignKey [FK_Person_Country]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Country]
GO
/****** Object:  ForeignKey [FK_Person_Gender]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Gender]
GO
/****** Object:  ForeignKey [FK_Person_Nationality]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Nationality]
GO
/****** Object:  ForeignKey [FK_PersonRole_Person]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [FK_PersonRole_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [FK_PersonRole_Person]
GO
/****** Object:  ForeignKey [FK_PersonRole_Role]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[PersonRole]  WITH CHECK ADD  CONSTRAINT [FK_PersonRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[PersonRole] CHECK CONSTRAINT [FK_PersonRole_Role]
GO
/****** Object:  ForeignKey [FK_PersonSetting_Person]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[PersonSetting]  WITH CHECK ADD  CONSTRAINT [FK_PersonSetting_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[PersonSetting] CHECK CONSTRAINT [FK_PersonSetting_Person]
GO
/****** Object:  ForeignKey [FK_RandomUri_UserContractUri]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RandomUri]  WITH CHECK ADD  CONSTRAINT [FK_RandomUri_UserContractUri] FOREIGN KEY([UserContractUriId])
REFERENCES [dbo].[UserContractUri] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RandomUri] CHECK CONSTRAINT [FK_RandomUri_UserContractUri]
GO
/****** Object:  ForeignKey [FK_RedirectTypeValue_RedirectType]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RedirectTypeValue]  WITH CHECK ADD  CONSTRAINT [FK_RedirectTypeValue_RedirectType] FOREIGN KEY([RedirectTypeId])
REFERENCES [dbo].[RedirectType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RedirectTypeValue] CHECK CONSTRAINT [FK_RedirectTypeValue_RedirectType]
GO
/****** Object:  ForeignKey [FK_RuleParameterValue_RuleParameter]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[RuleParameterValue]  WITH CHECK ADD  CONSTRAINT [FK_RuleParameterValue_RuleParameter] FOREIGN KEY([RuleParameterId])
REFERENCES [dbo].[RuleParameter] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RuleParameterValue] CHECK CONSTRAINT [FK_RuleParameterValue_RuleParameter]
GO
/****** Object:  ForeignKey [FK_ShoppingBasket_UserContract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[ShoppingBasket]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingBasket_UserContract] FOREIGN KEY([UserContractId])
REFERENCES [dbo].[UserContract] ([Id])
GO
ALTER TABLE [dbo].[ShoppingBasket] CHECK CONSTRAINT [FK_ShoppingBasket_UserContract]
GO
/****** Object:  ForeignKey [FK_Tooltip_TranslationType]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Tooltip]  WITH CHECK ADD  CONSTRAINT [FK_Tooltip_TranslationType] FOREIGN KEY([TranslationTypeId])
REFERENCES [dbo].[TranslationType] ([Id])
GO
ALTER TABLE [dbo].[Tooltip] CHECK CONSTRAINT [FK_Tooltip_TranslationType]
GO
/****** Object:  ForeignKey [FK_Translation_TranslationType]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_TranslationType] FOREIGN KEY([TranslationTypeId])
REFERENCES [dbo].[TranslationType] ([Id])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_TranslationType]
GO
/****** Object:  ForeignKey [FK_User_Country]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Country]
GO
/****** Object:  ForeignKey [FK_User_User]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ReselerId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
/****** Object:  ForeignKey [FK_User_UserRole]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[UserRole] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
/****** Object:  ForeignKey [FK_UserContract_Contract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContract]  WITH CHECK ADD  CONSTRAINT [FK_UserContract_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[UserContract] CHECK CONSTRAINT [FK_UserContract_Contract]
GO
/****** Object:  ForeignKey [FK_UserContract_ContractRecipe]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContract]  WITH CHECK ADD  CONSTRAINT [FK_UserContract_ContractRecipe] FOREIGN KEY([ContractRecipeId])
REFERENCES [dbo].[ContractRecipe] ([Id])
GO
ALTER TABLE [dbo].[UserContract] CHECK CONSTRAINT [FK_UserContract_ContractRecipe]
GO
/****** Object:  ForeignKey [FK_UserContract_User]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContract]  WITH CHECK ADD  CONSTRAINT [FK_UserContract_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContract] CHECK CONSTRAINT [FK_UserContract_User]
GO
/****** Object:  ForeignKey [FK_UserContractLog_UserContract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractLog]  WITH CHECK ADD  CONSTRAINT [FK_UserContractLog_UserContract] FOREIGN KEY([UserContractId])
REFERENCES [dbo].[UserContract] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContractLog] CHECK CONSTRAINT [FK_UserContractLog_UserContract]
GO
/****** Object:  ForeignKey [FK_UserContractLog_UserContractRedirect]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractLog]  WITH CHECK ADD  CONSTRAINT [FK_UserContractLog_UserContractRedirect] FOREIGN KEY([UserContractRedirect])
REFERENCES [dbo].[UserContractRedirect] ([Id])
GO
ALTER TABLE [dbo].[UserContractLog] CHECK CONSTRAINT [FK_UserContractLog_UserContractRedirect]
GO
/****** Object:  ForeignKey [FK_UserContractLog_UserContractUri]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractLog]  WITH CHECK ADD  CONSTRAINT [FK_UserContractLog_UserContractUri] FOREIGN KEY([UserContractUri])
REFERENCES [dbo].[UserContractUri] ([Id])
GO
ALTER TABLE [dbo].[UserContractLog] CHECK CONSTRAINT [FK_UserContractLog_UserContractUri]
GO
/****** Object:  ForeignKey [FK_UserContractRedirect_UserContractUri]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirect]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirect_UserContractUri] FOREIGN KEY([UserContractUri])
REFERENCES [dbo].[UserContractUri] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContractRedirect] CHECK CONSTRAINT [FK_UserContractRedirect_UserContractUri]
GO
/****** Object:  ForeignKey [FK_UserContractRedirect_Weekday]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirect]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirect_Weekday] FOREIGN KEY([DayOfTheWeekValue])
REFERENCES [dbo].[Weekday] ([Id])
GO
ALTER TABLE [dbo].[UserContractRedirect] CHECK CONSTRAINT [FK_UserContractRedirect_Weekday]
GO
/****** Object:  ForeignKey [FK_UserContractRedirectRedirectTypeValue_RedirectTypeValue]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirectRedirectTypeValue]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirectRedirectTypeValue_RedirectTypeValue] FOREIGN KEY([RedirectTypeValueId])
REFERENCES [dbo].[RedirectTypeValue] ([Id])
GO
ALTER TABLE [dbo].[UserContractRedirectRedirectTypeValue] CHECK CONSTRAINT [FK_UserContractRedirectRedirectTypeValue_RedirectTypeValue]
GO
/****** Object:  ForeignKey [FK_UserContractRedirectRedirectTypeValue_UserContractRedirect]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirectRedirectTypeValue]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirectRedirectTypeValue_UserContractRedirect] FOREIGN KEY([UserContractRedirectId])
REFERENCES [dbo].[UserContractRedirect] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContractRedirectRedirectTypeValue] CHECK CONSTRAINT [FK_UserContractRedirectRedirectTypeValue_UserContractRedirect]
GO
/****** Object:  ForeignKey [FK_UserContractRedirectRuleParameterValue_RuleParameterValue]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirectRuleParameterValue]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirectRuleParameterValue_RuleParameterValue] FOREIGN KEY([RuleParameterValueId])
REFERENCES [dbo].[RuleParameterValue] ([Id])
GO
ALTER TABLE [dbo].[UserContractRedirectRuleParameterValue] CHECK CONSTRAINT [FK_UserContractRedirectRuleParameterValue_RuleParameterValue]
GO
/****** Object:  ForeignKey [FK_UserContractRedirectRuleParameterValue_UserContractRedirect]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractRedirectRuleParameterValue]  WITH CHECK ADD  CONSTRAINT [FK_UserContractRedirectRuleParameterValue_UserContractRedirect] FOREIGN KEY([UserContractRedirectId])
REFERENCES [dbo].[UserContractRedirect] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContractRedirectRuleParameterValue] CHECK CONSTRAINT [FK_UserContractRedirectRuleParameterValue_UserContractRedirect]
GO
/****** Object:  ForeignKey [FK_UserContractUri_UserContract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserContractUri]  WITH CHECK ADD  CONSTRAINT [FK_UserContractUri_UserContract] FOREIGN KEY([UserContractId])
REFERENCES [dbo].[UserContract] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContractUri] CHECK CONSTRAINT [FK_UserContractUri_UserContract]
GO
/****** Object:  ForeignKey [FK_UserPassword_User1]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[UserPassword]  WITH CHECK ADD  CONSTRAINT [FK_UserPassword_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPassword] CHECK CONSTRAINT [FK_UserPassword_User1]
GO
/****** Object:  ForeignKey [FK_VolumDiscount_Contract]    Script Date: 10/28/2014 18:27:37 ******/
ALTER TABLE [dbo].[VolumDiscount]  WITH CHECK ADD  CONSTRAINT [FK_VolumDiscount_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[VolumDiscount] CHECK CONSTRAINT [FK_VolumDiscount_Contract]
GO
