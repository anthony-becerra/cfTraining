<cffunction name="getPageContent" returntype="Query" >
	<cfargument name="pageID" type="numeric" required="true">
	<cfset var rsPage=''>
	<cfquery datasource="hdStreet" name="rsPage">
		SELECT FLD_PAGETITLE, FLD_PAGECONTENT
		FROM TBL_PAGES
		WHERE FLD_PAGEID = #arguments.pageID# AND FLD_PAGEISACTIVE = 1
	</cfquery>
	<cfreturn rsPage>
</cffunction>