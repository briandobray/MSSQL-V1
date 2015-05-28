/****** Object:  Table [src_load].[tblSearchOutput]    Script Date: 1/15/2015 11:53:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [src_load].[tblSearchOutput](
	[ReferenceID] [nvarchar](4000) NULL,
	[SearchTerm] [nvarchar](4000) NULL,
	[OriginalFieldValue] [nvarchar](max) NULL,
	[TableName] [nvarchar](255) NULL,
	[FieldName] [nvarchar](255) NULL,
	[UniqueID] [bigint] NULL,
	[DateRan] [datetime] NULL,
	[DT_RUN_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

