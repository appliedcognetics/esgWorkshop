IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE	ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spDocument_GetDocuments' )
BEGIN
	DROP PROCEDURE [dbo].[spDocument_GetDocuments]
END
GO

CREATE PROCEDURE [dbo].[spDocument_GetDocuments]	
	@SearchTerm VARCHAR(275) = NULL,
	@SearchFacets VARCHAR(MAX) = NULL,
	@PageSize INT = NULL,
	@PageNumber INT = NULL,	
	@SortBy VARCHAR(50) = NULL,
	@SortDirection VARCHAR(10) = Null,
	@BlobIds VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	IF ((ISNULL(@PageSize, -1) < 0) OR (@PageSize > 0 AND ISNULL(@PageNumber, -1) <= 0))
	BEGIN
		RAISERROR('Invalid values provided for parameters @PageNumber and @PageSize', 16, 0)
		RETURN
	END
	
	IF (ISNULL(@SortBy, '') = '')
	BEGIN
		SET @SortBy = 'CreationDate'
     END

	IF (ISNULL(@SortDirection, '') = '')
	BEGIN
		SET @SortDirection = 'ASC'
     END	

	DECLARE @TotalCount INT = 0
	DECLARE @Offset INT = NULL

	SET @Totalcount = 
		(SELECT	COUNT(DISTINCT D.DocumentId) FROM [dbo].[Document] AS D	
		WHERE (@SearchFacets IS NULL 
		OR EXISTS (SELECT * FROM [dbo].[DocumentEntityXref] AS DEX LEFT JOIN [dbo].[Entity] AS E ON E.EntityId = DEX.EntityId
		WHERE D.DocumentId = DEX.DocumentID AND (E.EntityName IN (SELECT value FROM STRING_SPLIT(@SearchFacets,'|')))))
		AND (@BlobIds IS NULL OR (D.BlobId IN (SELECT value FROM STRING_SPLIT(@BlobIds,'|')))))

	IF(ISNULL(@PageSize,0) = 0)
	BEGIN		
		IF(@TotalCount = 0)
		BEGIN
			SET @PageSize = 1
		END
		ELSE
		BEGIN
			SET @PageSize = @TotalCount
		END
		SET @Offset = 0 
	END
	ELSE
	BEGIN
		SET @Offset =  (@PageNumber - 1) * @PageSize
	END

	 CREATE TABLE #finaldata (
          DocumentId BIGINT,
          BlobId varchar(500),
          FileName varchar(500),
          FileType varchar(200),
          FileSize int,
          FilePath varchar(max),
          CreationDate DATETIME,
          CreatedBy BIGINT,
          ModificationDate DATETIME,
          ModifiedBy BIGINT
     )
	
	INSERT INTO #finaldata
	(
		DocumentId,
		BlobId,
		FileName,
		FileType,
		FilePath,
		FileSize,
		CreationDate,
		ModificationDate,
		CreatedBy,
		ModifiedBy
	)
	SELECT	D.DocumentId,
			D.BlobId,
			D.FileName,
			D.FileType,
			D.FilePath,
			D.FileSize,
			D.CreationDate,
			D.ModificationDate,
			D.CreatedBy,
			D.ModifiedBy
	FROM	[dbo].[Document] AS D	
	WHERE	(@SearchFacets IS NULL OR EXISTS (SELECT * FROM [dbo].[DocumentEntityXref] AS DEX 
			LEFT JOIN [dbo].[Entity] AS E ON E.EntityId = DEX.EntityId
			WHERE	D.DocumentId = DEX.DocumentID
			AND (E.EntityName IN (SELECT value FROM STRING_SPLIT(@SearchFacets,'|')))))
			AND (@BlobIds IS NULL OR (D.BlobId IN (SELECT value FROM STRING_SPLIT(@BlobIds,'|'))))
	ORDER BY 
		CASE WHEN ISNULL(@SortDirection, 'ASC') = 'ASC' THEN CreationDate END ASC,
		CASE WHEN ISNULL(@SortDirection, 'ASC') = 'DESC' THEN CreationDate END DESC
	OFFSET @Offset Rows
	Fetch NEXT @PageSize ROWS ONLY

	SELECT	D.DocumentId,
			D.BlobId,
			D.FileName,
			D.FileType,
			D.FilePath,
			D.FileSize,
			D.CreationDate,
			D.ModificationDate,
			D.CreatedBy,
			D.ModifiedBy,
			CAST(AVG(DEI.ConfidenceScore) AS NUMERIC(3,2)) AS Score
	FROM	#finaldata D
	LEFT JOIN DocumentEntityXref DEX ON DEX.DocumentID = D.DocumentId
	LEFT JOIN DocumentEntityItem DEI ON DEI.DocumentEntityXrefId = DEX.DocumentEntityXrefID
	LEFT JOIN Entity E ON E.EntityId = DEX.EntityId
	GROUP BY D.DocumentId,
			D.BlobId,
			D.FileName,
			D.FileType,
			D.FilePath,
			D.FileSize,
			D.CreationDate,
			D.ModificationDate,
			D.CreatedBy,
			D.ModifiedBy

	SELECT * FROM [dbo].[GetPaginationInfo](@TotalCount, @Offset, @PageSize, @PageNumber, @SortBy, @SortDirection)
END