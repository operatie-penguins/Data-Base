USE [master]
GO

CREATE DATABASE [ITA_Support] ON  PRIMARY 
( NAME = N'ITA_Support_Data1', FILENAME = N'C:\MODULE4\ITA_Support_Data1.mdf' , SIZE = 20480KB , FILEGROWTH = 1024KB ), 
 FILEGROUP [SECONDARY] 
( NAME = N'ITA_Support_Data2', FILENAME = N'C:\MODULE4\ITA_Support_Data2.ndf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 20480KB )
 LOG ON 
( NAME = N'ITA_Support_log', FILENAME = N'C:\MODULE4\ITA_Support_log.ldf' , SIZE = 5120KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ITA_Support] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [ITA_Support] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITA_Support] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITA_Support] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITA_Support] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITA_Support] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITA_Support] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITA_Support] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ITA_Support] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [ITA_Support] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITA_Support] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITA_Support] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITA_Support] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITA_Support] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITA_Support] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITA_Support] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITA_Support] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITA_Support] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITA_Support] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITA_Support] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITA_Support] SET  READ_WRITE 
GO
ALTER DATABASE [ITA_Support] SET RECOVERY FULL 
GO
ALTER DATABASE [ITA_Support] SET  MULTI_USER 
GO
ALTER DATABASE [ITA_Support] SET PAGE_VERIFY CHECKSUM  
GO
USE [ITA_Support]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'SECONDARY') ALTER DATABASE [ITA_Support] MODIFY FILEGROUP [SECONDARY] DEFAULT
GO


CREATE TYPE CourseNumber  FROM varchar(6) NOT NULL
GO

CREATE TYPE CashValue  FROM decimal(8, 2) NOT NULL
GO


CREATE TABLE Teachers
 (
	Id int NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50) NOT NULL
)  ON [PRIMARY]
GO


CREATE TABLE Cources
 (
	Id int NOT NULL,
	Code CourseNumber NULL,
	Name nvarchar(256) NOT NULL,
	ShortDescription nvarchar(2000) NOT NULL
)  ON [PRIMARY]
GO


CREATE TABLE Contracts
(
	Id int NOT NULL,
	RegistrationDate date NOT NULL,
	Price decimal(18, 0) NOT NULL,
	StudentId int NOT NULL,
	CourceId int NOT NULL
)  ON [PRIMARY]
GO

