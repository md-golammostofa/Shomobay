USE [master]
GO
/****** Object:  Database [MMSLDMS]    Script Date: 02-Oct-19 5:17:30 PM ******/
CREATE DATABASE [MMSLDMS]
GO

USE [MMSLDMS]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBranchInfo]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranchInfo](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [int] NULL,
	[BranchName] [nvarchar](50) NULL,
	[BranchCode] [nvarchar](15) NULL,
	[ShortName] [nvarchar](5) NULL,
	[Address] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblBranchInfo] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ShortName] [nvarchar](max) NULL,
	[OrgId] [int] NOT NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesignation](
	[DesigId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ShortName] [nvarchar](10) NULL,
	[OrgId] [int] NULL,
	[EntryUser] [nvarchar](80) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblDesignation] PRIMARY KEY CLUSTERED 
(
	[DesigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDiagnosticBillDetails]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiagnosticBillDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillInfoId] [bigint] NULL,
	[InvoiceNo] [nvarchar](max) NULL,
	[InvestigationId] [bigint] NULL,
	[Fee] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[NetTotal] [decimal](18, 2) NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblDiagnosticBillDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDiagnosticBillInfo]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiagnosticBillInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrgId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[InvoiceNo] [nvarchar](max) NULL,
	[PatientId] [nvarchar](100) NULL,
	[PatientName] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Year] [smallint] NULL,
	[Sex] [nvarchar](10) NULL,
	[ReferrerId] [nvarchar](50) NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[BankId] [bigint] NULL,
	[CashAmount] [decimal](18, 2) NULL,
	[CardAmount] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[ReceivedAmount] [decimal](18, 2) NULL,
	[DueAmount] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Status] [nvarchar](20) NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[DiscountPercent] [smallint] NULL,
	[InvestigationQty] [smallint] NULL,
	[Months] [smallint] NULL,
	[Days] [smallint] NULL,
 CONSTRAINT [PK_dbo.tblDiagnosticBillInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDoctorProfile]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoctorProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [nvarchar](30) NULL,
	[Prefix] [nvarchar](max) NULL,
	[FirstName] [nvarchar](70) NULL,
	[MiddleName] [nvarchar](70) NULL,
	[LastName] [nvarchar](50) NULL,
	[FatherName] [nvarchar](70) NULL,
	[MotherName] [nvarchar](70) NULL,
	[SpouseName] [nvarchar](70) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[ParmanentAddress] [nvarchar](150) NULL,
	[PresentAddress] [nvarchar](150) NULL,
	[MaritalStatus] [nvarchar](30) NULL,
	[Gender] [nvarchar](10) NULL,
	[City] [nvarchar](30) NULL,
	[Degrees] [nvarchar](250) NULL,
	[Experiences] [nvarchar](200) NULL,
	[CurrentJobLocation] [nvarchar](100) NULL,
	[YearsOfExperience] [int] NULL,
	[About] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[DateOfBirth] [datetime] NULL,
	[DepartmentId] [int] NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[LicenseNo] [nvarchar](20) NULL,
	[DesignationId] [int] NULL,
	[SpecializationTypeId] [int] NULL,
	[BranchId] [int] NULL,
	[InPatientChargeType] [nvarchar](15) NULL,
	[OutPatientChargeType] [nvarchar](15) NULL,
	[InPatientChargeValue] [float] NULL,
	[OutPatientChargeValue] [float] NULL,
	[EmployeeCode] [nvarchar](100) NULL,
	[AllowToLogin] [bit] NOT NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedUser] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[OrgId] [int] NOT NULL,
	[Nationality] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblDoctorProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeeInfo]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeInfo](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](100) NULL,
	[BranchId] [int] NULL,
	[DepartmentId] [int] NULL,
	[DesignationId] [int] NULL,
	[OrgId] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](20) NULL,
	[Gender] [nvarchar](15) NULL,
	[Email] [nvarchar](150) NULL,
	[HomeContactNo] [nvarchar](15) NULL,
	[DOB] [datetime] NULL,
	[MobileNo] [nvarchar](15) NULL,
	[Nationality] [nvarchar](50) NULL,
	[PresentAddress] [nvarchar](150) NULL,
	[ParmanentAddress] [nvarchar](150) NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[StateStatus] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[AllowToLogin] [bit] NOT NULL,
	[EntryUser] [nvarchar](100) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[EmpType] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblEmployeeInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblInvestigatinReferrer]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvestigatinReferrer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[OrgId] [bigint] NULL,
	[BranchId] [bigint] NULL,
 CONSTRAINT [PK_dbo.tblInvestigatinReferrer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblInvestigations]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvestigations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Fee] [float] NULL,
	[OrgId] [int] NULL,
	[BranchId] [int] NULL,
	[EntryUser] [nvarchar](100) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblInvestigations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMainMenus]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMainMenus](
	[MMId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](max) NULL,
	[ModuleID] [int] NOT NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedUser] [nvarchar](max) NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblMainMenus] PRIMARY KEY CLUSTERED 
