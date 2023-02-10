GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS ( SELECT  1
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N'[dbo].[Entity]')
               )
    BEGIN
		CREATE TABLE [dbo].[Entity](
			[EntityId] [int] IDENTITY(1,1) NOT NULL,
			[EntityName] [varchar](100) NOT NULL,
			[EntityGroupId] [int] NULL,
			CONSTRAINT [PK__Category__19093A2B03B9159C] PRIMARY KEY CLUSTERED 
			(
				[EntityId] ASC
			)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
			CONSTRAINT [UQ_Entity] UNIQUE NONCLUSTERED 
			(
				[EntityName] ASC,
				[EntityGroupId] ASC
			)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
		
		ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_EntityGroup] FOREIGN KEY([EntityGroupId])
		REFERENCES [dbo].[EntityGroup] ([EntityGroupId])
		
		ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_EntityGroup]
		
	END
GO

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'Entity', NULL, NULL) )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Table Stores New Entity Details',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'Entity';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'Entity', N'COLUMN', N'EntityId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores the Id of Newly Created Entity',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'Entity',
	@level2type = N'COLUMN', 
	@level2name = N'EntityId';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'TABLE',
														N'Entity', N'COLUMN', N'EntityName') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Column Stores the  New Entity Description',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'TABLE',
	@level1name = N'Entity',
	@level2type = N'COLUMN', 
	@level2name = N'EntityName';

GO


insert into Entity(EntityName,EntityGroupId) values('SDG 1. No Poverty',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 2. Zero Hunger',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 3. Good Health And Well Being',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 4. Quality Education',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 5. Gender Equality',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 6. Clean Water And Sanitation',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 7. Affordable And Clean Energy',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 8. Decent Work And Economic Growth',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 9. Industry Innovation And Infrastructure',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 10. Reduce Inequalities',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 11. Sustainable Cities And Communities',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 12. Responsible Consumption And Production',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 13. Climate Action',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 14. Life Below Water',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 15. Life On Land',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 16. Peace Justice And Strong Institutions',1);
insert into Entity(EntityName,EntityGroupId) values('SDG 17. Partnerships For The Goals',1);

