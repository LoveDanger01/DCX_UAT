USE [EDW_Audit]
GO

/****** Object:  Table [dbo].[Salesforce_Event_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salesforce_Event_Log]') AND type in (N'U'))
DROP TABLE [dbo].[Salesforce_Event_Log]
GO

/****** Object:  Table [dbo].[Salesforce_Error_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salesforce_Error_Log]') AND type in (N'U'))
DROP TABLE [dbo].[Salesforce_Error_Log]
GO

/****** Object:  Table [dbo].[Process_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Process_Log]') AND type in (N'U'))
DROP TABLE [dbo].[Process_Log]
GO

/****** Object:  Table [dbo].[Delta_Settings]    Script Date: 5/17/2022 1:48:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Delta_Settings]') AND type in (N'U'))
DROP TABLE [dbo].[Delta_Settings]
GO

/****** Object:  Table [dbo].[Delta_Settings]    Script Date: 5/17/2022 1:48:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Delta_Settings](
	[Row_ID] [int] IDENTITY(1,1) NOT NULL,
	[Setting_Name] [nvarchar](50) NOT NULL,
	[Setting_Module] [nvarchar](50) NULL,
	[Setting_Value] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Process_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Process_Log](
	[Row_ID] [INT] IDENTITY(1,1) NOT NULL,
	[Process_ID] [BIGINT] NULL,
	[Start_Dt] [DATETIME2](7) NULL,
	[Stop_Dt] [DATETIME2](7) NULL,
	[Step_Description] [NVARCHAR](1500) NULL,
	[Row_Count] [INT] NULL,
 CONSTRAINT [PK__Process___7C36D05E3B38CF7E] PRIMARY KEY CLUSTERED 
(
	[Row_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Salesforce_Error_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salesforce_Error_Log](
	[Row_ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Log_Time] [DATETIME2](7) NULL,
	[Process_Nm] [VARCHAR](255) NULL,
	[Step_In_Process] [VARCHAR](255) NULL,
	[Fault_Code] [VARCHAR](255) NULL,
	[Fault_Description] [NVARCHAR](MAX) NULL,
	[Fault_Reason] [NVARCHAR](1000) NULL,
	[Module_Name] [VARCHAR](150) NULL,
 CONSTRAINT [PK__Salesfor__83C92FA1E813322F] PRIMARY KEY CLUSTERED 
(
	[Row_ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Salesforce_Event_Log]    Script Date: 5/17/2022 1:48:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Salesforce_Event_Log](
	[Row_ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[sf_Input_Payload] [TEXT] NULL,
	[Start_Time] [DATETIME2](7) NULL,
	[End_Time] [DATETIME2](7) NULL,
	[Process_Nm] [VARCHAR](255) NULL,
	[Process_Status] [VARCHAR](255) NULL,
	[Module_Name] [VARCHAR](150) NULL,
 CONSTRAINT [PK__Salesfor__83C92FA171781797] PRIMARY KEY CLUSTERED 
(
	[Row_ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