(
	[MMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblModules]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModules](
	[MId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](max) NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](max) NULL,
	[ApprovedDate] [datetime] NULL,
	[IconName] [nvarchar](max) NULL,
	[IconColor] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.tblModules] PRIMARY KEY CLUSTERED 
(
	[MId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrganizations]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrganizations](
	[OrgId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryUser] [nvarchar](max) NULL,
	[ApprovedBy] [nvarchar](max) NULL,
	[ApprovedDate] [datetime] NULL,
	[ShortName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.tblOrganizations] PRIMARY KEY CLUSTERED 
(
	[OrgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrgAuthorization]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrgAuthorization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [int] NOT NULL,
	[SubmenuId] [int] NOT NULL,
	[MainmenuId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblOrgAuthorization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [int] NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoleWiseUserMenu]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleWiseUserMenu](
	[RoleWiseMenuId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[OrgId] [int] NOT NULL CONSTRAINT [DF__tblRoleWi__OrgId__147C05D0]  DEFAULT ((0)),
	[ModuleId] [int] NOT NULL,
	[MainmenuId] [int] NOT NULL,
	[SubmenuId] [int] NOT NULL,
	[Add] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[Approval] [bit] NOT NULL,
	[Report] [bit] NOT NULL,
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblRoleWiseUserMenu] PRIMARY KEY CLUSTERED 
(
	[RoleWiseMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSpecializationType]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpecializationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
	[OrgId] [int] NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblSpecializationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubmenus]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubmenus](
	[SubMenuId] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [nvarchar](max) NULL,
	[MainMenuId] [int] NOT NULL,
	[ControllName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[Area] [nvarchar](max) NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedUser] [nvarchar](max) NULL,
	[ApprovedDate] [datetime] NULL,
	[IsShow] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.tblSubmenus] PRIMARY KEY CLUSTERED 
(
	[SubMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserAuthorization]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserAuthorization](
	[TaskId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[ModuleId] [int] NOT NULL,
	[MainmenuId] [int] NOT NULL,
	[SubmenuId] [int] NOT NULL,
	[Add] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[Approval] [bit] NOT NULL,
	[Report] [bit] NOT NULL,
	[EntryUser] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](max) NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblUserAuthorization] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02-Oct-19 5:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmpId] [nvarchar](30) NULL,
	[OrgId] [int] NOT NULL,
	[RoleId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsRoleActive] [bit] NOT NULL CONSTRAINT [DF__tblUsers__IsRole__5AEE82B9]  DEFAULT ((0)),
	[EntryUser] [nvarchar](30) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](30) NULL,
	[ApprovedDate] [datetime] NULL,
	[UpdateBy] [nvarchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_dbo.tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblDiagnosticBillDetails] ON 

INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (1, NULL, N'INV-00232870', 1, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:03:32.870' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (2, NULL, N'INV-00232870', 3, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:03:32.873' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (3, NULL, N'INV-00242789', 3, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:05:42.790' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (4, NULL, N'INV-00242789', 2, CAST(200.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:05:42.790' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (5, NULL, N'INV-00245689', 1, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:15:45.713' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDiagnosticBillDetails] ([Id], [BillInfoId], [InvoiceNo], [InvestigationId], [Fee], [Discount], [SubTotal], [NetTotal], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (6, NULL, N'INV-0022644', 4, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'GuestUser1', CAST(N'2019-10-02 16:17:02.647' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblDiagnosticBillDetails] OFF
SET IDENTITY_INSERT [dbo].[tblDiagnosticBillInfo] ON 

INSERT [dbo].[tblDiagnosticBillInfo] ([Id], [OrgId], [BranchId], [InvoiceNo], [PatientId], [PatientName], [Address], [MobileNo], [Year], [Sex], [ReferrerId], [PaymentMode], [BankId], [CashAmount], [CardAmount], [DiscountAmount], [ReceivedAmount], [DueAmount], [SubTotal], [NetAmount], [Status], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate], [DiscountPercent], [InvestigationQty], [Months], [Days]) VALUES (1, 2, NULL, N'INV-00232870', N'PNT-00232870', N'Mr. Abc', N'Dhaka', N'20304050', 30, N'Male', N'1', N'Cash', 0, CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), N'Paid', N'GuestUser1', CAST(N'2019-10-02 16:03:32.870' AS DateTime), NULL, NULL, 0, 2, 0, 0)
INSERT [dbo].[tblDiagnosticBillInfo] ([Id], [OrgId], [BranchId], [InvoiceNo], [PatientId], [PatientName], [Address], [MobileNo], [Year], [Sex], [ReferrerId], [PaymentMode], [BankId], [CashAmount], [CardAmount], [DiscountAmount], [ReceivedAmount], [DueAmount], [SubTotal], [NetAmount], [Status], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate], [DiscountPercent], [InvestigationQty], [Months], [Days]) VALUES (2, 2, NULL, N'INV-00242789', N'PNT-00242789', N'Jack Leian', N'USA', N'40560325', 28, N'Male', N'1', N'Cash', 0, CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), N'Due', N'GuestUser1', CAST(N'2019-10-02 16:05:42.790' AS DateTime), NULL, NULL, 0, 2, 0, 0)
INSERT [dbo].[tblDiagnosticBillInfo] ([Id], [OrgId], [BranchId], [InvoiceNo], [PatientId], [PatientName], [Address], [MobileNo], [Year], [Sex], [ReferrerId], [PaymentMode], [BankId], [CashAmount], [CardAmount], [DiscountAmount], [ReceivedAmount], [DueAmount], [SubTotal], [NetAmount], [Status], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate], [DiscountPercent], [InvestigationQty], [Months], [Days]) VALUES (3, 2, NULL, N'INV-00245689', N'PNT-00245689', N'Adam Smith', N'UK', N'50203607', 30, N'Male', N'0', N'Cash', 0, CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), N'Paid', N'GuestUser1', CAST(N'2019-10-02 16:15:45.690' AS DateTime), NULL, NULL, 0, 1, 0, 0)
INSERT [dbo].[tblDiagnosticBillInfo] ([Id], [OrgId], [BranchId], [InvoiceNo], [PatientId], [PatientName], [Address], [MobileNo], [Year], [Sex], [ReferrerId], [PaymentMode], [BankId], [CashAmount], [CardAmount], [DiscountAmount], [ReceivedAmount], [DueAmount], [SubTotal], [NetAmount], [Status], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate], [DiscountPercent], [InvestigationQty], [Months], [Days]) VALUES (4, 2, NULL, N'INV-0022644', N'PNT-0022644', N'Bon Javi', N'Canada', N'7889454654', 36, N'Male', N'0', N'Cash', 0, CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Paid', N'GuestUser1', CAST(N'2019-10-02 16:17:02.643' AS DateTime), NULL, NULL, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[tblDiagnosticBillInfo] OFF
SET IDENTITY_INSERT [dbo].[tblInvestigatinReferrer] ON 

INSERT [dbo].[tblInvestigatinReferrer] ([Id], [Name], [Address], [PhoneNumber], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate], [OrgId], [BranchId]) VALUES (1, N'Mr. XYZ', N'Dhaka', N'0123456789', N'GuestUser1', CAST(N'2019-10-02 15:58:52.260' AS DateTime), N'GuestUser1', CAST(N'2019-10-02 15:59:09.857' AS DateTime), 2, NULL)
SET IDENTITY_INSERT [dbo].[tblInvestigatinReferrer] OFF
SET IDENTITY_INSERT [dbo].[tblInvestigations] ON 

