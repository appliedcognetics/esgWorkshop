GO
SET
     ANSI_NULLS ON;

GO
SET
     QUOTED_IDENTIFIER ON;

GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Document]')) 
	BEGIN
    CREATE TABLE [DBO].[Document] (
          DocumentId BIGINT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
          CONSTRAINT [PK_Document_DocumentId] PRIMARY KEY CLUSTERED ([DocumentId] ASC),
          BlobId varchar(500) NULL,
          FileName varchar(500) NULL,
          FileType varchar(200) NULL,
          FileSize int NULL,
          FilePath varchar(max) NULL,
          Tags varchar(max) NULL,
          StorageProvider varchar(50) NULL,
          StorageContainer varchar(50) NULL,
          StorageDirectory varchar(50) NULL,
          CreationDate DATETIME DEFAULT GETDATE(),
          CreatedBy BIGINT,
          ModificationDate DATETIME DEFAULT GETDATE(),
          ModifiedBy BIGINT,
          OverrideCount int default 0,
          DocumentIndexerStatusId int 
     )
  END
GO
     IF NOT EXISTS (SELECT 1 FROM :: fn_listextendedproperty(
                    N'MS_Description',
                    N'SCHEMA',
                    N'dbo',
                    N'TABLE',
                    N'Document',
                    NULL,
                    NULL
               )
     ) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
     @value = N'This Table Stores New Document Details',
     @level0type = N'SCHEMA',
     @level0name = N'dbo',
     @level1type = N'TABLE',
     @level1name = N'Document';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'DocumentId'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores the Id of Newly Created Document',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'DocumentId';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'FileName'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores the  New Document Description',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'FileName';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'CreationDate'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores Created Date',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'CreationDate';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'CreatedBy'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores Created By',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'CreatedBy';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'ModificationDate'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores Modified Date',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'ModificationDate';

IF NOT EXISTS (
     SELECT
          1
     FROM
          :: fn_listextendedproperty(
               N'MS_Description',
               N'SCHEMA',
               N'dbo',
               N'TABLE',
               N'Document',
               N'COLUMN',
               N'ModifiedBy'
          )
) EXEC sys.sp_addextendedproperty @name = N'MS_Description',
@value = N'This ColumNStores Modified By',
@level0type = N'SCHEMA',
@level0name = N'dbo',
@level1type = N'TABLE',
@level1name = N'Document',
@level2type = N'COLUMN',
@level2name = N'ModifiedBy';

GO