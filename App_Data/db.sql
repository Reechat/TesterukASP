USE [master]
GO

/****** Object:  Database [testerukdb]    Script Date: 21.11.2020 15:45:42 ******/
DROP DATABASE [testerukdb]
GO

/****** Object:  Database [testerukdb]    Script Date: 21.11.2020 15:45:42 ******/
CREATE DATABASE [testerukdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testerukdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\testerukdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testerukdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\testerukdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testerukdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [testerukdb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [testerukdb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [testerukdb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [testerukdb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [testerukdb] SET ARITHABORT OFF 
GO

ALTER DATABASE [testerukdb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [testerukdb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [testerukdb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [testerukdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [testerukdb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [testerukdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [testerukdb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [testerukdb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [testerukdb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [testerukdb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [testerukdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [testerukdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [testerukdb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [testerukdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [testerukdb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [testerukdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [testerukdb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [testerukdb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [testerukdb] SET  MULTI_USER 
GO

ALTER DATABASE [testerukdb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [testerukdb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [testerukdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [testerukdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [testerukdb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [testerukdb] SET QUERY_STORE = OFF
GO

ALTER DATABASE [testerukdb] SET  READ_WRITE 
GO


USE [testerukdb]
GO

/****** Object:  Table [dbo].[employee]    Script Date: 21.11.2020 15:46:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employee]') AND type in (N'U'))
DROP TABLE [dbo].[employee]
GO

/****** Object:  Table [dbo].[employee]    Script Date: 21.11.2020 15:46:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employee](
	[id] [int] NOT NULL,
	[name] [text] NULL,
	[login] [text] NULL,
	[password] [text] NULL,
	[access] [int] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [testerukdb]
GO

/****** Object:  Table [dbo].[test]    Script Date: 21.11.2020 15:46:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type in (N'U'))
DROP TABLE [dbo].[test]
GO

/****** Object:  Table [dbo].[test]    Script Date: 21.11.2020 15:46:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[test](
	[id] [int] NOT NULL,
	[name] [text] NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [testerukdb]
GO

ALTER TABLE [dbo].[history] DROP CONSTRAINT [FK_history_test]
GO

ALTER TABLE [dbo].[history] DROP CONSTRAINT [FK_history_employee]
GO

/****** Object:  Table [dbo].[history]    Script Date: 21.11.2020 15:46:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[history]') AND type in (N'U'))
DROP TABLE [dbo].[history]
GO

/****** Object:  Table [dbo].[history]    Script Date: 21.11.2020 15:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[history](
	[id] [int] NOT NULL,
	[id_user] [int] NULL,
	[id_test] [int] NULL,
	[points] [int] NULL,
 CONSTRAINT [PK_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_employee] FOREIGN KEY([id_user])
REFERENCES [dbo].[employee] ([id])
GO

ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_employee]
GO

ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_test] FOREIGN KEY([id_test])
REFERENCES [dbo].[test] ([id])
GO

ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_test]
GO

