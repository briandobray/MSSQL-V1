/****** Object:  Table [src_load].[tblSearchInput]    Script Date: 1/15/2015 11:53:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [src_load].[tblSearchInput](
	[GroupID] [int] NULL,
	[ReferenceID] [nvarchar](10) NULL,
	[OriginalSearchTerm] [nvarchar](4000) NULL,
	[SearchTerm] [nvarchar](4000) NULL,
	[Comments] [nvarchar](4000) NULL,
	[DT_RUN_ID] [int] NULL
) ON [PRIMARY]

GO

