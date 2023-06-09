USE [master]
GO
/****** Object:  Database [TestAssesmentDB]    Script Date: 3/14/2023 1:55:54 AM ******/
CREATE DATABASE [TestAssesmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestAssesmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestAssesmentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestAssesmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestAssesmentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestAssesmentDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestAssesmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestAssesmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestAssesmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestAssesmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestAssesmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestAssesmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestAssesmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestAssesmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestAssesmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestAssesmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestAssesmentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestAssesmentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestAssesmentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestAssesmentDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestAssesmentDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestAssesmentDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/14/2023 1:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 3/14/2023 1:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Marks] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[marksview]    Script Date: 3/14/2023 1:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[marksview]
AS
SELECT  a.FullName, b.CourseName , c.Marks
FROM Students a, Courses b, Marks c
WHERE a.Id=c.StudentId
AND b.Id=c.CourseId;
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/14/2023 1:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Roll] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [CourseName]) VALUES (1, N'Bangla')
INSERT [dbo].[Courses] ([Id], [CourseName]) VALUES (2, N'English')
INSERT [dbo].[Courses] ([Id], [CourseName]) VALUES (3, N'Math')
INSERT [dbo].[Courses] ([Id], [CourseName]) VALUES (4, N'Hindi')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (1, 1, 1, 60)
INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (2, 2, 1, 70)
INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (3, 1, 2, 40)
INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (4, 2, 2, 30)
INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (5, 3, 1, 40)
INSERT [dbo].[Marks] ([Id], [CourseId], [StudentId], [Marks]) VALUES (12, 4, 1, 105)
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [FullName], [Age], [Roll]) VALUES (1, N'Rj Porosh', 24, N'1')
INSERT [dbo].[Student] ([Id], [FullName], [Age], [Roll]) VALUES (2, N'Porosh', 23, N'2')
INSERT [dbo].[Student] ([Id], [FullName], [Age], [Roll]) VALUES (3, N'Rj', 22, N'3')
INSERT [dbo].[Student] ([Id], [FullName], [Age], [Roll]) VALUES (4, N'Rj porosh', 20, N'4')
INSERT [dbo].[Student] ([Id], [FullName], [Age], [Roll]) VALUES (5, N'Rj porosh12', 45, N'45')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Courses]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Students]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateMarks]    Script Date: 3/14/2023 1:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_CreateMarks]   
    @StudentId int,
    @CourseId int,
	@Marks int

AS
BEGIN
    SET NOCOUNT ON;
    Insert into Marks(
           [StudentId]
           ,[CourseId]
		   ,[Marks]
           )
 Values (@StudentId, @CourseId,@Marks)
END
GO
USE [master]
GO
ALTER DATABASE [TestAssesmentDB] SET  READ_WRITE 
GO
