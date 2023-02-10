IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE	ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocument_GetDocumentEntityItemsByDocumentId' )
BEGIN
	DROP PROCEDURE [dbo].[spDocument_GetDocumentEntityItemsByDocumentId]
END
GO

CREATE PROCEDURE [dbo].[spDocument_GetDocumentEntityItemsByDocumentId]	
	@DocumentId BIGINT
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	SELECT	DEX.DocumentEntityXrefID,
			ISNULL(DEX.DocumentID, @DocumentId) AS DocumentId,
			E.EntityId,
			E.EntityName,
			DEI.DocumentEntityItemId,
			DEI.EntityText,
			DEI.OffSet,
			DEI.Length,
			CAST(DEI.ConfidenceScore AS NUMERIC(3,2)) AS ConfidenceScore,
			E.EntityGroupId,
			EG.EntityGroupName
	FROM	Entity E 
	LEFT JOIN EntityGroup EG ON EG.EntityGroupId = E.EntityGroupId
	LEFT JOIN DocumentEntityXref DEX ON E.EntityId = DEX.EntityId AND DEX.DocumentId = @DocumentId
	LEFT JOIN DocumentEntityItem DEI ON DEI.DocumentEntityXrefId = DEX.DocumentEntityXrefID
	ORDER BY ISNULL(DEX.DocumentID, @DocumentId),
			E.EntityGroupId,
			E.EntityId,
			DEI.EntityText
END