USE [master]
GO
/****** Object:  Database [MMSLDMS]    Script Date: 02-Oct-19 2:21:03 PM ******/
CREATE DATABASE [MMSLDMS]
GO

USE [MMSLDMS]
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
/****** Object:  Table [dbo].[tblBranchInfo]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
	[OrgId] [int] NOT NULL DEFAULT ((0)),
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.tblDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblDiagnosticBillDetails]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblDiagnosticBillInfo]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblDoctorProfile]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
	[AllowToLogin] [bit] NOT NULL CONSTRAINT [DF__tblDoctor__Allow__37C5420D]  DEFAULT ((0)),
	[EntryUser] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[ApprovedUser] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[OrgId] [int] NOT NULL DEFAULT ((0)),
	[Nationality] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tblDoctorProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeeInfo]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
	[AllowToLogin] [bit] NOT NULL CONSTRAINT [DF__tblEmploy__Allow__324172E1]  DEFAULT ((0)),
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
/****** Object:  Table [dbo].[tblInvestigatinReferrer]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblInvestigations]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblMainMenus]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblModules]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblOrganizations]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblOrgAuthorization]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblRoles]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblRoleWiseUserMenu]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblSpecializationType]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblSubmenus]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblUserAuthorization]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02-Oct-19 2:21:04 PM ******/
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
USE [master]
GO
ALTER DATABASE [MMSLHMS] SET  READ_WRITE 
GO
