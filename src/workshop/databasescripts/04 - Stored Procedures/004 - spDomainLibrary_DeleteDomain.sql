IF EXISTS ( SELECT 1
			FROM	INFORMATION_SCHEMA.ROUTINES
			WHERE	ROUTINE_SCHEMA = 'dbo'
					AND ROUTINE_NAME = 'spDomainLibrary_DeleteDomain' )
BEGIN
	DROP PROCEDURE [dbo].[spDomainLibrary_DeleteDomain]
END
Go

CREATE PROCEDURE [dbo].[spDomainLibrary_DeleteDomain]  
    @NewDomainId Int
AS  
BEGIN  
	SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET XACT_ABORT ON 

	IF EXISTS ( SELECT 1 FROM TreatmentDomain WHERE NewDomainId = @NewDomainId )
		BEGIN 
			RAISERROR('Domain is Associated with Treatment Domain, Cannot Delete', 16, 0)
		    RETURN
		END
        
	IF EXISTS ( SELECT 1 FROM ClientAspirationNewDomainXref WHERE NewDomainId = @NewDomainId )
		BEGIN 
			RAISERROR('Domain is Associated with Client Aspirations, Cannot Delete', 16, 0)
			RETURN
		END

	BEGIN TRANSACTION
		DELETE FROM NewDomain WHERE NewDomainId = @NewDomainId
    COMMIT TRANSACTION
END

IF NOT EXISTS ( SELECT 1
                 FROM   ::
                        fn_listextendedproperty(N'MS_Description', N'SCHEMA',
                                                N'dbo', N'PROCEDURE',
                                                N'spDomainLibrary_DeleteDomain', 
												Null, Null) )
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'This Stored Procedure is Used to Delete Domain Details' ,
	@level0type=N'SCHEMA',
	@level0name=N'dbo', 
	@level1type=N'PROCEDURE',
	@level1name=N'spDomainLibrary_DeleteDomain'

IF NOT EXISTS ( SELECT 1
						FROM    ::
								fn_listextendedproperty(N'MS_Description', N'SCHEMA',
														N'dbo', N'PROCEDURE',
														N'spDomainLibrary_DeleteDomain', N'Parameter', N'@NewDomainId') )
EXEC sys.sp_addextendedproperty 
	@name = N'MS_Description',
	@value = N'This Parameter Passes the Id for Domain Which Needs to be Deleted',
	@level0type = N'SCHEMA', 
	@level0name = N'dbo', 
	@level1type = N'PROCEDURE',
	@level1name = N'spDomainLibrary_DeleteDomain',
	@level2type = N'Parameter', 
	@level2name = N'@NewDomainId';
GO

