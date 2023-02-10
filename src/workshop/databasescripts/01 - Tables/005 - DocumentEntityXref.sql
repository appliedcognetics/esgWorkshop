GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS ( SELECT  1
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[DocumentEntityXref]')
               )
    BEGIN
		CREATE TABLE [dbo].[DocumentEntityXref](
			[DocumentEntityXrefID] [bigint] IDENTITY(1,1) NOT NULL,
			[DocumentID] [bigint] NOT NULL,
			[EntityId] [int] NOT NULL,
		 CONSTRAINT [PK__Document__723A5FC679E44143] PRIMARY KEY CLUSTERED 
		(
			[DocumentEntityXrefID] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
		 CONSTRAINT [UQ_DocumentEntityXref] UNIQUE NONCLUSTERED 
		(
			[DocumentID] ASC,
			[EntityId] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]

		ALTER TABLE [dbo].[DocumentEntityXref]  WITH CHECK ADD  CONSTRAINT [FK_DocumentEntityXref_Document] FOREIGN KEY([DocumentID])
		REFERENCES [dbo].[Document] ([DocumentId])

		ALTER TABLE [dbo].[DocumentEntityXref] CHECK CONSTRAINT [FK_DocumentEntityXref_Document]

		ALTER TABLE [dbo].[DocumentEntityXref]  WITH CHECK ADD  CONSTRAINT [FK_DocumentEntityXref_Entity] FOREIGN KEY([EntityId])
		REFERENCES [dbo].[Entity] ([EntityId])

		ALTER TABLE [dbo].[DocumentEntityXref] CHECK CONSTRAINT [FK_DocumentEntityXref_Entity]

	END
GO

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityXref', NULL, NULL) )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Table Stores New DocumentEntityXref Details',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityXref';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'DocumentEntityXref', N'COLUMN', N'DocumentEntityXrefID') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores the Id of Newly Created DocumentEntityXref',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'DocumentEntityXref',
	@level2type = N'COLUMN', 
	@level2name = N'DocumentEntityXrefID';

GO