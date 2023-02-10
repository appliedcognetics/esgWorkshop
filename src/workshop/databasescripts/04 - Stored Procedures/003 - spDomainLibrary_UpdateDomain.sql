IF EXISTS ( SELECT 1
			FROM	INFORMATION_SCHEMA.ROUTINES
			WHERE	ROUTINE_SCHEMA = 'dbo'
					AND ROUTINE_NAME = 'spDomainLibrary_UpdateDomain' )
BEGIN
	DROP PROCEDURE [dbo].[spDomainLibrary_UpdateDomain]
END
GO

CREATE PROCEDURE [dbo].[spDomainLibrary_UpdateDomain]  
    @NewDomainId INT,
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
			RAISERROR('Domain Name cannot be Blank.', 16, 0)
		    RETURN
		END

	IF EXISTS (SELECT 1 FROM NewDomain WHERE DomainName = @DomainName AND NewDomainId <> @NewDomainId)
		BEGIN 
			RAISERROR('Domain Already Exists, Cannot Update', 16, 0)
		    RETURN
		END	

	IF EXISTS (SELECT 1 FROM TreatmentDomain TD WHERE TD.IsActive = 1 AND TD.NewDomainId = @NewDomainId AND @IsActive = 0)
		BEGIN 
			RAISERROR('This Domain is referred by Treatment Domain, Cannot Deactivate', 16, 0)
		    RETURN
		END	

	IF EXISTS (SELECT 1 FROM ClientAspirationNewDomainXref CANDX WHERE CANDX.NewDomainId = @NewDomainId AND CANDX.[Deleted] = 0 AND @IsActive = 0)
		BEGIN 
			RAISERROR('This Domain is referred by Client Aspirations, Cannot Deactivate', 16, 0)
		    RETURN
		END	

	    BEGIN TRANSACTION
		    UPDATE NewDomain SET DomainName = @DomainName,
			IsActive = @IsActive,
		    Modifiedby = @UserId,
		    ModificationDate = GETDATE()
		    WHERE  NewDomainId = @NewdomainId; 
        COMMIT TRANSACTION

		SELECT NewDomainId , DomainName , IsActive
        FROM   NewDomain 
        WHERE  NewDomainId = @NewdomainId  
END

IF NOT EXISTS ( SELECT 1
                 FROM   ::
                        fn_listextendedproperty(N'MS_Description', N'SCHEMA',
                                                N'dbo', N'PROCEDURE',
                                                N'spDomainLibrary_UpdateDomain', 
												Null, Null) )
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'This Stored Procedure is Used to Update Domain Details' ,
	@level0type=N'SCHEMA',
	@level0name=N'dbo', 
	@level1type=N'PROCEDURE',
	@level1name=N'spDomainLibrary_UpdateDomain'

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_UpdateDomain', N'Parameter', N'@NewDomainId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Id for Domain Which Needs to be Updated',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_UpdateDomain',
	@level2type = N'Parameter', 
	@level2name = N'@NewDomainId';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_UpdateDomain', N'Parameter', N'@DomainName') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Domain Name Which Needs to be Updated',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_UpdateDomain',
	@level2type = N'Parameter', 
	@level2name = N'@DomainName';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_UpdateDomain', N'Parameter', N'@UserId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the User Id',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_UpdateDomain',
	@level2type = N'Parameter', 
	@level2name = N'@UserId';

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_UpdateDomain', N'Parameter', N'@IsActive') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the IsActive Flag',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_UpdateDomain',
	@level2type = N'Parameter', 
	@level2name = N'@IsActive';
GO