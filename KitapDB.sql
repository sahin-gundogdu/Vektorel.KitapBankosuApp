USE [master]
GO
/****** Object:  Database [KitapDB]    Script Date: 19.12.2019 14:21:01 ******/
CREATE DATABASE [KitapDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KitapDB', FILENAME = N'D:\Vektorel Bilişim\DB\KitapDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KitapDB_log', FILENAME = N'D:\Vektorel Bilişim\DB\KitapDB_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KitapDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KitapDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KitapDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KitapDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KitapDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KitapDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KitapDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KitapDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KitapDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KitapDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KitapDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KitapDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KitapDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KitapDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KitapDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KitapDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KitapDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KitapDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KitapDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KitapDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KitapDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KitapDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KitapDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KitapDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KitapDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KitapDB] SET  MULTI_USER 
GO
ALTER DATABASE [KitapDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KitapDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KitapDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KitapDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KitapDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KitapDB] SET QUERY_STORE = OFF
GO
USE [KitapDB]
GO
/****** Object:  Table [dbo].[tblKitaplar]    Script Date: 19.12.2019 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKitaplar](
	[KitapId] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [varchar](50) NOT NULL,
	[TurId] [smallint] NOT NULL,
	[SayfaSayi] [smallint] NOT NULL,
	[BasimYil] [smallint] NULL,
	[Adet] [smallint] NOT NULL,
	[YayinEviId] [smallint] NOT NULL,
	[ISBN] [varchar](13) NOT NULL,
 CONSTRAINT [PK_tblKitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKitapYazar]    Script Date: 19.12.2019 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKitapYazar](
	[YazarId] [smallint] NOT NULL,
	[KitapId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTurler]    Script Date: 19.12.2019 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTurler](
	[TurId] [smallint] IDENTITY(1,1) NOT NULL,
	[TurAd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTurler] PRIMARY KEY CLUSTERED 
(
	[TurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblYayinEvleri]    Script Date: 19.12.2019 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYayinEvleri](
	[YayinEviId] [smallint] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Adres] [varchar](500) NOT NULL,
	[Tel] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblYayinEvleri] PRIMARY KEY CLUSTERED 
(
	[YayinEviId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblYazarlar]    Script Date: 19.12.2019 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYazarlar](
	[YazarId] [smallint] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](75) NOT NULL,
	[Dtar] [date] NOT NULL,
	[OlumTarih] [date] NULL,
 CONSTRAINT [PK_tblYazarlar] PRIMARY KEY CLUSTERED 
(
	[YazarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTurler] ON 

INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (12, N'Din')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (10, N'Edebiyat')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (18, N'Eğitim')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (19, N'Eğlence-Mizah')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (4, N'Tarih')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (3, N'Teknoloji')
INSERT [dbo].[tblTurler] ([TurId], [TurAd]) VALUES (5, N'Yabancı Dil')
SET IDENTITY_INSERT [dbo].[tblTurler] OFF
SET IDENTITY_INSERT [dbo].[tblYayinEvleri] ON 

INSERT [dbo].[tblYayinEvleri] ([YayinEviId], [Ad], [Adres], [Tel]) VALUES (1, N'TÜRKİYE İŞ BANKASI KÜLTÜR YAYINLARI', N'Türkiye İş Bankası Kültür Yayınları İş Türk A.Ş.İstiklal Caddesi Meşelik Sokak No: 2 Kat: 4Beyoğlu / İstanbul(T. İş Bankası Parmakkapı Şubesi üzeri)', N'2122523991')
INSERT [dbo].[tblYayinEvleri] ([YayinEviId], [Ad], [Adres], [Tel]) VALUES (3, N'CAN YAYINLARI', N'Hayriye Caddesi No:2 34430 Galatasaray
Beyoğlu İstanbul', N'2122525988')
INSERT [dbo].[tblYayinEvleri] ([YayinEviId], [Ad], [Adres], [Tel]) VALUES (4, N'YAPIKREDİ YAYINLARI', N'Yapı Kredi Kültür Sanat
İstiklal Caddesi No: 161
34433, Beyoğlu / İstanbul', N'2122524700')
INSERT [dbo].[tblYayinEvleri] ([YayinEviId], [Ad], [Adres], [Tel]) VALUES (5, N'KIRMIZI KEDİ YAYINEVİ', N'Asmalı Mescit Mahallesi Ensiz Sokak No:3 Tünel Geçidi İşhanı A Blok Kat:2 Beyoğlu-İstanbul', N'2122934447')
INSERT [dbo].[tblYayinEvleri] ([YayinEviId], [Ad], [Adres], [Tel]) VALUES (6, N'DOĞAN KİTAP', N'Doğan Egmont Yapımcılık ve Yayıncılık A.Ş. 19 Mayıs Cad. Golden Plaza No:1 Kat:10 34360 - Şişli - İstanbul
', N'2123737700')
SET IDENTITY_INSERT [dbo].[tblYayinEvleri] OFF
SET IDENTITY_INSERT [dbo].[tblYazarlar] ON 

INSERT [dbo].[tblYazarlar] ([YazarId], [Ad], [Soyad], [Dtar], [OlumTarih]) VALUES (2, N'Sabahattin', N'Ali', CAST(N'1907-02-25' AS Date), CAST(N'1948-04-02' AS Date))
INSERT [dbo].[tblYazarlar] ([YazarId], [Ad], [Soyad], [Dtar], [OlumTarih]) VALUES (3, N'Zülfü', N'Livaneli', CAST(N'1946-01-01' AS Date), NULL)
INSERT [dbo].[tblYazarlar] ([YazarId], [Ad], [Soyad], [Dtar], [OlumTarih]) VALUES (4, N'Soner', N'Yalçın', CAST(N'1966-01-01' AS Date), NULL)
INSERT [dbo].[tblYazarlar] ([YazarId], [Ad], [Soyad], [Dtar], [OlumTarih]) VALUES (5, N'Victor', N'Hugo', CAST(N'1802-01-01' AS Date), CAST(N'1885-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[tblYazarlar] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_tblKitaplar_Isbn]    Script Date: 19.12.2019 14:21:02 ******/
ALTER TABLE [dbo].[tblKitaplar] ADD  CONSTRAINT [UK_tblKitaplar_Isbn] UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_tblTurler_TurAd]    Script Date: 19.12.2019 14:21:02 ******/
ALTER TABLE [dbo].[tblTurler] ADD  CONSTRAINT [UK_tblTurler_TurAd] UNIQUE NONCLUSTERED 
(
	[TurAd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblKitaplar]  WITH CHECK ADD  CONSTRAINT [FK_tblKitaplar_tblTurler] FOREIGN KEY([TurId])
REFERENCES [dbo].[tblTurler] ([TurId])
GO
ALTER TABLE [dbo].[tblKitaplar] CHECK CONSTRAINT [FK_tblKitaplar_tblTurler]
GO
ALTER TABLE [dbo].[tblKitaplar]  WITH CHECK ADD  CONSTRAINT [FK_tblKitaplar_tblYayinEvleri] FOREIGN KEY([YayinEviId])
REFERENCES [dbo].[tblYayinEvleri] ([YayinEviId])
GO
ALTER TABLE [dbo].[tblKitaplar] CHECK CONSTRAINT [FK_tblKitaplar_tblYayinEvleri]
GO
ALTER TABLE [dbo].[tblKitapYazar]  WITH CHECK ADD  CONSTRAINT [FK_tblKitapYazar_tblKitaplar] FOREIGN KEY([KitapId])
REFERENCES [dbo].[tblKitaplar] ([KitapId])
GO
ALTER TABLE [dbo].[tblKitapYazar] CHECK CONSTRAINT [FK_tblKitapYazar_tblKitaplar]
GO
ALTER TABLE [dbo].[tblKitapYazar]  WITH CHECK ADD  CONSTRAINT [FK_tblKitapYazar_tblYazarlar] FOREIGN KEY([YazarId])
REFERENCES [dbo].[tblYazarlar] ([YazarId])
GO
ALTER TABLE [dbo].[tblKitapYazar] CHECK CONSTRAINT [FK_tblKitapYazar_tblYazarlar]
GO
USE [master]
GO
ALTER DATABASE [KitapDB] SET  READ_WRITE 
GO
