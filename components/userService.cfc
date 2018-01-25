<cfcomponent output="false">
	<!---updateUser() method --->
	<cffunction name="updateUser" access="public" output="false" returntype="void">
		<cfargument name="userFirstName" type="string" required="true" />
		<cfargument name="userLastName" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userRole" type="numeric" required="true" />
		<cfargument name="userInstrument" type="numeric" required="true" />
		<cfargument name="userComment" type="string" required="true" />
		<cfargument name="userApproved" type="numeric" required="true" />
		<cfargument name="userIsActive" type="numeric" required="true" />
		<cfargument name="userID" type="numeric" required="true" />
		<cfquery datasource="hdStreet" >
			UPDATE TBL_USERS
			SET
			FLD_USERFIRSTNAME = '#arguments.userFirstName#',
			FLD_USERLASTNAME = '#arguments.userLastName#',
			FLD_USEREMAIL = '#arguments.userEmail#',
			FLD_USERPASSWORD = '#arguments.userPassword#',
			FLD_USERINSTRUMENT = #arguments.userInstrument#,
			FLD_USERCOMMENT = '#arguments.userComment#'
			WHERE FLD_USERID = #arguments.userID#
		</cfquery>
	</cffunction>
	<!---addUser() method --->
	<cffunction name="addUser" access="public" output="false" returntype="void">
		<cfargument name="userFirstName" type="string" required="true" />
		<cfargument name="userLastName" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userRole" type="numeric" required="true" />
		<cfargument name="userInstrument" type="numeric" required="true" />
		<cfargument name="userComment" type="string" required="true" />
		<cfargument name="userApproved" type="numeric" required="true" />
		<cfargument name="userIsActive" type="numeric" required="true" />
		<cfquery datasource="hdStreet" >
			INSERT INTO TBL_USERS
			(FLD_USERFIRSTNAME,FLD_USERLASTNAME,FLD_USEREMAIL,FLD_USERPASSWORD,FLD_USERCOMMENT,FLD_USERAPPROVED,FLD_USERISACTIVE,FLD_USERROLE,FLD_USERINSTRUMENT)
			VALUES
			('#arguments.userFirstName#', '#arguments.userLastName#', '#arguments.userEmail#', '#arguments.userPassword#', '#arguments.userComment#', #arguments.userApproved#, #arguments.userIsActive#, #arguments.userRole#, #arguments.userInstrument#)
		</cfquery>
	</cffunction>
	<!---getInstruments() method --->
	<cffunction name="getInstruments" access="public" output="false" returntype="query">
		<cfset var rsInstrumentsList='' />
		<cfquery datasource="hdStreet" name="rsInstrumentsList">
			SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
			FROM TBL_INSTRUMENTS
			ORDER BY FLD_INSTRUMENTNAME ASC
		</cfquery>
		<cfreturn rsInstrumentsList>
	</cffunction>
	<!---validateUser() method --->
	<cffunction name="validateUser" access="public" output="false" returntype="array" >
		<cfargument name="userFirstName" type="string" required="true" />
		<cfargument name="userLastName" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userPasswordConfirm" type="string" required="true" />
		<cfset var aErrorMessages = arrayNew(1) />
		<!---Validate firstName--->
		<cfif arguments.userFirstName EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide a first name') />
		</cfif>
		<!---Validate lastName--->
		<cfif arguments.userLastName EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide a last name') />
		</cfif>
		<!---Validate Email--->
		<cfif arguments.userEmail EQ '' OR NOT isValid('email',arguments.userEmail)>
			<cfset arrayAppend(aErrorMessages,'Please provide a valid email address')/>
		</cfif>
		<!---Validate Password--->
		<cfif arguments.userPassword EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please provide a password ')/>
		</cfif>
		<!---Validate Password confirmation--->
		<cfif arguments.userPasswordConfirm EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please confirm your password')/>
		</cfif>
		<!---Verify Password & Password Confirmation match --->
		<cfif arguments.userPassword NEQ arguments.userPasswordConfirm >
			<cfset arrayAppend(aErrorMessages,'The password and the password
			confirmation do not match')/>
		</cfif>
		<cfreturn aErrorMessages />	
	</cffunction>
	<!---getUserByID() method --->
	<cffunction name="getUserByID" access="public" output="false" returntype="query">
		<cfargument name="userID" type="numeric" required="true" />
		<cfset var rsSingleUser='' />
		<cfquery datasource="hdStreet" name="rsSingleUser">
			SELECT FLD_USERID, FLD_USERFIRSTNAME, FLD_USERLASTNAME, FLD_USEREMAIL, FLD_USERPASSWORD, FLD_USERCOMMENT, FLD_USERINSTRUMENT
			FROM TBL_USERS
			WHERE FLD_USERID = #arguments.userID#
		</cfquery>
		<cfreturn rsSingleUser />
	</cffunction>

</cfcomponent>