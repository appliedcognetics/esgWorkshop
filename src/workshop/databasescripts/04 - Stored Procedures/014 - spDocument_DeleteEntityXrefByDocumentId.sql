IF EXISTS ( SELECT 1 FROM	INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' 
AND ROUTINE_NAME = 'spDocument_DeleteEntityXrefByDocumentId' )
BEGIN
	DROP PROCEDURE [dbo].[spDocument_DeleteEntityXrefByDocumentId]
END
Go

CREATE PROCEDURE [dbo].[spDocument_DeleteEntityXrefByDocumentId]  
    @documentId bigint
AS  
BEGIN  
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET XACT_ABORT ON 

	BEGIN TRANSACTION
	 DELETE  FROM DocumentEntityItem 
	 WHERE DocumentEntityXrefId in (SELECT DocumentEntityXrefid FROM DocumentEntityXref 
	 WHERE DocumentID=@documentId); 

     DELETE from DocumentEntityXref WHERE DocumentID=@documentId;
	COMMIT TRANSACTION
END