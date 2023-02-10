
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocument_UpdateDocument') BEGIN DROP PROCEDURE [dbo].[spDocument_UpdateDocument]
END
Go
CREATE PROCEDURE [dbo].[spDocument_UpdateDocument]
     @DocumentId bigint,
     @BlobId varchar(500),
     @FileName varchar(500),
     @FileType varchar(200),
     @FileSize int,
     @FilePath varchar(max),
     @Tags varchar(max),
     @StorageProvider varchar(50),
     @StorageContainer varchar(50),
     @StorageDirectory varchar(50) AS BEGIN
SET
     NOCOUNT ON BEGIN TRANSACTION
UPDATE  [dbo].[Document] SET 
          [BlobId]= @BlobId,
          [FileName]= @FileName,
          [FileType]= @FileType,
          [FileSize]= @FileSize,
          [FilePath]= @FilePath,
          [Tags] = @Tags,
          [StorageProvider]= @StorageProvider,
          [StorageContainer]= @StorageContainer,
          [StorageDirectory]= @StorageDirectory,
	      [ModificationDate]=getDate(),
		  [DocumentIndexerStatusId]=0,
	      [OverrideCount]=isnull([OverrideCount],0)+1
 WHERE DocumentId=@DocumentId
 COMMIT TRANSACTION
END