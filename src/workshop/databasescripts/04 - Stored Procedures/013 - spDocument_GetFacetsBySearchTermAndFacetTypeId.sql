IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE	ROUTINE_SCHEMA = 'dbo' 
AND ROUTINE_NAME = 'spDocument_GetFacetsBySearchTermAndFacetTypeId' )
BEGIN
	DROP PROCEDURE [dbo].spDocument_GetFacetsBySearchTermAndFacetTypeId
END
GO

CREATE PROCEDURE [dbo].spDocument_GetFacetsBySearchTermAndFacetTypeId
	@SearchTerm VARCHAR(275) = NULL,
	@FacetTypeId INT
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	SELECT    E.EntityId AS FacetId,
            E.EntityName AS FacetText,
            EG.EntityGroupId AS FacetTypeId,
            EG.EntityGroupName AS FacetType
    FROM Entity E 
    LEFT JOIN EntityGroup EG ON E.EntityGroupId = EG.EntityGroupId
    WHERE  (@SearchTerm IS NULL OR E.EntityName LIKE '%'+@SearchTerm+'%') 
    AND (@FacetTypeId = 0 OR EG.EntityGroupId = @FacetTypeId);

END