INSERT [dbo].[tblInvestigations] ([Id], [Name], [Fee], [OrgId], [BranchId], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (1, N'CBC', 500, 2, NULL, N'GuestUser1', CAST(N'2019-10-02 15:57:57.770' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvestigations] ([Id], [Name], [Fee], [OrgId], [BranchId], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (2, N'Urine', 200, 2, NULL, N'GuestUser1', CAST(N'2019-10-02 15:58:19.030' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvestigations] ([Id], [Name], [Fee], [OrgId], [BranchId], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (3, N'RBS', 300, 2, NULL, N'GuestUser1', CAST(N'2019-10-02 15:58:37.040' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvestigations] ([Id], [Name], [Fee], [OrgId], [BranchId], [EntryUser], [EntryDate], [UpdateBy], [UpdateDate]) VALUES (4, N'CT Scan', 2000, 2, NULL, N'GuestUser1', CAST(N'2019-10-02 15:59:19.037' AS DateTime), N'GuestUser1', CAST(N'2019-10-02 16:02:30.053' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblInvestigations] OFF
SET IDENTITY_INSERT [dbo].[tblMainMenus] ON 

INSERT [dbo].[tblMainMenus] ([MMId], [MenuName], [ModuleID], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate]) VALUES (1, N'Module Management', 1, N'SYSTEM', CAST(N'2019-06-02 10:42:22.127' AS DateTime), N'SYSTEM', CAST(N'2019-06-02 10:42:22.127' AS DateTime))
INSERT [dbo].[tblMainMenus] ([MMId], [MenuName], [ModuleID], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate]) VALUES (2, N'User Management', 1, N'SYSTEM', CAST(N'2019-06-09 13:00:24.657' AS DateTime), N'SYSTEM', CAST(N'2019-06-09 13:00:24.657' AS DateTime))
INSERT [dbo].[tblMainMenus] ([MMId], [MenuName], [ModuleID], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate]) VALUES (3, N'Diagnostic Management', 2, N'SYSTEM', CAST(N'2019-09-17 17:05:06.887' AS DateTime), N'SYSTEM', CAST(N'2019-09-17 17:05:06.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMainMenus] OFF
SET IDENTITY_INSERT [dbo].[tblModules] ON 

INSERT [dbo].[tblModules] ([MId], [ModuleName], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate], [IconName], [IconColor]) VALUES (1, N'Admin Panel', N'SYSTEM', CAST(N'2019-05-23 10:58:12.167' AS DateTime), N'SYSTEM', CAST(N'2019-05-23 10:58:12.170' AS DateTime), N'fa fa-user-secret fa-5x', N'#764d4d')
INSERT [dbo].[tblModules] ([MId], [ModuleName], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate], [IconName], [IconColor]) VALUES (2, N'Diagnostic', N'SYSTEM', CAST(N'2019-09-17 17:04:45.353' AS DateTime), N'SYSTEM', CAST(N'2019-09-17 17:04:45.353' AS DateTime), N'N/A', N'N/A')
SET IDENTITY_INSERT [dbo].[tblModules] OFF
SET IDENTITY_INSERT [dbo].[tblOrganizations] ON 

INSERT [dbo].[tblOrganizations] ([OrgId], [Name], [Address], [Telephone], [MobileNumber], [Fax], [Email], [IsActive], [EntryDate], [EntryUser], [ApprovedBy], [ApprovedDate], [ShortName]) VALUES (1, N'MM Services Limited', N'Dhanmondi,Dhaka', N'0291415181', N'01515101010', NULL, NULL, 1, CAST(N'2019-10-02 15:27:12.110' AS DateTime), N'SYSTEM', NULL, NULL, N'MMSL')
INSERT [dbo].[tblOrganizations] ([OrgId], [Name], [Address], [Telephone], [MobileNumber], [Fax], [Email], [IsActive], [EntryDate], [EntryUser], [ApprovedBy], [ApprovedDate], [ShortName]) VALUES (2, N'Ahmed Diagnostic Center', N'Dhaka,Bangladesh', N'0123456789', N'0123456789', N'0123456789', N'labaid@aid.com', 1, CAST(N'2019-10-02 15:48:20.293' AS DateTime), N'SuperAdmin', N'SuperAdmin', CAST(N'2019-10-02 15:48:20.293' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblOrganizations] OFF
SET IDENTITY_INSERT [dbo].[tblOrgAuthorization] ON 

INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (1, 2, 12, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 15:52:38.473' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (2, 2, 13, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 15:52:38.473' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (3, 2, 14, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 15:52:38.473' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (4, 2, 15, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 15:52:38.473' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (5, 2, 16, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 15:52:38.473' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (6, 2, 10, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:14.097' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (7, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (8, 1, 2, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (9, 1, 3, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (10, 1, 4, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (11, 1, 5, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (12, 1, 6, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (13, 1, 7, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (14, 1, 8, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (15, 1, 9, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (16, 1, 10, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (17, 1, 11, 2, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (18, 1, 12, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (19, 1, 13, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (20, 1, 14, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (21, 1, 15, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
INSERT [dbo].[tblOrgAuthorization] ([Id], [OrgId], [SubmenuId], [MainmenuId], [ModuleId], [EntryUser], [EntryDate]) VALUES (22, 1, 16, 3, 2, N'SuperAdmin', CAST(N'2019-10-02 16:19:32.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrgAuthorization] OFF
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([RoleId], [OrgId], [RoleName], [Description], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (1, NULL, N'Admin', N'Admin Operation Role', N'SYSTEM', CAST(N'2019-06-18 15:39:30.517' AS DateTime), N'Admin', CAST(N'2019-06-18 15:39:30.517' AS DateTime))
INSERT [dbo].[tblRoles] ([RoleId], [OrgId], [RoleName], [Description], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (2, NULL, N'User', N'User operational role', N'SYSTEM', CAST(N'2019-06-18 17:04:10.160' AS DateTime), N'Admin', CAST(N'2019-06-18 17:04:10.160' AS DateTime))
INSERT [dbo].[tblRoles] ([RoleId], [OrgId], [RoleName], [Description], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (3, NULL, N'System Admin', N'Super Admin Role', N'SYSTEM', CAST(N'2019-08-10 12:19:18.397' AS DateTime), N'Admin', CAST(N'2019-08-10 12:19:18.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
SET IDENTITY_INSERT [dbo].[tblRoleWiseUserMenu] ON 

INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (1, 2, 2, 2, 3, 12, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:46.593' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:46.593' AS DateTime))
INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (2, 2, 2, 2, 3, 13, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:46.707' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:46.707' AS DateTime))
INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (3, 2, 2, 2, 3, 14, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:46.793' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:46.793' AS DateTime))
INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (4, 2, 2, 2, 3, 15, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:46.870' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:46.870' AS DateTime))
INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (5, 2, 2, 2, 3, 16, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:46.953' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:46.953' AS DateTime))
INSERT [dbo].[tblRoleWiseUserMenu] ([RoleWiseMenuId], [RoleId], [OrgId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (6, 2, 2, 1, 2, 10, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:58.643' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 16:19:58.643' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRoleWiseUserMenu] OFF
SET IDENTITY_INSERT [dbo].[tblSubmenus] ON 

INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (1, N'Module List', 1, N'Admin', N'ModuleList', NULL, N'SYSTEM', CAST(N'2019-06-02 10:43:19.463' AS DateTime), N'SYSTEM', CAST(N'2019-06-02 10:43:19.463' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (2, N'Mainmenu List', 1, N'Admin', N'MainMenuList', NULL, N'SYSTEM', CAST(N'2019-06-02 10:43:48.827' AS DateTime), N'SYSTEM', CAST(N'2019-06-02 10:43:48.827' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (3, N'Submenu List', 1, N'Admin', N'SubMenuList', NULL, N'SYSTEM', CAST(N'2019-06-02 10:44:33.180' AS DateTime), N'SYSTEM', CAST(N'2019-06-02 10:44:33.180' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (4, N'All Menu Item', 1, N'Admin', N'GetAllMenuItem', NULL, N'SYSTEM', CAST(N'2019-06-02 10:49:44.810' AS DateTime), N'SYSTEM', CAST(N'2019-06-02 10:49:44.810' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (5, N'User List', 2, N'Admin', N'UserList', NULL, N'SYSTEM', CAST(N'2019-06-09 13:04:49.343' AS DateTime), N'SYSTEM', CAST(N'2019-06-09 13:04:49.343' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (6, N'Organization List', 2, N'Admin', N'OrganizationList', NULL, N'SYSTEM', CAST(N'2019-06-11 10:31:27.243' AS DateTime), N'SYSTEM', CAST(N'2019-06-11 10:31:27.243' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (7, N'User Authorization', 2, N'Admin', N'SetUserMenu', NULL, N'SYSTEM', CAST(N'2019-06-18 12:12:05.047' AS DateTime), N'SYSTEM', CAST(N'2019-06-18 12:12:05.047' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (8, N'Role List', 2, N'Admin', N'RoleList', NULL, N'SYSTEM', CAST(N'2019-06-22 11:48:59.097' AS DateTime), N'SYSTEM', CAST(N'2019-06-22 11:48:59.097' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (9, N'Role Wise Authorization', 2, N'Admin', N'RoleWiseUserMenu', NULL, N'SYSTEM', CAST(N'2019-06-22 11:49:32.790' AS DateTime), N'SYSTEM', CAST(N'2019-06-22 11:49:32.790' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (10, N'Change Password', 2, N'Account', N'ChangePassword', NULL, N'SYSTEM', CAST(N'2019-07-10 15:49:21.653' AS DateTime), N'SYSTEM', CAST(N'2019-07-10 15:49:21.653' AS DateTime), 0)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (11, N'Org Authorization', 2, N'Admin', N'GetAllMenuItemForOrgAuth', NULL, N'SYSTEM', CAST(N'2019-09-14 15:30:00.697' AS DateTime), N'SYSTEM', CAST(N'2019-09-14 15:30:00.697' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (12, N'Investigation List', 3, N'Diagnostic', N'GetInvestigationList', NULL, N'SYSTEM', CAST(N'2019-09-17 17:05:57.167' AS DateTime), N'SYSTEM', CAST(N'2019-09-17 17:05:57.167' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (13, N'Referrer List', 3, N'Diagnostic', N'GetReferrerList', NULL, N'SYSTEM', CAST(N'2019-09-21 12:07:33.603' AS DateTime), N'SYSTEM', CAST(N'2019-09-21 12:07:33.603' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (14, N'Investigation Bill', 3, N'Diagnostic', N'CreateDiagnosticBill', NULL, N'SYSTEM', CAST(N'2019-09-23 09:37:49.817' AS DateTime), N'SYSTEM', CAST(N'2019-09-23 09:37:49.817' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (15, N'Bill Due Adjustment', 3, N'Diagnostic', N'GetDiagnosticDueList', NULL, N'SYSTEM', CAST(N'2019-09-30 11:42:46.290' AS DateTime), N'SYSTEM', CAST(N'2019-09-30 11:42:46.290' AS DateTime), 1)
INSERT [dbo].[tblSubmenus] ([SubMenuId], [SubMenuName], [MainMenuId], [ControllName], [ActionName], [Area], [EntryUser], [EntryDate], [ApprovedUser], [ApprovedDate], [IsShow]) VALUES (16, N'Report Panel', 3, N'Diagnostic', N'ReportPanel', NULL, N'SYSTEM', CAST(N'2019-10-01 10:27:21.700' AS DateTime), N'SYSTEM', CAST(N'2019-10-01 10:27:21.700' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblSubmenus] OFF
SET IDENTITY_INSERT [dbo].[tblUserAuthorization] ON 

INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (1, 2, NULL, 2, 3, 12, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:22.810' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:22.813' AS DateTime))
INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (2, 2, NULL, 2, 3, 13, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:22.897' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:22.897' AS DateTime))
INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (3, 2, NULL, 2, 3, 14, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:22.990' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:22.990' AS DateTime))
INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (4, 2, NULL, 2, 3, 15, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:23.057' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:23.057' AS DateTime))
INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (5, 2, NULL, 2, 3, 16, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 15:53:23.130' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:53:23.130' AS DateTime))
INSERT [dbo].[tblUserAuthorization] ([TaskId], [UserId], [RoleId], [ModuleId], [MainmenuId], [SubmenuId], [Add], [Edit], [Delete], [Approval], [Report], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate]) VALUES (6, 2, NULL, 1, 2, 10, 1, 1, 1, 1, 1, N'SuperAdmin', CAST(N'2019-10-02 16:19:49.430' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 16:19:49.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUserAuthorization] OFF
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserId], [UserName], [Email], [Password], [FirstName], [MiddleName], [LastName], [EmpId], [OrgId], [RoleId], [IsActive], [IsRoleActive], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate], [UpdateBy], [UpdateDate], [BranchId]) VALUES (1, N'SuperAdmin', N'yeasin@super.com', N'NRmacANXZLxcP3FyLn0u+fQEfntDUOQiRuhYv8lVjYc=', N'Mohammad', N'Yeasin', N'Ahmed', N'03020002', 1, 3, 1, 0, N'Admin', CAST(N'2019-08-10 12:21:45.363' AS DateTime), N'SYSTEM', CAST(N'2019-08-10 12:21:45.363' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [Email], [Password], [FirstName], [MiddleName], [LastName], [EmpId], [OrgId], [RoleId], [IsActive], [IsRoleActive], [EntryUser], [EntryDate], [ApprovedBy], [ApprovedDate], [UpdateBy], [UpdateDate], [BranchId]) VALUES (2, N'GuestUser1', NULL, N'NnsesSy1B7wALP7So+GLPlUJC2swhGl9ut/VecnX/hc=', N'Test User Ever', NULL, NULL, NULL, 2, 2, 1, 0, N'SuperAdmin', CAST(N'2019-10-02 15:48:54.573' AS DateTime), N'SuperAdmin', CAST(N'2019-10-02 15:48:54.573' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
ALTER TABLE [dbo].[tblDepartment] ADD  DEFAULT ((0)) FOR [OrgId]
GO
ALTER TABLE [dbo].[tblDoctorProfile] ADD  CONSTRAINT [DF__tblDoctor__Allow__37C5420D]  DEFAULT ((0)) FOR [AllowToLogin]
GO
ALTER TABLE [dbo].[tblDoctorProfile] ADD  DEFAULT ((0)) FOR [OrgId]
GO
ALTER TABLE [dbo].[tblEmployeeInfo] ADD  CONSTRAINT [DF__tblEmploy__Allow__324172E1]  DEFAULT ((0)) FOR [AllowToLogin]
GO
USE [master]
GO
ALTER DATABASE [MMSLDMS] SET  READ_WRITE 
GO
