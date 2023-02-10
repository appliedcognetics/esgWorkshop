GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS ( SELECT  1
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[DocumentEntityItem]')
               )
    BEGIN
		CREATE TABLE [dbo].[DocumentEntityItem](
			[DocumentEntityItemId] [bigint] IDENTITY(1,1) NOT NULL,
			[DocumentEntityXrefId] [bigint] NOT NULL,
			[EntityText] [varchar](250) NOT NULL,
			[OffSet] [numeric](8, 2) NULL,
			[Length] [int] NULL,
			[ConfidenceScore] [numeric](3, 2) NULL,
		 CONSTRAINT [PK__Document__3214EC27E86E5D91] PRIMARY KEY CLUSTERED 
		(
			[DocumentEntityItemId] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
GO

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', NULL, NULL) )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Table Stores New Document Entity Item Details',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', N'COLUMN', N'DocumentEntityItemId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores the Id of Newly Created Document Entity Item',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem',
	@level2type = N'COLUMN', 
	@level2name = N'DocumentEntityItemId';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', N'COLUMN', N'EntityText') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores the  New Entity Text',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem',
	@level2type = N'COLUMN', 
	@level2name = N'EntityText';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', N'COLUMN', N'OffSet') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores OffSet',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem',
	@level2type = N'COLUMN', 
	@level2name = N'OffSet';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', N'COLUMN', N'Length') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores Length',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem',
	@level2type = N'COLUMN', 
	@level2name = N'Length';
	
IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityItem', N'COLUMN', N'ConfidenceScore') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores Confidence Score',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityItem',
	@level2type = N'COLUMN', 
	@level2name = N'ConfidenceScore';
	
GO