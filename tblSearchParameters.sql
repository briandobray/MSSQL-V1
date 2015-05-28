/****** Object:  Table [src_load].[tblSearchParameters]    Script Date: 1/15/2015 11:53:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [src_load].[tblSearchParameters](
	[TableName] [varchar](255) NULL,
	[FieldSearch] [varchar](255) NULL,
	[UniqueID] [varchar](9) NULL,
	[DT_RUN_ID] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

