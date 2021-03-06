USE [master]
GO
/****** Object:  Database [DB_ResultProcessing]    Script Date: 6/3/2015 8:41:31 AM ******/
CREATE DATABASE [DB_ResultProcessing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ResultProcessing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB_ResultProcessing.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_ResultProcessing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DB_ResultProcessing_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_ResultProcessing] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ResultProcessing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ResultProcessing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ResultProcessing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ResultProcessing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ResultProcessing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_ResultProcessing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ResultProcessing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_ResultProcessing] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ResultProcessing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ResultProcessing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ResultProcessing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ResultProcessing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DB_ResultProcessing]
GO
/****** Object:  Table [dbo].[Result_Table]    Script Date: 6/3/2015 8:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result_Table](
	[Roll] [int] NULL,
	[Name] [varchar](50) NULL,
	[SoftEngMarks] [float] NULL,
	[CompilerDesignMarks] [float] NULL,
	[NeumaricalMarks] [float] NULL,
	[SoftEngGPA] [varchar](50) NULL,
	[CompilerDesignGPA] [varchar](50) NULL,
	[NeumaricalGPA] [varchar](50) NULL,
	[GPA] [varchar](50) NULL,
	[Grade] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Result_Table] ([Roll], [Name], [SoftEngMarks], [CompilerDesignMarks], [NeumaricalMarks], [SoftEngGPA], [CompilerDesignGPA], [NeumaricalGPA], [GPA], [Grade]) VALUES (1, N'Disha', 86, 62, 74, N'A+', N'B', N'A-', N'A-', N'3.5')
INSERT [dbo].[Result_Table] ([Roll], [Name], [SoftEngMarks], [CompilerDesignMarks], [NeumaricalMarks], [SoftEngGPA], [CompilerDesignGPA], [NeumaricalGPA], [GPA], [Grade]) VALUES (2, N'Mim', 55, 84, 78, N'B-', N'A+', N'A', N'A-', N'3.5')
INSERT [dbo].[Result_Table] ([Roll], [Name], [SoftEngMarks], [CompilerDesignMarks], [NeumaricalMarks], [SoftEngGPA], [CompilerDesignGPA], [NeumaricalGPA], [GPA], [Grade]) VALUES (3, N'Tanjila', 86, 74, 66, N'A+', N'A-', N'B+', N'A-', N'3.58333333333333')
USE [master]
GO
ALTER DATABASE [DB_ResultProcessing] SET  READ_WRITE 
GO
