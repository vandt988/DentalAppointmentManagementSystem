USE [master]
GO
/****** Object:  Database [swpUpdate]    Script Date: 7/27/2024 12:31:42 AM ******/
CREATE DATABASE [swpUpdate]

USE [swpUpdate]
GO
/****** Object:  Table [dbo].[AppointmentForm]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentForm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PatientId] [nvarchar](200) NULL,
	[Note] [nvarchar](200) NULL,
	[dateNow] [date] NULL,
	[timeNow] [time](7) NULL,
	[ScheduleId] [int] NULL,
	[dateReply] [date] NULL,
	[descriptionReply] [nvarchar](200) NULL,
	[staffId] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[ReceptionistIdReply] [nvarchar](200) NULL,
 CONSTRAINT [PK_AppointmentForm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [nvarchar](200) NULL,
	[StaffId] [nvarchar](200) NULL,
	[TotalPrice] [float] NULL,
	[time] [datetime] NULL,
	[Note] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[DoctorPriceId] [int] NULL,
	[StaffIdCreate] [nvarchar](200) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_Service]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Service](
	[BillId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_Bill_Service] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[ServiceId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[PriceReal] [float] NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CertificateStaff]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificateStaff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[detail] [nvarchar](200) NULL,
	[StaffId] [nvarchar](200) NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_CertificateStaff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[changeSchedule]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[changeSchedule](
	[StaffId] [nvarchar](200) NULL,
	[dateChange] [datetime] NULL,
	[ScheduleId] [int] NULL,
	[StaffIdNew] [nvarchar](200) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_changeSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discountService]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discountService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NULL,
	[DateStart] [date] NULL,
	[DateEnd] [date] NULL,
	[discountPercent] [float] NULL,
 CONSTRAINT [PK_discountService] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorPrice]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorPrice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_DoctorPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanAmountOfPatients]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanAmountOfPatients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[Price] [float] NULL,
	[date] [datetime] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoanAmountOfPatients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[diseasedescription] [nvarchar](100) NULL,
	[dateCreate] [date] NULL,
	[note] [nvarchar](150) NULL,
	[PatientId] [nvarchar](200) NULL,
	[StaffId] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NULL,
	[dateIn] [date] NULL,
	[dateOut] [date] NULL,
 CONSTRAINT [PK_MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord-Service]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord-Service](
	[MedicalRecordId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalRecord-Service] PRIMARY KEY CLUSTERED 
(
	[MedicalRecordId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[gmail] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Dob] [date] NULL,
	[Gender] [nvarchar](1) NULL,
	[Address] [nvarchar](150) NULL,
	[Password] [nvarchar](150) NULL,
	[lever] [nvarchar](50) NULL,
	[TotalBill] [float] NULL,
	[code] [nvarchar](100) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[name] [nvarchar](150) NULL,
	[detail] [nvarchar](max) NULL,
	[TypeOfPostId] [int] NULL,
	[image] [nvarchar](max) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [nvarchar](200) NULL,
	[PatientsId] [nvarchar](200) NULL,
	[issueDate] [date] NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionDetail]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionId] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](200) NULL,
	[quantity] [nvarchar](50) NULL,
 CONSTRAINT [PK_PrescriptionDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[timeStart] [time](7) NULL,
	[timeEnd] [time](7) NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_Patients]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Patients](
	[scheduleId] [int] NOT NULL,
	[PatientId] [nvarchar](200) NOT NULL,
	[StafId] [nvarchar](200) NULL,
 CONSTRAINT [PK_Schedule_Patients] PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC,
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[mainDetail] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceDetail]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NULL,
	[detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[RoleId] [int] NULL,
	[RoomId] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Dob] [date] NULL,
	[Gender] [nvarchar](1) NULL,
	[Address] [nvarchar](250) NULL,
	[IdentificationCard] [nvarchar](250) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Gmail] [nvarchar](200) NOT NULL,
	[description] [nvarchar](200) NULL,
	[typeOfDoctorId] [int] NULL,
	[code] [nvarchar](150) NULL,
 CONSTRAINT [PK__Staff__B488B1023F59407E] PRIMARY KEY CLUSTERED 
(
	[Gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_schedule]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_schedule](
	[StaffId] [nvarchar](200) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_staff_schedule] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC,
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokenSetTime]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenSetTime](
	[gmail] [nvarchar](200) NOT NULL,
	[token] [nvarchar](max) NULL,
	[timeStart] [time](7) NULL,
	[date] [date] NULL,
	[timeEnd] [time](7) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TokenSetTime] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDoctor_Service]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDoctor_Service](
	[ServiceId] [int] NOT NULL,
	[TypeDoctorId] [int] NOT NULL,
 CONSTRAINT [PK_TypeDoctor_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC,
	[TypeDoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeOfDoctor]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeOfDoctor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeOfDoctor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfPost]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_TypeOfPost] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workCaculate]    Script Date: 7/27/2024 12:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workCaculate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [nvarchar](200) NULL,
	[count] [int] NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
 CONSTRAINT [PK_workCaculate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppointmentForm] ON 
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (38, N'duong', N'0856765186', N'0961594860duong@gmail.com', N'aa', CAST(N'2024-07-19' AS Date), CAST(N'00:05:23' AS Time), 16, CAST(N'2024-07-19' AS Date), N'', N'duonglthe170176@fpt.edu.vn', N'Đã hủy (Bệnh nhân hủy)', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (39, N'a', N'0856765186', N'phuongthao@gmail.com', N'aa', CAST(N'2024-07-19' AS Date), CAST(N'00:23:38' AS Time), 16, CAST(N'2024-07-21' AS Date), N'thank you', N'vulqhe170481@fpt.edu.vn', N'Đã hủy', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (40, N'duong', N'0856765186', N'trongkhoi@gmail.com', N'aaa', CAST(N'2024-07-19' AS Date), CAST(N'00:31:52' AS Time), 12, CAST(N'2024-07-19' AS Date), N'thank you', N'namlegend586@gmail.com', N'Đã xác nhận', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (41, N'duong', N'0856765186', N'0961594860duong@gmail.com', N'â', CAST(N'2024-07-20' AS Date), CAST(N'21:36:10' AS Time), 16, CAST(N'2024-07-21' AS Date), N'no', N'vulqhe170481@fpt.edu.vn', N'Đã hủy (Bệnh nhân hủy)', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (42, N'duong', N'0856765186', N'phuongthao@gmail.com', N'123', CAST(N'2024-07-21' AS Date), CAST(N'00:29:41' AS Time), 16, CAST(N'2024-07-23' AS Date), N'a', N'vulqhe170481@fpt.edu.vn', N'Đã hủy', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (43, N'duong', N'0856765186', N'0961594860duong@gmail.com', N'a', CAST(N'2024-07-21' AS Date), CAST(N'00:39:07' AS Time), 16, CAST(N'2024-07-23' AS Date), N'a', N'namlegend586@gmail.com', N'Đã hủy (Bệnh nhân hủy)', N'admin@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (44, N'duong', N'0945643452', N'0961594860duong@gmail.com', N'aa', CAST(N'2024-07-23' AS Date), CAST(N'20:52:06' AS Time), 16, CAST(N'2024-07-23' AS Date), N'a', N'namlegend586@gmail.com', N'Đã hủy (Bệnh nhân hủy)', NULL)
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (45, N'duong', N'0945643452', N'0961594860duong@gmail.com', N'a', CAST(N'2024-07-23' AS Date), CAST(N'22:52:02' AS Time), 16, CAST(N'2024-07-23' AS Date), N'thank you', N'namlegend586@gmail.com', N'Đã xác nhận', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (46, N'duong', N'0945643452', N'0961594860duong@gmail.com', N'abc', CAST(N'2024-07-25' AS Date), CAST(N'22:20:29' AS Time), 39, CAST(N'2024-07-25' AS Date), N'abc', N'tudahe163675@fpt.edu.vn', N'Đã hủy', N'admin@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (47, N'van', N'0856765186', NULL, N'asa', CAST(N'2024-07-25' AS Date), CAST(N'23:52:02' AS Time), 39, NULL, NULL, N'tudahe163675@fpt.edu.vn', N'Đang chờ xử lý', NULL)
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (48, N'Vũ Văn duong', N'08567651872', N'dinhtu@gmail.com', N'abc', CAST(N'2024-07-26' AS Date), CAST(N'21:08:08' AS Time), 36, CAST(N'2024-07-26' AS Date), N'Lịch của bạn đã được xác nhận', N'duonglthe170176@fpt.edu.vn', N'Đã xác nhận', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (49, N'Đỗ Anh Đức', N'934874678', N'duc@gmail.com', N'abc', CAST(N'2024-07-26' AS Date), CAST(N'21:21:00' AS Time), 36, CAST(N'2024-07-26' AS Date), N'Lịch của bạn đã được xác nhận', N'duonglthe170176@fpt.edu.vn', N'Đã xác nhận', N'receptionist@gmail.com')
GO
INSERT [dbo].[AppointmentForm] ([id], [FullName], [PhoneNumber], [PatientId], [Note], [dateNow], [timeNow], [ScheduleId], [dateReply], [descriptionReply], [staffId], [status], [ReceptionistIdReply]) VALUES (50, N'Đỗ Anh Đức', N'934874678', N'duc@gmail.com', N'abc', CAST(N'2024-07-26' AS Date), CAST(N'21:21:10' AS Time), 38, CAST(N'2024-07-26' AS Date), N'Lịch của bạn đã được xác nhận', N'duonglthe170176@fpt.edu.vn', N'Đã xác nhận', N'receptionist@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[AppointmentForm] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (1, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 103597999, CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'', N'Đã thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (2, N'0961594860duong@gmail.com', N'duonglthe170176@fpt.edu.vn', 3200000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'', N'Đã thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (3, N'dothivan988@gmail.com', N'duonglthe170176@fpt.edu.vn', 2700000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Trả góp', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (4, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 0, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (5, N'0961594860duong@gmail.com', N'duonglthe170176@fpt.edu.vn', 1500000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (6, N'duc@gmail.com', N'duonglthe170176@fpt.edu.vn', 0, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (7, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 2599998, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (8, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 2400000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (9, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 3199997, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (10, N'dothivan988@gmail.com', N'namlegend586@gmail.com', 1910000, CAST(N'2024-07-23T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 1, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (11, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 3700000, CAST(N'2024-07-25T00:00:00.000' AS DateTime), NULL, N'Chưa thanh toán', 2, N'receptionist@gmail.com')
GO
INSERT [dbo].[Bill] ([id], [PatientId], [StaffId], [TotalPrice], [time], [Note], [status], [DoctorPriceId], [StaffIdCreate]) VALUES (12, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', 3450000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'', N'Đã thanh toán', 2, N'receptionist@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
INSERT [dbo].[Bill_Service] ([BillId], [ServiceId]) VALUES (1, 1)
GO
INSERT [dbo].[Bill_Service] ([BillId], [ServiceId]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (1, 1, 1, 1, 700000, 700000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (2, 1, 2, 1, 800000, 798000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (3, 2, 2, 2, 800000, 650000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (4, 2, 3, 1, 500000, 400000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (5, 3, 3, 1, 500000, 450000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (6, 3, 2, 1, 800000, 750000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (7, 1, 4, 1, 700000, 600000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (8, 7, 2, 1, 800000, 699998)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (9, 7, 3, 1, 500000, 400000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (10, 8, 2, 1, 800000, 600000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (11, 8, 3, 1, 500000, 300000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (12, 9, 1, 1, 700000, 599999)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (13, 9, 2, 1, 800000, 699999)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (14, 9, 3, 1, 500000, 399999)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (15, 1, 9, 1, 100000000, 99999999)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (16, 10, 1, 1, 700000, 650000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (17, 10, 2, 1, 800000, 760000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (18, 11, 1, 2, 700000, 600000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (19, 11, 2, 1, 800000, 600000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (20, 11, 3, 1, 500000, 400000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (21, 12, 1, 1, 700000, 650000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (22, 12, 2, 1, 800000, 650000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (23, 12, 3, 2, 500000, 450000)
GO
INSERT [dbo].[BillDetail] ([id], [BillId], [ServiceId], [Quantity], [UnitPrice], [PriceReal]) VALUES (24, 12, 11, 1, 5000000, 4000000)
GO
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CertificateStaff] ON 
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (1, N'Master of Science in Orthodontics', N'Thạc sĩ Khoa học trong Chỉnh nha', N'tudahe163675@fpt.edu.vn', CAST(N'2012-09-08' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (2, N'Doctor of Dental Surgery - DDS', N'Bác sĩ Răng Hàm Mặt', N'tudahe163675@fpt.edu.vn', CAST(N'2003-03-28' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (3, N'Doctor of Dental Surgery - DDS', N'Bác sĩ Răng Hàm Mặt', N'namnvhe170141@fpt.edu.vn', CAST(N'2010-07-29' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (4, N'Doctor of Dental Surgery - DDS', N'Bác sĩ Răng Hàm Mặt', N'namlegend586@gmail.com', CAST(N'2000-04-09' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (5, N'Periodontics Certificate', N'Chứng chỉ Nha chu', N'namlegend586@gmail.com', CAST(N'2005-03-18' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (6, N'Doctor of Dental Surgery - DDS', N'Bác sĩ Răng Hàm Mặt', N'vulqhe170481@fpt.edu.vn', CAST(N'2005-06-05' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (7, N'Oral and Maxillofacial Surgery Certificate', N'Chứng chỉ Phẫu thuật miệng và hàm mặt', N'vulqhe170481@fpt.edu.vn', CAST(N'2008-08-15' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (8, N'Doctor of Dental Surgery - DDS', N'Bác sĩ Răng Hàm Mặt', N'duonglthe170176@fpt.edu.vn', CAST(N'2007-04-25' AS Date))
GO
INSERT [dbo].[CertificateStaff] ([id], [name], [detail], [StaffId], [StartDate]) VALUES (9, N'Cosmetic Dentistry Certificate', N'Chứng chỉ Nha khoa Thẩm mỹ', N'duonglthe170176@fpt.edu.vn', CAST(N'2010-01-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[CertificateStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[changeSchedule] ON 
GO
INSERT [dbo].[changeSchedule] ([StaffId], [dateChange], [ScheduleId], [StaffIdNew], [Id]) VALUES (N'namlegend586@gmail.com', CAST(N'2024-11-04T00:00:00.000' AS DateTime), 14, N'duonglthe170176@fpt.edu.vn', 1)
GO
INSERT [dbo].[changeSchedule] ([StaffId], [dateChange], [ScheduleId], [StaffIdNew], [Id]) VALUES (N'namnvhe170141@fpt.edu.vn', CAST(N'2024-11-04T00:00:00.000' AS DateTime), 14, N'tudahe163675@fpt.edu.vn', 9)
GO
INSERT [dbo].[changeSchedule] ([StaffId], [dateChange], [ScheduleId], [StaffIdNew], [Id]) VALUES (N'duonglthe170176@fpt.edu.vn', CAST(N'2024-07-19T00:00:00.000' AS DateTime), 16, N'namnvhe170141@fpt.edu.vn', 10)
GO
INSERT [dbo].[changeSchedule] ([StaffId], [dateChange], [ScheduleId], [StaffIdNew], [Id]) VALUES (N'namnvhe170141@fpt.edu.vn', CAST(N'2024-07-27T00:00:00.000' AS DateTime), 16, N'duonglthe170176@fpt.edu.vn', 11)
GO
SET IDENTITY_INSERT [dbo].[changeSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[discountService] ON 
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (1, 1, CAST(N'2024-06-12' AS Date), CAST(N'2024-04-26' AS Date), 0.15)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (2, 3, CAST(N'2024-05-16' AS Date), CAST(N'2024-05-22' AS Date), 0.1)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (3, 5, CAST(N'2024-05-20' AS Date), CAST(N'2024-06-07' AS Date), 0.1)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (4, 6, CAST(N'2024-05-20' AS Date), CAST(N'2024-06-07' AS Date), 0.1)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (5, 7, CAST(N'2024-05-20' AS Date), CAST(N'2024-06-07' AS Date), 0.1)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (6, 1, CAST(N'2024-06-26' AS Date), CAST(N'2024-06-29' AS Date), 0.2)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (7, 1, CAST(N'2024-07-21' AS Date), CAST(N'2024-07-22' AS Date), 0.02)
GO
INSERT [dbo].[discountService] ([id], [ServiceId], [DateStart], [DateEnd], [discountPercent]) VALUES (8, 1, CAST(N'2024-07-11' AS Date), CAST(N'2024-07-28' AS Date), 0.1)
GO
SET IDENTITY_INSERT [dbo].[discountService] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorPrice] ON 
GO
INSERT [dbo].[DoctorPrice] ([id], [RoleId], [price]) VALUES (1, 3, 500000)
GO
INSERT [dbo].[DoctorPrice] ([id], [RoleId], [price]) VALUES (2, 4, 1500000)
GO
SET IDENTITY_INSERT [dbo].[DoctorPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[LoanAmountOfPatients] ON 
GO
INSERT [dbo].[LoanAmountOfPatients] ([id], [BillId], [Price], [date], [status]) VALUES (1, 3, 2000000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[LoanAmountOfPatients] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (1, N'Đau răng cấp tính', CAST(N'2024-07-18' AS Date), N'Do viêm chân răng cần mổ gấp ', N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-16' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (2, N'Nhổ răng khôn', CAST(N'2024-06-18' AS Date), N'Do răng khôn mọc lệch', N'0961594860duong@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-20' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (10, N'rat ed', CAST(N'2024-07-21' AS Date), N'dâdđ', N'duc@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-11' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (11, N'rat ed', CAST(N'2024-07-21' AS Date), N'dâdđ', N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-05' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (12, N'rat ed', CAST(N'2024-07-23' AS Date), N'dâdđ', N'dothivan988@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-11' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (13, N'rat ed', CAST(N'2024-07-23' AS Date), N'dâdđ', N'thanhcong@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đang điều trị', CAST(N'2024-07-17' AS Date), NULL)
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (14, N'rat ed', CAST(N'2024-07-23' AS Date), N'dâdđ', N'dothivan988@gmail.com', N'namlegend586@gmail.com', N'Đã ra viện', CAST(N'2024-07-05' AS Date), CAST(N'2024-07-23' AS Date))
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (15, N'abc', CAST(N'2024-07-25' AS Date), N'abc', N'ha@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đã ra viện', CAST(N'2024-07-18' AS Date), CAST(N'2024-07-25' AS Date))
GO
INSERT [dbo].[MedicalRecord] ([id], [diseasedescription], [dateCreate], [note], [PatientId], [StaffId], [Status], [dateIn], [dateOut]) VALUES (16, N'abc', CAST(N'2024-07-26' AS Date), N'abc', N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn', N'Đã ra viện', CAST(N'2024-07-19' AS Date), CAST(N'2024-07-26' AS Date))
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (1, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (1, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (1, 3)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (2, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (2, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (2, 4)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (2, 8)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (2, 10)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (10, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (10, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (11, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (11, 3)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (12, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (12, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (13, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (13, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (13, 3)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (14, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (14, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (15, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (15, 2)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (15, 3)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (16, 1)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (16, 5)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (16, 6)
GO
INSERT [dbo].[MedicalRecord-Service] ([MedicalRecordId], [ServiceId]) VALUES (16, 7)
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'0961594860duong@gmail.com', N'La tùng ', N'Dương', N'0961594860', CAST(N'2003-09-02' AS Date), N'M', N'Hà Nội', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 10000, N'PA0017', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'dinhtu@gmail.com', N'Vũ Văn', N'duong', N'08567651872', CAST(N'2004-04-29' AS Date), N'M', N'Ha noi', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 0, N'PA0001', N'Dừng hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'dothivan988@gmail.com', N'Đỗ Thị', N'Vân', N'0374268988', CAST(N'2003-05-18' AS Date), N'F', N'Bắc Ninh', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 23000000, N'PA0002', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'duc@gmail.com', N'Đỗ Anh', N'Đức', N'0934874678', CAST(N'2012-01-15' AS Date), N'M', N'Bắc Ninh', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 0, N'PA0003', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'ha@gmail.com', N'Đỗ Thị', N'Hà', N'0468135879', CAST(N'2000-07-17' AS Date), N'F', N'Hà Nội', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 700000, N'PA0004', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'hien@gmail.com', N'Nghiêm Thị', N'Hiến', N'0746791346', CAST(N'1980-08-01' AS Date), N'F', N'Hà Nội', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 100000, N'PA0005', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'huong@gmail.com', N'Đỗ Thị', N'Hường', N'0946786458', CAST(N'1998-06-29' AS Date), N'F', N'Hà Nội', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 8000000, N'PA0006', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'khanhvan@gmail.com', N'Nguyễn Khánh', N'Vân', N'0332242988', CAST(N'2013-10-21' AS Date), N'F', N'Hải Phòng', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 3000000, N'PA0007', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'nam@gmail.com', N'Đỗ Văn', N'Nam', N'0974678468', CAST(N'1976-07-14' AS Date), N'M', N'Bắc Ninh', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 500000, N'PA0008', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'phuongthao@gmail.com', N'Đào Phương', N'Thảo', N'0984387144', CAST(N'2005-03-09' AS Date), N'F', N'Thái Nguyên', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'vip', 103000000, N'PA0009', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'quockhanh@gmail.com', N'Phạm Quốc', N'Khánh', N'0498159461', CAST(N'1995-05-30' AS Date), N'M', N'Bắc Giang', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 59000000, N'PA0010', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'thanhcong@gmail.com', N'Hà Thành', N'Công', N'0786132648', CAST(N'1999-03-01' AS Date), N'M', N'Thanh Hóa', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 1000000, N'PA0011', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'thaohien@gmail.com', N'Nguyễn Thảo', N'Hiền', N'0746846135', CAST(N'2008-11-19' AS Date), N'F', N'Bắc Giang', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 500000, N'PA0012', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'thehung@gmail.com', N'Thân Thế', N'Hưng', N'0794345731', CAST(N'2001-05-16' AS Date), N'M', N'Bắc Giang', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 0, N'PA0013', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'thutrang@gmail.com', N'Nguyễn Thị Thu', N'Trang', N'0984156789', CAST(N'1998-05-02' AS Date), N'F', N'Hà Nội', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'vip', 156000000, N'PA0014', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'trong@gmail.com', N'Nguyễn Văn Trọng', N'Trọng', N'0943719258', CAST(N'1994-12-03' AS Date), N'M', N'Vĩnh Phúc', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 0, N'PA0015', N'Đang hoạt động')
GO
INSERT [dbo].[Patients] ([gmail], [FirstName], [LastName], [PhoneNumber], [Dob], [Gender], [Address], [Password], [lever], [TotalBill], [code], [status]) VALUES (N'trongkhoi@gmail.com', N'Đào Trọng', N'Khôi', N'0946789153', CAST(N'2003-08-03' AS Date), N'M', N'Hưng Yên', N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'normal', 0, N'PA0016', N'Đang hoạt động')
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([id], [RoleId], [name], [detail], [TypeOfPostId], [image], [date]) VALUES (1, 1, N'Nói “không” với các cách tẩy trắng răng kém an toàn', N'Trong cuộc sống hàng ngày có nhiều nguyên nhân về chế độ ăn, sinh hoạt,... khiến răng dần bị ngả màu, không còn trắng sáng. Để giải quyết vấn đề này, nhiều người quyết định sử dụng các phương pháp tẩy trắng răng. Và để thuận tiện, tối ưu chi phí, nhiều phương pháp tẩy trắng răng bằng mẹo tại nhà hoặc không rõ nguồn gốc đã xuất hiện. Một số mẹo dân gian như tẩy trắng bằng baking soda và chanh có thể chứa các chất axit có thể gây tổn thương cho men răng. Cụ thể, chúng làm mất lớp men bảo vệ. Từ đó sẽ gây ra các vấn đề như nhạy cảm và mài mòn răng. Sản phẩm không rõ nguồn gốc có thể chứa các chất gây kích ứng. Chúng làm tổn thương niêm mạc miệng và gây ra viêm nhiễm nếu không được sản xuất và lưu trữ đúng cách. Tuy nhiên, độ tin cậy của những cách này chưa được xác thực. Do đó, để đảm bảo an toàn cho răng miệng, chúng ta cần nói “không” với các cách tẩy trắng răng này.', 1, N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2024/04/cach-tay-trang-rang-2.jpg', CAST(N'2024-04-29T13:23:06.000' AS DateTime))
GO
INSERT [dbo].[Post] ([id], [RoleId], [name], [detail], [TypeOfPostId], [image], [date]) VALUES (2, 1, N'Cách điều trị khi bị sưng nướu khi mang thai', N'Khi mang thai, phụ nữ thường sẽ phải đối mặt với nhiều nguy cơ về sức khỏe. Trong đó, sưng nướu là một trong những vấn đề thường gặp. Tình trạng này không chỉ dẫn tới bất tiện mà còn có thể gây ra những vấn đề sức khỏe nghiêm trọng nếu không được xử lý đúng cách. Sau đây, chúng ta hãy tìm hiểu về cách điều trị khi bị sưng nướu khi mang thai. Ngay khi nhận thấy dấu hiệu sưng nướu trong thai kỳ, chúng ta nên tới nha khoa để kiểm tra. Sau khi xác định tình trạng, tùy vào mức độ bệnh và thời điểm thai kỳ, bác sĩ sẽ chỉ định phương pháp điều trị phù hợp. Thông thường, những người bị sưng lợi khi mang thai sẽ được thực hiện vệ sinh răng miệng và lấy cao răng. Một số biện pháp mà bạn có thể thực hiện tại nhà để giảm sưng nướu: Thực hiện đánh răng đúng cách, sử dụng chỉ nha khoa làm sạch răng miệng, súc miệng với nước muối loãng ấm, hạn chế ăn những đồ ngọt, đồ quá chua và thăm khám nha khoa định kỳ.', 1, N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2024/03/sung-nuou-khi-mang-thai-2.jpg', CAST(N'2024-05-03T10:50:22.000' AS DateTime))
GO
INSERT [dbo].[Post] ([id], [RoleId], [name], [detail], [TypeOfPostId], [image], [date]) VALUES (3, 1, N'Hướng dẫn chăm sóc răng miệng cho trẻ theo từng độ tuổi', N'Việc chăm sóc sức khỏe răng miệng sớm cho trẻ là điều quan trọng đối với các bậc cha mẹ. Có nhiều cách bảo vệ và phòng ngừa bệnh răng miệng cho trẻ, trong đó, cha mẹ nên lưu ý đến việc chọn bàn chải, kem đánh răng phù hợp lứa tuổi và thực hành chải răng đúng cách. Giai đoạn từ một tuổi đến 2 tuổi: Cha mẹ cần chủ động đánh răng cho trẻ. Khi bé chưa mọc răng hay mới mọc một vài chiếc răng đầu tiên bạn cần vệ sinh răng nướu cho trẻ bằng gạc mềm thấm nước ấm sạch hoặc nước muối pha loãng. Khi trẻ 3 - 6 tuổi: Trẻ bắt đầu mọc răng hàm và lần lượt thay răng, chuyển từ răng sữa sang răng vĩnh viễn. Đến lúc này, cha mẹ có thể cho trẻ tự đánh răng mỗi ngày dưới sự giám sát của người lớn. Trẻ 6 - 9 tuổi: Cha mẹ vẫn nên kiểm tra việc chải răng của trẻ đều đặn để đảm bảo trẻ đánh răng đúng cách. Chia lịch đánh răng, vệ sinh răng miệng vào thời gian hợp lý. Bạn cần hướng dẫn trẻ đánh răng đều đặn ngày 2 lần (buổi sáng và trước khi đi ngủ).', 2, N'https://vinmec-prod.s3.amazonaws.com/images/20190223_045043_827529_danh_rang_1.max-1800x1800.jpg', CAST(N'2024-05-08T15:06:43.000' AS DateTime))
GO
INSERT [dbo].[Post] ([id], [RoleId], [name], [detail], [TypeOfPostId], [image], [date]) VALUES (4, 1, N'Niềng răng trả góp O lãi suất – Phù hợp khả năng chi trả của mọi khách hàng', N'Chương trình niềng răng trả góp O lãi suất áp dụng cho tất cả các loại mắc cài của Răng Hàm Mặt là cơ hội để cả những khách hàng chưa đủ kinh phí vẫn có thể thực hiện chỉnh nha để nhanh chóng tìm lại hàm răng đều đẹp và chắc khỏe. Vì vậy, nếu vấn đề tài chính là nguyên nhân lớn nhất khiến bạn chần chừ việc chỉnh nha khắc phục răng hô móm, lệch lạc, khấp khểnh hoặc thưa,...hãy đến với chúng tôi để được niềng răng thanh toán từng đợt – Lãi suất O% nhé! CHƯƠNG TRÌNH NIỀNG RĂNG TRẢ GÓP LÃI SUẤT O%. Giảm ngay 20% khi thanh toán 1 lần. Giảm 10% khi trả góp. Khách hàng sẽ thanh toán trước 40% chi phí. Sau đó, trả góp theo đợt sản xuất khay', 3, N'https://benhvienranghammatsg.vn/wp-content/uploads/2019/03/nieng-rang-tra-gop.jpg', CAST(N'2024-05-15T16:08:28.000' AS DateTime))
GO
INSERT [dbo].[Post] ([id], [RoleId], [name], [detail], [TypeOfPostId], [image], [date]) VALUES (8, 1, N' Giới thiệu về đội ngũ y tế của chúng tôi', N'Phòng khám nha khoa là một cơ sở y tế chuyên cung cấp các dịch vụ chăm sóc và điều trị răng miệng. Tại đây, các bác sĩ nha khoa và chuyên gia y tế sẽ thực hiện các quy trình kiểm tra, chẩn đoán, điều trị và phòng ngừa các vấn đề liên quan đến răng và lợi.

Các dịch vụ chính tại phòng khám nha khoa bao gồm:

Khám và tư vấn nha khoa: Đánh giá tình trạng sức khỏe răng miệng, cung cấp lời khuyên và lên kế hoạch điều trị cá nhân hóa.

Điều trị bệnh lý răng miệng: Điều trị các bệnh lý như sâu răng, viêm nướu, viêm nha chu, và các vấn đề khác liên quan đến răng và lợi.

Làm sạch và lấy cao răng: Loại bỏ mảng bám và cao răng, giúp răng miệng sạch sẽ và ngăn ngừa các bệnh lý răng miệng.

Điều trị tủy răng: Điều trị các vấn đề liên quan đến tủy răng bị viêm hoặc nhiễm trùng.

Trám răng và bọc răng sứ: Khôi phục lại hình dáng và chức năng của răng bị hư tổn hoặc mất thẩm mỹ.

Nhổ răng: Nhổ răng sữa, răng khôn, và các răng bị hư hỏng không thể điều trị được.

Chỉnh nha: Sử dụng các phương pháp như niềng răng để điều chỉnh vị trí răng và hàm, cải thiện khớp cắn và thẩm mỹ nụ cười.

Cấy ghép implant: Thay thế răng đã mất bằng cách cấy ghép răng nhân tạo vào xương hàm.

Phục hình răng: Bao gồm làm hàm giả, cầu răng, và các phương pháp khác để phục hồi răng đã mất.

Tẩy trắng răng: Sử dụng các kỹ thuật và sản phẩm chuyên dụng để làm trắng răng, cải thiện thẩm mỹ nụ cười.

Phòng khám nha khoa không chỉ tập trung vào việc điều trị các vấn đề răng miệng mà còn chú trọng đến việc giáo dục bệnh nhân về cách chăm sóc răng miệng đúng cách. Bên cạnh đó, các phòng khám hiện đại còn trang bị các thiết bị và công nghệ tiên tiến nhằm đảm bảo chất lượng dịch vụ cao nhất cho bệnh nhân.', 4, N'https://thietbirang.com/wp-content/uploads/2021/05/ky-thuat-vien-nha-khoa-la-gi-2.jpg', CAST(N'2024-04-29T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription] ON 
GO
INSERT [dbo].[Prescription] ([id], [StaffId], [PatientsId], [issueDate]) VALUES (1, N'namnvhe170141@fpt.edu.vn', N'khanhvan@gmail.com', CAST(N'2024-03-13' AS Date))
GO
INSERT [dbo].[Prescription] ([id], [StaffId], [PatientsId], [issueDate]) VALUES (2, N'namlegend586@gmail.com', N'quockhanh@gmail.com', CAST(N'2024-03-19' AS Date))
GO
INSERT [dbo].[Prescription] ([id], [StaffId], [PatientsId], [issueDate]) VALUES (3, N'duonglthe170176@fpt.edu.vn', N'thutrang@gmail.com', CAST(N'2024-04-23' AS Date))
GO
INSERT [dbo].[Prescription] ([id], [StaffId], [PatientsId], [issueDate]) VALUES (4, N'vulqhe170481@fpt.edu.vn', N'dothivan988@gmail.com', CAST(N'2024-02-16' AS Date))
GO
INSERT [dbo].[Prescription] ([id], [StaffId], [PatientsId], [issueDate]) VALUES (5, N'tudahe163675@fpt.edu.vn', N'phuongthao@gmail.com', CAST(N'2024-02-26' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Prescription] OFF
GO
SET IDENTITY_INSERT [dbo].[PrescriptionDetail] ON 
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (1, 1, N'Amoxicillin 500mg', N'Uống 1 viên, 3 lần mỗi ngày, sau khi ăn.', N'21 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (2, 1, N'Ibuprofen 400mg', N'Uống 1 viên, 3 lần mỗi ngày, nếu đau.', N'15 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (3, 1, N'Paracetamol 500mg', N'Uống 1 viên, 4 lần mỗi ngày, nếu sốt.', N'20 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (4, 1, N'Chlorhexidine 0.12% mouthwash', N'Súc miệng 15ml, 2 lần mỗi ngày.', N'1 chai 250ml')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (5, 2, N'Metronidazole 400mg', N'Uống 1 viên, 2 lần mỗi ngày, sau khi ăn.', N'14 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (6, 2, N'Amoxicillin 500mg', N'Uống 1 viên, 3 lần mỗi ngày, sau khi ăn.', N'21 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (7, 2, N'Chlorhexidine 0.12% mouthwash', N'Súc miệng 15ml, 2 lần mỗi ngày (sáng và tối).', N'1 chai 250ml')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (8, 3, N'Amoxicillin 500mg', N'Uống 1 viên, 3 lần mỗi ngày, sau khi ăn.', N'15 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (9, 3, N'Chlorhexidine 0.12% mouthwash', N'Súc miệng 15ml, 2 lần mỗi ngày (sáng và tối).', N'1 chai 250ml')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (10, 3, N'Amoxicillin 500mg', N'Uống 1 viên, 3 lần mỗi ngày, nếu đau.', N'9 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (11, 4, N'Clindamycin 300mg', N'Uống 1 viên, 3 lần mỗi ngày, sau khi ăn.', N'21 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (12, 4, N'Ketorolac 10mg', N'Uống 1 viên, 2 lần mỗi ngày, nếu đau.', N'10 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (13, 4, N'Chlorhexidine 0.2% mouthwash', N'Súc miệng 15ml, 2 lần mỗi ngày (sáng và tối).', N'1 chai 250ml')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (14, 4, N'Acetaminophen 500mg', N'Uống 1 viên, 4 lần mỗi ngày, nếu sốt hoặc đau nhiều.', N'20 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (15, 5, N'Paracetamol 500mg', N'Uống 1 viên, 3 lần mỗi ngày, nếu đau.', N'15 viên')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (16, 5, N'Chlorhexidine 0.12% mouthwash', N'Súc miệng 15ml, 2 lần mỗi ngày (sáng và tối) sau khi đánh răng.', N'1 chai 250ml')
GO
INSERT [dbo].[PrescriptionDetail] ([id], [PrescriptionId], [name], [description], [quantity]) VALUES (17, 5, N'Ibuprofen 200mg', N'Uống 1 viên, 2 lần mỗi ngày, nếu đau.', N'10 viên')
GO
SET IDENTITY_INSERT [dbo].[PrescriptionDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'lễ tân')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'bác sĩ hạng 2')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'bác sĩ cao cấp hạng 1')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (1, N'Phòng Khám Tổng Quát')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (2, N'Phòng Khám Nha Chu')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (3, N'Phòng Khám Chỉnh Nha')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (4, N'Phòng Khám Phẫu Thuật')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (5, N'Phòng Khám Thẩm Mỹ Răng')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (6, N'Phòng Chẩn Đoán Hình Ảnh')
GO
INSERT [dbo].[Room] ([id], [name]) VALUES (7, N'Phòng Tư Vấn')
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule] ON 
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (1, CAST(N'2024-05-13' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (2, CAST(N'2024-05-13' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (3, CAST(N'2024-05-14' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (4, CAST(N'2024-05-14' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (5, CAST(N'2024-05-15' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (6, CAST(N'2024-05-15' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (7, CAST(N'2024-05-16' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (8, CAST(N'2024-05-16' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (9, CAST(N'2024-05-17' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (10, CAST(N'2024-05-17' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (11, CAST(N'2024-05-18' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (12, CAST(N'2024-05-18' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (13, CAST(N'2024-05-20' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (14, CAST(N'2024-07-20' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (15, CAST(N'2024-05-21' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (16, CAST(N'2024-07-30' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (17, CAST(N'2024-05-22' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (18, CAST(N'2024-05-22' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (19, CAST(N'2024-04-23' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (20, CAST(N'2024-05-23' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (21, CAST(N'2024-05-24' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (22, CAST(N'2024-05-24' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (23, CAST(N'2024-05-25' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (24, CAST(N'2024-05-25' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (25, CAST(N'2024-05-27' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (26, CAST(N'2024-05-27' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (27, CAST(N'2024-05-28' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (28, CAST(N'2024-05-28' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (29, CAST(N'2024-05-29' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (30, CAST(N'2024-05-29' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (31, CAST(N'2024-05-30' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (32, CAST(N'2024-05-30' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (33, CAST(N'2024-06-29' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (34, CAST(N'2024-06-29' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (35, CAST(N'2024-07-30' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (36, CAST(N'2024-07-30' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (37, CAST(N'2024-07-31' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (38, CAST(N'2024-07-31' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (39, CAST(N'2024-08-01' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (40, CAST(N'2024-08-01' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (41, CAST(N'2024-07-27' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[schedule] ([Id], [date], [timeStart], [timeEnd]) VALUES (42, CAST(N'2024-07-27' AS Date), CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[schedule] OFF
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'0961594860duong@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'dinhtu@gmail.com', N'namnvhe170141@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'khanhvan@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'thanhcong@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'thaohien@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (14, N'thehung@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (15, N'thutrang@gmail.com', N'namnvhe170141@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (16, N'0961594860duong@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (16, N'phuongthao@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (16, N'trongkhoi@gmail.com', N'vulqhe170481@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (17, N'dinhtu@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (17, N'dothivan988@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (17, N'ha@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (17, N'huong@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (17, N'phuongthao@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (18, N'duc@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (18, N'hien@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (18, N'nam@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (18, N'quockhanh@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (18, N'trong@gmail.com', N'namlegend586@gmail.com')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (22, N'thutrang@gmail.com', N'namnvhe170141@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (40, N'nam@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (40, N'thaohien@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (40, N'thehung@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
INSERT [dbo].[Schedule_Patients] ([scheduleId], [PatientId], [StafId]) VALUES (40, N'trong@gmail.com', N'duonglthe170176@fpt.edu.vn')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (1, 3, N'Lấy cao răng và đánh bóng răng', 700000, N'Lấy cao răng và đánh bóng răng khiến cho răng của bạn trở nên bóng đẹp hơn, mang lại hơi thở thơm mát và phòng tránh sâu răng.', N'https://elitedental.com.vn/wp-content/uploads/2023/11/danh-bong-rang-1.png', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (2, 2, N'Điều trị fluoride', 800000, N'Việc sử dụng fluoride trong liệu pháp chăm sóc răng miệng là rất quan trọng để ngăn ngừa và điều trị các vấn đề liên quan đến răng miệng, bao gồm sâu răng, viêm lợi và mất men răng.', N'https://www.vinmec.com/s3-images/20230518_135131_482933_Kem_danh_rang_chua_fl.max-800x800.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (3, 3, N'Nhổ răng', 500000, N'Nhổ răng là chỉ định được đưa ra khi răng đã không thể bảo tồn do tổn thương nghiêm trọng hay gây ảnh hưởng đến những răng xung quanh. ', N'https://www.docosan.com/blog/wp-content/uploads/2022/05/gia-nho-rang-2.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (4, 3, N'Điều trị tủy răng', 700000, N'Điều trị ống tủy răng (nội nha) là một tiến trình y khoa nhằm điều trị tình trạng viêm nhiễm tại phần trung tâm của răng.', N'https://nhakhoakim.com/wp-content/uploads/2016/11/dieu-tri-tuy-rang-gia-bao-nhieu-tien.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (5, 4, N'Niềng răng kim loại truyền thống', 20000000, N'Niềng răng mắc cài kim loại là phương pháp niềng răng truyền thống phổ biến nhất hiện nay. Sử dụng mắc cài và dây cung kim loại, cố định trên răng bằng các dây chun hoặc dây thép nhỏ.', N'https://hethongnhakhoasaigon.vn/wp-content/uploads/2021/09/20190806_045211_746039_pasted_image_0_25.max-1800x1800-1.png', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (6, 4, N'Niềng Răng Sứ (Ceramic Braces)', 40000000, N'Niềng răng mắc cài sứ là phương pháp sử dụng mắc cài làm bằng sứ thay vì kim loại, đảm bảo an toàn với cơ thể đồng thời đem lại tính thẩm mỹ vượt trội.', N'https://nhakhoathuyduc.com.vn/wp-content/uploads/2021/04/nieng-rang-mac-cai-su-gia-bao-nhieu-1.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (7, 4, N'Niềng Răng Không Mắc Cài (Invisalign)', 60000000, N'Niềng răng Invisalign là phương pháp chỉnh nha hiện đại, sử dụng những khay niềng trong suốt để điều chỉnh răng về đúng vị trí.', N'https://updental.vn/upload/image/article/content/nieng-rang-invisalign(3).jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (8, 5, N'Bọc răng sứ kim loại', 20000000, N'Niềng răng mắc cài kim loại là phương pháp niềng răng truyền thống phổ biến nhất hiện nay. Sử dụng mắc cài và dây cung kim loại, cố định trên răng bằng các dây chun hoặc dây thép nhỏ.', N'https://www.laboasia.com.vn/uploads/product/dia-chi-lam-rang-su-kim-loai-uy-tin-nhat-ha-noi-2.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (9, 5, N'Răng sứ Zirconia', 100000000, N'Răng sứ kim loại là một dòng răng sứ được ứng dụng đầu tiên trong ngành làm răng sứ thẩm mỹ. Có lõi bằng kim loại và lớp phủ sứ bên ngoài. Loại này bền và giá thành thấp.', N'https://nhakhoaident.com/Images/filebrowser/hinh_-rang-su-toan-su.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (10, 5, N'Răng sứ lai (sứ veneer)', 150000000, N'Lớp phủ sứ mỏng dán lên bề mặt răng thật, cải thiện thẩm mỹ và bảo vệ răng khỏi tổn thương. Phương pháp này ít xâm lấn hơn và bảo tồn mô răng thật nhiều hơn.', N'https://nhakhoanhantam.com/stmresource/files/News/dan-su-veneer-gia-bao-nhieu-1-rang.jpg', N'Đang hoạt động')
GO
INSERT [dbo].[Service] ([id], [ServiceTypeID], [Name], [Price], [mainDetail], [image], [Status]) VALUES (11, 1, N'Răng sứ lai (vippro)', 5000000, N'Niềng răng mắc cài kim loại là phương pháp niềng răng truyền thống phổ biến nhất hiện nay. Sử dụng mắc cài và dây cung kim loại, cố định trên răng bằng các dây chun hoặc dây thép nhỏ.', N'https://nhakhoakim.com/wp-content/uploads/2021/11/rang-toan-su-lava-plus-3.png', N'Đang hoạt động')
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceDetail] ON 
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (1, 5, N'Niềng răng mắc cài kim loại là phương pháp chỉnh nha sử dụng hệ thống mắc cài và dây cung, dây thun nhằm dịch chuyển răng về vị trí mong muốn. Phương pháp này giúp cải thiện hiệu quả tình trạng răng hô, móm, khấp khểnh, thậm chỉ khớp cắn lệch... Đây được xem là phương pháp niềng không chỉ phổ biến tại Việt Nam mà phổ biến trên toàn thế giới,. Sử dụng dây chun (hay dây thun) chỉnh nha để gắn cố định dây cung vào những chiếc mắc cài, những chiếc dây chun có tác dụng hỗ trợ quá trình niềng răng hiêu quả. Những chiếc dây chun này có độ bền cao, độ đàn hồi tốt, giúp hỗ trợ cho quá trình chỉnh răng diễn ra ổn định và có hiệu quả cao. Niềng răng kim loại thông thường đem đến hiệu quả chỉnh nha tuyệt đối, đi kèm đó là có những khí cụ hỗ trợ đi kèm để giúp cố định, kéo, đẩy, chỉnh,… dây cung trong quá trình niềng răng. Chi phí của niềng răng kim loại là thấp nhất trong tất các các loại niềng răng thẩm mỹ. Phương pháp này sẽ tiết kiệm được rất nhiều chi phí, nhưng khi giao tiếp sẽ phải để lộ niềng răng, nhiều khách hàng sẽ cảm thấy ngượng ngùng trước đối tác hoặc giao tiếp ở nơi đông người.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (2, 6, N'Niềng răng mắc cài sứ là phương pháp chỉnh nha sử dụng hệ thống mắc cài sứ và dây cung nhằm kéo chỉnh răng đều đẹp hơn. Phương pháp này được đánh giá cao về mặt thẩm mỹ bởi chất liệu mắc cài được làm bằng sứ có màu trắng trong giống với màu răng của bạn.  Niềng răng mắc cài sứ là một trong những loại niềng răng chỉnh nha được thiết kế để phù hợp với những ai phải giao tiếp nhiều, cần chỉn chu về ngoại hình. Tính thẩm mỹ được đánh giá cao khi người dùng sử dụng niềng răng mắc cài sứ, vì màu của mắc cài sứ và răng gần trùng màu của nhau nên không gây chú ý với mọi người xung quanh. Sử dụng chất liệu sứ nên hoàn toàn an toàn với môi, nướu và khoang miệng, phù hợp với những người dị ứng với nhựa hay kim loại. Mặc dù sứ chỉnh nha rất chắc chắn nhưng vẫn có thể sứ bị vỡ do va đập hoặc chơi thể thao,...Tuy nhiên tỉ lệ này rất thấp nên bạn không nên quá lo lắng!')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (3, 7, N'Niềng răng Invisalign là phương pháp niềng răng trong suốt tiến bộ nhất hiện nay. Phương pháp này không chỉ giữ được thẩm mỹ cho người dùng còn tác động lực đủ để chỉnh lại răng. 

 

Invisalign bao gồm một loạt 30 đến 50 khay nhựa trong suốt giống như miếng bảo vệ miệng, được làm theo yêu cầu. Các khay nhựa có thể tháo rời và được thay thế sau từ 10 - 15 ngày. Với những cơ chế niềng răng truyền thống, người dùng sẽ đau hơn, ăn uống sinh hoạt thường cảm thấy khó chịu còn với Invisalign mọi điều này gần như là không có. Niềng răng vô hình Invisalign khiến người đối diện khó có thể phát hiện ra bạn đang sử dụng loại khí cụ này. Nhờ vậy, sử dụng khay chỉnh nha Invisalign sẽ đảm bảo tính thẩm mỹ tốt nhất.  Tuy nhiên giá thànhđắt hơn tất cả các phương pháp niềng răng truyền thống khác. Điều này do khay niềng được thiết kế tinh vi, đảm bảo tính thẩm mỹ cũng như đạt hiệu quả tối đa. ')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (4, 8, N'Răng sứ kim loại thường là dòng răng sứ cấu tạo bởi 02 lớp, phía trong là lõi chịu lực đúc từ hợp kim nha khoa (hợp kim crom – niken hoặc hợp kim crom – coban), còn phía ngoài phủ lớp sứ nhằm tạo tính thẩm mỹ cũng như tăng khả năng ăn nhai dành cho chụp răng. Đồng thời màu sắc thẩm mỹ còn như răng thật.

 So với các dòng răng sứ cao cấp hiện nay thì dòng răng sứ kim loại thường sẽ có màu sắc, độ bền không được cao bằng. Thế nhưng dòng răng sứ này vẫn mang lại nhiều ưu điểm nổi bật: Khả năng chịu lực tốt, độ cứng chắc cao, thích hợp cho phục hình răng phải chịu lực ăn nhai lớn, điển hình là nhóm răng hàm, tuổi thọ trên dưới 10 năm và có thể lâu hơn với răng hàm bên trong,... Tóm lại ưu điểm lớn nhất của các dòng răng sứ kim loại là giá thành rẻ, rẻ nhất trong các dòng răng sứ. Bên cạnh đó nó còn có thêm một số ưu điểm khác như độ cứng tốt, có thể chỉ định chuyên trồng răng cho khoảng mất răng dài, khả năng chế tác đơn giản, vật liệu phong phú.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (5, 9, N'Đây là một loại răng sứ hoàn toàn cao cấp, được chế tác dựa trên công nghệ của dòng răng sứ Zirconia . Mang nhiều cải tiến hiện đại, tạo nên một dòng răng sứ đẹp hoàn toàn tự nhiên. Nó được ứng dụng rộng rãi tại các cơ sở nha khoa, là dòng răng sứ được ưa chuộng hàng đầu hiện nay bởi các đặc tính ưu việt.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (6, 10, N'Dán sứ Veneer là phương pháp sử dụng một lớp sứ siêu mỏng từ 0.2mm - 0.5mm để dán đè lên bề mặt ngoài cửa răng thật. Miếng dán được cố định bằng keo chuyên dùng sao cho ôm khít vào răng một cách hoàn hảo nhất. Giống như bọc răng sứ, dán sứ Veneer cũng có tác dụng khắc phục một số khuyết điểm của răng như: vỡ, mẻ, ngả vàng, xỉn màu hay sâu răng… 

Tuy nhiên, nếu bọc răng sứ là phương pháp thẩm mỹ dùng mão sứ để chụp lên toàn bộ răng thật thì dán sứ Veneer chỉ sử dụng mặt sứ mỏng để dán lên bề mặt của răng. Từ đó dán sứ Veneer giúp hạn chế được việc mài răng, bảo tồn răng thật một cách tốt nhất mà vẫn đem lại hiệu quả cao. 

Đây được coi là "bước đột phát lớn" trong lĩnh vực nha khoa thẩm mỹ dành cho ai muốn sở hữu một hàm răng trắng sáng. Thông thường miếng dán sứ Veneer có khả năng chịu lực lớn gấp 3 -4 lần so với răng thật nên việc ăn uống vẫn hoàn toàn không bị ảnh hưởng. Mặt dán Veneer có thể duy trì tốt nhất lên tới 15 năm nếu thực hiện đúng theo chỉ định của các bác sĩ. Tuy nhiên dán sứ Veneer kén răng và chỉ áp dụng với các trường hợp các răng trên hàm đã khá đều nhau.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (7, 1, N'Cao răng vốn là một trong những “kẻ thù” nguy hiểm, tiềm ẩn vô vàn nguy hiểm đối với tình hình sức khỏe răng miệng của mỗi người. Lấy cao răng định kì 6 tháng/lần bằng máy siêu âm là yêu cầu vô cùng cần thiết mà bất cứ bác sĩ nha khoa nào cũng khuyên các bệnh nhân của mình. Cao răng được hiểu một cách đơn giản là những mảng bám của thức ăn trên cổ răng, nướu răng… tích tụ lâu ngày mà thành. Các mảng bám này nếu để lâu ngày sẽ bám dính rất chắc vào răng, là môi trường thuận lợi để các vi khuẩn tích tụ, khiến cho tình trạng răng trở nên ố vàng, xỉn màu, lâu dần có thể gây viêm nhiễm và gây ra các bệnh lý răng miệng nguy hiểm.Các nha sĩ đã chỉ ra rằng, trong cao răng tồn tại và ẩn chứa tới hơn 500 loại vi khuẩn khác nhau. Những loại vi khuẩn này là nguồn gốc của bệnh viêm nướu, viêm chân răng, viêm nha chu… Ở mức độ nhẹ, nó sẽ gây cho người bệnh những cảm giác vô cùng khó chịu và gây ra bất tiện đối với chức năng ăn nhai cũng như những sinh hoạt hàng ngày. Ở mức độ nặng hơn, những bệnh lý răng miệng này có thể gây ra nhiều biến chứng răng miệng vô cùng nguy hiểm, thậm chí có thể khiến răng lung lay hoặc làm mất răng.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (8, 2, N'Fluoride là khoáng chất quan trọng trong quá trình tạo ngà răng và men răng. Từ khi còn bé, cùng với sự hình thành răng sữa và răng vĩnh viễn, quá trình tích tụ và khoáng hóa men răng đã diễn ra. Khi hệ vi khuẩn phân hủy đường và carbs, men răng dần yếu đi và hình thành nên các axit ăn mòn men răng. Đây còn được gọi là quá trình khử khoáng. Khi men răng yếu, vi khuẩn dễ xâm nhập gây sâu răng.

Lúc này, Fluoride đóng vai trò tái tạo men răng nhằm ngăn ngừa sâu răng đồng thời nó còn có khả năng phục hồi sâu răng khi chưa hình thành lỗ sâu. Vì vậy, nếu bạn thắc mắc Fluoride có tốt cho răng không thì câu trả lời là có.  Bên cạnh đó, Fluoride còn có tác dụng to lớn trong quá trình hình thành khung xương hữu cơ, khoáng hóa tạo mô xương đặc nhờ quá trình điều hòa chuyển hóa canxi và photpho. Chính điều này giúp nó. Vì vậy, khi bị sâu răng và loãng xương chứng tỏ bạn đang thiếu Fluoride.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (9, 3, N'Bảo tồn răng thật là yêu cầu hàng đầu đối với các nha sĩ. Tuy nhiên, trong một số trường hợp bất khả kháng thì việc nhổ răng vẫn phải được chỉ định để tránh những biến chứng nguye hiểm cũng như ảnh hưởng đến các răng xung quanh.          Răng bị nhổ vì các lý do sau:
 Sâu răng nặng tiến sâu vào trong răng
, Nhiễm trùng phá hủy phần lớn răng hoặc phần xương xung quanh, Không đủ chỗ cho tất cả răng mọc trên cung hàm. Nhiều bác sĩ khuyên nên nhổ các răng ngầm, là răng mà chỉ có một phần được mọc nhú lên. Vi khuẩn có thể xâm nhập vào vùng xung quanh của răng nhú lên một phần này và gây nhiễm trùng, nhiễm trùng có thể lan xuống vùng xương xung quanh và tạo ra tình trạng cực kì nghiêm trọng. Các răng ngầm liên tục phát triển đâm xuyên qua mô nướu để cố lộ lên trên cung hàm, mặt dù không đủ chỗ cho chúng mọc. Một áp lực liên tục do việc nỗ lực cố mọc lên này có thể gây tổn hại chân của các răng kế cận. Việc nhổ các răng ngầm này sẽ giúp ngăn ngừa nhiễm trùng, tổn thương xương và răng kế cận, và tránh các đau đớn do răng này sẽ gây ra.')
GO
INSERT [dbo].[ServiceDetail] ([id], [ServiceId], [detail]) VALUES (10, 4, N'Sự viêm nhiễm ở phần tủy răng (nằm bên trong ngà răng) thường bị gây ra bởi sự tấn công của các loại vi khuẩn tồn tại trong khoang miệng. Hình thức điều trị này sẽ được bác sĩ áp dụng cho bệnh nhân khi việc chụp tia X cho thấy phần tủy của răng đã và đang bị tổn thương bởi sự xâm nhập của vi khuẩn. Tủy răng (ở thân răng) sẽ bắt đầu hoại tử nếu cường độ tấn công của vi khuẩn không suy giảm và ngày một lan rộng. Khi thực trạng viêm nhiễm ở răng (sâu răng) diễn tiến nặng, các triệu chứng trên sẽ ngừng xuất hiện báo hiệu cho việc vùng tủy răng này đã hoàn toàn chết. Sau đó, người bệnh sẽ cảm thấy như răng đã tự lành nhưng thực chất thì tiến trình viêm nhiễm đã lan đến hết hệ thống tủy ở chân răng. Việc gặp bác sĩ sẽ trở nên rất cấp thiết nếu răng của bệnh nhân bắt đầu có dấu hiệu đau. Nếu răng bị nhiễm trùng, tủy sẽ không thể tự hồi phục.

Nếu răng sâu không được chữa trị hoặc nhổ bỏ thì tình trạng sẽ ngày một nặng thêm. Điều này sẽ khiến cho tỉ lệ thành công của hình thức điều trị tủy răng giảm đi khi tình trạng viêm nhiễm lan sang răng khác.

Các loại thuốc kháng sinh sẽ không hiệu quả trong việc điều trị tủy răng.')
GO
SET IDENTITY_INSERT [dbo].[ServiceDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON 
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (1, N'Khám và Tư vấn Răng Miệng')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (2, N'Dịch vụ Phòng Ngừa')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (3, N'Dịch vụ Điều Trị')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (4, N'Dịch vụ Chỉnh Nha')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (5, N'Dịch vụ Phục Hình')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (6, N'Dịch Vụ Thẩm Mỹ')
GO
INSERT [dbo].[ServiceType] ([id], [name]) VALUES (7, N'Dịch vụ Điều Trị Nha Chu')
GO
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (1, NULL, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'admin@gmail.com', NULL, NULL, N'ST1001')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (4, 2, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Lê Văn', N'Vũ', N'https://tq6.mediacdn.vn/thumb_w/640/133514250583805952/2020/6/8/873302766563216418622655364023183338578077n-15915865604311972647945.jpg', N'344030458', CAST(N'1982-12-17' AS Date), N'F', N'Hà Nội 1009', N'27082003156', CAST(N'2023-07-19' AS Date), NULL, N'Đang làm việc', N'duonglthe170176@fpt.edu.vn', N'Là bác sĩ trưởng, bác sĩ Nguyễn Hồng Quân luôn luôn nỗ lực để đem lại hàm răng chắc khỏe nhất, đẹp nhất cho mỗi khách hàng của mình.', 2, N'ST1002')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (3, 2, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Phạm Huy', N'Huyên', N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2021/02/BS-Pham-Huy-Huyen.png', N'374268999', CAST(N'1970-05-11' AS Date), N'M', N'Hà Nội', N'27303004591', CAST(N'2019-07-03' AS Date), NULL, N'Đang làm việc', N'namlegend586@gmail.com', N'Bác sĩ Quỳnh Nguyễn với trên 10 năm kinh nghiệm trong lĩnh vực chỉnh nha hiện đang điều trị trên 1.000 ca lâm sàng. ', 1, N'ST1003')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (3, 1, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Bùi Minh', N'Chiến', N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/10/BS-Bui-Minh-Chien.png', N'984999222', CAST(N'1976-06-17' AS Date), N'M', N'Hà Nội', N'15076004931', CAST(N'2022-01-09' AS Date), NULL, N'Đang làm việc', N'namnvhe170141@fpt.edu.vn', N'Bác sĩ Hoàng Văn Tùng là bác sĩ giàu kinh nghiệm và có chuyên môn cao tại Nha khoa Quốc tế Việt Pháp.', 2, N'ST1004')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (2, NULL, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Lễ Tân', NULL, N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/06/BS-Nguyen-Thi-Kim-Loan.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Đang làm việc', N'receptionist@gmail.com', NULL, NULL, N'ST1005')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (3, 3, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Nguyễn Thị Kim', N'Loan', N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/06/BS-Nguyen-Thi-Kim-Loan.png', N'332241687', CAST(N'1979-06-09' AS Date), N'F', N'Vĩnh Phúc', N'33069001579', CAST(N'2018-09-16' AS Date), CAST(N'2024-07-24' AS Date), N'Đã nghỉ việc', N'tudahe163675@fpt.edu.vn', N'Sau quá trình học tập và tu nghiệp tại Nga, bác sĩ Phạm Văn Tú trở về Việt Nam và lựa chọn nha khoa Quốc tế Việt Pháp để làm việc.', 4, N'ST1006')
GO
INSERT [dbo].[Staff] ([RoleId], [RoomId], [Password], [FirstName], [LastName], [Image], [PhoneNumber], [Dob], [Gender], [Address], [IdentificationCard], [StartDate], [EndDate], [Status], [Gmail], [description], [typeOfDoctorId], [code]) VALUES (4, 4, N'YjkzNmM0MDVlYmRkZjM3OGRmNzY3ODgzZDcxMGNlZDU=', N'Nguyễn Thị Thu', N'Hương', N'https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/08/BS-Nguyen-Thi-Thu-Huong.jpg', N'397767788', CAST(N'1980-09-28' AS Date), N'F', N'Bắc Ninh', N'3408002675', CAST(N'2020-06-08' AS Date), NULL, N'Đang làm việc', N'vulqhe170481@fpt.edu.vn', N'Tốt nghiệp Đại Học Y Hà Nội chuyên khoa Răng hàm mặt. Sau khi ra trường, bác sĩ Thúy lựa chọn Nha khoa Quốc tế Việt Pháp để làm việc.', 3, N'ST1007')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 14, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 15, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 16, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 17, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 19, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 20, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 36, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 38, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 40, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 41, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'duonglthe170176@fpt.edu.vn', 42, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 14, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 15, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 16, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 17, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 18, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 19, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 20, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 21, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 22, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 37, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namlegend586@gmail.com', 38, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namnvhe170141@fpt.edu.vn', 14, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namnvhe170141@fpt.edu.vn', 15, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namnvhe170141@fpt.edu.vn', 17, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namnvhe170141@fpt.edu.vn', 18, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'namnvhe170141@fpt.edu.vn', 42, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'tudahe163675@fpt.edu.vn', 35, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'tudahe163675@fpt.edu.vn', 39, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 14, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 15, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 16, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 17, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 18, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 34, N'Đã hết hạn')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 35, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 40, N'Còn trống')
GO
INSERT [dbo].[staff_schedule] ([StaffId], [ScheduleId], [status]) VALUES (N'vulqhe170481@fpt.edu.vn', 41, N'Đã hết hạn')
GO
SET IDENTITY_INSERT [dbo].[TokenSetTime] ON 
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Q-BrJUlayluJgRKDC0jcer9IMZiTKIhr', CAST(N'20:59:53.9771544' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'21:03:53.9771544' AS Time), 1)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'FgczGodpONlWaeDp8l_2UdZqkCYZ9KZ0', CAST(N'21:16:19.1963876' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'21:20:19.1963876' AS Time), 2)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'v6WmEf7O0CA4PGSfRahnxhfb7PtCBK9H', CAST(N'21:27:50.4969245' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'21:31:50.4969245' AS Time), 3)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Z-fBMS8fCXWfpvV-lywnIadAlnCJuMUM', CAST(N'21:44:24.9807538' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'21:48:24.9807538' AS Time), 4)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'sdsfdgfhggfds', CAST(N'21:44:24.9807538' AS Time), CAST(N'2024-05-25' AS Date), CAST(N'21:48:24.9807538' AS Time), 5)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'iJtsntB3ZaZXGmGC0RcjEpNl4lzbnTOQ', CAST(N'22:02:15.6339840' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:06:15.6339840' AS Time), 6)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'0LO7TYn3yNuqAT7BUlRvdK9QgJjxwYXH', CAST(N'22:09:23.8824091' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:13:23.8824091' AS Time), 7)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'I0lBfnm5jtZIlhSOf8hm9Jz6eFT-G2_d', CAST(N'22:13:14.9212064' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:17:14.9212064' AS Time), 8)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'HIJ945kIL-1Yo0BKZ1Q3-g4GcMNQcmy9', CAST(N'22:13:19.9789703' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:17:19.9789703' AS Time), 9)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'QUvHCWu-cLKaK1DXVVM4cV8mMc5diw46', CAST(N'22:29:13.5828011' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:31:13.5828011' AS Time), 10)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'cj02BUi_d9q3Asi8cwexYlooCni7hOh9', CAST(N'22:29:54.1291785' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:31:54.1291785' AS Time), 11)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'pfHTEEB28rKQIUvilg8IGoKWJpEbcspS', CAST(N'22:32:36.6094067' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:34:36.6094067' AS Time), 12)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'rixfemXhG1RNK5l3f8ii7OwbWL3LSq2j', CAST(N'22:50:15.4741797' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'22:52:15.4741797' AS Time), 13)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'GgDdIk6yYB2AE_qHi2DoiekYq8YliEk1', CAST(N'23:01:23.2924886' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'23:03:23.2924886' AS Time), 14)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'D6p_xD7TaiFUbhEMRGpcarTbUI1wyS6G', CAST(N'23:01:24.8415081' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'23:02:00.9386326' AS Time), 15)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'-o_qPpOyNMoLzN65A2HSreUr78Q4TdZu', CAST(N'23:03:12.0850639' AS Time), CAST(N'2024-05-26' AS Date), CAST(N'23:05:12.0850639' AS Time), 16)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'En61e3x9t544ReRxbAeDwGo11zR7ikpF', CAST(N'00:17:48.9858062' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'00:19:48.9858062' AS Time), 17)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'AhRCa6ZCaSAdqRC1mx3Eup6Gb3Bpil_5', CAST(N'00:22:23.6142682' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'00:24:23.6142682' AS Time), 18)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'wmBMtwIy5AVpGS238kwF0eX-9onPc4eu', CAST(N'01:18:24.5455206' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'01:20:24.5455206' AS Time), 19)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'_wpYnXvJpfxwAHXrDiIVnaRD_eyPiRFy', CAST(N'01:21:22.6142675' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'01:23:22.6142675' AS Time), 20)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'iP6L6dSnYTWmRVUE254yiWp3HogwcM6f', CAST(N'01:24:57.7301849' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'01:26:57.7301849' AS Time), 21)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dfghjnkml@gmail.com', N'uQMroatv03O70GA2kr0Lagv6VAe5KxKN', CAST(N'01:26:22.8417896' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'01:28:22.8417896' AS Time), 22)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'AU0Zp6awEkI9Wcpw9DlNYOsqRxFB655v', CAST(N'01:56:19.1908243' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'01:58:15.5842377' AS Time), 23)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'2zjUYNc7Tcrc_JyGy-FfCtAUX_FMQvUk', CAST(N'02:03:01.2515369' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'02:03:48.0344342' AS Time), 24)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'ir-MFFTwPGSTFg1aVuCvAG75BedzYtXD', CAST(N'02:03:03.1573264' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'02:05:03.1573264' AS Time), 25)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'SaLUBbo4SxSAXHaIHlZQOXLAffo4XbFu', CAST(N'09:03:06.1932562' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'09:05:06.1932562' AS Time), 26)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'B9Ivw81ekZcj47Zco2JcIvEz0nzinwFA', CAST(N'09:05:59.7420687' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'09:06:37.8458222' AS Time), 27)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'MQ29j18KQJlrN4BhqheGHH3z8fThnG9A', CAST(N'13:29:03.7596847' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'13:29:27.5392789' AS Time), 28)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'CEo5KxFbXcFdwo6zPhyXtF0HK0IB2dkS', CAST(N'13:30:22.0393025' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'13:32:22.0393025' AS Time), 29)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'7fZgQKXo1EksZW7ixghaCKYpXH68Fvo9', CAST(N'14:56:45.0926063' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'14:58:45.0926063' AS Time), 30)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'1R4GqnEV19LbsHcKht7mtCz5PcTSdeVV', CAST(N'14:57:40.9767101' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'14:59:40.9767101' AS Time), 31)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'hFvb4hjEIro7eEGUHHBN4pW34LOTr3MM', CAST(N'15:00:09.1488026' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'15:00:50.9227249' AS Time), 32)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'WYlCZQiYXVEO7zjQLCvAxdQ9VPhUFU8e', CAST(N'15:08:13.1295570' AS Time), CAST(N'2024-05-27' AS Date), CAST(N'15:08:31.9562037' AS Time), 33)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Bm6KqLEtMBg9ZZ2Z02rgiPwr6553Kyjs', CAST(N'01:00:57.6095356' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'01:01:33.9287302' AS Time), 34)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'c3D5GYYBF92Wa7RDyy-5Z2LxprPBt7Hf', CAST(N'02:17:13.8796383' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:19:13.8796383' AS Time), 35)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'eNLljnb3MBC4GKgr0hC0PmECr-3u0CXQ', CAST(N'02:20:33.8873288' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:22:33.8873288' AS Time), 36)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'SnlKguYUVklcQgBG2bzSjqT0pVsAXaHU', CAST(N'02:21:38.7656395' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:23:38.7656395' AS Time), 37)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'dacD7XgqxMI-KaGOphoGJ54xiCXYwCo4', CAST(N'02:24:38.8570546' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:25:27.5046374' AS Time), 38)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'Dz3Bt8Mtj7EikhPvahqSDlNP_6gQ7ZGW', CAST(N'02:33:30.6536910' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:35:30.6536910' AS Time), 39)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'GcWDxfxo8K6WVzNoWoUV1_e-FYsN0xxp', CAST(N'02:43:10.9712631' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'02:45:10.9712631' AS Time), 40)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'4u2dXFXzFHDts_-Awyr1qxU4QBY-hlkd', CAST(N'02:58:23.0493024' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'03:02:23.0493024' AS Time), 41)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'f-jhemXkdBr-ez7xbuFw8cXwe3PxOwH1', CAST(N'02:58:42.9807664' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'03:02:42.9807664' AS Time), 42)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'ONbuoiH84G_Tm70jd2jGy1sPvClYqhjL', CAST(N'04:16:19.1482799' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:20:19.1482799' AS Time), 43)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'EMlqq7ZblmFryPxZ_0YHb4mK6O2Q24aC', CAST(N'04:17:40.8536060' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:21:40.8536060' AS Time), 44)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'ZnZ_5vtix3ivWPwqQn8LDPha-aqnNySe', CAST(N'04:21:55.3981960' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:25:55.3981960' AS Time), 45)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'zM1o96wVRWIRA6afzaA_TH5MkvuBSdK0', CAST(N'04:25:46.7619592' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:26:00.8814132' AS Time), 46)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'kGUMFoH4kF2eHSgl4aelG0SgR77ULq4P', CAST(N'04:33:28.9694895' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:35:39.8036354' AS Time), 47)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'kKPJ57Tv3zMUNzIG41st4hTS0vCoB_ND', CAST(N'04:36:21.6923569' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:38:21.6923569' AS Time), 48)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'u9Kjlp9KeisRV7c7Y1WLkq7TjhkAXT19', CAST(N'04:40:23.0933413' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:40:38.1412206' AS Time), 49)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'mBUWO7DquhnlJoB9yb3KcbjMan1zqE8d', CAST(N'04:41:16.3578825' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:41:25.4068961' AS Time), 50)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'uRdAkZcw31o1_2cpqYgZR9vCc2JRGIxi', CAST(N'04:42:09.0573382' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:42:28.6528914' AS Time), 51)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Xc2DHgSC0tCLxVtiU__GCo3tN6xj1igw', CAST(N'04:43:02.3313393' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:47:02.3313393' AS Time), 52)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'5NM7S1A61URmT6o9SQaDfDC3r3FXfsvl', CAST(N'04:43:03.4089129' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:43:16.2961534' AS Time), 53)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'K8ZbUaF3ZMYggNWAWzu_tJJX4vS8SL7W', CAST(N'04:46:13.7407957' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:50:13.7407957' AS Time), 54)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'tCZ8gLHLPI7l05y5lQKDrNz6Z7mhNUXL', CAST(N'04:46:33.7579319' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:46:45.9183709' AS Time), 55)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'1G6nFN3LhIx5Nr4_XdszruAPqMff5FSp', CAST(N'04:52:18.3805751' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:56:18.3805751' AS Time), 56)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Sr9nHympHvn1EeLgcuPO-qtDKHlDkg5d', CAST(N'04:55:10.1206091' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'04:59:10.1206091' AS Time), 57)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'9epeYiUvClpKLNTnh2guNzS__drw-ljT', CAST(N'04:57:26.4391424' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'05:01:26.4391424' AS Time), 58)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'IylGJMb8XxrEJho-7KHotxnJBLu7Gu0a', CAST(N'04:59:27.2749375' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'05:03:27.2749375' AS Time), 59)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'zQagiMiDPic5Kc46QEZa2VXM1QBFu-_V', CAST(N'05:01:10.3958687' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'05:05:10.3958687' AS Time), 60)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'2qYb9MDTTQzVcUI5KqEBiAGL9uRN8Mpj', CAST(N'05:02:35.7478320' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'05:04:30.0226012' AS Time), 61)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'Mre-_SijkPOR5pyZAmNRvCwS6RtsZupd', CAST(N'05:04:54.1772828' AS Time), CAST(N'2024-05-30' AS Date), CAST(N'05:05:18.1173651' AS Time), 62)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'GXOOpVdFZJWV1gJOBEmBl9fth7MDb-5S', CAST(N'22:15:00.6340507' AS Time), CAST(N'2024-06-05' AS Date), CAST(N'22:19:00.6340507' AS Time), 63)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'vi2p5M8LCiJkN1dgIL8f4V1EbtKLCEEz', CAST(N'16:45:46.7419582' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'16:49:46.7419582' AS Time), 64)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'BBqapcdALxVNzyqReybR7DJ7tUJntj7q', CAST(N'16:54:10.5812368' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'16:58:10.5812368' AS Time), 65)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'2b5boF6O6JfaxZsyrcHEQUfdlAEZmmcU', CAST(N'16:54:47.2612385' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'16:58:47.2612385' AS Time), 66)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'NR9r5nm39I4t1YoEb7a2fum6vAGY_4k-', CAST(N'16:55:21.9599840' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'16:59:21.9599840' AS Time), 67)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'k6aG0fiBJY66whRTiJRJuI8Bhh7pyfOO', CAST(N'16:55:30.3923564' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'16:59:30.3923564' AS Time), 68)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'gNMQb93cF2F7Jbknh3v37uyAK3_qXPxF', CAST(N'17:02:03.7835462' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:06:03.7835462' AS Time), 69)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'TSFPJo-rZm7KdOdpsMSL4sul9Ob8CiAy', CAST(N'17:02:04.7319761' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:06:04.7319761' AS Time), 70)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'Iorn-zWfEva70hQDNMKZkA_IyTvp_zo3', CAST(N'17:02:24.0480198' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:06:24.0480198' AS Time), 71)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'WbLVk9L2WPlWHZ0DFO_r9xsTK1C3DfzA', CAST(N'17:03:31.3250509' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:07:31.3250509' AS Time), 72)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vulqhe170481@fpt.edu.vn', N'jhwpBPT9y0I1cMFsxTF77OpOswyRWftt', CAST(N'17:04:37.7515184' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:08:37.7515184' AS Time), 73)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vulqhe170481@fpt.edu.vn', N'9ly6ri3Dx5L6fkSQI6jIoWDfdZEfKGhd', CAST(N'17:04:53.7832710' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:08:53.7832710' AS Time), 74)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vulqhe170481@fpt.edu.vn', N'hTliSMpYyPYmAsULW5xpY_0ODo6UQlfc', CAST(N'17:04:54.0163437' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:08:54.0163437' AS Time), 75)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'SB85AoIx2sgmVL3c8QhTnMQ6YL0UbVuw', CAST(N'17:05:32.0781811' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:09:32.0781811' AS Time), 76)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'namlegend586@gmail.com', N'WjwA1mGQh5TqP6VfsIuW1bSJD1x-AiQf', CAST(N'17:05:38.1225237' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:09:38.1225237' AS Time), 77)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'namnvhe170141@fpt.edu.vn', N'dniwBSMe1MDHbB35RIMTOV3oQvGyEbxs', CAST(N'17:05:51.7276719' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:09:51.7276719' AS Time), 78)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'RLC_x2ADnuA2wVmy1AT_YqDQxgpIlL_T', CAST(N'17:06:51.2354926' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:10:51.2354926' AS Time), 79)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'd_Gz-RqIFDd9thUHENVQHzh76H8SC26G', CAST(N'17:07:27.1712313' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:11:27.1712313' AS Time), 80)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'LJkDpv-aLdbhstpctTUL3GlM5VnOCSKP', CAST(N'17:08:18.1370421' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:12:18.1370421' AS Time), 81)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'k0f4LqkCprfLB2rdT1MYQ5T4s3AFWx3Y', CAST(N'17:08:39.8020770' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:12:39.8020770' AS Time), 82)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'e25FiEPj6ntL7i1A-qmP4wZbffGcW9z_', CAST(N'17:09:27.9730883' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:13:27.9730883' AS Time), 83)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'YC1oTxrg6k1ce3IsJAIljluX2AgLMMcB', CAST(N'17:09:44.9455677' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:13:44.9455677' AS Time), 84)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'iLDA9_tyRk5lF2gUD6QsVUrkXaBsUBEh', CAST(N'17:09:49.9216391' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:13:49.9216391' AS Time), 85)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'IM8levPdHYJW2B57tP4MxNlHbI68nkDl', CAST(N'17:10:16.5391304' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:14:16.5391304' AS Time), 86)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'HwudjeRst9Ea8XzwFBWPh5uUXnEVokv-', CAST(N'17:10:17.2671048' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:14:17.2671048' AS Time), 87)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'tYgMDXSWD8rsIJWCAUWiOTAzCPjoa4Ho', CAST(N'17:10:23.5141873' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:14:23.5141873' AS Time), 88)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'3g5DIy5uBG2_j7M5uyYXw_EY8563Ide_', CAST(N'17:10:39.0296655' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:14:39.0296655' AS Time), 89)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'sYaVJP7JerKGoWlxc0O7wp3BNwfiM8Zp', CAST(N'17:20:23.5384981' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:24:23.5384981' AS Time), 90)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'yPQTk6nZ4XULPG5n3C9XxxnG0IZO5IX5', CAST(N'17:20:39.9485153' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:24:39.9485153' AS Time), 91)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'L497HosWMvVl7AtDLk-MJOEoQyRyxIBp', CAST(N'17:21:12.3050501' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:22:26.5204392' AS Time), 92)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'C2wRLt51aOWIFC9P1MGL8yDPFy85ae0s', CAST(N'17:23:15.8385290' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:27:15.8385290' AS Time), 93)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'5HcZ_GDEGqG-oLxc5iv1dBMeBsVyx9AO', CAST(N'17:25:53.2420644' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:29:53.2420644' AS Time), 94)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'_t3JvTM3N2RySoUYBrJiXnileNSlPEw8', CAST(N'17:26:30.1669573' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:30:30.1669573' AS Time), 95)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'vPPOrGtNhSw79ihpUI2N61oujZpK3I3U', CAST(N'17:27:27.9003404' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:31:27.9003404' AS Time), 96)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'PTEqWa46jcT9U1HESHSGoJphKx5Dy5QY', CAST(N'17:28:04.1330090' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:32:04.1330090' AS Time), 97)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'SW8pFp_-qggCAlQ0Quo5KVplPmhFl-fc', CAST(N'17:29:01.6296303' AS Time), CAST(N'2024-06-06' AS Date), CAST(N'17:33:01.6296303' AS Time), 98)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'oBFsUmCFC3vsVdd9XQphBMjWow3kKy0Y', CAST(N'08:50:19.2641786' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'08:54:19.2641786' AS Time), 99)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'sT4HMGXoKNjsLjfLusOaJPNx-_wUSLag', CAST(N'08:50:44.7751191' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'08:54:44.7751191' AS Time), 100)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N't2FLBQwXXi6J6jyCys-mZOquHMPdBzX-', CAST(N'08:51:08.1860117' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'08:55:08.1860117' AS Time), 101)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'Y5DmKREDi1tXTK_7WPFjSZFnqn2GDJAZ', CAST(N'08:51:42.2038138' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'08:55:42.2038138' AS Time), 102)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vulqhe170481@fpt.edu.vn', N'cuIZv0y0UghOVCU3hTnlO2g7in2rzarw', CAST(N'08:59:18.2953954' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'09:03:18.2953954' AS Time), 103)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'KdV9ElYm34TS-8cYV-GTxD6XNK7TxQEP', CAST(N'14:08:53.4379560' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'14:12:53.4379560' AS Time), 104)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'DEIPK88CRwXfhBDOpp9DJzPm00QKsupM', CAST(N'15:09:52.2184364' AS Time), CAST(N'2024-06-10' AS Date), CAST(N'15:13:52.2184364' AS Time), 105)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'NlEfh5OLzXsf00plIn1PiFmyYQrWnix2', CAST(N'00:03:11.8072432' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:07:11.8072432' AS Time), 106)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'WnMrCMmcOPhWZWgbVOWNiUOP17pGBeYx', CAST(N'00:12:21.7661796' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:16:21.7661796' AS Time), 107)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'4rQ5yTWegXQsf119sLn0EgZQ5nu8xDBH', CAST(N'00:17:22.8543924' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:21:22.8543924' AS Time), 108)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'58uia9_poZ2jb4KaoHqKj6OO7zbrQRNo', CAST(N'00:23:35.0391113' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:27:35.0391113' AS Time), 109)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'Du5pSNFezSnSP-7x1OBX0BGup29OLoGG', CAST(N'00:34:13.4172347' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:38:13.4172347' AS Time), 110)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'A5KwWiQSRPULMf0DJ2dEV9BNxXrKDkZJ', CAST(N'00:40:48.7777095' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:44:48.7777095' AS Time), 111)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'V7oa2ykBl0EuKBuadGDR6M4p0EE7PmVd', CAST(N'00:44:04.2329959' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:44:12.7995823' AS Time), 112)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'6wEV2w7HaHuSH0sOOmLFvRFcKUjZI4xx', CAST(N'00:45:35.6667481' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:45:51.6821359' AS Time), 113)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'482o0VK89igPigqdlqB0qlr0kH33s1RW', CAST(N'00:48:13.9989158' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:52:13.9989158' AS Time), 114)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'0WdL7Scz2xWU9GMin8zYfnvTsZIamBcK', CAST(N'00:53:56.7422975' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:57:56.7422975' AS Time), 115)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'oJu-caQu6hqcntlLRIP2e1ih0TNphZaV', CAST(N'00:57:21.3170052' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'00:57:35.8749737' AS Time), 116)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'FXOH3vHKHNBqZAq2pSZ-_e3qnGB5fgwH', CAST(N'01:29:35.3077235' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'01:30:11.9015221' AS Time), 117)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'mwv_PpSGkhbcVuXfFtBWgNEh4wKpYCz0', CAST(N'01:56:37.7712074' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'02:00:37.7712074' AS Time), 118)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'54i7OoNhtyJ56lX0nTvwzE9TqMORBKxX', CAST(N'02:05:52.7317598' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'02:09:52.7317598' AS Time), 119)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vulqhe170481@fpt.edu.vn', N'p8yzoXD8vSsoP33iLuhbE3-OO7MRFnUg', CAST(N'02:07:41.4493507' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'02:11:41.4493507' AS Time), 120)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'nTMcFsKtEKDGV1mDoD79952YWltKS6Qv', CAST(N'06:01:24.5149581' AS Time), CAST(N'2024-06-13' AS Date), CAST(N'06:02:05.3966753' AS Time), 121)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'XD7JzZX1rOhemwZHjZpb_AnkApSTam45', CAST(N'11:19:56.5215341' AS Time), CAST(N'2024-06-15' AS Date), CAST(N'11:23:56.5215341' AS Time), 122)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'vCQez5sxTz2BxL_NeTCqJUBaL3rsFgDq', CAST(N'00:43:34.4961137' AS Time), CAST(N'2024-07-21' AS Date), CAST(N'00:47:34.4961137' AS Time), 123)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'e3BhS6YypS9_PQYW9TkN2yAHvu1E7Pw3', CAST(N'02:53:55.9356931' AS Time), CAST(N'2024-07-22' AS Date), CAST(N'02:57:55.9356931' AS Time), 124)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'OqkoetYNC8-CULfcF5b_M9DJUeaPvWei', CAST(N'21:47:50.1157278' AS Time), CAST(N'2024-07-22' AS Date), CAST(N'21:49:01.8867363' AS Time), 125)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'dHvQd6eILwjN2zEAHugE-ATZFh09N0Ma', CAST(N'10:12:48.6174570' AS Time), CAST(N'2024-07-23' AS Date), CAST(N'10:14:35.8028302' AS Time), 126)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'4hwN1yWkpGU9SLCEQEp4cPx-U1ydhEW_', CAST(N'10:24:18.9690459' AS Time), CAST(N'2024-07-23' AS Date), CAST(N'10:26:15.5633559' AS Time), 127)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'RQyb3mtXmvIz89u3fC0dJYahJmpOPjwy', CAST(N'23:06:50.3756574' AS Time), CAST(N'2024-07-25' AS Date), CAST(N'23:10:50.3756574' AS Time), 128)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'I4G9tQ78gF6F4_My7gumQBfWqPNmw-zF', CAST(N'23:07:58.3226523' AS Time), CAST(N'2024-07-25' AS Date), CAST(N'23:11:58.3226523' AS Time), 129)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'nVsdpDdZpu5qoWZyiVI9MLdqB1H4-oKT', CAST(N'23:08:43.1715916' AS Time), CAST(N'2024-07-25' AS Date), CAST(N'23:09:24.3620927' AS Time), 130)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'AfBmuC5zJgw7tdTv0VofsOaWxkFKwElH', CAST(N'23:10:07.7408786' AS Time), CAST(N'2024-07-25' AS Date), CAST(N'23:11:00.5055678' AS Time), 131)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vunuong003@gmail.com', N'lRaOTNY29T_5oVhiTh6M9-BacmXUMaOJ', CAST(N'21:52:36.4586506' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'21:54:39.8935076' AS Time), 132)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vunuong003@gmail.com', N'XzeMB15i2M8ntC4XBUJmFfRya5cY2WML', CAST(N'22:02:31.7126176' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'22:06:31.7126176' AS Time), 133)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vunuong003@gmail.com', N'KhrBFCc9qTo1v8sS1NsbjUlaUxnj6L_C', CAST(N'22:04:54.9987484' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'22:06:20.7571423' AS Time), 134)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vunuong003@gmail.com', N'DQeVeobVUCy-WWZj2x2xMZrcFu3R-JAa', CAST(N'22:08:11.2301004' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'22:08:40.3875498' AS Time), 135)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'0961594860duong@gmail.com', N'JxXPJtUr-AeQwm1_axiQGkRi54ZioqND', CAST(N'23:49:18.3177937' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'23:50:27.4118944' AS Time), 136)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'dodat09615@gmail.com', N'rn2dfO7_un_q86JAxTA9E94PGuNaiP1S', CAST(N'23:51:35.2451999' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'23:55:35.2451999' AS Time), 137)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'duonglthe170176@fpt.edu.vn', N'hTZwuSLWwGTryySJ71RnSDVQdTd5zFmP', CAST(N'23:51:52.0350721' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'23:55:52.0350721' AS Time), 138)
GO
INSERT [dbo].[TokenSetTime] ([gmail], [token], [timeStart], [date], [timeEnd], [id]) VALUES (N'vunuong003@gmail.com', N'fip6YAEVcylRtTyPm9T2W9_wp2dlqMFK', CAST(N'23:52:34.7957927' AS Time), CAST(N'2024-07-26' AS Date), CAST(N'23:54:45.0392320' AS Time), 139)
GO
SET IDENTITY_INSERT [dbo].[TokenSetTime] OFF
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (1, 3)
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (1, 5)
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (2, 1)
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (4, 1)
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (5, 2)
GO
INSERT [dbo].[TypeDoctor_Service] ([ServiceId], [TypeDoctorId]) VALUES (6, 4)
GO
SET IDENTITY_INSERT [dbo].[typeOfDoctor] ON 
GO
INSERT [dbo].[typeOfDoctor] ([id], [name]) VALUES (1, N'Chuyên khoa nha chu')
GO
INSERT [dbo].[typeOfDoctor] ([id], [name]) VALUES (2, N'Chuyên khoa tổng quát')
GO
INSERT [dbo].[typeOfDoctor] ([id], [name]) VALUES (3, N'Chuyên khoa phẫu thuật')
GO
INSERT [dbo].[typeOfDoctor] ([id], [name]) VALUES (4, N'Chuyên khoa chỉnh nha')
GO
INSERT [dbo].[typeOfDoctor] ([id], [name]) VALUES (5, N'Chuyên khoa thẩm mỹ')
GO
SET IDENTITY_INSERT [dbo].[typeOfDoctor] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfPost] ON 
GO
INSERT [dbo].[TypeOfPost] ([id], [Name]) VALUES (1, N'Thông tin Y Khoa')
GO
INSERT [dbo].[TypeOfPost] ([id], [Name]) VALUES (2, N'Tư vấn sức khỏe răng miệng')
GO
INSERT [dbo].[TypeOfPost] ([id], [Name]) VALUES (3, N'Khuyến mãi và sự kiện')
GO
INSERT [dbo].[TypeOfPost] ([id], [Name]) VALUES (4, N'giới thiệu về chúng tôi')
GO
SET IDENTITY_INSERT [dbo].[TypeOfPost] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patients__357D4CF97BBB0D75]    Script Date: 7/27/2024 12:31:42 AM ******/
ALTER TABLE [dbo].[Patients] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__357D4CF99EE407DC]    Script Date: 7/27/2024 12:31:42 AM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppointmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentForm_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([gmail])
GO
ALTER TABLE [dbo].[AppointmentForm] CHECK CONSTRAINT [FK_AppointmentForm_Patients]
GO
ALTER TABLE [dbo].[AppointmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentForm_schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[schedule] ([Id])
GO
ALTER TABLE [dbo].[AppointmentForm] CHECK CONSTRAINT [FK_AppointmentForm_schedule]
GO
ALTER TABLE [dbo].[AppointmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentForm_Staff] FOREIGN KEY([staffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[AppointmentForm] CHECK CONSTRAINT [FK_AppointmentForm_Staff]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_DoctorPrice] FOREIGN KEY([DoctorPriceId])
REFERENCES [dbo].[DoctorPrice] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_DoctorPrice]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([gmail])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Patients]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Staff]
GO
ALTER TABLE [dbo].[Bill_Service]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Service_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[Bill_Service] CHECK CONSTRAINT [FK_Bill_Service_Bill]
GO
ALTER TABLE [dbo].[Bill_Service]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Service_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Bill_Service] CHECK CONSTRAINT [FK_Bill_Service_Service]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bill]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Service]
GO
ALTER TABLE [dbo].[CertificateStaff]  WITH CHECK ADD  CONSTRAINT [FK_CertificateStaff_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[CertificateStaff] CHECK CONSTRAINT [FK_CertificateStaff_Staff]
GO
ALTER TABLE [dbo].[changeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_changeSchedule_schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[schedule] ([Id])
GO
ALTER TABLE [dbo].[changeSchedule] CHECK CONSTRAINT [FK_changeSchedule_schedule]
GO
ALTER TABLE [dbo].[changeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_changeSchedule_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[changeSchedule] CHECK CONSTRAINT [FK_changeSchedule_Staff]
GO
ALTER TABLE [dbo].[discountService]  WITH CHECK ADD  CONSTRAINT [FK_discountService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[discountService] CHECK CONSTRAINT [FK_discountService_Service]
GO
ALTER TABLE [dbo].[DoctorPrice]  WITH CHECK ADD  CONSTRAINT [FK_DoctorPrice_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[DoctorPrice] CHECK CONSTRAINT [FK_DoctorPrice_Roles]
GO
ALTER TABLE [dbo].[LoanAmountOfPatients]  WITH CHECK ADD  CONSTRAINT [FK_LoanAmountOfPatients_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[LoanAmountOfPatients] CHECK CONSTRAINT [FK_LoanAmountOfPatients_Bill]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([gmail])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Patients]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Staff]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Staff1] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Staff1]
GO
ALTER TABLE [dbo].[MedicalRecord-Service]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord-Service_MedicalRecord] FOREIGN KEY([MedicalRecordId])
REFERENCES [dbo].[MedicalRecord] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord-Service] CHECK CONSTRAINT [FK_MedicalRecord-Service_MedicalRecord]
GO
ALTER TABLE [dbo].[MedicalRecord-Service]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord-Service_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[MedicalRecord-Service] CHECK CONSTRAINT [FK_MedicalRecord-Service_Service]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Roles]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_TypeOfPost] FOREIGN KEY([TypeOfPostId])
REFERENCES [dbo].[TypeOfPost] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_TypeOfPost]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Patients] FOREIGN KEY([PatientsId])
REFERENCES [dbo].[Patients] ([gmail])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Patients]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Staff]
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionDetail_Prescription] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Prescription] ([id])
GO
ALTER TABLE [dbo].[PrescriptionDetail] CHECK CONSTRAINT [FK_PrescriptionDetail_Prescription]
GO
ALTER TABLE [dbo].[Schedule_Patients]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Patients_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([gmail])
GO
ALTER TABLE [dbo].[Schedule_Patients] CHECK CONSTRAINT [FK_Schedule_Patients_Patients]
GO
ALTER TABLE [dbo].[Schedule_Patients]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Patients_schedule] FOREIGN KEY([scheduleId])
REFERENCES [dbo].[schedule] ([Id])
GO
ALTER TABLE [dbo].[Schedule_Patients] CHECK CONSTRAINT [FK_Schedule_Patients_schedule]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceType] FOREIGN KEY([ServiceTypeID])
REFERENCES [dbo].[ServiceType] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceType]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetail_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_ServiceDetail_Service]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Roles]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Room]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_typeOfDoctor] FOREIGN KEY([typeOfDoctorId])
REFERENCES [dbo].[typeOfDoctor] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_typeOfDoctor]
GO
ALTER TABLE [dbo].[staff_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_schedule_schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[schedule] ([Id])
GO
ALTER TABLE [dbo].[staff_schedule] CHECK CONSTRAINT [FK_staff_schedule_schedule]
GO
ALTER TABLE [dbo].[TypeDoctor_Service]  WITH CHECK ADD  CONSTRAINT [FK_TypeDoctor_Service_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[TypeDoctor_Service] CHECK CONSTRAINT [FK_TypeDoctor_Service_Service]
GO
ALTER TABLE [dbo].[TypeDoctor_Service]  WITH CHECK ADD  CONSTRAINT [FK_TypeDoctor_Service_typeOfDoctor] FOREIGN KEY([TypeDoctorId])
REFERENCES [dbo].[typeOfDoctor] ([id])
GO
ALTER TABLE [dbo].[TypeDoctor_Service] CHECK CONSTRAINT [FK_TypeDoctor_Service_typeOfDoctor]
GO
ALTER TABLE [dbo].[workCaculate]  WITH CHECK ADD  CONSTRAINT [FK_workCaculate_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Gmail])
GO
ALTER TABLE [dbo].[workCaculate] CHECK CONSTRAINT [FK_workCaculate_Staff]
GO
USE [master]
GO
ALTER DATABASE [swpUpdate] SET  READ_WRITE 
GO
