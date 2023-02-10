IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'dbo' AND ROUTINE_NAME = 'spEntity_InsertEntity') BEGIN DROP PROCEDURE [dbo].[spEntity_InsertEntity]
END
Go
CREATE PROCEDURE [dbo].[spEntity_InsertEntity]
     @EntityName varchar(100),
     @EntityGroupId int
AS BEGIN
SET
    NOCOUNT ON BEGIN TRANSACTION
    INSERT INTO
         [dbo].[Entity] (
              [EntityName],
              [EntityGroupId]
         )
    Values
         (
             @EntityName,
             @EntityGroupId
         ) 
    COMMIT TRANSACTION
    
    SELECT
         EntityId,
         EntityName,
         EntityGroupId  
    FROM
         Entity
    WHERE
         EntityId = SCOPE_IDENTITY()
END