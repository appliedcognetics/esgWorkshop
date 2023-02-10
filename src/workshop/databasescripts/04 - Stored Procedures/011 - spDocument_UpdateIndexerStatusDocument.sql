IF EXISTS ( SELECT 1
			FROM	INFORMATION_SCHEMA.ROUTINES
			WHERE	ROUTINE_SCHEMA = 'dbo'
					AND ROUTINE_NAME = 'spDocument_UpdateIndexerStatusDocument' )
BEGIN
	DROP PROCEDURE [dbo].spDocument_UpdateIndexerStatusDocument
END
GO

CREATE PROCEDURE [dbo].spDocument_UpdateIndexerStatusDocument  
    @documentId bigint,
    @documentIndexerStatus INT
AS  
BEGIN  
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET XACT_ABORT ON 


	    BEGIN TRANSACTION
		    UPDATE Document SET DocumentIndexerStatusId = @documentIndexerStatus,
		    ModificationDate = GETDATE()
		    WHERE  DocumentId = @documentId; 
        COMMIT TRANSACTION

		SELECT DocumentId , DocumentIndexerStatusId
        FROM   Document 
        WHERE  DocumentId = @documentId  
END

GO