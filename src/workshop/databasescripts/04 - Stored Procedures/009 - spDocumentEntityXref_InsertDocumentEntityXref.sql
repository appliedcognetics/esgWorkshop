IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocumentEntityXref_InsertDocumentEntityXref') BEGIN DROP PROCEDURE [dbo].[spDocumentEntityXref_InsertDocumentEntityXref]
END
Go
CREATE PROCEDURE [dbo].[spDocumentEntityXref_InsertDocumentEntityXref]
     @DocumentId int,
     @EntityId int
AS BEGIN
SET
    NOCOUNT ON BEGIN TRANSACTION
    INSERT INTO
         [dbo].[DocumentEntityXref] (
            [DocumentID],
            [EntityId]
         )
    Values
         (
             @DocumentId,
             @EntityId
         ) 
    COMMIT TRANSACTION
    
    SELECT
        DocumentEntityXrefID,
        DocumentID,
        EntityId
    FROM
         DocumentEntityXref
    WHERE
         DocumentEntityXrefId = SCOPE_IDENTITY()
END