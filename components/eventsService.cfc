<cfcomponent output="false">
	<!---getEventByID() method --->
	<cffunction name="getEventByID" access="public" output="false" returntype="query">
		<cfargument name="eventID" type="numeric" required="true" />
	    <cfset var rsSingleEvent='' />
	    <cfquery datasource="hdStreet" name="rsSingleEvent">
			SELECT TBL_EVENTS.FLD_EVENTID, TBL_EVENTS.FLD_EVENTNAME, TBL_EVENTS.FLD_EVENTDATETIME, TBL_EVENTS.FLD_EVENTLOCATION, TBL_EVENTS.FLD_EVENTVENUE, TBL_EVENTS.FLD_EVENTDESCRIPTION
			FROM TBL_EVENTS
			WHERE FLD_EVENTID = #arguments.eventID#
		</cfquery>
		<cfreturn rsSingleEvent />
	</cffunction>
	<!---getCurrentEvents() method --->
	<cffunction name="getCurrentEvents" access="public" output="false" returntype="query">
	    <cfset var rsCurrentEvents='' />
	    <cfquery datasource="hdStreet" name="rsCurrentEvents">
			SELECT FLD_EVENTID,FLD_EVENTNAME,FLD_EVENTDATETIME,FLD_EVENTLOCATION,FLD_EVENTVENUE
			FROM TBL_EVENTS
			<!---CF now() function returns current datetime--->
			WHERE FLD_EVENTDATETIME >= #now()#
			ORDER BY FLD_EVENTDATETIME ASC 
	    </cfquery>
	    <cfreturn rsCurrentEvents />
	</cffunction>
</cfcomponent>