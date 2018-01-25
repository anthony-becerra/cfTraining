<cfcomponent output="false">
	<!---getNewsYears() method --->
	<cffunction name="getNewsYears" access="public" returntype="query">
		<cfset var rsNewsYears ='' />
		<cfquery datasource="hdStreet" name="rsNewsYears">
			<!---Use YEAR() function to get only the year--->
			SELECT YEAR(FLD_NEWSCREATIONDATE) AS FLD_NEWSYEARS
			FROM TBL_NEWS
			ORDER BY FLD_NEWSCREATIONDATE DESC 
		</cfquery>
		<cfreturn rsNewsYears />
	</cffunction>
	<!---getLatestNews() method  --->
	<cffunction name="getLatestNews" access="public" returntype="query">
		<cfset var rsAllNews='' />
		<cfquery datasource="hdStreet" name="rsAllNews">
			SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
			FROM TBL_NEWS
			ORDER BY FLD_NEWSCREATIONDATE DESC 
		</cfquery>
		<cfreturn rsAllNews />
	</cffunction>
	<!---getNewsByID() method  --->
	<cffunction name="getNewsByID" access="public" returntype="query">
		<cfargument name="newsID" type="numeric" required="true" />
		<cfset var rsSingleNews='' />
		<cfquery datasource="hdStreet" name="rsSingleNews">
			SELECT TBL_NEWS.FLD_NEWSCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_USERS.FLD_USERFIRSTNAME, TBL_USERS.FLD_USERLASTNAME
			<!---INNER JOIN to take data only if it exists in both tables--->
			FROM TBL_NEWS INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
			WHERE FLD_NEWSID = #arguments.newsID#
		</cfquery>
		<cfreturn rsSingleNews>
	</cffunction>
	
	<!---getNewsForYear() method  --->
	<cffunction name="getNewsForYear" access="public" returntype="query">
		<cfargument name="year" type="numeric" required="true" />
		<cfset var rsNewsOfYear='' />
		<cfquery datasource="hdStreet" name="rsNewsOfYear">
			SELECT TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_NEWS.FLD_NEWSID
			FROM TBL_NEWS
			WHERE year(FLD_NEWSCREATIONDATE) = #arguments.year#
			ORDER BY FLD_NEWSCREATIONDATE DESC				
		</cfquery>
		<cfreturn rsNewsOfYear />
	</cffunction>
</cfcomponent>