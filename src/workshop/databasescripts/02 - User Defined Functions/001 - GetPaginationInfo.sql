IF EXISTS (	SELECT 1
			FROM INFORMATION_SCHEMA.ROUTINES
			WHERE ROUTINE_SCHEMA = 'dbo'
			AND ROUTINE_NAME = 'GetPaginationInfo')
BEGIN
	DROP FUNCTION [dbo].[GetPaginationInfo]
END
GO

CREATE FUNCTION [dbo].[GetPaginationInfo]
(
	@TotalRecordsCount Int,
	@Offset Int,
	@PageSize Int,
	@PageNumber Int,
	@SortBy VARCHAR(50),
	@SortDirection VARCHAR(10)
)
RETURNS @PaginationInfo TABLE
(
	TotalCount Int,
	Offset Int,
	PageSize Int,
	PageNumber Int,
	Hits Int,
	SortBy Varchar(50),
	SortDirection Varchar(10))
AS
BEGIN	
	INSERT INTO @PaginationInfo
	SELECT @TotalRecordsCount As TotalCount,
		   @Offset As Offset,
		   @PageSize As PageSize,
		   @PageNumber As PageNumber,
		   CASE 
		   WHEN @PageSize = 0 THEN @TotalRecordsCount
		   WHEN (@PageSize > 0 AND (@TotalRecordsCount - @Offset) >= @PageSize) THEN @PageSize
		   WHEN (@PageSize > 0 AND (@TotalRecordsCount - @Offset) < @PageSize AND (@TotalRecordsCount - @Offset) >= 0) THEN @TotalRecordsCount - @Offset
		   WHEN (@PageSize > 0 AND (@TotalRecordsCount - @Offset) < @PageSize AND (@TotalRecordsCount - @Offset) < 0) THEN 0
		   END AS 'Hits',
		   @SortBy,
		   @SortDirection
	RETURN
END
GO