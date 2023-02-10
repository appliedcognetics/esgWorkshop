IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE	ROUTINE_SCHEMA = 'dbo' 
AND ROUTINE_NAME = 'spDocument_GetAverageFacetsByDocumentId' )
BEGIN
	DROP PROCEDURE [dbo].spDocument_GetAverageFacetsByDocumentId
END
GO

CREATE PROCEDURE [dbo].spDocument_GetAverageFacetsByDocumentId
	@DocumentId BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	
	 CREATE TABLE #finaldata (
          FacetText varchar(500),
          FacetTypeId int
     )
	 INSERT INTO #finaldata
	(
		FacetText,
		FacetTypeId
	)
	SELECT E.EntityName as FacetText,E.EntityGroupId as FacetTypeId FROM DocumentEntityXref DEX
	LEFT JOIN Entity E ON E.EntityId = DEX.EntityId WHERE DEX.DocumentID = @DocumentId AND E.EntityGroupId <> 1;

	SELECT 
	E.EntityName AS FacetText,
	E.EntityGroupId AS FacetTypeId, 
	EG.EntityGroupName AS FacetType, 
	DEX.DocumentID  from #finaldata D
	LEFT JOIN Entity E ON E.EntityGroupId = D.FacetTypeId 
	LEFT JOIN DocumentEntityXref DEX ON E.EntityId = DEX.EntityId
	LEFT JOIN EntityGroup EG ON E.EntityGroupId = EG.EntityGroupId
	WHERE E.EntityGroupId IN (D.FacetTypeId) 
	AND E.EntityName IN (D.FacetText)

END