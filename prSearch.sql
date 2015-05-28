/****** Object:  StoredProcedure [src_load].[prSearch]    Script Date: 1/15/2015 11:51:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE [src_load].[prSearch](@pRunID INT) AS 
/*===============================================================================================
  Created By:	Brian Dobray

  Description:	This procedure will run SQL keyword searches and output the results to a table
  
  Syntax:		EXEC [prSearch] @pRunID
				
  Tables:		tblSearchInput:
				Table that contains the search terms.  When modifications are made, insert the
				data with a new Run ID (Should match tblSearchParameters
				
				tblSearchParameters:
				The specified tables and fields to search.  When modifications are made, insert
				the new data with a new Run ID (Should match tblSearchInput)
				
				tblSearchOutput:
				Search results are written to this table along with the RunID
  
  Created On:	08/07/2013

  =============================================================================================*/


BEGIN
	
	--Truncate Table
	--TRUNCATE TABLE dbo.tblSearchOutput
	
	--Declare Variables
	DECLARE @vRefID NVARCHAR(MAX)
	DECLARE @vTableName NVARCHAR(MAX)
	DECLARE @vFieldSearch NVARCHAR(MAX)
	DECLARE @vSearchTerm NVARCHAR(MAX)
	DECLARE @vFieldUnique NVARCHAR(MAX)
	DECLARE @vSQL NVARCHAR(MAX)
	DECLARE @vRunID NVARCHAR(MAX)
	
	--Declare Cursor
	DECLARE crSearch CURSOR FAST_FORWARD FOR 
	SELECT	si.ReferenceID,
			si.SearchTerm,
			sp.TableName,
			sp.FieldSearch,
			sp.UniqueID,
			si.DT_RUN_ID
	FROM	dbo.tblSearchInput si
			JOIN dbo.tblSearchParameters sp
				ON	si.DT_RUN_ID = sp.DT_RUN_ID
	WHERE	si.DT_RUN_ID = @pRunID
			
	OPEN crSearch
	
		FETCH NEXT FROM crSearch INTO @vRefID, @vSearchTerm, @vTableName, @vFieldSearch, @vFieldUnique, @vRunID
		WHILE @@FETCH_STATUS = 0
		
			BEGIN
				
				--Insert into Results/Output Table
				SET @vSQL =	'INSERT INTO src_load.tblSearchOutput ' +
							'SELECT ' + CHAR(39) + @vRefID + CHAR(39) + ', ' +
									  + 'N' + CHAR(39) + @vSearchTerm + CHAR(39) + ', ' +
									  + 'CAST(' + @vFieldSearch + ' AS NVARCHAR(MAX)) ' + ', ' +
									  + CHAR(39) + @vTableName + CHAR(39) + ', ' +
									  + CHAR(39) + @vFieldSearch + CHAR(39) + ', ' +
									  @vFieldUnique + ', ' +
									  'GETDATE() ' + ', ' +
									  @vRunID + ' ' +
							'FROM ' + @vTableName + ' WITH (NOLOCK) ' +
							'WHERE CAST(' + @vFieldSearch + ' AS NVARCHAR(MAX)) LIKE N' + CHAR(39) + '%' + @vSearchTerm + '%' + CHAR(39) + ' COLLATE Latin1_General_CI_AI'
				PRINT (@VSQL)
				EXEC (@vSQL)
				
				FETCH NEXT FROM crSearch INTO @vRefID, @vSearchTerm, @vTableName, @vFieldSearch, @vFieldUnique, @vRunID
				
			END
	
	CLOSE crSearch
	DEALLOCATE crSearch
	
END
























GO

