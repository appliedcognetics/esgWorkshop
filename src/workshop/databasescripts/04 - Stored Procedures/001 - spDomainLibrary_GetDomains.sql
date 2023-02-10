IF EXISTS ( SELECT 1
			FROM	INFORMATION_SCHEMA.ROUTINES
			WHERE	ROUTINE_SCHEMA = 'dbo'
					AND ROUTINE_NAME = 'spDomainLibrary_GetDomains' )
BEGIN
	DROP PROCEDURE [dbo].[spDomainLibrary_GetDomains]
END
GO

CREATE PROCEDURE [dbo].[spDomainLibrary_GetDomains]	
	@SearchTerm VARCHAR(75) = NULL,
	@PageSize INT = NULL,
	@PageNumber INT = NULL,	
	@SortBy VARCHAR(50) = NULL,
	@SortDirection VARCHAR(10) = Null,
	@IsActive BIT = NULL
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
		SET @SortBy = 'DomainName'
    END

	IF (ISNULL(@SortDirection, '') = '')
	BEGIN
		SET @SortDirection = 'ASC'
    END	

	DECLARE @TotalCount INT = 0
	DECLARE @Offset INT = NULL

	SET @Totalcount = (SELECT COUNT(*) FROM	[dbo].[NewDomain] 
	WHERE			(
						@SearchTerm IS NULL OR DomainName Like @SearchTerm + '%'
					)
					AND		    
					(
						@IsActive IS NULL OR IsActive = @IsActive
					)					
	)

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

    SELECT		NewDomainId,
				DomainName,
				IsActive
	FROM	    [dbo].[NewDomain] 
	WHERE		(
					@SearchTerm IS NULL OR DomainName Like @SearchTerm + '%'
				)
	AND		    (
					@IsActive IS NULL OR IsActive = @IsActive 
				)
	ORDER BY 
    CASE WHEN  ISNULL(@SortDirection, 'ASC') = 'ASC' THEN DomainName END ASC,
	CASE WHEN  ISNULL(@SortDirection, 'ASC') = 'DESC' THEN DomainName END DESC
	OFFSET @Offset Rows
	Fetch NEXT @PageSize ROWS ONLY

	SELECT * FROM [dbo].[GetPaginationInfo](@TotalCount, @Offset, @PageSize, @PageNumber, @SortBy, @SortDirection)
END

IF NOT EXISTS ( SELECT 1
                 FROM   ::
                        fn_listextendedproperty(N'MS_Description', N'SCHEMA',
                                                N'dbo', N'PROCEDURE',
                                                N'spDomainLibrary_GetDomains', 
												Null, Null) )
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'This Stored Procedure Used to Get NewDomain Details' ,
	@level0type=N'SCHEMA',
	@level0name=N'dbo', 
	@level1type=N'PROCEDURE',
	@level1name=N'spDomainLibrary_GetDomains'

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_GetDomains', N'Parameter', N'@SearchTerm') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Search Term',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_GetDomains',
	@level2type = N'Parameter', 
	@level2name = N'@SearchTerm';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_GetDomains', N'Parameter', N'@SortDirection') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Sorting Order',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_GetDomains',
	@level2type = N'Parameter', 
	@level2name = N'@SortDirection';

IF NOT EXISTS (SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_GetDomains', N'Parameter', N'@PageSize'))
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Page Size',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_GetDomains',
	@level2type = N'Parameter', 
	@level2name = N'@PageSize';	

IF NOT EXISTS (SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_GetDomains', N'Parameter', N'@PageNumber'))
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Page Number',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_GetDomains',
	@level2type = N'Parameter', 
	@level2name = N'@PageNumber';

IF NOT EXISTS (SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_GetDomains', N'Parameter', N'@IsActive'))
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the IsActive Flag',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_GetDomains',
	@level2type = N'Parameter', 
	@level2name = N'@IsActive';

GO