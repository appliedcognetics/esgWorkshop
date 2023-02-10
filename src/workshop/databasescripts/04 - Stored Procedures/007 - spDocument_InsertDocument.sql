IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocument_InsertDocument') BEGIN DROP PROCEDURE [dbo].[spDocument_InsertDocument]
END
Go
CREATE PROCEDURE [dbo].[spDocument_InsertDocument]
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
INSERT INTO
     [dbo].[Document] (
          [BlobId],
          [FileName],
          [FileType],
          [FileSize],
          [FilePath],
          [Tags],
          [StorageProvider],
          [StorageContainer],
          [StorageDirectory]
     )
Values
     (
          @BlobId,
          @FileName,
          @FileType,
          @FileSize,
          @FilePath,
          @Tags,
          @StorageProvider,
          @StorageContainer,
          @StorageDirectory
     ) COMMIT TRANSACTION
SELECT
     DocumentId,
     BlobId,
     FileName,
     FileType,
     FilePath,
     Tags,
     StorageProvider,
     StorageContainer,
     StorageDirectory,
     FileSize,
	 CreationDate,
	 CreatedBy,
	 ModificationDate,
	 ModifiedBy
FROM
     Document
WHERE
     DocumentId = SCOPE_IDENTITY()
END