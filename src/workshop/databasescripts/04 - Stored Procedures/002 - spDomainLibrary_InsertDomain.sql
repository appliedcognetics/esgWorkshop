IF EXISTS ( SELECT 1
			FROM	INFORMATION_SCHEMA.ROUTINES
			WHERE	ROUTINE_SCHEMA = 'dbo'
					AND ROUTINE_NAME = 'spDomainLibrary_InsertDomain' )
BEGIN
	DROP PROCEDURE [dbo].[spDomainLibrary_InsertDomain]
END
Go

CREATE PROCEDURE [dbo].[spDomainLibrary_InsertDomain]   
	@DomainName VARCHAR(75),
	@UserId INT,
	@IsActive BIT
AS  
BEGIN  
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET XACT_ABORT ON 

	IF ISNULL(@DomainName, '') = ''
		BEGIN 
			RAISERROR('Domain Name Cannot be Blank.', 16, 0)
		    RETURN
		END

	IF EXISTS (SELECT 1 FROM NewDomain WHERE DomainName = @DomainName)
		BEGIN 
			RAISERROR('This Domain Already Exists. Please change the Domain Name.', 16, 0)
		    RETURN
		END
	
		BEGIN TRANSACTION
		INSERT INTO [dbo].[NewDomain]
		(		
			DomainName,
			IsActive,
			CreatedBy,
			CreationDate,
			ModifiedBy,
			ModificationDate
		)
		VALUES
		(
			@DomainName,
			@IsActive,
			@UserId,
			GetDate(),
			@UserId,
			Getdate()
		)	
	COMMIT TRANSACTION
	
	SELECT NewDomainId , DomainName , IsActive
    FROM   NewDomain 
    WHERE  NewDomainId = SCOPE_IDENTITY()
END

IF NOT EXISTS ( SELECT 1
                 FROM   ::
                        fn_listextendedproperty(N'MS_Description', N'SCHEMA',
                                                N'dbo', N'PROCEDURE',
                                                N'spDomainLibrary_InsertDomain', 
												Null, Null) )
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'This Stored Procedure is Used to Insert NewDomain Details' ,
	@level0type=N'SCHEMA',
	@level0name=N'dbo', 
	@level1type=N'PROCEDURE',
	@level1name=N'spDomainLibrary_InsertDomain'
GO

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_InsertDomain', N'Parameter', N'@DomainName') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Domain Name',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_InsertDomain',
	@level2type = N'Parameter', 
	@level2name = N'@DomainName';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_InsertDomain', N'Parameter', N'@UserId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the User Id',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_InsertDomain',
	@level2type = N'Parameter', 
	@level2name = N'@UserId';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_InsertDomain', N'Parameter', N'@IsActive') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the IsActive Flag',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_InsertDomain',
	@level2type = N'Parameter', 
	@level2name = N'@IsActive';
GO