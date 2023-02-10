GO
SET
     ANSI_NULLS ON;

GO
SET
     QUOTED_IDENTIFIER ON;

GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntityGroup]')) 
	BEGIN
    CREATE TABLE [dbo].[EntityGroup](
	    [EntityGroupId] [int] IDENTITY(1,1) NOT NULL,
	    [EntityGroupName] [varchar](50) NOT NULL,
        CONSTRAINT [PK_EntityGroup] PRIMARY KEY CLUSTERED 
        (
	        [EntityGroupId] ASC
        )WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
  END
GO
     IF NOT EXISTS (SELECT 1 FROM :: fn_listextendedproperty(
                    N'MS_Description',
                    N'SCHEMA',
                    N'dbo',
                    N'TABLE',
                    N'EntityGroup',
                    NULL,
                    NULL
               )
     ) EXEC sys.sp_addextendedproperty 
     @name = N'MS_Description',
     @value = N'This Table Stores Entity Group Details',
     @level0type = N'SCHEMA',
     @level0name = N'dbo',
     @level1type = N'TABLE',
     @level1name = N'EntityGroup';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'EntityGroup',
               N'COLUMN',
               N'EntityGroupId'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This Column Stores the Id of Newly Created Entity Group',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'EntityGroup',
@level2type = N'COLUMN',
@level2name = N'EntityGroupId';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'EntityGroup',
               N'COLUMN',
               N'EntityGroupName'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores the  New Entity Group Description',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'EntityGroup',
@level2type = N'COLUMN',
@level2name = N'EntityGroupName';

GO

--Do not change in the sequence of insert script--
INSERT INTO EntityGroup (EntityGroupName) VALUES('SDG Entity');
INSERT INTO EntityGroup (EntityGroupName) VALUES('Company');
INSERT INTO EntityGroup (EntityGroupName) VALUES('Industry');
INSERT INTO EntityGroup (EntityGroupName) VALUES('Location');