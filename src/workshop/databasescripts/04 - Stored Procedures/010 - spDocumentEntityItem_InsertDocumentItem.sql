IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocumentEntityItem_InsertDocumentItem') BEGIN DROP PROCEDURE [dbo].[spDocumentEntityItem_InsertDocumentItem]
END
Go
CREATE PROCEDURE [dbo].[spDocumentEntityItem_InsertDocumentItem]
     @DocumentEntityXrefId int,
     @EntityText varchar(250),
     @OffSet numeric(8,2),
     @Length int,
     @ConfidenceScore numeric(3,2)
AS BEGIN
SET
    NOCOUNT ON BEGIN TRANSACTION
    INSERT INTO
         [dbo].[DocumentEntityItem] (
            [DocumentEntityXrefId],
            [EntityText],
            [OffSet],
            [Length],
            [ConfidenceScore]
         )
    Values
         (
             @DocumentEntityXrefId,
             @EntityText,
             @OffSet,
             @Length,
             @ConfidenceScore
         ) 
    COMMIT TRANSACTION
    
    SELECT
        DocumentEntityItemID,
        DocumentEntityXrefId,
        EntityText,
        OffSet,
        [Length],
        ConfidenceScore
    FROM
         DocumentEntityItem
    WHERE
         DocumentEntityItemId = SCOPE_IDENTITY()
END